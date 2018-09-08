const fs = require('fs');
const tv4 = require('tv4');
const yaml = require('js-yaml');

let schema = JSON.parse(
  fs.readFileSync('../generated/ansible-stable-2.5.json')
);

/* Process each case in `files` relative to `base` directory */
const caseProcessor = (base, files) => { return (file, n) => {
   const testCase = yaml.loadAll(
     fs.readFileSync(base + file)
   );

   const valid = tv4.validate(testCase, schema);
   if (!valid) {
     console.log(file, tv4.error)
     throw tv4.error
   }

   console.log('['+(n+1)+'/'+files.length+'] Validating: '+ file);
}}

/* Validate all test cases in a directory */
const validateDirectory = dir => {
  fs.readdir(dir, (err, files) => {
    files.forEach(caseProcessor(dir, files));
  })
}

validateDirectory('../test/cases/');
validateDirectory('../test/regressions/');
