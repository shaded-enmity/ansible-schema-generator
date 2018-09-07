#!/usr/bin/bash

set -xe

git clone https://github.com/ansible/ansible ansible
git clone https://github.com/ansible/ansible ansible-stable

cd ansible-stable
 git checkout stable-2.5
cd -

ANSIBLE_DIR=ansible/ ARGSPEC_PATH=ansible-stable/test/sanity/validate-modules/module_args.py ./generate.sh

for TC in test/cases/*; do
  python3 <<< "import jsonschema, json, yaml; jsonschema.validate(yaml.load(open(\"${TC}\").read()), json.loads(open(\"generated/ansible-stable-2.5.json\").read())"
done