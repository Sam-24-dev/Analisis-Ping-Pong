.PHONY: help pipeline serve clean

help:
	@echo "Available commands:"
	@echo "  make pipeline  - Run R analysis and generate outputs"
	@echo "  make serve     - Start local web server"
	@echo "  make clean     - Remove generated files"

pipeline:
	@echo "Running R analysis pipeline..."
	cd scripts && Rscript ping_pong_analysis.R
	@echo "Pipeline complete. Outputs in web/results/ and web/images/"

serve:
	@echo "Starting local server at http://localhost:8000"
	cd web && python -m http.server 8000

clean:
	@echo "Cleaning generated files..."
	rm -f web/results/analysis_results.json
	rm -f web/images/*.png
	@echo "Clean complete."
