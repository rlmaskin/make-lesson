COUNT_SCRIPT = wordcount.py
#make zip
analysis.zip : isles.dat abyss.dat last.dat $(COUNT_SCRIPT)
	zip $@ $^

.PHONY : dats
dats : isles.dat abyss.dat last.dat

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
	rm -f *.dat *.zip
	
