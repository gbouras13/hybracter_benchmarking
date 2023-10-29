
rule install_hybracter:
    output:
        flag = os.path.join(FLAGS, "hybracter_installed.txt")
    threads:
        1
    resources:
        mem_mb=32000,
        time=4000 
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    shell:
        '''
        hybracter install
        touch {output.flag}
        '''


rule hybracter_tests:
    input:
        flag = os.path.join(FLAGS, "hybracter_installed.txt")
    output:
        flag = os.path.join(FLAGS, "hybracter_tested.txt")
    threads:
        8
    resources:
        mem_mb=32000,
        time=4000 
    conda:
        os.path.join('..', 'envs','hybracter.yaml')
    params:
        l = os.path.join(HYBRACTER_OUTPUT_TESTS, "long"),
        h = os.path.join(HYBRACTER_OUTPUT_TESTS, "hybrid")
    shell:
        '''
        hybracter test-hybrid -t {threads} -o {params.h}
        hybracter test-long -t {threads} -o {params.l}
        touch {output.flag}
        '''