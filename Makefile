COUNT_SCRIPT = wordcount.py
PNG_SCRIPT = plotcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES = $(patsubst %.dat, %.png, $(DAT_FILES))
#make zip
analysis.zip : $(DAT_FILES) $(PNG_FILES) $(COUNT_SCRIPT) $(PNG_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : pngs
pngs : $(PNG_FILES)

.PHONY : variables
variables:
	@echo TXT_FILES:$(TXT_FILES) 
	@echo DAT_FILES:$(DAT_FILES)
	@echo PNG_FILES:$(PNG_FILES)

#count words
%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT)  $< $*.dat
#make PNGs
%.png : %.dat $(PNG_SCRIPT)
	python $(PNG_SCRIPT) $< $*.png

#last.dat : books/last.txt wordcount.py
#	python wordcount.py $< $@

#isles.dat : books/isles.txt wordcount.py
#	python wordcount.py $< $@

#abyss.dat : books/abyss.txt wordcount.py
#	python wordcount.py $< $@

.PHONY : clean
clean :
	rm -f $(DAT_FILES)
	rm -f analysis.zip
#	rm -f *.dat *.zip
