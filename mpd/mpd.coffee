mpdclient 	= require 	'mpdclient.js'
child		= require	'child_process'

exec 		= child.exec

client = new (mpdclient.MPDClient)('localhost', 6600)

command = new (mpdclient.MPDCommand)('status')

log = console.log

str 	= ''
work	= 0

exec 'mpc status', (err, stdout, stderr) ->

	if stdout.match 'playing'
		str += '  ' 
		work = 1

	if stdout.match 'paused'
		str += '  ' 
		work = 1

	if work
		track = stdout.split('\n')[0]
		str = track + str 

	if stdout.match 'single: on'
		str += '  '

	log str
