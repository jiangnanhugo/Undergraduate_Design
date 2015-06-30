@echo off
tasklist|find /i "Acrobat.exe" && taskkill /f /im Acrobat.exe && del main.pdf

del main.blg
del main.dvi
del main.idx
del main.log
del mian.lof
del main.lot
del main.toc
del main.out
del main.synctex
del main.ind
del main.aux
del main.ilg

xelatex -shell-escape main.tex
makeindex main.idx
bibtex main
xelatex -shell-escape main.tex


main.pdf 
exit
