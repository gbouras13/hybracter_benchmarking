# hybracter 
rule dnadiff_hybracter_hybrid:
    input:
        chrom = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_chromosome.fasta"),
    output:
        report = os.path.join(DNADIFF,"{sample}_hybracter_hybrid.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF,"{sample}_hybracter_hybrid"),
        reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        dnadiff -p {params.out} {params.reference} {input.chrom}
        '''

rule dnadiff_hybracter_long:
    input:
        chrom = os.path.join(HYBRACTER_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "FINAL_OUTPUT", "complete",  "{sample}_chromosome.fasta"),
    output:
        report = os.path.join(DNADIFF,"{sample}_hybracter_long.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF,"{sample}_hybracter_long"),
        reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        dnadiff -p {params.out} {params.reference} {input.chrom}
        '''

####
# unicycler
####

rule extract_unicycler_chromosomes:
    """
    extracts the chromosomes from unicycler assembly
    """
    input:
        fasta=os.path.join(UNICYCLER_OUTPUT_REAL,"{sample}",  "8_Threads", "assembly.fasta"),
    output:
        fasta=os.path.join(UNICYCLER_CHROMOSOMES,"{sample}", "chromosome.fasta"),
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
        os.path.join('..', 'scripts', "extract_chromosome.py")

rule dnadiff_unicycler:
    input:
        chrom = os.path.join(UNICYCLER_CHROMOSOMES,"{sample}", "chromosome.fasta"),
    output:
        report = os.path.join(DNADIFF,"{sample}_unicycler.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF,"{sample}_unicycler"),
        reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        dnadiff -p {params.out} {params.reference} {input.chrom}
        '''

rule extract_dragonflye_hybrid_chromosomes:
    """
    extracts the chromosomes from unicycler assembly
    """
    input:
        fasta=os.path.join(DRAGONFLYE_HYBRID_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa"),
    output:
        fasta=os.path.join(DRAGONFLYE_CHROMOSOMES, "{sample}_hybrid_chromosome.fasta"),
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
        os.path.join('..', 'scripts', "extract_chromosome.py")

rule dnadiff_dragonflye_hybrid:
    input:
        chrom = os.path.join(DRAGONFLYE_CHROMOSOMES, "{sample}_hybrid_chromosome.fasta"),
    output:
        report = os.path.join(DNADIFF,"{sample}_dragonflye_hybrid.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF,"{sample}_dragonflye_hybrid"),
        reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        dnadiff -p {params.out} {params.reference} {input.chrom}
        '''

rule extract_dragonflye_long_chromosomes:
    """
    extracts the chromosomes from unicycler assembly
    """
    input:
        fasta=os.path.join(DRAGONFLYE_LONG_OUTPUT_REAL,"{sample}", "8_Thread", "contigs.fa"),
    output:
        fasta=os.path.join(DRAGONFLYE_CHROMOSOMES, "{sample}_long_chromosome.fasta"),
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
        os.path.join('..', 'scripts', "extract_chromosome.py")

rule dnadiff_dragonflye_long:
    input:
        chrom = os.path.join(DRAGONFLYE_CHROMOSOMES, "{sample}_long_chromosome.fasta"),
    output:
        report = os.path.join(DNADIFF,"{sample}_dragonflye_long.report")
    threads:
        1
    resources:
        mem_mb=8000,
        time=10 
    params:
        out = os.path.join(DNADIFF,"{sample}_dragonflye_long"),
        reference = os.path.join(CHROMOSOMES,"{sample}.fasta")
    conda:
        os.path.join('..', 'envs','dnadiff.yaml')
    shell:
        '''
        dnadiff -p {params.out} {params.reference} {input.chrom}
        '''

#### aggregation rule
rule aggr_dnadiff_REAL:
    """aggregate dnadiff"""
    input:
        expand(os.path.join(DNADIFF,"{sample}_hybracter_long.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF,"{sample}_hybracter_hybrid.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF,"{sample}_unicycler.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF,"{sample}_dragonflye_hybrid.report"), sample = SAMPLES),
        expand(os.path.join(DNADIFF,"{sample}_dragonflye_long.report"), sample = SAMPLES),

    output:
        os.path.join(FLAGS, "dnadiff_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



