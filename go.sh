rm -rf ./job*
for i in {0..300}; do
	cp -r tmpl job$i
done

export TF_PLUGIN_CACHE_DIR=$PWD/cache/
rm -r "$TF_PLUGIN_CACHE_DIR"


ls | grep job | xargs -P 20 -I foo bash -c "cd foo; tofu init"
