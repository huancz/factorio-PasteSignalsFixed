#!/bin/bash

PV=$(cat src/info.json | jq -r '.version')

cp -r src "PasteSignalsFixed_${PV}"
7z a -tzip "PasteSignalsFixed_${PV}.zip" "PasteSignalsFixed_${PV}"/
rm -rf -- "./PasteSignalsFixed_${PV}"
