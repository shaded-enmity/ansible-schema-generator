#!/usr/bin/env bash

set -xe

ANSIBLE_DIR=${ANSIBLE_DIR:-~/Repos/ansible}
OUTPUT_DIR="generated"
ARGSPEC_PATH=${ARGSPEC_PATH:-~/Repos/ansible-stable/test/sanity/validate-modules/module_args.py}

list_branches() {
  cd "${ANSIBLE_DIR}"
  set +e
  for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote >/dev/null 2>/dev/null ; done
  git fetch --all >/dev/null 2>/dev/null
  git branch --format '%(refname)' | cut -d/ -f3 | grep stable | grep '2\.[0-9]*'
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
  ./ansible-schema-generator -a ${ARGSPEC_PATH} -v "${version}.0" -o "${outfile}" -l debug -d "${desc}" -t "${title}" "${ANSIBLE_DIR}"
  # TODO: get rid of trailing spaces ...
  # cat "${outfile}.x" | jq . > ${outfile}
done
