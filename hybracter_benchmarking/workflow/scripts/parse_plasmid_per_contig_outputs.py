
#!/usr/bin/env python3

import csv
import pandas as pd



def parse_per_contig(hybracter_hybrid, hybracter_long, unicycler, dragonflye_hybrid, dragonflye_long, tsv_path, sample):

    # preamble
    print("beginning parse_dnadiff_outputs.py")
    print("this is a helper script")
    print("Written by George Bouras: george.bouras@adelaide.edu.au")

    reports = [hybracter_hybrid, hybracter_long, unicycler, dragonflye_hybrid, dragonflye_long ]
    names = ["hybracter_hybrid", "hybracter_long", "unicycler", "dragonflye_hybrid", "dragonflye_long" ]

    i = 0 

    combined_df = pd.DataFrame()

    for report in reports:

        run = names[i]
        i += 1

        # Iterate through the file names and read each file into a DataFrame
        df = pd.read_csv(report, sep='\t')
        # Add a new column 'Sample' with the file name
        df['Sample'] = sample
        df['Run'] = run
        combined_df = combined_df.concat(df)


    # Reset the index of the combined DataFrame
    combined_df.reset_index(drop=True, inplace=True)

    # Reorder the columns with 'Sample' as the first column and Run in the second
    combined_df = combined_df[['Sample'] + ['Run'] + [col for col in combined_df.columns if col != ['Sample', 'Run']]]


    # Save the combined DataFrame to a new TSV file
    combined_df.to_csv(tsv_path, sep='\t', index=False)



parse_per_contig(snakemake.params.hybracter_hybrid, snakemake.params.hybracter_long,
               snakemake.input.unicycler, snakemake.input.dragonflye_hybrid,
               snakemake.input.dragonflye_long, snakemake.output.tsv, snakemake.wildcards.sample)






