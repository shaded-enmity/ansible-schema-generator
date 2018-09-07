const fs = require('fs');
const tv4 = require('tv4');

let schema = JSON.parse(
  fs.readFileSync('../generated/ansible-stable-2.5.json')
);

var counter = 0;
fs.readdir('../test/cases/', (err, files) => {
  files.forEach(file => {
    const testCase = JSON.parse(
      fs.readFileSync('../generated/ansible-stable-2.5.json')
    );

    const validation = tv4.validate(testCase, schema);
    if (validation.error !== undefined) {
      console.log(validation)
      throw validation
    }
    
    console.log('['+(counter+1)+'/'+files.length+'] Validating: '+ file);
    counter++;
  });
})
