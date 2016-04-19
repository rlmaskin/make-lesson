#make zip
analysis.zip : isles.dat abyss.dat last.dat wordcount.py
	zip $@ $^

.PHONY : dats
dats : isles.dat abyss.dat last.dat

#count words
last.dat : books/last.txt wordcount.py
	python wordcount.py $< $@

isles.dat : books/isles.txt wordcount.py
	python wordcount.py $< $@

abyss.dat : books/abyss.txt wordcount.py
	python wordcount.py $< $@


.PHONY : clean
clean :
	rm -f *.dat *.zip
	
