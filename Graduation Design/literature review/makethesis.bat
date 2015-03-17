latex --src-specials --synctex=-1 main 
makeindex main.idx
bibtex main
latex --src-specials --synctex=-1 main
latex --src-specials --synctex=-1 main
dvipdfmx -p a4 main
main.pdf
