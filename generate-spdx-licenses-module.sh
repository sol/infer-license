#!/bin/bash

set -o nounset
set -o errexit

exec > "src/Data/License/SpdxLicenses.hs"

echo '-- DO NOT MODIFY MANUALLY'
echo '--'
echo "-- This file has been generated with $0."
echo
echo '{-# LANGUAGE OverloadedStrings #-}'
echo 'module Data.License.SpdxLicenses where'
echo 'import Data.Text (Text)'
echo 'import Data.License.Type'

first=true

echo 'licenses :: [(License, Text)]'
echo 'licenses = ['
for license in spdx-licenses/*; do
  file=$(basename "$license")
  license_id=${file//-/_}
  $first && echo -n "    " || echo -n "  , "
  first=false
  echo -n "($license_id, "
  echo '"\'
  while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "\\${line//\"/\\\"}\\n\\"
  done < $license
  echo '\")'
done
echo '  ]'
