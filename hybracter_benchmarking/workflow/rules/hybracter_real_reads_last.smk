
rule hybracter_hybrid_real_last:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL_LAST, "{sample}", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        8
    params:
        out_dir = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL_LAST,"{sample}"),
        chromosome = get_length,
        medaka_model = get_medaka_model
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_hybrid_8_threads_real_last.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter hybrid-single -l {input.l} -1 {input.short_one} -2 {input.short_two} --medakaModel {params.medaka_model}  -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads}  --skip_qc --logic last
        '''


rule hybracter_long_8_threads_real_last:
    input:
        l = get_long
    output:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_REAL_LAST,"{sample}", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        8
    params:
        out_dir = os.path.join(HYBRACTER_LONG_OUTPUT_REAL_LAST,"{sample}"),
        chromosome = get_length,
        medaka_model = get_medaka_model
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_long_8_threads_real_last.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter long-single -l {input.l} -c {params.chromosome} -s {wildcards.sample} --medakaModel {params.medaka_model}  -o {params.out_dir} -t {threads}   --skip_qc --logic last
        '''


#### aggregation rule
rule aggr_hybracter_real_last:
    """aggregate lr"""
    input:
        expand(os.path.join(HYBRACTER_LONG_OUTPUT_REAL_LAST,"{sample}", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
        expand(os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL_LAST,"{sample}", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
    output:
        os.path.join(FLAGS, "hybracter_real_last_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """