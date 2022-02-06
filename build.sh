#!/usr/bin/env bash

# TODO: Get the .pkg.tar.zst from calpkgs

getAnyPackages() {
    pkgs=($(find -H "$PWD/any" -mindepth 1 -type f -regex '.*.pkg.tar.zst.*'))
    for arch in "x86_64" "i686" "aarch64"; do
	cd $arch

	for pkg in "${pkgs[@]}"; do
	    ln -sf "$pkg" "$(basename $pkg)"
	    #echo "ln -sf $pkg $(basename $pkg)"
	done

	cd ..
    done
}

buildDatabase() {
    #lastFolder=$(pwd -P)
    #cd db || { echo "Couldn't cd into 'db'." 1>&2 && exit 1; }
    for arch in "x86_64" "i686" "aarch64"; do
	cd $arch

	while read -r pkg; do
	    repo-add -s -n -R -k "199980CE93F18E62" calrepo.db.tar.gz "$pkg"
	    rm -rf *.old*
	    #echo "repo-add -s -n -R -k calrepo.db.tar.gz $pkg"
	done < <(find -L "$PWD" -mindepth 1 -type f -regex '.*.pkg.tar.zst')

	cd ..
    done
    #cd "$lastFolder" || { echo "Couldn't cd into '$lastFolder'." 1>&2 && exit 1; }
}

runScript() {
    getAnyPackages
    buildDatabase 
}

runScript
