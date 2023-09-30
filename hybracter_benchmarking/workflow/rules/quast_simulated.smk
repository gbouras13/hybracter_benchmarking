# hybracter
# hybrid

rule quast_hybracter_hybrid_simulated_1_thread:
    input:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_SIMULATED,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "1_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "1_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''

rule quast_hybracter_hybrid_simulated_8_threads:
    input:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_SIMULATED,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "8_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "8_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''

rule quast_hybracter_hybrid_simulated_16_threads:
    input:
        fasta = os.path.join(HYBRACTER_HYBRID_OUTPUT_SIMULATED,"{sample}", "16_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "16_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "16_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''

# long

rule quast_hybracter_LONG_simulated_1_thread:
    input:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_SIMULATED,"{sample}", "1_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "1_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "1_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''

rule quast_hybracter_LONG_simulated_8_threads:
    input:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_SIMULATED,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "8_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "8_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''


rule quast_hybracter_LONG_simulated_16_threads:
    input:
        fasta = os.path.join(HYBRACTER_LONG_OUTPUT_SIMULATED,"{sample}", "16_Thread", "FINAL_OUTPUT", "complete",  "{sample}_final.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "16_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "16_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''

# unicycler

rule quast_unicycler_simulated_1_thread:
    input:
        fasta = os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "1_Thread", "assembly.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_SIMULATED,"{sample}", "1_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_SIMULATED,"{sample}", "1_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''

rule quast_unicycler_LONG_simulated_8_threads:
    input:
        fasta = os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "8_Thread", "assembly.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_SIMULATED,"{sample}", "8_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_SIMULATED,"{sample}", "8_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''


rule quast_unicycler_LONG_simulated_16_threads:
    input:
        fasta = os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "16_Thread", "assembly.fasta"),
        reference = os.path.join(GENOME,"{sample}.fasta")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_SIMULATED,"{sample}", "16_Thread", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_SIMULATED,"{sample}", "16_Thread")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.fasta}
        '''






#### aggregation rule
rule aggr_quast_simulated:
    """aggregate lr"""
    input:
        expand(os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "1_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "8_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_HYBRACTER_HYBRID_SIMULATED,"{sample}", "16_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "1_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "8_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_HYBRACTER_LONG_SIMULATED,"{sample}", "16_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "1_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "8_Thread", "report.html"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_OUTPUT_SIMULATED, "{sample}", "16_Thread", "report.html"), sample = SAMPLES))
    output:
        os.path.join(FLAGS, "quast_simulated_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



