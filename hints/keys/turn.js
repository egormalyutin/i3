// Generated by CoffeeScript 1.12.5
var a, fs, log;

fs = require('fs');

log = console.log;

a = (fs.readFileSync('raw')).toString();

a = a.replace(/\t/g, "\\t").replace(/\n/g, "\\n");

fs.writeFileSync('text', a);
