ASY_INPUTS := $(wildcard figures/*.asy)
SVG_OUTPUTS := $(ASY_INPUTS:.asy=.svg)
TYP_INPUTS := $(wildcard recitations/*.typ extras/*.typ *.typ)
PDF_OUTPUTS := $(TYP_INPUTS:.typ=.pdf)

all: $(SVG_OUTPUTS) $(PDF_OUTPUTS) posters

figs: $(SVG_OUTPUTS)

figures/%.svg: figures/%.asy
	cd figures; asy -f svg $(notdir $<) -o $(basename $(notdir $@))

posters: published/poster-ints.pdf published/poster-stokes.pdf

published/poster-ints.pdf: figures/integrals-triangle.asy
	cd figures; asy -f pdf $(notdir $<) -o ../published/poster-ints
published/poster-stokes.pdf: figures/integrals-stokes.asy figures/stokes_base.asy
	cd figures; asy -f pdf $(notdir $<) -o ../published/poster-stokes

%.pdf: %.typ
	typst compile $<

lamv.pdf: lamv.typ $(wildcard src/*.typ) $(SVG_OUTPUTS)
	typst compile $<
