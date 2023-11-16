
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


### DIRECTORIES and functions
include: "rules/directories.smk"
include: "rules/functions.smk"


# Parse the samples and read files
# csv is the same as assemble_real
include: "rules/samples.smk"
dictReads = parseSamplesReal(CSV)
SAMPLES = list(dictReads.keys())

# Import rules and functions
include: "rules/targets.smk"
include: "rules/dnadiff_real.smk"
include: "rules/real_plasmid_analysis.smk"
include: "rules/dnadiff_plasmids.smk"

rule all:
    input:
        RealAssessTargetFiles
        