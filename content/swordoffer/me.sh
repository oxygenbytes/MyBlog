#!/bin/bash

# sample ./me.sh ~/swordoffer

path1=$1

cd $path1

rename 's/\.cpp/\.md/' *

ls -R  *.md > me.txt 
cat me.txt | while read line
do
    
    sed -i -e '1d' "$line" # delete /*
    
    sed -i '10s/\*\//\`\`\`cpp/' "$line" # add ```cpp
    
    sed -i '3s/$/&+08:00/g' "$line"

    sed -i '$a \`\`\`' "$line" # add ``` in the end
done
    