In the revisions of Hybracter, we were asked to add an analysis comparing the performance of Hybracter at different depths of long-read sequencing data on an example isolate.

Therefore, we decided to subsample the long read set for _Lerminiaux_ isolate B, which is an _Enterobacter cloacae_ isolate. I note that the short-read data was of approximately estimated coverage of 61.22x for this sample (see the `get_fastqs.md` file for more information).

We subsampled the long-read set

```bash

read_dir=/home/user/Documents/hybracter_depth_analysis/fastqs
subsample_dir=/home/user/Documents/hybracter_depth_analysis/fastqs/Lerminiaux_isolate_B_subsampled
genomes=(
    "ATCC_10708_Salmonella_enterica"
    "ATCC_14035_Vibrio_cholerae"
    "ATCC_17802_Vibrio_parahaemolyticus"
    "ATCC_19119_Listeria_ivanovii"
    "ATCC_25922_Escherichia_coli"
    "ATCC_33560_Campylobacter_jejuni"
    "ATCC_35221_Campylobacter_lari"
    "ATCC_35897_Listeria_welshimeri"
    "ATCC_BAA-679_Listeria_monocytogenes"
)

for d in $(seq -f "%02.0f" 10 5 100); do 
        mkdir -p "$subsample_dir"
        cd "$read_dir"
        echo "$d"x

        genome_size=5500000
        target_bases=$(echo "scale=2; $genome_size * "$d | bc)
        
        rasusa -i "$read_dir"/SRR26162845_100x.fastq.gz  -b "$target_bases"  -o "$subsample_dir"/"$d"x.fastq.gz 
        wait
done

```bash
export CUDA_VISIBLE_DEVICES=""

hybracter_benchmarking assemble-real --input depth_assemble.csv --bulk_lerminiaux_csv depth_assemble_bulk.csv --bulk_lerminiaux_config bulk_config.yaml --output hybracter_depth_Lerminiaux_isolate_benchmarking_results --threads 32 --cores 16
```

* removing the 15x and 20x - hybracter failed to completely circularise the genome here

```bash
# hybracter_benchmarking assess-real --input depth_assemble.csv --output  hybracter_depth_Lerminiaux_isolate_benchmarking_results --threads 32 --cores 16

hybracter_benchmarking assess-real --input depth_assemble_assess.csv --output  hybracter_depth_Lerminiaux_isolate_benchmarking_results --threads 32 --cores 16
```

