#!/usr/bin/env bash

# TODO: Get the .pkg.tar.zst from calpkgs

buildDatabase() {
    cd db || { echo "Couldn't cd into 'db'." 1>&2 && exit 1; }

    while read -r pkg; do
        repo-add -s -n -R -k "199980CE93F18E62" calrepo.db.tar.gz "$pkg"
    done < "$1"

    cd "$lastFolder" || { echo "Couldn't cd into '$lastFolder'." 1>&2 && exit 1; }
}

runScript() {
#     lastFolder=$(pwd -P)

#     local IFS=
#     while read -r -d '' arch; do
#         cd "$arch" || { echo "Couldn't cd into 'x86_64'." 1>&2 && exit 1; }
#         buildDatabase
#         cd "$lastFolder" || { echo "Couldn't cd into '$lastFolder'." 1>&2 && exit 1; }
#    done < <(find -H "$PWD" -mindepth 1 -type f -regex '.*.pkg.tar.zst' -print0)

    buildDatabase <(find -H "$PWD" -mindepth 1 -type f -regex '.*.pkg.tar.zst')
}

runScript
