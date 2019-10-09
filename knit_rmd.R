# knit_rmd
#
# this script takes an Rmd file command line argument
# and complies it using knitr
#
#
# Author: @lachlandeer
#

# --- Command Line Unpack --- #
args <- commandArgs(trailingOnly = TRUE)
rmd_file = args[1]
out_file = basename(args[2])
out_path = dirname(args[2])

# --- Build file --- #
rmarkdown::render(input = rmd_file,
                  output_dir  = here::here(),
                  output_file = out_file,
                  output_format = 'pdf_document',
                  quiet=FALSE)
