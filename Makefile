TYPST := typst
TYPST_MAIN := cv.typ
OUT_DIR := dist
JOB_NAME := allie-mari-jones-cv
PDF := $(OUT_DIR)/$(JOB_NAME).pdf
FONT_FILES := $(wildcard fonts/fraunces/* fonts/source-serif-4/*)
TYPST_FLAGS := --font-path fonts

.PHONY: all pdf watch format clean

all: pdf

pdf: $(PDF)

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(PDF): $(TYPST_MAIN) style/cv.typ sections/*.typ $(FONT_FILES) | $(OUT_DIR)
	$(TYPST) compile $(TYPST_FLAGS) $(TYPST_MAIN) $(PDF)

watch: | $(OUT_DIR)
	$(TYPST) watch $(TYPST_FLAGS) $(TYPST_MAIN) $(PDF)

format:
	typstyle -i $(TYPST_MAIN) style/cv.typ sections/*.typ

clean:
	rm -rf $(OUT_DIR)
