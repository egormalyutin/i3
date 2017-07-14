childProcess	= require 'child_process'
exec		= childProcess.exec
fs 		= require 'fs'
write		= fs.writeFile
i3 = require('i3').createClient()


log = console.log

path = '/tmp/i3-workspaces-all.txt'

fs.writeFile path, '', ->

reload = ->
	exec 'i3-msg -t get_workspaces', [], (err, stdout, stderr) ->
		mas = (JSON.parse stdout)

		mas2 = []

		for work in mas
			mas2[work.num + 1 - 1] = work.name

		fs.writeFile path, '', ->
		fs.writeFile path, mas2.join '\n'

reload()

i3.on 'workspace', ->
	reload()
