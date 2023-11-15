
# Concatenate Snakemake's own log file with the master log file
onsuccess:
    shell("cat {log} >> " + config['log'])

onerror:
    shell("cat {log} >> " + config['log'])

outTouch = os.path.join(config['output'], config['input'])

### DEFAULT CONFIG FILE
configfile: os.path.join(workflow.basedir, '../', 'config', 'config.yaml')

# need to specify the reads directory
CSV = config['input']
OUTPUT = config['output']
THREADS = config['threads']
BULK_CSV = config['bulk_lerminiaux_csv']
BULK_CONFIG = config['bulk_lerminiaux_config']


### DIRECTORIES
include: "rules/directories.smk"
include: "rules/functions.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesReal(CSV)
SAMPLES = list(dictReads.keys())


# Import rules and functions
include: "rules/targets.smk"
include: "rules/hybracter_install.smk"
include: "rules/hybracter_real_reads.smk"
include: "rules/hybracter_real_reads_bulk.smk"
include: "rules/hybracter_real_reads_last.smk"
include: "rules/unicycler_real_reads.smk"
include: "rules/dragonflye_real_reads.smk"


rule all:
    input:
        AssembleRealTargetFiles
        