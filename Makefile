LATEXMK := latexmk
ENGINE := -lualatex
MAIN := cv.tex
OUT_DIR := dist
JOB_NAME := allie-mari-jones-cv
PDF := $(OUT_DIR)/$(JOB_NAME).pdf
FONT_FILES := $(wildcard fonts/fraunces/* fonts/source-serif-4/*)
LATEXMK_FLAGS := $(ENGINE) -file-line-error -interaction=nonstopmode -halt-on-error -outdir=$(OUT_DIR) -jobname=$(JOB_NAME)
TEX_ENV := TEXMFVAR=$(OUT_DIR)/texmf-var TEXMFCONFIG=$(OUT_DIR)/texmf-config

.PHONY: all pdf watch clean

all: pdf

pdf: $(PDF)

$(PDF): $(MAIN) style/cv.sty sections/*.tex $(FONT_FILES)
	$(TEX_ENV) $(LATEXMK) $(LATEXMK_FLAGS) $(MAIN)

watch:
	$(TEX_ENV) $(LATEXMK) $(LATEXMK_FLAGS) -pvc $(MAIN)

clean:
	$(TEX_ENV) $(LATEXMK) -C -outdir=$(OUT_DIR) -jobname=$(JOB_NAME) $(MAIN)
	rm -rf $(OUT_DIR)
