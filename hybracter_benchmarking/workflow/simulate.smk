
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
# genome dir 
GENOME = os.path.join(workflow.basedir, '../../', 'genomes')

# define functions
def get_length(wildcards):
    reads = dictReads[wildcards.sample]["chromosome_length"]
    return int(reads)


### DIRECTORIES
include: "rules/directories.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesSimulate(CSV)
SAMPLES = list(dictReads.keys())

# Import rules and functions
include: "rules/sr.smk"
include: "rules/lr.smk"
include: "rules/hybracter_install.smk"
include: "rules/targets.smk"

rule all:
    input:
        SimulateTargetFiles
        