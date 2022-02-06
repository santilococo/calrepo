#!/bin/bash

set -e

#files=($(find -H /home/slococo/Documents/arch-repo/any -type f -regex '.*zaread-git.*'))
mapfile -t files < <(find -H /home/slococo/Documents/arch-repo/any -type f -regex '.*zaread-git.*')
for file in "${files[@]}"; do
    echo "1 $file"
done
#IFS=$'\n'
while read -r -d '' file ; do
    echo "2 $file"
done < <(find -H /home/slococo/Documents/arch-repo/any -regex '.*zaread-git.*' -print0)
#while read -r file ; do
while read -r -d '' file ; do
    echo "3 $file"
done < <(find -H arch-repo/any -regex '.*st-git.*' -print0)

echo "fin"
