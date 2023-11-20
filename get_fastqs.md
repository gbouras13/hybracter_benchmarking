# Instructions How to Download, Subsample and QC Fastqs

## JKD6159 (Wick et al 2023)

* Paper doi: https://doi.org/10.1128/mra.01129-22

* Reference Genome: GCF_000144955.1 https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000144955.1/

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

#### Downloading FASTQs

* Install `fastq-dl`

```
mamba create -n fastq-dl fastq-dl

conda activate fastq-dl
```

* Download Illumina reads

```
fastq-dl -a SRR21386014
```

* Download ONT R9.4.1 reads

```
fastq-dl -a SRR21386010
```

* Download ONT R10.4 Guppy v6.1.7 SUP reads

```
fastq-dl -a SRR21386012
```

# Lerminiaux et al preprint

* Preprint link: https://www.biorxiv.org/content/10.1101/2023.09.25.559359v1 

## Download all Fastqs

```
fastq-dl PRJNA1020811
```

## Download Reference Genome Assemblies 

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

## Chitale et al

* Paper link: https://www.nature.com/articles/s41467-022-34853-x#Sec7

From the paper:

_Using the >50x coverage, Dnadiff indicated that Bact-Builder’s assembly of the three independent H37Rv samples produced were identical in size and whole genome sequence (No SNPs were found between H37Rv.1, H37Rv.2 and H37Rv.3) except for one sample (H37Rv.1) that was one nucleotide shorter than the other two (Table 1)._

* Therefore I used H37Rv.2 ONT FASTQs

#### Download the H37R.2 ONT FASTQs

```
fastq-dl -a SRR20082804
```

#### Download the H37R.2 Illumina FASTQs

```
fastq-dl -a SRR20082813
```

#### Download the reference genome

```
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/GCA_026185275.1/download?include_annotation_type=GENOME_FASTA,GENOME_GFF,RNA_FASTA,CDS_FASTA,PROT_FASTA,SEQUENCE_REPORT&filename=GCA_026185275.1.zip" -H "Accept: application/zip"

unzip GCA_026185275.1.zip 

mv ncbi_dataset/data/GCA_026185275.1/GCA_026185275.1_ASM2618527v1_genomic.fna H37R2.fasta

rm -rf README.md 
rm -rf ncbi_dataset 
rm -rf *.zip
```

#### ATCC FASTQs

