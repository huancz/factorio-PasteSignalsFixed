#!/bin/bash

PV=$(cat src/info.json | jq -r '.version')

cp -r src "PasteSignals_${PV}"
7z a -tzip "PasteSignals_${PV}.zip" "PasteSignals_${PV}"/
rm -rf -- "./PasteSignals_${PV}"
