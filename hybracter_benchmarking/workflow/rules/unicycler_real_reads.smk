rule run_unicycler_1_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_1_THREADS_REAL,"{sample}", "assembly.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_1_THREADS_REAL,"{sample}")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_1_threads.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads} 
        '''

rule run_unicycler_8_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}", "assembly.fasta")
    threads:
        8
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_8_threads.txt")
    resources:
        mem_mb=32000,
        time=4000 # 4000 mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads} 
        '''

rule run_unicycler_16_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_16_THREADS_REAL,"{sample}", "assembly.fasta")
    threads:
        16
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_16_THREADS_REAL,"{sample}")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_16_threads.txt")
    resources:
        mem_mb=32000,
        time=4000 # 4000 mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads} 
        '''


#### aggregation rule
rule aggr_unicycler_real:
    """aggregate lr"""
    input:
        expand(os.path.join(UNICYCLER_OUTPUT_1_THREADS_REAL,"{sample}", "assembly.fasta"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}", "assembly.fasta"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_OUTPUT_16_THREADS_REAL,"{sample}", "assembly.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "unicycler_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """