#!/bin/bash

#AG_GRID_EXAMPLE_DIR=ag-grid-react-example

#echo "Hello world!"

this_dir=`pwd`

if [ -d "target" ]; then
   rm -rf target
fi 

mkdir target

#echo "this_dir=$this_dir"

#cd ..

#if [ ! -d "$AG_GRID_EXAMPLE_DIR" ]; then
#    git clone https://github.com/ceolter/ag-grid-react-example.git $AG_GRID_EXAMPLE_DIR
#fi

#cd ag-grid-react-example 

echo "npm install"

npm install

if [ -d "target" ]; then
   rm -rf target
fi 

sudo npm install webpack -g
webpack --progress --colors


mkdir -p target/phenotips-table-1.0/

if [ ! -d "dist" ]; then
   exit 1
fi

echo "copying files in target"

cp -r  dist/ target/phenotips-table-1.0/
#cp  webpack.config.js target/ag-grid-react-1.0/

cd target

echo "zipping contents"

zip -r phenotips-table.zip phenotips-table-1.0
#jar -cMf ag-grid-react-1.0.zip ag-grid-react-1.0/

#mv phenotips-table.zip $this_dir/target

cd $this_dir

mvn install


