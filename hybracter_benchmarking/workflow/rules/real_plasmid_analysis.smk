# # hybracter 
# rule dnadiff_hybracter_hybrid_plasmid:
#     input:
#         chrom = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_chromosome.fasta"),
#     output:
#         report = os.path.join(DNADIFF,"{sample}_hybracter_hybrid.report")
#     threads:
#         1
#     resources:
#         mem_mb=8000,
#         time=10 
#     params:
#         out = os.path.join(DNADIFF,"{sample}_hybracter_hybrid"),
#         reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
#     conda:
#         os.path.join('..', 'envs','dnadiff.yaml')
#     shell:
#         '''
#         dnadiff -p {params.out} {params.reference} {input.chrom}
#         '''

# rule dnadiff_hybracter_long:
#     input:
#         chrom = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_chromosome.fasta"),
#     output:
#         report = os.path.join(DNADIFF,"{sample}_hybracter_long.report")
#     threads:
#         1
#     resources:
#         mem_mb=8000,
#         time=10 
#     params:
#         out = os.path.join(DNADIFF,"{sample}_hybracter_long"),
#         reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
#     conda:
#         os.path.join('..', 'envs','dnadiff.yaml')
#     shell:
#         '''
#         dnadiff -p {params.out} {params.reference} {input.chrom}
#         '''

####
# unicycler
####


rule extract_unicycler_plasmids:
    """
    extracts the chromosomes from unicycler assembly
    """
    input:
        fasta=os.path.join(UNICYCLER_OUTPUT_REAL,"{sample}",  "8_Threads", "assembly.fasta"),
    output:
        fasta=os.path.join(UNICYCLER_PLASMIDS,"{sample}", "plasmid.fasta"),
        per_conting_summary = os.path.join(UNICYCLER_SUMMARIES, "{sample}_per_contig_stats.tsv"),
    params:
        min_chrom_length=get_length,
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    script:
        os.path.join('..', 'scripts', "extract_plasmids.py")


# rule dnadiff_unicycler:
#     input:
#         chrom = os.path.join(UNICYCLER_CHROMOSOMES,"{sample}", "chromosome.fasta"),
#     output:
#         report = os.path.join(DNADIFF,"{sample}_unicycler.report")
#     threads:
#         1
#     resources:
#         mem_mb=8000,
#         time=10 
#     params:
#         out = os.path.join(DNADIFF,"{sample}_unicycler"),
#         reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
#     conda:
#         os.path.join('..', 'envs','dnadiff.yaml')
#     shell:
#         '''
#         dnadiff -p {params.out} {params.reference} {input.chrom}
#         '''

rule extract_dragonflye_hybrid_plasmids:
    """
    extracts the chromosomes from unicycler assembly
    """
    input:
        fasta=os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa"),
    output:
        fasta=os.path.join(DRAGONFLYE_PLASMIDS, "{sample}_hybrid_plasmids.fasta"),
        per_conting_summary = os.path.join(DRAGONFLYE_SUMMARIES, "{sample}_hybrid_per_contig_stats.tsv"),
    params:
        min_chrom_length=get_length,
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    script:
        os.path.join('..', 'scripts', "extract_plasmids.py")

# rule dnadiff_dragonflye_hybrid:
#     input:
#         chrom = os.path.join(DRAGONFLYE_CHROMOSOMES, "{sample}_hybrid_chromosome.fasta"),
#     output:
#         report = os.path.join(DNADIFF,"{sample}_dragonflye_hybrid.report")
#     threads:
#         1
#     resources:
#         mem_mb=8000,
#         time=10 
#     params:
#         out = os.path.join(DNADIFF,"{sample}_dragonflye_hybrid"),
#         reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
#     conda:
#         os.path.join('..', 'envs','dnadiff.yaml')
#     shell:
#         '''
#         dnadiff -p {params.out} {params.reference} {input.chrom}
#         '''

rule extract_dragonflye_long_plasmids:
    """
    extracts the plasmids from dragonfly assembly along with information
    """
    input:
        fasta=os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa"),
    output:
        fasta=os.path.join(DRAGONFLYE_PLASMIDS, "{sample}_long_plasmids.fasta"),
        per_conting_summary = os.path.join(DRAGONFLYE_SUMMARIES, "{sample}_long_per_contig_stats.tsv"),
    params:
        min_chrom_length=get_length,
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    script:
        os.path.join('..', 'scripts', "extract_plasmids.py")


