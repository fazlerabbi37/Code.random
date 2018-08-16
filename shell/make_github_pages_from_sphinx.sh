#author: fazlerabbi37

#shell script name: make_github_pages_from_sphinx.sh 

#the purpose of the shell script is to make github pages from sphinx document generator

#!/bin/bash

#source: https://jefflirion.github.io/sphinx-github-pages.html

#rename docs to html
mv docs html

#change directory to html
cd html

#make documents
make html

#create .nojekyll file
touch .nojekyll

#change directory back to root dir
cd ..

#rename html to docs
mv html docs
