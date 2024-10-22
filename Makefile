ASY_INPUTS := $(wildcard figures/*.asy)
PNG_OUTPUTS := $(ASY_INPUTS:.asy=.png)
TYP_INPUTS := $(wildcard *.typ)
PDF_OUTPUTS := $(TYP_INPUTS:.typ=.pdf)

all: $(PNG_OUTPUTS) $(PDF_OUTPUTS)

figs: $(PNG_OUTPUTS)

figures/%.pdf: figures/%.asy
	cd figures; asy -f pdf $(notdir $<) -o $(basename $(notdir $@))
figures/%.png: figures/%.pdf
	magick -density 192 $< $@

%.pdf: %.typ
	typst compile $<

lamv.pdf: lamv.typ $(wildcard src/*.typ) $(PNG_INPUTS)
	typst compile $<
