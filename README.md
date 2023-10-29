# hybracter_benchmarking
Benchmarking Pipeline for `hybracter`

This directory contains the pipeline used to benchmark [hybracter](https://github.com/gbouras13/hybracter).

I used [Snaketool](https://github.com/beardymcjohnface/Snaketool) to make this, and would highly recommend it!

It should work 'out of the box' for the simulated reads. For the real read sets, you will need to change the `csv` input files in this directory with the correct FASTQ paths of the required files on your system. 


# Download hybracter_benchmarking and install it in a conda env

```
# creates conda env
mamba create -n hybracter_benchmarking pip
conda activate hybracter_benchmarking

# download the repository
git clone "https://github.com/gbouras13/hybracter_benchmarking"
cd hybracter_benchmarking/hybracter_benchmarking

pip install -e .
hybracter_benchmarking --help
```

## subsampling to 100x

```

mamba create -n rasusa 


##### JKD6159

```
GENOME_SIZE="2.9mb"

rasusa --input SRR21386010.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR21386010_100x.fastq.gz
rasusa --input SRR21386012.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR21386012_100x.fastq.gz
rasusa -i SRR21386014_1.fastq.gz -i SRR21386014_2.fastq.gz --coverage 100 --genome-size $GENOME_SIZE -o SRR21386014_100x_1.fastq.gz  -o SRR21386014_100x_2.fastq.gz 
```

# Lermaniaux
```
GENOME_SIZE="5.5mb"

# LR

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

* SRR26162836 no subsampling done actual coverage is 52.92x 
* SRR26162839 no subsampling done actual coverage is 97.78x 
* SRR26162841 no subsampling done actual coverage is 53.24x 
* SRR26162844 no subsampling done actual coverage is 33.25x

# SR

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

* SRR26162836 no subsampling done actual coverage is 77.65x
* SRR26162827 no subsampling done actual coverage is 58.22x
* SRR26162828 no subsampling done actual coverage is 61.95x
* SRR26162829 no subsampling done actual coverage is 79.96x
* SRR26162830 no subsampling done actual coverage is 86.12x
* SRR26162831 no subsampling done actual coverage is 43.19x
* SRR26162832 no subsampling done actual coverage is 71.97x
* SRR26162833 no subsampling done actual coverage is 62.42x
* SRR26162847 no subsampling done actual coverage is 65.02x
* SRR26162849 no subsampling done actual coverage is 61.22x
* SRR26162850 no subsampling done actual coverage is 40.72x

# to disable GPU for a fair bechmarking with medaka 
export CUDA_VISIBLE_DEVICES=""

hybracter_benchmarking assemble-real --input real_assemble.csv --output  ../hybracter_benchmarking_results/real_results --threads 8 --cores 8
```




