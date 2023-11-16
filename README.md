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

# Install

```
hybracter_benchmarking install
```


# Run the benchmarking pipeline 

```
hybracter_benchmarking assemble-real --input ../hybracter_benchmarking/real_assemble.csv --bulk_lerminiaux_csv ../hybracter_benchmarking/bulk_assemble_lerminiaux.csv --bulk_lerminiaux_config ../hybracter_benchmarking/bulk_assemble_lerminiaux_config.yaml --output  ../hybracter_benchmarking_results/real_results --threads 16 --cores 16
 

```

# Run the assessment

* This needs to be done after the `hybracter_benchmarking assemble-real` is complete or else it will not work
* The same input csv and output directory needs to be used as `hybracter_benchmarking assemble-real`

```
hybracter_benchmarking assess-real --input ../hybracter_benchmarking/real_assemble.csv --output  ../hybracter_benchmarking_results/real_results --threads 16 --cores 16
```


# pharokka on JKD6159

```
pharokka.py -i extra_phage_contigs.fasta -o JKD6159_extra_phage_contigs -t 8 -d ../pharokka_v1.4.0_databases
```

# bakta on JKD6159