#!/usr/bin/env bash

buildDatabase() {
    repo-add -s -n -R -k "199980CE93F18E62" calrepo.db.tar.gz *.pkg.tar.zst
}

runScript() {
    lastFolder=$(pwd -P)
    cd x86_64 || { echo "Couldn't cd into 'x86_64'." 1>&2 && exit 1; }

    buildDatabase

    cd "$lastFolder" || { echo "Couldn't cd into '$lastFolder'." 1>&2 && exit 1; }
}

runScript