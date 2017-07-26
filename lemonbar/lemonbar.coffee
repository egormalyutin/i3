log = console.log
childProcess	= require 'child_process'
exec		= childProcess.exec
fs 		= require 'fs'
write		= fs.writeFile
i3  = require('i3').createClient()


mpd = require('mpd')
cmd = mpd.cmd

setInterval () ->
			exec "node ~/.config/i3/mpd/mpd.js", [], (err, stdout, stderr) ->
				out.p.mpd = stdout.replace "\n", ""
				out.draw()
			return
, 5000

setInterval () ->
			exec "~/.config/i3/scripts/lemonbar", [], (err, stdout, stderr) ->
				out.p.info = stdout.replace "\n", ""
				out.draw()
			return
, 6234

out = {
	p:
		left: ""
		center: ""
		right: ""
		workspaces: ""
		mpd: ""
		info: ""

	draw: () ->
		@p.left = "%{l}  " + @p.mpd
		@p.center = "%{c}%{B#11CCCCCC} " + @p.workspaces + " %{B-}"
		@p.right = "%{r}" + @p.info
		@p.out = @p.left + @p.center + @p.right
		
		log @p.out
}


reload = ->
	exec 'i3-msg -t get_workspaces', [], (err, stdout, stderr) ->
		mas = (JSON.parse stdout)

		left = ''
		center = ''

		out.p.workspaces = ""

		for work in mas
			if not work.focused
				out.p.workspaces += " " + work.name + " "
			else
				out.p.workspaces += "%{F#F78C06} " + work.name + " %{F-}"

		out.draw()
		

		
reload()

i3.on 'workspace', ->
	reload()
