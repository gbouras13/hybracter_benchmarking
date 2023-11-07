
#!/usr/bin/env python3

import sys
import csv



# def get_input():
#     """gets input for pharokka_plotter.py
#     :return: args
#     """
#     parser = argparse.ArgumentParser(
#         description="pharokka_plotter.py: pharokka plotting function",
#         formatter_class=RawTextHelpFormatter,
#     )
#     parser.add_argument(
#         "-d",
#         "--dnadiff_directory",
#         action="store",
#         required=True,
#         help="Path to DNADIFF_OUTPUT.",
#     )
#     parser.add_argument(
#         "-o",
#         "--outfile",
#         action="store",
#         required=True,
#         help='output file',
#     )
#     args = parser.parse_args()
#     return args

# parse_dnadiff(snakemake.input.hybracter_hybrid, snakemake.input.hybracter_long,
#                snakemake.input.unicycler, snakemake.input.dragonflye_hybrid,
#                snakemake.input.dragonflye_long, snakemake.output.report)


def parse_dnadiff(hybracter_hybrid, hybracter_long, unicycler, dragonflye_hybrid, dragonflye_long, tsv_path, sample):

    # preamble
    print("beginning parse_dnadiff_outputs.py")
    print("this is a helper script")
    print("Written by George Bouras: george.bouras@adelaide.edu.au")


    dnadiff_dict = {}

    reports = [hybracter_hybrid, hybracter_long, unicycler, dragonflye_hybrid, dragonflye_long ]
    names = ["hybracter_hybrid", "hybracter_long", "unicycler", "dragonflye_hybrid", "dragonflye_long" ]


    i = 0 

    for report in reports:

        run = names[i]
        i += 1

        dnadiff_dict[run] = {}

        # Initialize variables to store the values
        # insertions = {"REF": 0, "QRY": 0}
        # total_snps = {"REF": 0, "QRY": 0}
        # total_indels = {"REF": 0, "QRY": 0}
        # unaligned_bases = {"REF": 0, "QRY": 0}

        # Open the text file for reading
        with open(report, 'r') as file:
            lines = file.readlines()

        # Iterate through the lines and extract the values
        for line in lines:
            if line.strip().startswith("TotalSNPs"):
                parts = line.strip().split()
                dnadiff_dict[run]['TotalSNPs'] = max(int(parts[1]), int(parts[2]))
            elif line.strip().startswith("TotalIndels"):
                parts = line.strip().split()
                dnadiff_dict[run]['TotalIndels'] = max(int(parts[1]), int(parts[2]))
            elif line.strip().startswith("Insertions"):
                parts = line.strip().split()
                dnadiff_dict[run]['InsertionsRef'] = int(parts[1])
                dnadiff_dict[run]['InsertionsQry'] = int(parts[2])
            elif line.strip().startswith("InsertionSum"):
                parts = line.strip().split()
                dnadiff_dict[run]['InsertionSumRef'] = int(parts[1])
                dnadiff_dict[run]['InsertionSumQry'] = int(parts[2])
            elif line.strip().startswith("TotalBases"): # gets the size  of ref
                parts = line.strip().split()
                dnadiff_dict[run]['TotalBasesRef'] = int(parts[1])
                dnadiff_dict[run]['TotalBasesQry'] = int(parts[2])
            elif line.strip().startswith("UnalignedBases"):
                parts = line.strip().split()
                dnadiff_dict[run]['UnalignedBasesRef'] = int(parts[1].split('(')[0] )
                dnadiff_dict[run]['UnalignedBasesQry'] =  int(parts[2].split('(')[0] )
            elif line.strip().startswith("Breakpoints"):
                parts = line.strip().split()
                dnadiff_dict[run]['Breakpoints'] = max(int(parts[1]), int(parts[2]))
            elif line.strip().startswith("Relocations"):
                parts = line.strip().split()
                dnadiff_dict[run]['Relocations'] = max(int(parts[1]), int(parts[2]))
            elif line.strip().startswith("Translocations"):
                parts = line.strip().split()
                dnadiff_dict[run]['Translocations'] = max(int(parts[1]), int(parts[2]))
            elif line.strip().startswith("Inversions"):
                parts = line.strip().split()
                dnadiff_dict[run]['Inversions'] = max(int(parts[1]), int(parts[2]))


    # Define the output file name
    output_file = tsv_path

    result_list = []

    # Iterate through the keys in the dnadiff_dict
    for run, data in dnadiff_dict.items():
        # Initialize a dictionary to store the data for this run
        run_data = {
            'Sample': sample,
            'Run': run,
            'TotalSNPs': data.get('TotalSNPs', 0),
            'TotalIndels': data.get('TotalIndels', 0),
            'InsertionsRef': data.get('InsertionsRef', 0),
            'InsertionsQry': data.get('InsertionsQry', 0),
            'InsertionSumRef': data.get('InsertionSumRef', 0),
            'InsertionSumQry': data.get('InsertionSumQry', 0),
            'TotalBasesRef': data.get('TotalBasesRef', 0),
            'TotalBasesQry': data.get('TotalBasesQry', 0),
            'UnalignedBasesRef': data.get('UnalignedBasesRef', 0),
            'UnalignedBasesQry': data.get('UnalignedBasesQry', 0),
            'Breakpoints': data.get('Breakpoints', 0),
            'Relocations': data.get('Relocations', 0),
            'Translocations': data.get('Translocations', 0),
            'Inversions': data.get('Inversions', 0)
        }
        result_list.append(run_data)

    
    # Define the fieldnames (column names) for the TSV file
    fieldnames = [
        'Sample',
        'Run',
        'TotalSNPs',
        'TotalIndels',
        'InsertionsRef',
        'InsertionsQry',
        'InsertionSumRef',
        'InsertionSumQry',
        'TotalBasesRef',
        'TotalBasesQry',
        'UnalignedBasesRef',
        'UnalignedBasesQry',
        'Breakpoints',
        'Relocations',
        'Translocations',
        'Inversions'
    ]

    # Write the data to the TSV file
    with open(output_file, 'w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames, delimiter='\t')
        writer.writeheader()  # Write the header row
        writer.writerows(result_list)  # Write the data rows



    # # Define the headers for the TSV file
    # headers = ['Run', 'TotalIndels', 'TotalSNPs', 'InsertionsRef', 'InsertionsQry', 'InsertionSumRef',
    #            'InsertionSumQry', 'TotalBasesRef', 'TotalBasesQry', 'UnalignedBasesRef', 'UnalignedBasesQry',
    #              'Breakpoints', 'Relocations', 'Translocations', 'Inversions'  ]


    # # Write data to the TSV file
    # with open(output_file, 'w', newline='') as tsvfile:
    #     writer = csv.writer(tsvfile, delimiter='\t')
        
    #     # Write the header row
    #     writer.writerow(headers)
        
    #     # Write the data rows

    #     for run, values in dnadiff_dict.items():

    #         row = [run, values['TotalIndels'], values['TotalSNPs'], '']
    #         writer.writerow(row)



parse_dnadiff(snakemake.input.hybracter_hybrid, snakemake.input.hybracter_long,
               snakemake.input.unicycler, snakemake.input.dragonflye_hybrid,
               snakemake.input.dragonflye_long, snakemake.output.tsv, snakemake.wildcards.sample)