# hybracter 
rule parse_per_contig_summaries:
    input:
        unicycler = os.path.join(UNICYCLER_SUMMARIES, "{sample}_per_contig_stats.tsv"),
        dragonflye_hybrid = os.path.join(DRAGONFLYE_SUMMARIES, "{sample}_hybrid_per_contig_stats.tsv"),
        dragonflye_long = os.path.join(DRAGONFLYE_SUMMARIES, "{sample}_long_per_contig_stats.tsv"),
    output:
        tsv = os.path.join(PLASMID_PARSED_OUTPUT,"{sample}_per_contig_parsed_output.tsv")
    params:
        hybracter_hybrid = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_per_contig_stats.tsv"),
        hybracter_long =  os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_per_contig_stats.tsv")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        os.path.join('..', 'scripts', "parse_plasmid_per_contig_outputs.py")



#### aggregation rule
rule per_contig_parsed:
    """aggregate per contig stats"""
    input:
        expand(os.path.join(PLASMID_PARSED_OUTPUT,"{sample}_per_contig_parsed_output.tsv"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "per_contig_parsed_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """









# rule dnadiff_dragonflye_long:
#     input:
#         chrom = os.path.join(DRAGONFLYE_PLASMIDS, "{sample}_long_chromosome.fasta"),
#     output:
#         report = os.path.join(DNADIFF,"{sample}_dragonflye_long.report")
#     threads:
#         1
#     resources:
#         mem_mb=8000,
#         time=10 
#     params:
#         out = os.path.join(DNADIFF,"{sample}_dragonflye_long"),
#         reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
#     conda:
#         os.path.join('..', 'envs','dnadiff.yaml')
#     shell:
#         '''
#         dnadiff -p {params.out} {params.reference} {input.chrom}
#         '''

# #### aggregation rule
# rule aggr_plasmid_dnadiff_REAL:
#     """aggregate dnadiff"""
#     input:
#         expand(os.path.join(DNADIFF,"{sample}_hybracter_long.report"), sample = SAMPLES),
#         expand(os.path.join(DNADIFF,"{sample}_hybracter_hybrid.report"), sample = SAMPLES),
#         expand(os.path.join(DNADIFF,"{sample}_unicycler.report"), sample = SAMPLES),
#         expand(os.path.join(DNADIFF,"{sample}_dragonflye_hybrid.report"), sample = SAMPLES),
#         expand(os.path.join(DNADIFF,"{sample}_dragonflye_long.report"), sample = SAMPLES),

#     output:
#         os.path.join(FLAGS, "dnadiff_real_aggr.txt")
#     threads:
#         1
#     shell:
#         """
#         touch {output[0]}
#         """


"""
parse dnadiff output
"""


# # hybracter 
# rule parse_plasmid_dnadiff:
#     input:
#         hybracter_hybrid = os.path.join(DNADIFF,"{sample}_hybracter_hybrid.report"),
#         hybracter_long =  os.path.join(DNADIFF,"{sample}_hybracter_long.report"),
#         unicycler = os.path.join(DNADIFF,"{sample}_unicycler.report"),
#         dragonflye_hybrid = os.path.join(DNADIFF,"{sample}_dragonflye_hybrid.report"),
#         dragonflye_long = os.path.join(DNADIFF,"{sample}_dragonflye_long.report"),
#     output:
#         tsv = os.path.join(DNADIFF_PARSED_OUTPUT,"{sample}_dnadiff_parsed_output.tsv")
#     threads:
#         1
#     resources:
#         mem_mb=8000,
#         time=10 
#     conda:
#         os.path.join('..', 'envs','scripts.yaml')
#     script:
#         os.path.join('..', 'scripts', "parse_dnadiff_outputs.py")


# #### aggregation rule
# rule aggr_plasmid_dnadiff_parsed:
#     """aggregate dnadiff"""
#     input:
#         expand(os.path.join(DNADIFF_PARSED_OUTPUT,"{sample}_dnadiff_parsed_output.tsv"), sample = SAMPLES),
#     output:
#         os.path.join(FLAGS, "dnadiff_real_parsed_aggr.txt")
#     threads:
#         1
#     shell:
#         """
#         touch {output[0]}
#         """





