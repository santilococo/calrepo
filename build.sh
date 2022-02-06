#!/usr/bin/env bash

# TODO: Get the .pkg.tar.zst from calpkgs

getAnyPackages() {
    for arch in "x86_64" "i686" "aarch64"; do
	cd $arch

	while read -r pkg; do
	    ln -sf "$pkg" "$(basename $pkg)"
	done < "$1"

	cd ..
    done
}

buildDatabase() {
    lastFolder=$(pwd -P)
    #cd db || { echo "Couldn't cd into 'db'." 1>&2 && exit 1; }
    for arch in "x86_64" "i686" "aarch64"; do
	cd $arch

	while read -r pkg; do
	    repo-add -s -n -R -k "199980CE93F18E62" calrepo.db.tar.gz "$pkg"
	    rm -rf *.old*
	done < <(find -H "$PWD" -mindepth 1 -type f -regex '.*.pkg.tar.zst')
    done
    #cd "$lastFolder" || { echo "Couldn't cd into '$lastFolder'." 1>&2 && exit 1; }
}

runScript() {
    getAnyPackages <(find -H "$PWD/any" -mindepth 1 -type f -regex '.*.pkg.tar.zst.*')
    buildDatabase 
}

runScript
