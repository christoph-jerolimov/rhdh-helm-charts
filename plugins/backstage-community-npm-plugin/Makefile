
git-repo=https://github.com/backstage/community-plugins
git-local-folder=community-plugins

plugin-workspace=npm
plugin-name=npm

image-local-tag=backstage-community-npm-plugin:latest
image-remote-tag=quay.io/jerolimov/backstage-community-npm-plugin

janus-cli-version=1.15.2

all: clone update clean install-deps build publish

clone:
	if [ ! -d "${git-local-folder}" ]; then git clone "${git-repo}" "${git-local-folder}"; fi

update:
	cd "${git-local-folder}" && git fetch
	cd "${git-local-folder}" && git reset --hard main

clean:
	cd "${git-local-folder}" && git clean -dfX

install-deps:
	cd "${git-local-folder}/workspaces/${plugin-workspace}" && yarn

build:
	cd "${git-local-folder}/workspaces/${plugin-workspace}/plugins/${plugin-name}" && npx --yes "@janus-idp/cli@${janus-cli-version}" package export-dynamic-plugin
	cd "${git-local-folder}/workspaces/${plugin-workspace}/plugins/${plugin-name}" && npx --yes "@janus-idp/cli@${janus-cli-version}" package package-dynamic-plugins -t ${image-tag}

publish:
	podman push "${image-local-tag}" "${image-remote-tag}"
