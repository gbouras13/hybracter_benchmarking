#!/usr/bin/env python3

import pandas as pd
import csv
import os
from Bio import SeqIO
import os

def create_coverage_file(input_fasta, out_dir, sample, coverage):  

    coverage_file = os.path.join(out_dir,str(sample) + "_coverage.tsv")

# create a new TSV file
    with open(coverage_file, 'w', newline='') as file:
        writer = csv.writer(file, delimiter='\t')
        # write each fasta header to file
        for dna_record in SeqIO.parse(input_fasta, "fasta"):
            writer.writerow([dna_record.id, coverage])


        
                
create_coverage_file(snakemake.input[0], snakemake.params[0],  snakemake.wildcards.sample, snakemake.params[1])



        
