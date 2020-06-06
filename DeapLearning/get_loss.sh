grep 'avg' tiny_NDWI_no_TL.log | awk '{ print $2, $3, $9}'  | tr -d ',' > ${1:-foo}
