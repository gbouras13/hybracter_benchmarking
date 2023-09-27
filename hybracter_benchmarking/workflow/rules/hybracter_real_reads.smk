rule hybracter_hybrid_1_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "1_Thread"),
        chromosome = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_hybrid_1_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter hybrid-single -l {input.l} -1 {input.short_one} -2 {input.short_two} -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads} 
        '''

rule hybracter_hybrid_8_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread"),
        chromosome = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_hybrid_8_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter hybrid-single -l {input.l} -1 {input.short_one} -2 {input.short_two} -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads} 
        '''


rule hybracter_hybrid_16_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "16_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "16_Thread"),
        chromosome = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_hybrid_16_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter hybrid-single -l {input.l} -1 {input.short_one} -2 {input.short_two} -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads} 
        '''

rule hybracter_long_1_threads_real:
    input:
        l = get_long
    output:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "1_Thread"),
        chromosome = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_long_1_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter long-single -l {input.l} -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads} 
        '''

rule hybracter_long_8_threads_real:
    input:
        l = get_long
    output:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread"),
        chromosome = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_long_8_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter long-single -l {input.l} -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads} 
        '''


rule hybracter_long_16_threads_real:
    input:
        l = get_long
    output:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "16_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "16_Thread"),
        chromosome = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_hybracter_long_16_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter long-single -l {input.l} -c {params.chromosome} -s {wildcards.sample} -o {params.out_dir} -t {threads} 
        '''


#### aggregation rule
rule aggr_hybracter_real:
    """aggregate lr"""
    input:
        expand(os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
        expand(os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
        expand(os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "16_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
        expand(os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
        expand(os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES),
        expand(os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "16_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "hybracter_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """