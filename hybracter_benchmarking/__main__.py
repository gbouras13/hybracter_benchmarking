"""
Entrypoint for hybracter_benchmarking

Check out the wiki for a detailed look at customising this file:
https://github.com/beardymcjohnface/Snaketool/wiki/Customising-your-Snaketool
"""

import os
import click

from .util import (OrderedCommands,  copy_config,
                   default_to_ouput, print_citation, print_version, echo_click,
                   run_snakemake, snake_base)

def snake_base(rel_path):
    """Get the filepath to a Snaketool system file (relative to __main__.py)

    Args:
        rel_path (str): Filepath relative to __main__.py

    Returns (str): Resolved filepath
    """
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), rel_path)


def get_version():
    with open(snake_base("hybracter_benchmarking.VERSION"), "r") as f:
        version = f.readline()
    return version


def print_citation():
    with open(snake_base("hybracter_benchmarking.CITATION"), "r") as f:
        for line in f:
            echo_click(line)

def default_to_output(ctx, param, value):
    """Callback for click options; places value in output directory unless specified"""
    if param.default == value:
        return os.path.join(ctx.params["output"], value)
    return value

def common_options(func):
    """Common command line args
    Define common command line args here, and include them with the @common_options decorator below.
    """
    options = [
        click.option(
            "--output",
            help="Output directory",
            type=click.Path(dir_okay=True, writable=True, readable=True),
            default="hybracter_benchmarking.out",
            show_default=True,
        ),
        click.option(
            "--configfile",
            default="config.yaml",
            show_default=False,
            callback=default_to_output,
            help="Custom config file [default: (outputDir)/config.yaml]",
        ),
        click.option(
            "--threads", 
            help="Number of threads to use", 
            default=1, 
            show_default=True
        ),
        click.option(
            "--use-conda/--no-use-conda",
            default=True,
            help="Use conda for Snakemake rules",
            show_default=True,
        ),
        click.option(
            "--conda-prefix",
            default=snake_base(os.path.join("workflow", "conda")),
            help="Custom conda env directory",
            type=click.Path(),
            show_default=False,
        ),
        click.option(
            "--snake-default",
            multiple=True,
            default=[
                "--rerun-incomplete",
                "--printshellcmds",
                "--nolock",
                "--show-failed-logs",
            ],
            help="Customise Snakemake runtime args",
            show_default=True,
        ),
        click.option(
            "--log",
            default="hybracter_benchmarking.log",
            callback=default_to_output,
            hidden=True,
        ),
        click.argument("snake_args", nargs=-1),
    ]
    for option in reversed(options):
        func = option(func)
    return func


@click.group(
    cls=OrderedCommands, context_settings=dict(help_option_names=["-h", "--help"])
)
@click.version_option(get_version(), "-v", "--version", is_flag=True)
def cli():
    """hybracter_benchmarking
    \b
    For more options, run:
    hybracter_benchmarking --help"""
    pass

help_msg_install = """
\b
CLUSTER EXECUTION:
hybracter_benchmarking install ... --profile [profile]
For information on Snakemake profiles see:
https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles
\b
RUN EXAMPLES:
Required:           hybracter_benchmarking install --output [directory]
Specify threads:    hybracter_benchmarking install ... --threads [threads]
Disable conda:      hybracter_benchmarking install ... --no-use-conda 
Change defaults:    hybracter_benchmarking install ... --snake-default="-k --nolock"
Add Snakemake args: hybracter_benchmarking siminstallulate ... --dry-run --keep-going --touch
Specify targets:    hybracter_benchmarking install ... all print_targets
Available targets:
    all             install everything (default)
    print_targets   List available targets
"""


help_msg_simulate = """
\b
CLUSTER EXECUTION:
hybracter_benchmarking simulate ... --profile [profile]
For information on Snakemake profiles see:
https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles
\b
RUN EXAMPLES:
Required:           hybracter_benchmarking simulate --input [file]
Specify threads:    hybracter_benchmarking simulate ... --threads [threads]
Disable conda:      hybracter_benchmarking simulate ... --no-use-conda 
Change defaults:    hybracter_benchmarking simulate ... --snake-default="-k --nolock"
Add Snakemake args: hybracter_benchmarking simulate ... --dry-run --keep-going --touch
Specify targets:    hybracter_benchmarking simulate ... all print_targets
Available targets:
    all             simulate everything (default)
    print_targets   List available targets
"""