* Link to Ryan Wick's blogpost https://rrwick.github.io/2023/05/05/ont-only-accuracy-with-r10.4.1.html. DOI: https://doi.org/10.5281/zenodo.7898220
* These will be publicly available with the hybracter manuscript.
* All genomes were manually downloaded from the ATCC [website](https://www.atcc.org).



# Subsampling 

* Done with [Rasusa](https://github.com/mbhall88/rasusa) v0.7.0 to 100x approximate genome size

#### Install rasusa

```
mamba create -n rasusa 
conda activate rasusa
```

#### JKD6159

```
GENOME_SIZE="2.9mb"

rasusa --input SRR21386010.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR21386010_100x.fastq.gz
rasusa --input SRR21386012.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR21386012_100x.fastq.gz
rasusa -i SRR21386014_1.fastq.gz -i SRR21386014_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR21386014_100x_1.fastq.gz  -o SRR21386014_100x_2.fastq.gz 
```

#### Lermaniaux

##### Long Reads

```
GENOME_SIZE="5.5mb"
rasusa --input SRR26162834.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162834_100x.fastq.gz
rasusa --input SRR26162835.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162835_100x.fastq.gz
rasusa --input SRR26162836.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162836_100x.fastq.gz
rasusa --input SRR26162837.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162837_100x.fastq.gz
rasusa --input SRR26162839.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162839_100x.fastq.gz
rasusa --input SRR26162840.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162840_100x.fastq.gz
rasusa --input SRR26162841.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162841_100x.fastq.gz
rasusa --input SRR26162842.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162842_100x.fastq.gz
rasusa --input SRR26162843.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162843_100x.fastq.gz
rasusa --input SRR26162844.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162844_100x.fastq.gz
rasusa --input SRR26162845.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162845_100x.fastq.gz
rasusa --input SRR26162846.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162846_100x.fastq.gz
```

* SRR26162836 no subsampling was actually done, the estimated coverage was 52.92x 
* SRR26162839 no subsampling was actually done, the estimated coverage was 97.78x 
* SRR26162841 no subsampling was actually done, the estimated coverage was 53.24x 
* SRR26162844 no subsampling was actually done, the estimated coverage was 33.25x


##### Short Reads

```
rasusa -i SRR26162838_1.fastq.gz -i SRR26162838_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162838_100x_1.fastq.gz  -o SRR26162838_100x_2.fastq.gz 
rasusa -i SRR26162827_1.fastq.gz -i SRR26162827_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162827_100x_1.fastq.gz  -o SRR26162827_100x_2.fastq.gz 
rasusa -i SRR26162828_1.fastq.gz -i SRR26162828_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162828_100x_1.fastq.gz  -o SRR26162828_100x_2.fastq.gz 
rasusa -i SRR26162829_1.fastq.gz -i SRR26162829_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162829_100x_1.fastq.gz  -o SRR26162829_100x_2.fastq.gz 
rasusa -i SRR26162830_1.fastq.gz -i SRR26162830_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162830_100x_1.fastq.gz  -o SRR26162830_100x_2.fastq.gz 
rasusa -i SRR26162831_1.fastq.gz -i SRR26162831_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162831_100x_1.fastq.gz  -o SRR26162831_100x_2.fastq.gz 
rasusa -i SRR26162832_1.fastq.gz -i SRR26162832_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162832_100x_1.fastq.gz  -o SRR26162832_100x_2.fastq.gz 
rasusa -i SRR26162833_1.fastq.gz -i SRR26162833_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162833_100x_1.fastq.gz  -o SRR26162833_100x_2.fastq.gz 
rasusa -i SRR26162847_1.fastq.gz -i SRR26162847_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162847_100x_1.fastq.gz  -o SRR26162847_100x_2.fastq.gz 
rasusa -i SRR26162848_1.fastq.gz -i SRR26162848_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162848_100x_1.fastq.gz  -o SRR26162848_100x_2.fastq.gz 
rasusa -i SRR26162849_1.fastq.gz -i SRR26162849_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162849_100x_1.fastq.gz  -o SRR26162849_100x_2.fastq.gz 
rasusa -i SRR26162850_1.fastq.gz -i SRR26162850_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR26162850_100x_1.fastq.gz  -o SRR26162850_100x_2.fastq.gz 
```

* SRR26162836 no subsampling was actually done, the estimated coverage was 77.65x
* SRR26162827 no subsampling was actually done, the estimated coverage was 58.22x
* SRR26162828 no subsampling was actually done, the estimated coverage was 61.95x
* SRR26162829 no subsampling was actually done, the estimated coverage was 79.96x
* SRR26162830 no subsampling was actually done, the estimated coverage was 86.12x
* SRR26162831 no subsampling was actually done, the estimated coverage was 43.19x
* SRR26162832 no subsampling was actually done, the estimated coverage was 71.97x
* SRR26162833 no subsampling was actually done, the estimated coverage was 62.42x
* SRR26162847 no subsampling was actually done, the estimated coverage was 65.02x
* SRR26162849 no subsampling was actually done, the estimated coverage was 61.22x
* SRR26162850 no subsampling was actually done, the estimated coverage was 40.72x



#### ATCC 

```
GENOME_SIZE="5.2mb"
rasusa --input ATCC_25922.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_25922_100x.fastq.gz
rasusa -i ATCC_25922_1.fastq.gz -i ATCC_25922_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_25922_100x_1.fastq.gz  -o ATCC_25922_100x_2.fastq.gz 

GENOME_SIZE="5.2mb"
rasusa --input ATCC_17802.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_17802_100x.fastq.gz
rasusa -i ATCC_17802_1.fastq.gz -i ATCC_17802_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_17802_100x_1.fastq.gz  -o ATCC_17802_100x_2.fastq.gz 

GENOME_SIZE="3mb"
rasusa --input ATCC_BAA_679.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_BAA_679_100x.fastq.gz
rasusa -i ATCC_BAA_679_1.fastq.gz -i ATCC_BAA_679_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_BAA_679_100x_1.fastq.gz  -o ATCC_BAA_679_100x_2.fastq.gz 

GENOME_SIZE="4.8mb"
rasusa --input ATCC_10708.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_10708_100x.fastq.gz
rasusa -i ATCC_10708_1.fastq.gz -i ATCC_10708_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_10708_100x_1.fastq.gz  -o ATCC_10708_100x_2.fastq.gz 

GENOME_SIZE="1.8mb"
rasusa --input ATCC_33560.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_33560_100x.fastq.gz
rasusa -i ATCC_33560_1.fastq.gz -i ATCC_33560_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o ATCC_33560_100x_1.fastq.gz  -o ATCC_33560_100x_2.fastq.gz 

```

#### Chitale et al

```
# run rasusa
GENOME_SIZE="4.4mb"
rasusa --input SRR20082804_1.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR20082804_100x.fastq.gz
rasusa -i SRR20082813_1.fastq.gz -i SRR20082813_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR20082813_100x_1.fastq.gz  -o SRR20082813_100x_2.fastq.gz 
```


#  QC with nanoq

* [Nanoq](https://github.com/esteinig/nanoq) v0.10.0 was used for fast long read QC

#### Install nanoq

```
mamba create -n nanoq nanoq
conda activate nanoq
```

#### Run nanoq

```
mkdir nanoq_hybracter_benchmarking

nanoq -i hybracter_benchmarking_data/wick_judd_fastqs/ATCC_10708_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/ATCC_10708_report.txt
nanoq -i hybracter_benchmarking_data/wick_judd_fastqs/ATCC_17802_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/ATCC_17802_report.txt
nanoq -i hybracter_benchmarking_data/wick_judd_fastqs/ATCC_25922_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/ATCC_25922_report.txt
nanoq -i hybracter_benchmarking_data/wick_judd_fastqs/ATCC_33560_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/ATCC_33560_report.txt
nanoq -i hybracter_benchmarking_data/wick_judd_fastqs/ATCC_BAA_679_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/ATCC_BAA_679_report.txt

nanoq -i hybracter_benchmarking_data/Chitale/SRR20082804_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/H37R2_report.txt

nanoq -i hybracter_benchmarking_data/JKD6159/SRR21386010_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/JKD6159_R9_report.txt
nanoq -i hybracter_benchmarking_data/JKD6159/SRR21386012_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/JKD6159_R10_report.txt

nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162846_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateA_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162845_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateB_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162844_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateC_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162843_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateD_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162842_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateE_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162841_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateF_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162840_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateG_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162839_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateH_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162837_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateI_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162836_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateJ_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162835_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateK_report.txt
nanoq -i hybracter_benchmarking_data/PRJNA1020811/SRR26162834_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking/Lerminiaux_isolateL_report.txt
```
