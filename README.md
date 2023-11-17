# hybracter_benchmarking

This repository holds the benchmarking pipeline for `hybracter`

This directory contains the pipeline used to benchmark [hybracter](https://github.com/gbouras13/hybracter).

I used [Snaketool](https://github.com/beardymcjohnface/Snaketool) to make this pipeline (and also hybracter), and would highly recommend it!

You will need to change the 2 `csv` input files in this directory with the correct FASTQ paths of the required files on your system. 

You can get the FASTQs from the Zenodo repository (coming soon) or follow the instructions in [get_fastqs.md](get_fastqs.md).


# Step 1: Download hybracter_benchmarking and install it from source in a conda env

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

# Step 2: Install

```
hybracter_benchmarking install
```


# Step 3: Run the benchmarking assess pipeline 

```
# to disable GPU on my system for a fair bechmarking with medaka 
export CUDA_VISIBLE_DEVICES=""
cd ..
hybracter_benchmarking assemble-real --input real_assemble.csv --bulk_lerminiaux_csv bulk_assemble_lerminiaux.csv --bulk_lerminiaux_config bulk_assemble_lerminiaux_config.yaml --output  ../hybracter_benchmarking_results/real_results --threads 16 --cores 16
```

# Step4: Run the assessments

* This needs to be done after the `hybracter_benchmarking assemble-real` is complete or else it will not work
* The same input csv and output directory needs to be used as `hybracter_benchmarking assemble-real`

```
hybracter_benchmarking assess-real --input real_assemble.csv --output  ../hybracter_benchmarking_results/real_results --threads 16 --cores 16
```

* You should get the following output directories:
  * `BENCHMARKS` - contains the time etc benchmarking for each run (sample x tool)
  * `DNADIFF` - contains raw chromosome Dnadiff results for each run (sample x tool)
  * `DNADIFF_PARSED_OUTPUT` - contains parsed chromosome Dnadiff results for each sample
  * `DNADIFF_PLASMIDS` - contains plasmid Dnadiff results for each run (sample x tool)
  * `DNADIFF_PARSED_OUTPUT_PLASMID` - contains parsed plasmid Dnadiff results for each sample
  * `REAL` - this contains all the actual output for each assembler. The following 5 directories will contain the all the raw output:
    * `HYBRACTER_HYBRID_OUTPUT`
    * `HYBRACTER_LONG_OUTPUT`
    * `DRAGONFLYE_HYBRID_OUTPUT`
    * `DRAGONFLYE_LONG_OUTPUT`
    * `UNICYCLER_OUTPUT`
    * 
* It will also contain a number of other subdirectories with summary outputs and specific plasmids and chromosome assemblies for Unicycler and Dragonflye

# Other Utilities

* `genomes` directory contains the reference genomes
* `reference_genome_chromosomes` directory contains the reference chromosomes
* `reference_genome_plasmids` directory contains the reference plasmids

* `parse_genomes.py` was used to generate per contig and overall genome lengths for all reference genomes (contained in the `genome_info` directory).
* `Graphs_Ghais` contains R scripts used to make plots for the Hybracter manuscript.


# Usage

```
Usage: hybracter_benchmarking [OPTIONS] COMMAND [ARGS]...

  hybracter_benchmarking For more options, run: hybracter_benchmarking
  --help

Options:
  -v, --version  Show the version and exit.
  -h, --help     Show this message and exit.

Commands:
  install        install hybracter hybracter_benchmarking
  assemble-real  assemble real reads hybracter_benchmarking
  assess-real    asssess real assembly output in hybracter_benchmarking
  config         Copy the system default config file
  citation       Print the citation(s) for this tool
```

