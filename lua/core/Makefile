# Makefile

# Variables
TEX_FILES := $(wildcard *.tex)
OUTPUT_DIR := ../pdf

# Targets
all: $(TEX_FILES:%.tex=%.pdf)

%.pdf: %.tex
	@echo "Compiling $<..."
	@mkdir -p $(OUTPUT_DIR)
	@latexmk -outdir=$(OUTPUT_DIR) -pdf -use-make -g $<

clean:
	@echo "Cleaning up..."
	@latexmk -outdir=$(OUTPUT_DIR) -c
	@rm -rf $(OUTPUT_DIR)

.PHONY: all clean
