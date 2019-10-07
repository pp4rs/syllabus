
# Snakefile: pp4rs syllabus
#
# contributor: @lachlandeer
#
#

# --- Libraries --- #
import os, re

# --- Variable Declarations --- #
OUTPUT = "pp4rs-syllabus.pdf"

runR = "Rscript --no-save --no-restore --verbose"
logAll = "2>&1"

## --- Build Rules --- ##

rule build_pdf:
    input:
        styleFile = "svm-latex-syllabus.tex",
        syllabus  = "pp4rs-syllabus.Rmd",
        runner = "knit_rmd.R"
    output:
        pdf = OUTPUT
    log:
        "logs/syllabus.Rout"
    shell:
        "{runR} {input.runner} {input.syllabus} \
                    {output.pdf} > {log} {logAll}"

rule clean_:
    shell:
        "rm {OUTPUT}"
