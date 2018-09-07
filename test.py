import jsonschema, json, os, yaml

schema = json.loads(open("generated/ansible-stable-2.5.json").read())
cases = os.listdir('test/cases')
numcases = len(cases)

for (n, f) in enumerate(cases):
    print('[{n}/{total}] Validating: {file}'.format(file=f, n=n+1, total=numcases))
    jsonschema.validate(list(yaml.load_all(open('test/cases/' + f).read())), schema)
