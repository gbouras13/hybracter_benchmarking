# Download Fastqs

## JKD6159 

doi: https://doi.org/10.1128/mra.01129-22

Reference Genome: GCF_000144955.1 https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000144955.1/

#### Downloading the Reference Genome

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCF_000144955.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCF_000144955.1.zip" -H "Accept: application/zip"

unzip GCF_000144955.1.zip 

mv ncbi_dataset/data/GCF_000144955.1/GCF_000144955.1_ASM14495v1_genomic.fna JDK6159.fasta

# cleanup
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf GCF_000144955.1.zip

```

#### FASTQs

Install `fastq-dl`

```
mamba create -n fastq-dl fastq-dl

conda activate fastq-dl
```

Illumina reads

```
fastq-dl -a SRR21386014
```

ONT R9.4.1

```
fastq-dl -a SRR21386010
```

ONT R10.4 Guppy v6.1.7 SUP

```
fastq-dl -a SRR21386012
```

# Lerminiaux et al preprint

```
fastq-dl PRJNA1020811
```

https://www.biorxiv.org/content/10.1101/2023.09.25.559359v1

