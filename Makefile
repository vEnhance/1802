ASY_INPUTS := $(wildcard figures/*.asy)
SVG_OUTPUTS := $(ASY_INPUTS:.asy=.svg)
TYP_INPUTS := $(wildcard *.typ)
PDF_OUTPUTS := $(TYP_INPUTS:.typ=.pdf)

all: $(SVG_OUTPUTS) $(PDF_OUTPUTS)

figs: $(SVG_OUTPUTS)

figures/%.pdf: figures/%.asy
	cd figures; asy -f pdf $(notdir $<) -o $(basename $(notdir $@))
figures/%.svg: figures/%.pdf
	pdftocairo -svg $< $@

%.pdf: %.typ
	typst compile $<

lamv.pdf: lamv.typ $(wildcard src/*.typ) $(SVG_OUTPUTS)
	typst compile $<
