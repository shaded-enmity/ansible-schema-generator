#!/usr/bin/bash

ANSIBLE_DIR=~/Repos/ansible
OUTPUT_DIR="generated/"


list_branches() {
  cd "${ANSIBLE_DIR}"
  git branch --format '%(refname)' | cut -d/ -f3 | grep stable
  cd - 1>/dev/null
}

mkdir -p "${OUTPUT_DIR}"

for branch in $(list_branches); do
  version=$(cut -d- -f2 <<< ${branch})
  outfile="${OUTPUT_DIR}/ansible-stable-${version}.json"
  desc="Auto-Generated JSON Schema for Ansible-stable ${version} (https://github.com/shaded-enmity/ansible-schema-generator)"
  title="Ansible ${version}"
  echo "[-] Generating data for version: $version"
  pushd "${ANSIBLE_DIR}"
  git checkout ${branch}
  git submodule update --init --recursive
  popd
  ./ansible-schema-generator -v "${version}.0" -o "${outfile}.x" -l debug -d "${desc}" -t "${title}" ../ansible/
  # get rid of trailing spaces ...
  cat "${outfile}.x" | jq . > ${outfile}
  rm "${outfile}.x"
done
