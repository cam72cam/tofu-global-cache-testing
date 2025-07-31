rm -rf ./job*
for i in {0..300}; do
	cp -r tmpl job$i
done

export TF_PLUGIN_CACHE_DIR=$PWD/cache/
rm -r "$TF_PLUGIN_CACHE_DIR"

# Download the installer script:
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
# Give it execution permissions:
chmod +x install-opentofu.sh
# Run the installer:
sudo ./install-opentofu.sh --install-method deb

ls | grep job | xargs -P 20 -I foo bash -c "cd foo; tofu init"
