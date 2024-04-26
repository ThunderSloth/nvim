# Makefile

# Variables
PARENT_DIR := $(notdir $(realpath ..))
OUTPUT_DIR := ../out
MAIN_TEX := main.tex
MAIN_PDF := ../$(PARENT_DIR).pdf

# Targets
all: $(MAIN_PDF)

$(MAIN_PDF): $(MAIN_TEX)
	@echo "Compiling $@"
	@mkdir -p $(OUTPUT_DIR)
	@latexmk -outdir=$(OUTPUT_DIR) -pdf -jobname=$(PARENT_DIR) -use-make $<
	@mv $(OUTPUT_DIR)/$(PARENT_DIR).pdf $(MAIN_PDF)
