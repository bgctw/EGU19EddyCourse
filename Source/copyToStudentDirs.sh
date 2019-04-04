#!/bin/sh
# to be run from parent directory of Source

# generating the HandsOn file
# remove sections between ### TO_COMPLETE and ```
# https://stackoverflow.com/questions/6287755/using-sed-to-delete-all-lines-between-two-matching-patterns
sed '/^### TO_COMPLETE/,/^```/{/^### TO_COMPLETE/!{/^```/!d}}' Source/DEGebExample_complete.Rmd > HandsOn/DEGebExample.Rmd

# copy the hmtl-Slides to StandardProcessing
# first copy all htmt and delete notbooks again
cp Source/StandardProcessing*.html StandardProcessing
rm StandardProcessing/*.nb.html

# generate pdf from the IOSlides to have searchable ones
Rscript Source/IOSlidesToPdf.R
