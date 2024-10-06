ASY_INPUTS := $(wildcard figures/*.asy)
PNG_OUTPUTS := $(ASY_INPUTS:.asy=.png)
TYP_INPUTS := $(wildcard *.typ)
PDF_OUTPUTS := $(TYP_INPUTS:.typ=.pdf)

all: $(PNG_OUTPUTS) $(PDF_OUTPUTS)

figs: $(PNG_OUTPUTS)

figures/%.pdf: figures/%.asy
	asy -f pdf $< -o $(basename $@)
figures/%.png: figures/%.pdf
	magick -density 384 $< $@

%.pdf: %.typ
	typst compile $<

lamv.pdf: lamv.typ $(wildcard src/*.typ) $(PNG_INPUTS)
	typst compile $<
