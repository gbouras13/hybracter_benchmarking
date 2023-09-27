#!/usr/bin/env python3
from Bio import SeqIO
import csv
import os

def get_raven_length(input_fasta, out_file, chrom_len):



# create a new TSV file
    with open(out_file, 'w', newline='') as file:
        writer = csv.writer(file, delimiter='\t')
        writer.writerow(["contig", "length", "string"])
        len_str = "leng"
        # write each fasta header to file
        for dna_record in SeqIO.parse(input_fasta, "fasta"):
            if len(dna_record.seq) < int(chrom_len):
                len_str = len_str + "; " + str(len(dna_record.seq))
                writer.writerow([dna_record.id, len(dna_record.seq), len_str])
            


get_raven_length(snakemake.input[0], snakemake.output[0], snakemake.params[0])