In the revisions of Hybracter, we were asked to add an analysis comparing the performance of Hybracter at different depths of long-read sequencing data on an example isolate.

Therefore, we decided to subsample the long read set for _Lerminiaux et al_ isolate B, which is an _Enterobacter cloacae_ isolate. The short-read data was of approximately estimated coverage of 61.22x for this sample (see the `get_fastqs.md` file for more information).

We subsampled the long-read set as follows:

```bash

# replace with their location on your machine
read_dir=/home/user/Documents/hybracter_depth_analysis/fastqs
subsample_dir=/home/user/Documents/hybracter_depth_analysis/fastqs/Lerminiaux_isolate_B_subsampled

for d in $(seq -f "%02.0f" 10 5 100); do 
        mkdir -p "$subsample_dir"
        cd "$read_dir"
        echo "$d"x

        genome_size=5500000
        target_bases=$(echo "scale=2; $genome_size * "$d | bc)
        
        rasusa -i "$read_dir"/SRR26162845_100x.fastq.gz  -b "$target_bases"  -o "$subsample_dir"/"$d"x.fastq.gz 
        wait
done

```

#### Run Benchmarking Pipeline

* Note the bulk files are just to make the pipeline work

```bash
export CUDA_VISIBLE_DEVICES=""

hybracter_benchmarking assemble-real --input depth_assemble.csv --bulk_lerminiaux_csv depth_assemble_bulk.csv --bulk_lerminiaux_config bulk_config.yaml --output hybracter_depth_Lerminiaux_isolate_benchmarking_results --threads 32 --cores 16
```

* removing the 10x and 15x samples from `depth_assemble_assess.csv` - Hybracter failed to completely circularise the genome here
* I manually calculated the 10x and 15x samples for Unicycler to add into Figure 4

```bash
hybracter_benchmarking assess-real --input depth_assemble_assess.csv --output  hybracter_depth_Lerminiaux_isolate_benchmarking_results --threads 32 --cores 16
```

