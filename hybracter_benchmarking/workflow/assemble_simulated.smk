
# Concatenate Snakemake's own log file with the master log file
onsuccess:
    shell("cat {log} >> " + config['log'])

onerror:
    shell("cat {log} >> " + config['log'])

outTouch = os.path.join(config['output'], config['input'])

### DEFAULT CONFIG FILE
configfile: os.path.join(workflow.basedir, '../', 'config', 'config.yaml')


CSV = config['input']
OUTPUT = config['output']
THREADS = config['threads']


# need to specify the reads directory
CSV = config['input']


### DIRECTORIES
include: "rules/directories.smk"
# functions
include: "rules/functions.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesSimulate(CSV)
SAMPLES = list(dictReads.keys())


# Import rules and functions
include: "rules/targets.smk"
include: "rules/hybracter_install.smk"
include: "rules/hybracter_simulated_reads.smk"
include: "rules/unicycler_simulated_reads.smk"


rule all:
    input:
        AssembleSimulateTargetFiles
        