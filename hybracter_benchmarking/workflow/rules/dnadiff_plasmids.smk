# hybracter 
rule dnadiff_hybracter_hybrid_plasmid:
    input:
        chrom = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_plasmid.fasta"),
    output:
        report = os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_hybrid.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_hybrid"),
        reference = os.path.join(PLASMIDS,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        if dnadiff -p {params.out} {params.reference} {input.chrom}; then
            dnadiff -p {params.out} {params.reference} {input.chrom}
        else
            touch {output.report}
        fi
        '''


rule dnadiff_hybracter_long_plasmid:
    input:
        chrom = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_plasmid.fasta"),
    output:
        report = os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_long.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_long"),
        reference = os.path.join(PLASMIDS,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        if dnadiff -p {params.out} {params.reference} {input.chrom}; then
            dnadiff -p {params.out} {params.reference} {input.chrom}
        else
            touch {output.report}
        fi
        '''

####
# unicycler
####

rule dnadiff_unicycler_plasmids:
    input:
        chrom = os.path.join(UNICYCLER_PLASMIDS,"{sample}", "plasmid.fasta"),
    output:
        report = os.path.join(DNADIFF_PLASMIDS,"{sample}_unicycler.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF_PLASMIDS,"{sample}_unicycler"),
        reference = os.path.join(PLASMIDS,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        if dnadiff -p {params.out} {params.reference} {input.chrom}; then
            dnadiff -p {params.out} {params.reference} {input.chrom}
        else
            touch {output.report}
        fi
        '''

rule dnadiff_dragonflye_hybrid_plasmid:
    input:
        chrom = os.path.join(DRAGONFLYE_PLASMIDS, "{sample}_hybrid_plasmids.fasta")
    output:
        report = os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_hybrid.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_hybrid"),
        reference = os.path.join(PLASMIDS,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        if dnadiff -p {params.out} {params.reference} {input.chrom}; then
            dnadiff -p {params.out} {params.reference} {input.chrom}
        else
            touch {output.report}
        fi
        '''

rule dnadiff_dragonflye_long_plasmid:
    """
    in case no output
    """
    input:
        chrom = os.path.join(DRAGONFLYE_PLASMIDS, "{sample}_long_plasmids.fasta"),
    output:
        report = os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_long.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_long"),
        reference = os.path.join(PLASMIDS,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        if dnadiff -p {params.out} {params.reference} {input.chrom}; then
            dnadiff -p {params.out} {params.reference} {input.chrom}
        else
            touch {output.report}
        fi
        '''

#### aggregation rule
rule aggr_dnadiff_REAL_plasmid:
    """aggregate dnadiff"""
    input:
        expand(os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_long.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_hybrid.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF_PLASMIDS,"{sample}_unicycler.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_hybrid.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_long.report"), sample = SAMPLES),

    output:
        os.path.join(FLAGS, "dnadiff_plasmids_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """


"""
parse dnadiff output
"""


# hybracter 
rule parse_dnadiff_plasmids:
    input:
        hybracter_hybrid = os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_hybrid.report"),
        hybracter_long =  os.path.join(DNADIFF_PLASMIDS,"{sample}_hybracter_long.report"),
        unicycler = os.path.join(DNADIFF_PLASMIDS,"{sample}_unicycler.report"),
        dragonflye_hybrid = os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_hybrid.report"),
        dragonflye_long = os.path.join(DNADIFF_PLASMIDS,"{sample}_dragonflye_long.report"),
    output:
        tsv = os.path.join(DNADIFF_PARSED_OUTPUT_PLASMID,"{sample}_dnadiff_parsed_output.tsv")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        os.path.join('..', 'scripts', "parse_dnadiff_outputs_plasmids.py")


#### aggregation rule
rule aggr_dnadiff_parsed_plasmid:
    """aggregate dnadiff"""
    input:
        expand(os.path.join(DNADIFF_PARSED_OUTPUT_PLASMID,"{sample}_dnadiff_parsed_output.tsv"), sample = SAMPLES),
    output:
        os.path.join(FLAGS, "dnadiff_real_parsed_plasmid_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """





