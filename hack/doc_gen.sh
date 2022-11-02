rm -rf docs

OUTPUT_DIR="docs/"
SOURCE_CODE_URL="https://github.com/KusionStack/konfig/tree/main"
FILES="$PWD/base/pkg"

SCRIPT="kcl-doc generate $FILES -R -o $OUTPUT_DIR --repo-url $SOURCE_CODE_URL"

echo $SCRIPT

$($SCRIPT)

# remove specific directorys which contain backend/render/mixins/utils logic schemas. Only frontend/backend model docs are reserved.
find ./docs  -type d -name 'backend' -exec rm -rf {} +
find ./docs  -type d -name 'mixins' -exec rm -rf {} +
find ./docs  -type d -name 'render' -exec rm -rf {} +
find ./docs  -type d -name 'utils' -exec rm -rf {} +

# remove unnecessary nested dirs
mv docs/base/pkg/* docs/
rm -rf docs/base

# finanlly, generate the index
cd docs
md-file-tree > index.md