"""
Database and output locations for the pipeline
"""

### OUTPUT DIRs
FLAGS = os.path.join(OUTPUT, 'FLAGS')

SR = os.path.join(OUTPUT, 'SR')
LR = os.path.join(OUTPUT, 'LR')

BENCHMARKS = os.path.join(OUTPUT, 'BENCHMARKS')

REAL = os.path.join(OUTPUT, 'REAL')
SIMULATED = os.path.join(OUTPUT, 'SIMULATED')
DNADIFF = os.path.join(OUTPUT, 'DNADIFF')
DNADIFF_PLASMIDS = os.path.join(OUTPUT, 'DNADIFF_PLASMIDS')

#################
# assembly
#################

# hybracter 
# real
HYBRACTER_LONG_OUTPUT_REAL = os.path.join(REAL, 'HYBRACTER_LONG_OUTPUT')
HYBRACTER_LONG_OUTPUT_REAL_LAST = os.path.join(HYBRACTER_LONG_OUTPUT_REAL, 'LAST')
HYBRACTER_HYBRID_OUTPUT_REAL = os.path.join(REAL, 'HYBRACTER_HYBRID_OUTPUT')
HYBRACTER_HYBRID_OUTPUT_REAL_LAST = os.path.join(HYBRACTER_HYBRID_OUTPUT_REAL, 'LAST')

# bulk

HYBRACTER_HYBRID_OUTPUT_REAL_BULK = os.path.join(REAL, 'HYBRACTER_HYBRID_OUTPUT_REAL_BULK')

# dragonflye
DRAGONFLYE_HYBRID_OUTPUT_REAL = os.path.join(REAL, 'DRAGONFLYE_HYBRID_OUTPUT')
DRAGONFLYE_LONG_OUTPUT_REAL = os.path.join(REAL, 'DRAGONFLYE_LONG_OUTPUT')

# # simulated
# HYBRACTER_LONG_OUTPUT_SIMULATED = os.path.join(SIMULATED, 'HYBRACTER_LONG_OUTPUT')
# HYBRACTER_HYBRID_OUTPUT_SIMULATED = os.path.join(SIMULATED, 'HYBRACTER_HYBRID_OUTPUT')

# for install
HYBRACTER_OUTPUT_TESTS = os.path.join(OUTPUT, 'HYBRACTER_TESTS')

# unicycler
# real
UNICYCLER_OUTPUT_REAL = os.path.join(REAL, 'UNICYCLER_OUTPUT')

# sim
# UNICYCLER_OUTPUT_SIMULATED = os.path.join(REAL, 'UNICYCLER_OUTPUT_SIMULATED')

################
# dnadiff
###############


# unicycler and dragonflye chromosomes for dnadiff

UNICYCLER_CHROMOSOMES = os.path.join(REAL, 'UNICYCLER_CHROMOSOMES')
DRAGONFLYE_CHROMOSOMES = os.path.join(REAL, 'DRAGONFLYE_CHROMOSOMES')

UNICYCLER_PLASMIDS = os.path.join(REAL, 'UNICYCLER_PLASMIDS')
DRAGONFLYE_PLASMIDS = os.path.join(REAL, 'DRAGONFLYE_PLASMIDS')

UNICYCLER_SUMMARIES = os.path.join(REAL, 'UNICYCLER_SUMMARIES')
DRAGONFLYE_SUMMARIES = os.path.join(REAL, 'DRAGONFLYE_SUMMARIES')


# genome dir 
GENOME = os.path.join(workflow.basedir, '../../', 'genomes')
CHROMOSOMES = os.path.join(workflow.basedir, '../../', 'reference_genome_chromosomes')
PLASMIDS = os.path.join(workflow.basedir, '../../', 'reference_genome_plasmids')

DNADIFF_PARSED_OUTPUT = os.path.join(OUTPUT, 'DNADIFF_PARSED_OUTPUT')
DNADIFF_PARSED_OUTPUT_PLASMID = os.path.join(OUTPUT, 'DNADIFF_PARSED_OUTPUT_PLASMID')
PLASMID_PARSED_OUTPUT = os.path.join(OUTPUT, 'PLASMID_PARSED_OUTPUT')


