#!/bin/sh

set -ex

DIR=out

# Delete any existing temporary folder
rm -rf $DIR

mkdir $DIR

echo "Building article..."

cp -R `brew --prefix asciidoc`/etc/asciidoc/images/icons $DIR/icons/
#generate book, toclivel attribute is responsible for deep of table of contents
cd $DIR
#asciidoc -d book -b html5 -a icons -a iconsdir=icons -a toc2 -a toclevels=3  --out-file index.html ../productive_cdb.asciidoc

asciidoc -d book -b bootstrap-docs -a icons -a iconsdir=icons -a toc2 -a toclevels=3  --out-file index.html ../productive_cdb.asciidoc
rm -rf icons/glyphicons*

cp -R ../*.png .
cd -
