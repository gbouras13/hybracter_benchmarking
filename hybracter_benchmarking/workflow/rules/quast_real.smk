# hybracter 
rule quast_1_threads_hybracter:
    input:
        plas_file = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL, "{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_FLYE_8_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_1_threads_plassembler_flye:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_FLYE_1_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_FLYE_1_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_16_threads_plassembler_flye:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_FLYE_16_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_FLYE_16_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


# plassembler 
rule quast_8_threads_plassembler_raven:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_RAVEN,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_RAVEN_8_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_RAVEN_8_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_1_threads_plassembler_raven:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_RAVEN,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_RAVEN_1_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_RAVEN_1_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_16_threads_plassembler_raven:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_RAVEN,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_RAVEN_16_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_RAVEN_16_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''





# unicycler 

rule quast_8_threads_unicycler_REAL:
    input:
        plas_file = os.path.join(UNICYCLER_PLASMIDS_ONLY_8_THREADS_REAL,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_8_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_8_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''



rule quast_1_threads_unicycler_REAL:
    input:
        plas_file = os.path.join(UNICYCLER_PLASMIDS_ONLY_1_THREADS_REAL,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_1_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_1_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''

rule quast_16_threads_unicycler_REAL:
    input:
        plas_file = os.path.join(UNICYCLER_PLASMIDS_ONLY_16_THREADS_REAL,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_16_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_16_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''



#### aggregation rule
rule aggr_quast_REAL:
    """aggregate lr"""
    input:
        expand(os.path.join(QUAST_PLASSEMBLER_FLYE_1_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_FLYE_8_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_FLYE_16_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_UNICYCLER_16_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_UNICYCLER_1_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_UNICYCLER_8_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_RAVEN_1_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_RAVEN_8_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_RAVEN_16_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "quast_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



