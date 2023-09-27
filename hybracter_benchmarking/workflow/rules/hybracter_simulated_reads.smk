
rule install_hybracter:
    output:
        flag = os.path.join(FLAGS, "hybracter_installed.txt")
    threads:
        1
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_SIMULATED,"{sample}", "1_Thread")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_simulated_one_thread.txt")
    resources:
        mem_mb=32000,
        time=4000 
    conda:
        os.path.join('..', 'envs','unicycler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads}
        '''

rule run_hybracter_1_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "1_Thread", "assembly.fasta")
    threads:
        1
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_SIMULATED,"{sample}", "1_Thread")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_simulated_one_thread.txt")
    resources:
        mem_mb=32000,
        time=4000 
    conda:
        os.path.join('..', 'envs','unicycler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads}
        '''

rule run_unicycler_8_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "8_Threads", "assembly.fasta")
    threads:
        8
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_SIMULATED,"{sample}", "8_Threads")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_simulated_8_threads.txt")
    resources:
        mem_mb=32000,
        time=4000 
    conda:
        os.path.join('..', 'envs','unicycler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads}
        '''

rule run_unicycler_16_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "16_Threads", "assembly.fasta")
    threads:
        16
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_SIMULATED,"{sample}", "16_Threads")
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_unicycler_simulated_sixteen_threads.txt")
    resources:
        mem_mb=32000,
        time=4000 
    conda:
        os.path.join('..', 'envs','unicycler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads}
        '''

#### aggregation rule
rule aggr_unicycler_simulated:
    """aggregate lr"""
    input:
        expand( os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "1_Thread", "assembly.fasta"), sample = SAMPLES),
        expand( os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "8_Threads", "assembly.fasta"), sample = SAMPLES),
        expand( os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "16_Threads", "assembly.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "unicycler_simulated_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """