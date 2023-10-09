rule long_read_simulate:
    input:
        os.path.join(GENOME,"{sample}.fasta")
    output:
        os.path.join(LR,"{sample}.fastq.gz")
    threads:
        1
    resources:
        mem_mb=32000,
        time=300
    conda:
        os.path.join('..', 'envs','badread.yaml')
    shell:
        '''
         badread simulate --reference {input[0]}  --quantity 60x  --error_model nanopore2023 --qscore_model nanopore2023 --seed 43 \
         --length 10000,10000 | gzip > {output[0]}
        '''



#### aggregation rule
rule lr_aggr:
    """aggregate lr"""
    input:
        expand(os.path.join(LR,"{sample}.fastq.gz"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "lr_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



