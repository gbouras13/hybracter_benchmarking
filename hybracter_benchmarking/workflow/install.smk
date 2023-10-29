
# Concatenate Snakemake's own log file with the master log file
onsuccess:
    shell("cat {log} >> " + config['log'])

onerror:
    shell("cat {log} >> " + config['log'])

### DEFAULT CONFIG FILE
configfile: os.path.join(workflow.basedir, '../', 'config', 'config.yaml')

OUTPUT = config['output']
THREADS = config['threads']


# need to specify the reads directory
# genome dir 
GENOME = os.path.join(workflow.basedir, '../../', 'genomes')


### DIRECTORIES
include: "rules/directories.smk"

# Import rules and functions
include: "rules/targets.smk"
include: "rules/hybracter_install.smk"

rule all:
    input:
        InstallTargetFiles
        