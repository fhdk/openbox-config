#!/usr/bin/env bash

tracker_url="udp://tracker.opentrackr.org:1337/announce"
src_dir=$PWD
host="osdn.net"
project="pacbang-linux"
piece_size="21"
torrent_meta="PacbangLinux"
verbose="true"

find ${src_dir} -type f -name "*.torrent" -delete

if [[ -n $(find ${src_dir} -type f -name "*.iso") ]]; then
    isos=$(ls ${src_dir}/*.iso)
    for iso in ${isos}; do
        seed=https://${host}/dl/${project}/${iso##*/}
        mktorrent_args=(-c "${torrent_meta}" -p -l ${piece_size} -a ${tracker_url} -w ${seed})
        ${verbose} && mktorrent_args+=(-v)
        "Creating (%s) ..." "${iso##*/}.torrent"
        mktorrent ${mktorrent_args[*]} -o ${iso}.torrent ${iso}
    done
fi
