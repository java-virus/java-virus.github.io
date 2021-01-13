#!/bin/bash

# https://stackoverflow.com/a/246128/878361
SOURCES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${SOURCES_DIR}" || exit

asciidoctor "*.adoc"

GENERATED_FILES=$(ls *.html -1a | grep -v "docinfo*")

for VARIABLE in ${GENERATED_FILES}
do
	mv "$VARIABLE" ../
done

echo generated files:
echo ${GENERATED_FILES}
echo "done"