
rule hybracter_hybrid_real_bulk:
    """
    assembles the 12 lerminiaux isolates in one go to show the benefits of hybracter's bulk approach
    """
    input:
        csv = BULK_CSV
    output:
        tsv = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL_BULK, "FINAL_OUTPUT", "hybracter_summary.tsv")
    threads:
        16
    params:
        out_dir = HYBRACTER_HYBRID_OUTPUT_REAL_BULK,
        medaka_model = "r1041_e82_400bps_sup_g615"
    benchmark:
        os.path.join(BENCHMARKS,"bulk_lermininaux_hybracter_hybrid_real.txt")
    resources:
        mem_mb=64000,
        time=6000 # 6000 mins
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter hybrid --input {input.csv} --medakaModel {params.medaka_model} -o {params.out_dir} -t {threads}  --skip_qc
        '''


#### aggregation rule
rule aggr_hybracter_real_bulk:
    """aggregate bulk"""
    input:
        os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL_BULK, "FINAL_OUTPUT", "hybracter_summary.tsv")
    output:
        os.path.join(FLAGS, "hybracter_real_bulk_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """