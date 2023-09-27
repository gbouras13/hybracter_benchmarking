
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


# for assembly 
PLASSEMBLER_BIN = config["PLASSEMBLER_BIN"]
PLASSEMBLER_DB = config["PLASSEMBLER_DB"]


# need to specify the reads directory
CSV = config['input']

# define functions

def get_length(wildcards):
    chrom = dictReads[wildcards.sample]["chromosome_length"]
    return str(chrom)

def get_long(wildcards):
    return dictReads[wildcards.sample]["LR"]

def get_short_one(wildcards):
    return dictReads[wildcards.sample]["Short_One"]

def get_short_two(wildcards):
    return dictReads[wildcards.sample]["Short_Two"]


### DIRECTORIES
include: "rules/directories.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesReal(CSV)
SAMPLES = list(dictReads.keys())


# Import rules and functions
include: "rules/targets.smk"
include: "rules/plassembler_real_reads.smk"
include: "rules/unicycler_real_reads.smk"


rule all:
    input:
        AssembleRealTargetFiles
        