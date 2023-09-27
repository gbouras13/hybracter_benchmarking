#!/usr/bin/env python3
import argparse
from argparse import RawTextHelpFormatter
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import os

def split_multifastq(input_fasta, out_dir):

	# usage = 'python3 split_multifasta.py ...'
	# parser = argparse.ArgumentParser(description='script to split multifasta into individual fasta files based on accession', formatter_class=RawTextHelpFormatter)
	# parser.add_argument('-i', '--infile', action="store", help='input file in fasta format',  required=True)
	# parser.add_argument('-o', '--outdir', action="store", help='output directory',  required=True)
	# args = parser.parse_args()

	# return args


    if not os.path.exists(out_dir):
        os.makedirs(out_dir)


    for dna_record in SeqIO.parse(input_fasta, "fasta"):

        id = dna_record.id
        seq = dna_record.seq
        filename = id + '.fasta'

        outfile = os.path.join(out_dir, filename)

        single_record = SeqRecord(seq, id, description="")

        with open(outfile, 'w') as nt_fa:
            SeqIO.write(single_record, nt_fa, 'fasta')


split_multifastq(snakemake.input[0], snakemake.output[0])
