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

#################
# assembly
#################

# hybracter 
# real
HYBRACTER_LONG_OUTPUT_REAL = os.path.join(REAL, 'HYBRACTER_LONG_OUTPUT')
HYBRACTER_HYBRID_OUTPUT_REAL = os.path.join(REAL, 'HYBRACTER_HYBRID_OUTPUT')

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

# genome dir 
GENOME = os.path.join(workflow.basedir, '../../', 'genomes')

CHROMOSOMES = os.path.join(workflow.basedir, '../../', 'reference_genome_chromosomes')



