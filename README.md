# ansible-schema-generator

Generate JSON schema for language servers from Ansible module documentation

## Usage

```
$ ansible-schema-generator --help
usage: ansible-schema-generator [-h] [-o OUTPUT_FILE]
                                [-l {debug,warning,error}]
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
```

## Examples

Please refer to the `examples/` directory

## License

GNU/GPLv3
