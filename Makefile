DOCUMENT_NAME = report
OUTPUT_DIR    = out

all: report

# Remove output directory.
clean:
	rm -rf $(OUTPUT_DIR)

# Generate PDF from LaTex files.
report:
	mkdir -p $(OUTPUT_DIR)
	pdflatex -pdf -jobname=$(OUTPUT_DIR)/$(DOCUMENT_NAME) -shell-escape main.tex
	makeglossaries $(OUTPUT_DIR)/$(DOCUMENT_NAME)
	biber $(OUTPUT_DIR)/$(DOCUMENT_NAME)
	pdflatex -pdf -jobname=$(OUTPUT_DIR)/$(DOCUMENT_NAME) -shell-escape main.tex
