#!/usr/bin/env python3

from Bio import SeqIO
from Bio.SeqUtils import gc_fraction
import pandas as pd
# get plasmids if length < min chrom length


def get_plasmids(input_fasta, chromosome_fasta, per_conting_summary, min_chrom_length):

    # gets the per contig stats dict
    stats_dict = {}

    with open(chromosome_fasta, "w") as fa:
        for dna_record in SeqIO.parse(input_fasta, "fasta"):
             
             # to create the per contig stats

            parts = dna_record.description.split()
            # Initialize variables to store length and completeness
            contig_length = 0
            circular = False
            contig_type = "chromosome"

            # Iterate through the parts and extract information
            for part in parts:
                if part.startswith("len="):
                    contig_length = int(part[4:])  # Extract the length value after 'len='
                elif part.startswith("circular="):
                    circular_info = part[8:]  # Extract the completeness value after 'circular='
                    if circular_info == "Y":
                        circular = True
                    elif circular_info == "N":
                        circular = False

            gc_content = round(gc_fraction(dna_record.seq) * 100, 2)




        # to get the actual plasmids
            if len(dna_record.seq) < int(min_chrom_length):
                SeqIO.write(dna_record, fa, "fasta")
                contig_type = "plasmid"

        stats_dict[dna_record.id] = {}
        stats_dict[dna_record.id]["contig_type"] = contig_type
        stats_dict[dna_record.id]["length"] = contig_length
        stats_dict[dna_record.id]["gc"] = gc_content
        stats_dict[dna_record.id]["circular"] = circular

   
    # stats dict
    stats_df = pd.DataFrame.from_dict(stats_dict, orient="index")
    stats_df["contig_name"] = stats_df.index
    # Reorder the columns with 'contig_name' as the first column
    stats_df = stats_df[
        ["contig_name"] + [col for col in stats_df.columns if col != "contig_name"]
    ]

    stats_df.to_csv(per_conting_summary, index=False, sep="\t")



get_plasmids(
    snakemake.input.fasta, snakemake.output.fasta, snakemake.output.per_conting_summary, snakemake.params.min_chrom_length
)
