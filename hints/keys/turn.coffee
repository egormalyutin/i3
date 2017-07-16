fs  = require 'fs'
log = console.log

a = (fs.readFileSync 'raw').toString()

a = a.replace(/\t/g, "\\t").replace(/\n/g, "\\n")

fs.writeFileSync 'text', a
