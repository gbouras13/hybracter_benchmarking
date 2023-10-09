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

# to subset the ONT FASTQs to be 250x with rasusa

```
mamba create -n rasusa rasusa==0.7.1
```

```
rasusa --input  SRR21386010_1.fastq.gz  --coverage 250 --genome-size 2.8m -o SRR21386010_250x.fastq.gz -l 9
```

```
rasusa --input  SRR21386012_1.fastq.gz  --coverage 250 --genome-size 2.8m -o SRR21386012_250x.fastq.gz -l 9
```




# Lerminiaux et al preprint

## Fastqs

```
fastq-dl PRJNA1020811
```

https://www.biorxiv.org/content/10.1101/2023.09.25.559359v1


## Assemblies 

#### Downloading the Reference Genomes

#### Isolate A

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032354275.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032354275.1.zip" -H "Accept: application/zip"

unzip GCA_032354275.1.zip 
mv ncbi_dataset/data/GCA_032354275.1/GCA_032354275.1_ASM3235427v1_genomic.fna IsolateA.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate B

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032352615.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032352615.1.zip" -H "Accept: application/zip"

unzip GCA_032352615.1.zip 
mv ncbi_dataset/data/GCA_032352615.1/GCA_032352615.1_ASM3235261v1_genomic.fna  IsolateB.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate C

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032351815.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032351815.1.zip" -H "Accept: application/zip"

unzip GCA_032351815.1.zip 
mv ncbi_dataset/data/GCA_032351815.1/GCA_032351815.1_ASM3235181v1_genomic.fna  IsolateC.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate D

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032351055.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032351055.1.zip" -H "Accept: application/zip"

unzip GCA_032351055.1.zip 
mv ncbi_dataset/data/GCA_032351055.1/GCA_032351055.1_ASM3235105v1_genomic.fna  IsolateD.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate E

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032348595.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032348595.1.zip" -H "Accept: application/zip"

unzip GCA_032348595.1.zip 
mv ncbi_dataset/data/GCA_032348595.1/GCA_032348595.1_ASM3234859v1_genomic.fna  IsolateE.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate F

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032349915.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032349915.1.zip" -H "Accept: application/zip"

unzip GCA_032349915.1.zip 
mv ncbi_dataset/data/GCA_032349915.1/GCA_032349915.1_ASM3234991v1_genomic.fna  IsolateF.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate G

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032346775.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032346775.1.zip" -H "Accept: application/zip"

unzip GCA_032346775.1.zip 
mv ncbi_dataset/data/GCA_032346775.1/GCA_032346775.1_ASM3234677v1_genomic.fna  IsolateG.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

 
#### Isolate H

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032345935.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032345935.1.zip" -H "Accept: application/zip"

unzip GCA_032345935.1.zip 
mv ncbi_dataset/data/GCA_032345935.1/GCA_032345935.1_ASM3234593v1_genomic.fna IsolateH.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```


#### Isolate I

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032345195.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032345195.1.zip" -H "Accept: application/zip"

unzip GCA_032345195.1.zip 
mv ncbi_dataset/data/GCA_032345195.1/GCA_032345195.1_ASM3234519v1_genomic.fna  IsolateI.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate J

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032344435.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032344435.1.zip" -H "Accept: application/zip"

unzip GCA_032344435.1.zip 
mv ncbi_dataset/data/GCA_032344435.1/GCA_032344435.1_ASM3234443v1_genomic.fna  IsolateJ.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```
 
 #### Isolate K

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032343715.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032343715.1.zip" -H "Accept: application/zip"

unzip GCA_032343715.1.zip 
mv ncbi_dataset/data/GCA_032343715.1/GCA_032343715.1_ASM3234371v1_genomic.fna  IsolateK.fasta
rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### Isolate L

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_032347795.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_032347795.1.zip" -H "Accept: application/zip"

unzip GCA_032347795.1.zip 

mv ncbi_dataset/data/GCA_032347795.1/GCA_032347795.1_ASM3234779v1_genomic.fna IsolateL.fasta

rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

* All contigs were modified to have "circular=True" in the header 

