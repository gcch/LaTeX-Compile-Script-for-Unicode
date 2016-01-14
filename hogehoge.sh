#!/bin/bash

# TeX Compile Script for Linux
# Copyright (c) 2015 tag.

# move to the directory including this script
cd "${0%/*}"

# replace (GNU sed)
find . -name '*.tex' -exec sed -i -e 's/、/，/g' -e 's/。/．/g' {} +

# get filename with extension of this script
FNAME_WITH_EXT="${0##*/}"
# get filename of this script
FNAME="${FNAME_WITH_EXT%.*}"

# TeX environment
TEX2DVI=uplatex
DVI2PDF=dvipdfmx
CCODE=utf-8
FMAP=font_ipa.map

# delete temp files
#rm "${FNAME}.aux" "${FNAME}.dvi" "${FNAME}.out" "${FNAME}.log" "${FNAME}.toc" "${FNAME}.lof" "${FNAME}.lot"

# TeX -> DVI
${TEX2DVI} -kanji=${CCODE} "${FNAME}.tex"
${TEX2DVI} -kanji=${CCODE} "${FNAME}.tex"
#${TEX2DVI} -kanji=${CCODE} "${FNAME}.tex"

# DVI -> PDF
#${DVI2PDF} "${FNAME}.dvi"
${DVI2PDF} -f "${FMAP}" "${FNAME}.dvi"

# pause if error occured
RET=$?
if [ ! ${RET} -nq 0 ]; then
	read
fi

# delete temp files
rm "${FNAME}.aux" "${FNAME}.dvi" "${FNAME}.out" "${FNAME}.log" "${FNAME}.toc" "${FNAME}.lof" "${FNAME}.lot"

exit 0