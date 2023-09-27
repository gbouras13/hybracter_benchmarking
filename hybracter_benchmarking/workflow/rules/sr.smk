rule generate_coverage_file:
    """
    generates 60x short read genome coverage file for ISS
    """
    input:
        os.path.join(GENOME,"{sample}.fasta")
    output:
        os.path.join(SR,"{sample}_coverage.tsv")
    threads:
        1
    resources:
        mem_mb=1000,
        time=5
    params:
        SR,
        60
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/create_coverage_file.py'


rule short_read_simulate:
    input:
        os.path.join(GENOME,"{sample}.fasta"),
        os.path.join(SR,"{sample}_coverage.tsv")
    output:
        os.path.join(SR,"{sample}_R1.fastq.gz"),
        os.path.join(SR,"{sample}_R2.fastq.gz")
    threads:
        8
    resources:
        mem_mb=32000,
        time=300
    params:
        get_length,
        os.path.join(SR,"{sample}")
    conda:
        os.path.join('..', 'envs','iss.yaml')
    shell:
        '''
        iss generate --genomes {input[0]} --cpus {threads} --model novaseq --compress --coverage_file {input[1]} --output {params[1]}
        '''


#### aggregation rule
rule sr_aggr:
    """aggregate sr"""
    input:
        expand(os.path.join(SR,"{sample}_R2.fastq.gz"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "sr_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """

#### generate coverage file

