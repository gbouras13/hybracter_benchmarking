#!/usr/bin/env python3
"""
George Bouras 2023

This program is free software: you can redistribute it and/or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version. This program is distributed in the hope that it
will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should
have received a copy of the GNU General Public License along with this program. If not, see
<https://www.gnu.org/licenses/>.
"""

import argparse
import os
from argparse import RawTextHelpFormatter
from Bio import SeqIO
import shutil

import csv

def get_input():
    """gets input for parse_genomes.py
    :return: args
    """
    parser = argparse.ArgumentParser(
        description="parse_genomes.py: ",
        formatter_class=RawTextHelpFormatter,
    )
    parser.add_argument(
        "-d",
        "--directory",
        action="store",
        required=True,
        help="Input directory 'genomes'.",
    )
    parser.add_argument(
        "-o", "--outdir", action="store", default="", help="Output dir."
    )
    parser.add_argument(
        "-f", "--force", help="Overwrites the output directory.", action="store_true"
    )
    args = parser.parse_args()
    return args

def calculate_genome_length(file_path):
    total_length = 0
    for record in SeqIO.parse(file_path, "fasta"):
        total_length += len(record.seq)
    return total_length

def calculate_contig_lengths(file_path):
    contig_lengths = []
    i = 1
    for record in SeqIO.parse(file_path, "fasta"):
        contig_id = f"contig_{i}"
        length = len(record.seq)
        contig_lengths.append((contig_id, length))
        i +=1
    return contig_lengths

def save_contig_lengths_to_tsv(directory_path, output_file):
    with open(output_file, 'w', newline='') as csvfile:
        fieldnames = ['sample', 'contig_id', 'length']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames, delimiter='\t')
        writer.writeheader()

        for filename in os.listdir(directory_path):
            if filename.endswith(".fasta"):
                file_path = os.path.join(directory_path, filename)
                contig_lengths = calculate_contig_lengths(file_path)
                file_basename = os.path.splitext(filename)[0]

                for contig_id, length in contig_lengths:
                    writer.writerow({'sample': file_basename, 'contig_id': contig_id, 'length': length})


if __name__ == "__main__":
    args = get_input()

    if args.force == True:
        print(
                f"Removing output directory {args.outdir} as -f or --force was specified."
            )
        if os.path.isdir(args.outdir) == True:
            shutil.rmtree(args.outdir)
        elif os.path.isfile(args.outdir) == True:
            os.remove(args.outdir)
        else:
            print(
                f"--force was specified even though the output directory {args.outdir} does not already exist. Continuing."
            )
    else:
        if os.path.isdir(args.outdir) == True or os.path.isfile(args.outdir) == True:
            print(
                f"The output directory {args.outdir} already exists and force was not specified. Please specify -f or --force to overwrite it."
            )

    # instantiate outdir
    if os.path.isdir(args.outdir) == False:
        os.mkdir(args.outdir)



    ##### overall ####

    total_lengths_dict = {}
    for filename in os.listdir(args.directory):
        if filename.endswith(".fasta"):
            file_path = os.path.join(args.directory, filename)
            total_length = calculate_genome_length(file_path)
            file_basename = os.path.splitext(filename)[0]
            total_lengths_dict[file_basename] = total_length

    # save to file
    output_file = os.path.join(args.outdir, "genome_lengths.tsv")
    with open(output_file, 'w', newline='') as csvfile:
        fieldnames = ['sample', 'total_length']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames, delimiter='\t')
        writer.writeheader()

        for file_basename, total_length in total_lengths_dict.items():
            writer.writerow({'sample': file_basename, 'total_length': total_length})

    ##### overall ####

    output_file = os.path.join(args.outdir, "contig_lengths.tsv")
    save_contig_lengths_to_tsv(args.directory, output_file)

    