help_msg_assemble_simulated = """
\b
CLUSTER EXECUTION:
hybracter_benchmarking assemble-simulated ... --profile [profile]
For information on Snakemake profiles see:
https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles
\b
RUN EXAMPLES:
Required:           hybracter_benchmarking assemble-simulated --input [file]
Specify threads:    hybracter_benchmarking assemble-simulated ... --threads [threads]
Disable conda:      hybracter_benchmarking assemble-simulated ... --no-use-conda 
Change defaults:    hybracter_benchmarking assemble-simulated ... --snake-default="-k --nolock"
Add Snakemake args: hybracter_benchmarking assemble-simulated ... --dry-run --keep-going --touch
Specify targets:    hybracter_benchmarking assemble-simulated ... all print_targets
Available targets:
    all             assemble everything (default)
    print_targets   List available targets
"""

help_msg_assemble_real = """
\b
CLUSTER EXECUTION:
hybracter_benchmarking assemble-real ... --profile [profile]
For information on Snakemake profiles see:
https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles
\b
RUN EXAMPLES:
Required:           hybracter_benchmarking assemble-real --input [file]
Specify threads:    hybracter_benchmarking assemble-real ... --threads [threads]
Disable conda:      hybracter_benchmarking assemble-real ... --no-use-conda 
Change defaults:    hybracter_benchmarking assemble-real ... --snake-default="-k --nolock"
Add Snakemake args: hybracter_benchmarking assemble-real ... --dry-run --keep-going --touch
Specify targets:    hybracter_benchmarking assemble-real ... all print_targets
Available targets:
    all             assemble everything (default)
    print_targets   List available targets
"""

help_msg_assess_simulated = """
\b
CLUSTER EXECUTION:
hybracter_benchmarking assess-simulated ... --profile [profile]
For information on Snakemake profiles see:
https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles
\b
RUN EXAMPLES:
Required:           hybracter_benchmarking assess-simulated --input [file]
Specify threads:    hybracter_benchmarking assess-simulated ... --threads [threads]
Disable conda:      hybracter_benchmarking assess-simulated ... --no-use-conda 
Change defaults:    hybracter_benchmarking assess-simulated ... --snake-default="-k --nolock"
Add Snakemake args: hybracter_benchmarking assess-simulated ... --dry-run --keep-going --touch
Specify targets:    hybracter_benchmarking assess-simulated ... all print_targets
Available targets:
    all             assemble everything (default)
    print_targets   List available targets
"""


help_msg_assess_real = """
\b
CLUSTER EXECUTION:
hybracter_benchmarking assess-real ... --profile [profile]
For information on Snakemake profiles see:
https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles
\b
RUN EXAMPLES:
Required:           hybracter_benchmarking assess-real --input [file]
Specify threads:    hybracter_benchmarking assess-real ... --threads [threads]
Disable conda:      hybracter_benchmarking assess-real ... --no-use-conda 
Change defaults:    hybracter_benchmarking assess-real ... --snake-default="-k --nolock"
Add Snakemake args: hybracter_benchmarking assess-real ... --dry-run --keep-going --touch
Specify targets:    hybracter_benchmarking assess-real ... all print_targets
Available targets:
    all             assemble everything (default)
    print_targets   List available targets
"""



#### install

@click.command(
    epilog=help_msg_install,
    context_settings=dict(
        help_option_names=["-h", "--help"], ignore_unknown_options=True
    ),
)
@click.option("--input", "_input", help="Input file/directory", type=str, required=False)
@common_options
def install(_input, output, log, threads, **kwargs):
    """install hybracter hybracter_benchmarking"""
    # Config to add or update in configfile
    merge_config = { "output": output, "log": log, "threads": threads}

    # run!
    run_snakemake(
        # Full path to Snakefile
        snakefile_path=snake_base(os.path.join("workflow", "install.smk")),
        merge_config=merge_config,
        log=log,
        threads=threads,
        **kwargs
    )


