ASY_INPUTS := $(wildcard *.asy)
PNG_OUTPUTS := $(ASY_INPUTS:.asy=.png)

all: $(PNG_OUTPUTS)

%.png: %.asy
	asy -f pdf $<
	magick -density 300 $*.pdf $@
