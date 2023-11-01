"""
Defines all functions used in hybracter
"""


def get_genome(wildcards):
    return dictReads[wildcards.sample]["genome"]

def get_length(wildcards):
    chrom = dictReads[wildcards.sample]["chromosome_length"]
    return str(chrom)

def get_long(wildcards):
    return dictReads[wildcards.sample]["LR"]

def get_short_one(wildcards):
    return dictReads[wildcards.sample]["Short_One"]

def get_short_two(wildcards):
    return dictReads[wildcards.sample]["Short_Two"]

def get_medaka_model(wildcards):
    return dictReads[wildcards.sample]["Medaka_Model"]



