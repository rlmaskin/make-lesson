COUNT_SCRIPT = wordcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubst books/%.txt, %.dat, $(TXT_FILES))
#make zip
analysis.zip : $(DAT_FILES) $(COUNT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : $(DAT_FILES)

.PHONY : variables
variables:
	@echo TXT_FILES:$(TXT_FILES) 
	@echo DAT_FILES:$(DAT_FILES)

#count words
%.dat : books/%.txt $(COUNT_SCRIPT)
	python $(COUNT_SCRIPT)  $< $*.dat

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
