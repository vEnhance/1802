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

TYPST_PACKAGE_PATH ?= $(shell typst info -f yaml | sed -n 's/^  package-path: //p')
EVAN_VERSION := 1.0.0
EVAN_URL := https://raw.githubusercontent.com/vEnhance/dotfiles/main/local/share/typst/packages/local/evan/$(EVAN_VERSION)
EVAN_FILES := typst.toml evan.typ template/main.typ
EVAN_DEST := $(TYPST_PACKAGE_PATH)/local/evan/$(EVAN_VERSION)

install-evan:
	@test -n "$(TYPST_PACKAGE_PATH)" || { echo "Typst package path couldn't be found!" >&2; exit 1; }
	@for f in $(EVAN_FILES); do \
		curl -fsSL --create-dirs -o "$(EVAN_DEST)/$$f" "$(EVAN_URL)/$$f" || exit 1; \
	done
	@echo "I've installed @local/evan:$(EVAN_VERSION) to $(EVAN_DEST)"
