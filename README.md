# ansible-schema-generator

[![Build Status](https://travis-ci.org/shaded-enmity/ansible-schema-generator.svg?branch=master)](https://travis-ci.org/shaded-enmity/ansible-schema-generator)

Generate JSON schema for language servers from Ansible module documentation

## Usage

```
$ ansible-schema-generator --help
usage: ansible-schema-generator [-h] [-o OUTPUT_FILE]
                                [-l {debug,warning,error}] [-d DESCRIPTION]
                                [-t TITLE] [-v VERSION] [-a ARGSPEC_PATH]
                                [-r REPORT_FILE]
                                target_path

Generate JSON schema for language servers from Ansible module documentation in
an Ansible repository checkout `target_path`

positional arguments:
  target_path           scan this directory for Ansible modules

optional arguments:
  -h, --help            show this help message and exit
  -o OUTPUT_FILE, --output-file OUTPUT_FILE
                        write result to this file
  -l {debug,warning,error}, --log-level {debug,warning,error}
                        set log level
  -d DESCRIPTION, --description DESCRIPTION
                        Description string to add to the schema
  -t TITLE, --title TITLE
                        Title of the schema
  -v VERSION, --version VERSION
                        Version of Ansible for which schemas are generated
  -a ARGSPEC_PATH, --argspec-path ARGSPEC_PATH
                        File from which we can import `get_argument_spec`
                        function
  -r REPORT_FILE, --report-file REPORT_FILE
                        write report to this file
```

## Examples

Please refer to the `examples/` directory

## License

GNU/GPLv3
