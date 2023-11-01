rule dragonflye_hybrid_8_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        fasta = os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa")
    threads:
        8
    params:
        out_dir = os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread"),
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_dragonflye_hybrid_8_threads_real.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','dragonflye.yaml')
    shell:
        '''
        dragonflye --cpus {threads} --outdir {params.out_dir} --reads {input.l} --nanohq --force --R1 {input.short_one} --R2 {input.short_two} 
        '''


rule dragonflye_hybrid_16_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        fasta = os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "16_Thread", "contigs.fa")
    threads:
        16
    params:
        out_dir = os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "16_Thread"),
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_dragonflye_hybrid_16_threads_real.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','dragonflye.yaml')
    shell:
        '''
        dragonflye --cpus {threads} --outdir {params.out_dir} --reads {input.l} --nanohq --force --R1 {input.short_one} --R2 {input.short_two} 
        '''


rule dragonflye_long_8_threads_real:
    input:
        l = get_long,
    output:
        fasta = os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa")
    threads:
        8
    params:
        out_dir = os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "8_Thread"),
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_dragonflye_long_8_threads_real.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','dragonflye.yaml')
    shell:
        '''
        dragonflye --cpus {threads} --outdir {params.out_dir} --reads {input.l} --nanohq --force 
        '''


rule dragonflye_long_16_threads_real:
    input:
        l = get_long,
    output:
        fasta = os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "16_Thread", "contigs.fa")
    threads:
        16
    params:
        out_dir = os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "16_Thread"),
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_dragonflye_long_16_threads_real.txt")
    resources:
        mem_mb=32000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','dragonflye.yaml')
    shell:
        '''
        dragonflye --cpus {threads} --outdir {params.out_dir} --reads {input.l} --nanohq --force 
        '''



#### aggregation rule
rule aggr_dragonflye_real:
    """aggregate lr"""
    input:
        expand(os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa"), sample = SAMPLES),
        expand(os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "16_Thread", "contigs.fa"), sample = SAMPLES),
        expand(os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa"), sample = SAMPLES),
        expand(os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "16_Thread", "contigs.fa"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "dragonflye_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """