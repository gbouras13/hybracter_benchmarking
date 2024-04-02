# Instructions on how to run the Extra 5 fast model basecalled ATCC samples

## Download FASTQs

## _Escherichia coli_ ATCC 25922

```bash
conda activate fastq-dl
CPUS=16
GENOME_SIZE="5.2mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370659  --cpus $CPUS
conda deactivate
conda activate rasusa
rasusa --input SRR28370659.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370659_100x.fastq.gz
```

##  _Vibrio parahemolyticus_ ATCC 17802

```bash
GENOME_SIZE="5.2mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370661  --cpus $CPUS
rasusa --input SRR28370661.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370661_100x.fastq.gz
```

## _Listeria monocytogenes_ ATCC BAA-679

```bash
GENOME_SIZE="3mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370654	  --cpus $CPUS
rasusa --input SRR28370654.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370654_100x.fastq.gz
```

## _Salmonella enterica_ ATCC 10708

```bash
GENOME_SIZE="4.8mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370662	  --cpus $CPUS
rasusa --input SRR28370662.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370662_100x.fastq.gz
```

## _Campylobacter jejuni_ ATCC 33560

```bash
GENOME_SIZE="1.8mb"
# simplex fast v4.3.0
fastq-dl -a SRR28370658	  --cpus $CPUS
rasusa --input SRR28370658.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR28370658_100x.fastq.gz
```

#  QC with nanoq

* [Nanoq](https://github.com/esteinig/nanoq) v0.10.0 was used for fast long read QC

#### Install nanoq

```bash
mamba create -n nanoq nanoq
conda activate nanoq
```

#### Run nanoq

```bash
mkdir nanoq_hybracter_benchmarking_fast

nanoq -i fastqs/SRR28370659_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_fast/SRR28370659_report.txt
nanoq -i fastqs/SRR28370661_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_fast/SRR28370661_report.txt
nanoq -i fastqs/SRR28370654_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_fast/SRR28370654_report.txt
nanoq -i fastqs/SRR28370662_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_fast/SRR28370662_report.txt
nanoq -i fastqs/SRR28370658_100x.fastq.gz  -s -H  > nanoq_hybracter_benchmarking_fast/SRR28370658_report.txt
```


#### Run Benchmarking Pipeline

```bash
export CUDA_VISIBLE_DEVICES=""
hybracter_benchmarking assemble-real --input fast.csv --bulk_lerminiaux_csv depth_assemble_bulk.csv --bulk_lerminiaux_config bulk_config.yaml --output  hybracter_benchmarking_results_fast --threads 32  --cores 16  --keep-going
```

* Note the bulk files are just to make the pipeline work, they are not actually used

```bash

hybracter_benchmarking assess-real --input fast.csv  --output  hybracter_benchmarking_results_fast --threads 32 --cores 16
```
