#!/usr/bin/env bash

# TODO: Get the .pkg.tar.zst from calpkgs

buildDatabase() {
    lastFolder=$(pwd -P)
    cd db || { echo "Couldn't cd into 'db'." 1>&2 && exit 1; }

    while read -r pkg; do
        repo-add -s -n -R -k "199980CE93F18E62" calrepo.db.tar.gz "$pkg"
	rm -rf *.old*
    done < "$1"

    cd "$lastFolder" || { echo "Couldn't cd into '$lastFolder'." 1>&2 && exit 1; }
}

runScript() {
    buildDatabase <(find -H "$PWD" -mindepth 1 -type f -regex '.*.pkg.tar.zst')
}

runScript
