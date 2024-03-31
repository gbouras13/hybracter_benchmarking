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
mkdir nanoq_hybracter_benchmarking_duplex

nanoq -i fastqs/SRR28370642_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_duplex/SRR28370642_report.txt
nanoq -i fastqs/SRR28370643_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_duplex/SRR28370643_report.txt
nanoq -i fastqs/SRR28370636_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_duplex/SRR28370636_report.txt
nanoq -i fastqs/SRR28370644_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_duplex/SRR28370644_report.txt
nanoq -i fastqs/SRR28370641_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_duplex/SRR28370641_report.txt
```

# Run Duplex

```bash
export CUDA_VISIBLE_DEVICES=""
hybracter_benchmarking assemble-real --input duplex.csv --bulk_lerminiaux_csv depth_assemble_bulk.csv --bulk_lerminiaux_config bulk_config.yaml --output  hybracter_benchmarking_results_duplex --threads 32  --cores 16  --keep-going
```

```bash

hybracter_benchmarking assess-real --input duplex.csv  --output  hybracter_benchmarking_results_duplex --threads 32 --cores 16
```
