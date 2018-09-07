const fs = require('fs');
const tv4 = require('tv4');
const yaml = require('js-yaml');

let schema = JSON.parse(
  fs.readFileSync('../generated/ansible-stable-2.5.json')
);

var counter = 0;
fs.readdir('../test/cases/', (err, files) => {
  files.forEach(file => {
    const testCase = yaml.loadAll(
      fs.readFileSync('../test/cases/' + file)
    );

    const valid = tv4.validate(testCase, schema);
    if (!valid) {
      console.log(file, tv4.error)
      throw tv4.error
    }
    
    console.log('['+(counter+1)+'/'+files.length+'] Validating: '+ file);
    counter++;
  });
})
