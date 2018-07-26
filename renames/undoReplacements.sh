#!/bin/bash
# Removes all replacements to recover the old state
# call from this directory

reverse="--reverse"
#reverse=
if [ -e /labEnv3/bin/activate ]; then
    source /labEnv3/bin/activate
fi

cd ../meta_info_exploded/
echo -n "rename exploded... "
python ../renames/renamer.py $reverse */*.json
cd ../meta_info/meta_dictionary/
echo -n "rename compact ... "
python ../../renames/renamer.py $reverse *.meta_dictionary.json
cd ../nomad_meta_info
echo -n "rename v1      ... "
python ../../renames/renamer.py $reverse *.nomadmetainfo.json
