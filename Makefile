.PHONY: pdf

all: pdf with_notes notes_only notes_only_print handouts handouts_print handouts_space
# all: pdf with_notes handouts handouts_print handouts_space clean

pdf: 20210805_neurofedora.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20210805_neurofedora_presentation.tex

with_notes: 20210805_neurofedora_presentation_notes.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20210805_neurofedora_presentation_notes.tex

notes_only: 20210805_neurofedora_notes_only.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -bibtex- 20210805_neurofedora_notes_only.tex

notes_only_print: notes_only 20210805_neurofedora_notes_only_print.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make -bibtex- 20210805_neurofedora_notes_only_print.tex

handouts: 20210805_neurofedora_handouts.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20210805_neurofedora_handouts.tex

handouts_print: handouts 20210805_neurofedora_handouts_print.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20210805_neurofedora_handouts_print.tex

handouts_space: 20210805_neurofedora_handouts_with_space.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make 20210805_neurofedora_handouts_with_space.tex

deps:
	sudo dnf install 'tex(pgfpages.sty)'  'tex(pdfpages.sty)' 'tex(handoutWithNotes.sty)' 'tex(pdfpages.sty)' 'tex(pgfpages.sty)' 'tex(xcolor.sty)' 'tex(tipa.sty)' 'tex(ccicons.sty)' 'tex(amssymb.sty)' 'tex(tikz.sty)' 'tex(jneurosci.sty)' 'tex(subfig.sty)' 'tex(fontenc.sty)' 'tex(inputenc.sty)' 'tex(biblatex.sty)' 'tex(opensans.sty)' 'tex(ulem.sty)' 'tex(hyperref.sty)' 'tex(graphicx.sty)' 'tex(algorithmic.sty)' 'tex(textcomp.sty)' 'tex(wrapfig.sty)' 'tex(textgreek.sty)' 'tex(euler.sty)' 'tex(minted.sty)' 'tex(import.sty)' --setopt=strict=0


clean:
	rm -fv *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc *.dvi *.vrb *.bcf *.run.xml *.cut *.lo*
	latexmk -c
