[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![](https://img.shields.io/static/v1?label=CLI&message=Snaketool&color=blueviolet)](https://github.com/beardymcjohnface/Snaketool)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/gbouras13/hybracter_benchmarking/main?color=8a35da)
[![DOI](https://zenodo.org/badge/696328028.svg)](https://zenodo.org/badge/latestdoi/696328028)


# hybracter_benchmarking

This directory contains the pipeline used to benchmark [hybracter](https://github.com/gbouras13/hybracter).

I used [Snaketool](https://github.com/beardymcjohnface/Snaketool) to make this pipeline (and also `hybracter`), and would highly recommend it!

To use this repository, you will need to change the 2 `csv` input files in this directory with the correct FASTQ paths of the required files on your system. 

You can get the FASTQs from the Zenodo repository [here](https://doi.org/10.5281/zenodo.10158013) or follow the instructions in [get_fastqs.md](get_fastqs.md).

# Step 1: Download hybracter_benchmarking and install it from source in a conda env

```
# creates conda env
mamba create -n hybracter_benchmarking pip
conda activate hybracter_benchmarking

# download the repository
git clone "https://github.com/gbouras13/hybracter_benchmarking"
cd hybracter_benchmarking

pip install -e .
hybracter_benchmarking --help
```

# Step 2: Install

```
hybracter_benchmarking install
```

# Step 3: Run the benchmarking assemble-real command 

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

# Outputs

* You should get the following output directories (as per the output you can find [here](https://doi.org/10.5281/zenodo.10158013)):
  * `BENCHMARKS` - contains the time etc benchmarking for each run (sample x tool)
  * `DNADIFF` - contains raw chromosome Dnadiff results for each run (sample x tool)
  * `DNADIFF_PARSED_OUTPUT` - contains parsed chromosome Dnadiff results for each sample
  * `DNADIFF_PLASMIDS` - contains plasmid Dnadiff results for each run (sample x tool)
  * `DNADIFF_PARSED_OUTPUT_PLASMID` - contains parsed plasmid Dnadiff results for each sample
  * `REAL` - this contains all the actual output for each assembler. The following 5 directories will contain the all the raw output with subdirectories for each sample:
    * `HYBRACTER_HYBRID_OUTPUT`
    * `HYBRACTER_LONG_OUTPUT`
      * Note there will also be a `LAST` subdirectory in the `HYBRACTER_HYBRID_OUTPUT` and `HYBRACTER_LONG_OUTPUT`. The output contained in it are the sample, but where hybracter is run with `--logic last`. These were mostly done to test the functionality, not so much from a benchmarking perspective.
    * `DRAGONFLYE_HYBRID_OUTPUT`
    * `DRAGONFLYE_LONG_OUTPUT`
    * `UNICYCLER_OUTPUT`
    * Additionally, it should have `HYBRACTER_HYBRID_OUTPUT_REAL_BULK` - this contains the output for the 12 Lerminiaux et al isolates assembled using `hybracter hybrid` with modified config file `bulk_assemble_lerminiaux_config.yaml`.
  
* It will also contain a number of other subdirectories `_SUMMARIES`, `_PLASMIDS`, `_CHROMOSOMES` with parsed summary outputs and parsed specific plasmids and chromosome assemblies for Unicycler and Dragonflye (this made the assessment a lot easier and automated).

# Other Directories in this Repository

* `genomes` directory contains the reference genomes
* `reference_genome_chromosomes` directory contains the reference chromosomes. The ATCC references for the 5 ATCC strains (which were replaced by the curated Trycycler references in v2 of the preprint) are labelled as `_atcc.fasta`
* `reference_genome_plasmids` directory contains the reference plasmids.
* `parse_genomes.py` was used to generate per contig and overall genome lengths for all reference genomes (output contained in the `genome_info` directory).
* `Graphs_Ghais` contains R script and data used to make plots for the Hybracter manuscript.
* `bulk_assemble_lerminiaux_config.yaml` is the modified config file used on my system to benchmark `hybracter hybrid` showing the efficiency benefits of `hybracter` when run on multiple samples.
* `fast_analysis` contains the benchmarking scripts and input for the extra 5 fast model basecalled ATCC samples added in v2 of the preprint. See the `README.md` for more information
* `duplex_analysis` contains the benchmarking scripts and input for the extra 5 duplex super-accuracy model basecalled ATCC samples added in v2 of the preprint. See the `README.md` for more information.
* `atcc_trycycler_comparisons` contains the output of comparing the ATCC reference assemblies to the curated Trycycler assemblies of the same data
    * Note for `ATCC_17802_atcc.fasta`, the second chromosome was reoriented to begin with the `repA` gene using `dnaapler all v0.7.0` to allow for comparison with `compare_assemblies.py`.
    * These were run as follows:

```bash
mamba create -n compare_assembliesENV mappy edlib
conda activate compare_assembliesENV
python compare_assemblies.py 

python compare_assemblies.py  reference_genome_chromosomes/ATCC_10708.fasta reference_genome_chromosomes/ATCC_10708_atcc.fasta > atcc_trycycler_comparisons/ATCC_10708_comparison.txt  2>&1
python compare_assemblies.py  reference_genome_chromosomes/ATCC_17802.fasta reference_genome_chromosomes/ATCC_17802_atcc.fasta > atcc_trycycler_comparisons/ATCC_17802_comparison.txt  2>&1
python compare_assemblies.py  reference_genome_chromosomes/ATCC_25922.fasta reference_genome_chromosomes/ATCC_25922_atcc.fasta > atcc_trycycler_comparisons/ATCC_25922_comparison.txt  2>&1
python compare_assemblies.py  reference_genome_chromosomes/ATCC_33560.fasta reference_genome_chromosomes/ATCC_33560_atcc.fasta > atcc_trycycler_comparisons/ATCC_33560_comparison.txt  2>&1
python compare_assemblies.py  reference_genome_chromosomes/ATCC_BAA_679.fasta reference_genome_chromosomes/ATCC_BAA_679_atcc.fasta > atcc_trycycler_comparisons/ATCC_BAA_679_comparison.txt  2>&1
``` 

* `jkd6159_reference_comparisons` contains the output comparing the old [2010 Chua _et al_](https://doi.org/10.1128/jb.00878-10) JKD6159 reference and the perfect [2023 Wick _et al_](https://doi.org/10.1128/mra.01129-22) reference.
    * The reason this is included is that a reviewer of v1 of the manuscript noticed that a couple of samples consistently had worse performance (for all assemblers) than the rest.
    * It turns out these were the JKD6159 R9 and R10 samples, and it was because we erroneously used the old 2010 reference instead of the perfect 2023 one. 
    * When we included the correct reference (v2), the number of errors was greatly reduced
    * Running `compare_assemblies.py` on the two assemblies shows 8,255 differences (!), though this is inflated by a few large insertions/deletions

```bash
python compare_assemblies.py jkd6159_reference_comparisons/JDK6159_Chua_2010.fasta jkd6159_reference_comparisons/JKD6159_Wick_2023.fasta > jkd6159_reference_comparisons/JKD6159_comparison.txt  2>&1
```



# Usage

```bash
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

