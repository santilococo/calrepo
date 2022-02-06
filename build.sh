#!/usr/bin/env bash

getAnyPackages() {
    mapfile -t pkgs < <(find -H "$PWD/any" -mindepth 1 -type f -regex '.*.pkg.tar.zst.*')
    for arch in "x86_64" "i686" "aarch64"; do
        cd "$arch" || { echo "Couldn't cd into '$arch'." 1>&2 && exit 1; }
        for pkg in "${pkgs[@]}"; do
            if [ "$dryRunFlag" = false ]; then
                ln -sf "$pkg" "$(basename "$pkg")"
            else
                echo "ln -sf $pkg $(basename "$pkg")"
            fi
        done
        cd .. || { echo "Couldn't cd into the parent folder." 1>&2 && exit 1; }
    done
}

buildDatabase() {
    for arch in "x86_64" "i686" "aarch64"; do
        cd "$arch" || { echo "Couldn't cd into '$arch'." 1>&2 && exit 1; }
        while read -r pkg; do
            if [ "$dryRunFlag" = false ]; then
                repo-add -s -n -R -k "199980CE93F18E62" calrepo.db.tar.gz "$pkg"
                rm -rf -- *.old*
            else
                echo "repo-add -s -n -R -k calrepo.db.tar.gz $pkg"
            fi
        done < <(find -L "$PWD" -mindepth 1 -type f -regex '.*.pkg.tar.zst')
        cd .. || { echo "Couldn't cd into the parent folder." 1>&2 && exit 1; }
    done
}

checkParameters() {
    dryRunFlag=false
    while getopts ':hd' flag; do
        case $flag in
            h)  usage && exit 0 ;;
            d)  dryRunFlag=true ;;
            ?)  printf '%s: invalid option -''%s'\\n "${0##*/}" "$OPTARG" && exit 1 ;;
        esac
    done
}

runScript() {
    checkParameters "$@"
    getAnyPackages
    buildDatabase 
}

runScript "$@"
