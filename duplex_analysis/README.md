# Instructions How to Download Fastqs

## Download FASTQs

## _Escherichia coli_ ATCC 25922

```bash
conda activate fastq-dl
CPUS=16
GENOME_SIZE="5.2mb"
# duplex v4.3.0
fastq-dl -a SRR28370642  --cpus $CPUS
conda deactivate
conda activate rasusa
rasusa --input SRR28370642.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370642_100x.fastq.gz
```

* Coverage is less than 100x (45.56x)

##  _Vibrio parahemolyticus_ ATCC 17802

```bash
GENOME_SIZE="5.2mb"
# duplex v4.3.0
fastq-dl -a SRR28370643  --cpus $CPUS
rasusa --input SRR28370643.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370643_100x.fastq.gz
```

* Coverage is less than 100x (29.01x)

## _Listeria monocytogenes_ ATCC BAA-679

```bash
GENOME_SIZE="3mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370636	  --cpus $CPUS
rasusa --input SRR28370636.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370636_100x.fastq.gz
```

* Coverage is less than 100x (49.51x)

## _Salmonella enterica_ ATCC 10708

```bash
GENOME_SIZE="4.8mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370644	  --cpus $CPUS
rasusa --input SRR28370644.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370644_100x.fastq.gz
```

* Coverage is less than 100x (75.20x)
 
## _Campylobacter jejuni_ ATCC 33560

```bash
GENOME_SIZE="1.8mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370641	  --cpus $CPUS
rasusa --input SRR28370641.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370641_100x.fastq.gz
```

* Coverage is less than 100x (55.05x)


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


# Run Duplex

```bash
export CUDA_VISIBLE_DEVICES=""
hybracter_benchmarking assemble-real --input duplex.csv --bulk_lerminiaux_csv depth_assemble_bulk.csv --bulk_lerminiaux_config bulk_config.yaml --output  hybracter_benchmarking_results_duplex --threads 32  --cores 16  --keep-going
```

```bash

hybracter_benchmarking assess-real --input duplex.csv  --output  hybracter_benchmarking_results_duplex --threads 32 --cores 16
```