#### simulate

@click.command(
    epilog=help_msg_simulate,
    context_settings=dict(
        help_option_names=["-h", "--help"], ignore_unknown_options=True
    ),
)
@click.option("--input", "_input", help="Input file/directory", type=str, required=True)
@common_options
def simulate(_input, output, log, threads, **kwargs):
    """simulate hybracter_benchmarking"""
    # Config to add or update in configfile
    merge_config = {"input": _input, "output": output, "log": log, "threads": threads}

    # run!
    run_snakemake(
        # Full path to Snakefile
        snakefile_path=snake_base(os.path.join("workflow", "simulate.smk")),
        merge_config=merge_config,
        log=log,
        threads=threads,
        **kwargs
    )


##### assemble simulated

@click.command(
    epilog=help_msg_assemble_simulated,
    context_settings=dict(
        help_option_names=["-h", "--help"], ignore_unknown_options=True
    ))
@click.option("--input", "_input", help="Input file/directory", type=str, required=True)
@common_options
def assemble_simulated(_input, output, threads, log, **kwargs):
    """assemble simulated reads hybracter_benchmarking"""
    # Config to add or update in configfile
    merge_config = {"input": _input, "output": output, "log": log, "threads": threads}
    """Install databases"""
    run_snakemake(
        snakefile_path=snake_base(os.path.join('workflow','assemble_simulated.smk')),
        merge_config=merge_config,
        **kwargs)


##### assemble real reads

@click.command(
    epilog=help_msg_assemble_real,
    context_settings=dict(
        help_option_names=["-h", "--help"], ignore_unknown_options=True
    ))
@click.option("--input", "_input", help="Input file/directory", type=str, required=True)
@common_options
@click.option("--bulk_lerminiaux_csv", "bulk_lerminiaux_csv", help="Input bulk csv file with Lerminiaux samples", type=str, required=True)
def assemble_real(_input, output, log, threads, **kwargs):
    """assemble real reads hybracter_benchmarking"""
    # Config to add or update in configfile
    merge_config = {"input": _input, "output": output, "log": log, "threads": threads}
    """Install databases"""
    run_snakemake(
        snakefile_path=snake_base(os.path.join('workflow','assemble_real.smk')),
        merge_config=merge_config,
        **kwargs)

# assess simulated

@click.command(
    epilog=help_msg_assess_simulated,
    context_settings=dict(
        help_option_names=["-h", "--help"], ignore_unknown_options=True
    ))
@click.option("--input", "_input", help="Input file/directory", type=str, required=True)
@common_options
def assess_simulated(_input, output, log, threads, **kwargs):
    """asssess simulated assembly output in hybracter_benchmarking"""
    # Config to add or update in configfile
    merge_config = {"input": _input, "output": output, "log": log, "threads": threads}
    """Install databases"""
    run_snakemake(
        snakefile_path=snake_base(os.path.join('workflow','assess_simulated.smk')),
        merge_config=merge_config,
        **kwargs)


# assess real

@click.command(
    epilog=help_msg_assess_real,
    context_settings=dict(
        help_option_names=["-h", "--help"], ignore_unknown_options=True
    ))
@click.option("--input", "_input", help="Input file/directory", type=str, required=True)
@common_options
def assess_real(_input, output, log, threads, **kwargs):
    """asssess real assembly output in hybracter_benchmarking"""
    # Config to add or update in configfile
    merge_config = {"input": _input, "output": output, "log": log,  "threads": threads}
    """Install databases"""
    run_snakemake(
        snakefile_path=snake_base(os.path.join('workflow','assess_real.smk')),
        merge_config=merge_config,
        **kwargs)





@click.command()
@common_options
def config(configfile, **kwargs):
    """Copy the system default config file"""
    copy_config(configfile)


@click.command()
def citation(**kwargs):
    """Print the citation(s) for this tool"""
    print_citation()


cli.add_command(install)
cli.add_command(simulate)
cli.add_command(assemble_simulated)
cli.add_command(assemble_real)
cli.add_command(assess_simulated)
cli.add_command(assess_real)
cli.add_command(config)
cli.add_command(citation)


def main():
    cli()


if __name__ == "__main__":
    main()
