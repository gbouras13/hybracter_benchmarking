"""
All target output files are declared here
"""

InstallTargetFiles = [
 os.path.join(FLAGS, "hybracter_installed.txt"),
 os.path.join(FLAGS, "hybracter_tested.txt"),
]


SimulateTargetFiles = [
 # InstallTargetFiles,
 os.path.join(FLAGS, "sr_aggr.txt"),
 os.path.join(FLAGS, "lr_aggr.txt")
]

# AssembleSimulateTargetFiles = [
# os.path.join(FLAGS, "hybracter_simulated_aggr.txt"),
# os.path.join(FLAGS, "unicycler_simulated_aggr.txt")
# ]

AssembleRealTargetFiles = [
os.path.join(FLAGS, "hybracter_real_aggr.txt"),
os.path.join(FLAGS, "unicycler_real_aggr.txt"),
os.path.join(FLAGS, "dragonflye_real_aggr.txt")
]

RealAssessTargetFiles = [os.path.join(FLAGS, "dnadiff_real_aggr.txt"),
os.path.join(FLAGS, "dnadiff_real_parsed_aggr.txt")

    ]

# SimulateQuastTargetFiles = [os.path.join(FLAGS, "quast_ref_aggr.txt"),
# os.path.join(FLAGS, "quast_simulated_aggr.txt"),
# os.path.join(FLAGS, "get_plasmids_unicycler_sim_aggr.txt"),
# os.path.join(FLAGS, "get_fasta_lengths_sim_aggr.txt")
#     ]



