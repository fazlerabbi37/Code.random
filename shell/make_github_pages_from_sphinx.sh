#author: fazlerabbi37

#shell script name: make_github_pages_from_sphinx.sh 

#the purpose of the shell script is to make github pages from sphinx document generator

#!/bin/bash

#source: https://jefflirion.github.io/sphinx-github-pages.html

#check if variable BUILDDIR value and change it if expected value not found
echo "Modifying Makefile..."
e=$(grep "BUILDDIR      = \.." docs/Makefile)

if [[ -z $e ]]
then
    current_builddir_value=$(grep "BUILDDIR      = " docs/Makefile)
    sed -i "/$current_builddir_value/c\#$current_builddir_value" docs/Makefile
    sed -i "/#$current_builddir_value/i\BUILDDIR      = .." docs/Makefile
fi

echo ""


#rename docs to html
mv docs html

#change directory to html
cd html

#make documents
echo "Making html files ..."
echo "-----------------------------------------------------------------------------------------------------------------"
echo ""
make html
echo ""
echo "-----------------------------------------------------------------------------------------------------------------"


#change directory back to root dir
cd ..

#rename html to docs
mv html docs

#create .nojekyll file
touch docs/.nojekyll
echo ""

echo "Done with all tasks! Now use git to add, commit and push the files to GitHub"
