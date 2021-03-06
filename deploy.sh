#!/bin/bash
#
# Deploys the current enterprisewebbook.com website to the gh-pages branch of the GitHub
# repository.

echo "Building website ..."
sh build.sh

set -ex

DIR=temp_article

# Delete any existing temporary website clone
rm -rf $DIR

# Clone the current repo into temp folder
# git clone git@github.com:Farata/EnterpriseWebBook.git $DIR
git clone -b gh-pages git@github.com:gAmUssA/productive_cdb.git $DIR

# Move working directory into temp folder
cd $DIR

# Checkout and track the gh-pages branch
echo "switching to gh-pages branch..."
#git checkout -t origin/gh-pages

# Delete everything
rm -rf *

# Copy website files from real repo
cp -R ../out/* .

#Copy images
#cp -R ../images .
#cp -R `brew --prefix asciidoc`/etc/asciidoc/images/icons images/

# Stage all files in git and create a commit
git add .
git add -u
git commit -m "site generated and deployed at $(date +%m/%d/%Y-%T)"

# Push the new files up to GitHub
git push origin gh-pages

# Delete our temp folder
cd ..
rm -rf $DIR
