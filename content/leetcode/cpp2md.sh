#!/usr/bin/bash

# sample ./cpp2md.sh ./temp

path=$1
cd $path

rename 's/\.cpp/\.md/' *

ls -R *.md > filename.txt
cat filename.txt | while read line
do
    sed -i -e '1d' "$line" # delete /*
    sed -i '8s/\*\//\`\`\`cpp/' "$line" # add ```cpp
    sed -i '$a \`\`\`' "$line" # add ``` in the end
done