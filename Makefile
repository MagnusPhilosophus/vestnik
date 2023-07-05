# Makefile for building LaTeX documents

# Define variables
LATEX := xelatex -interaction=nonstopmode -output-driver='xdvipdfmx -z3' -file-line-error -synctex=1
LATEX_FLAGS := -halt-on-error -interaction=nonstopmode \
               -output-driver='xdvipdfmx -z3' -file-line-error -synctex=1
LATEX_TEST_FLAGS := -halt-on-error -interaction=errorstopmode -draftmode -no-pdf
SOURCE_DIR := src
BUILD_DIR := build
TEXFILES := $(wildcard $(SOURCE_DIR)/*.tex)
PDF := $(BUILD_DIR)/main.pdf

# Create build directory if it doesn't exist
$(shell mkdir -p $(BUILD_DIR))

# Default target
.DEFAULT_GOAL := pdf

# Rule to build PDF documents from LaTeX sources
pdf: $(PDF)

$(PDF): $(TEXFILES)
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) src/main.tex

test: $(TEXFILES)
	$(LATEX) $(LATEX_TEST_FLAGS) -output-directory=$(BUILD_DIR) src/main.tex

# Clean target
clean:
	rm -rf $(BUILD_DIR)
