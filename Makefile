ASY_INPUTS := $(wildcard figures/*.asy)
PNG_OUTPUTS := $(ASY_INPUTS:.asy=.png)
TYP_INPUTS := $(wildcard *.typ)
PDF_OUTPUTS := $(TYP_INPUTS:.typ=.pdf)

all: $(PNG_OUTPUTS) $(PDF_OUTPUTS)

figures/%.pdf: figures/%.asy
	asy -f pdf $< -o $(basename $@)
figures/%.png: figures/%.pdf
	magick -density 300 $< $@

%.pdf: %.typ $(PNG_OUTPUTS)
	typst compile $<
