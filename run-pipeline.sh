#usage: bash run pipeline.sh
#produces plots

python wordcount.py books/isles.txt isles.dat
python wordcount.py books/abyss.txt abyss.dat

python plotcount.py isles.dat isles.png
python plotcount.py abyss.dat abyss.png

zip analysis.zip isles.dat abyss.dat
