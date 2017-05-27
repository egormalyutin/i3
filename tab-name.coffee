do ->

	program = require "commander"

	program
		.version '0.0.1'
		.option '-s, --symbol [symbol]', 'name of symbol'
		.parse process.argv

	childProcess = require "child_process"

	exec = childProcess.exec
	ex = module.exports

	log = console.log
	
	ex.toTable = (str) ->
		m = str.split "; "
		m3 = []
		for m2 in m
			t = m2.split ": "
			m3[t[0]] = t[1]
		return m3
	
	ex.table = ex.toTable "browser: ;
			       web: ;
			       net: ;

			       terminal: ; 
			       term: ; 
			       shell: ; 

			       images: ;

			       torrent: ; 

			       paint: ; 

			       music: ; 

			       files: ; 

			       word: ; 

			       powerpoint: ; 

			       letter: ;

			       lock: ;
			       secure: ;
			       sec: ;

			       develop: ;
			       devel: ;
			       dev: ;

			       gaming: ;
			       game: ;

			       vkontakte: ;
			       vk: ;

			       youtube: ;
			       yt: ;

			       fix: ;

			       git: ;

			       github: ;

			       linux: ;

			       phone: ;

			       book: ;
			       manual: ;
			       man: ;

			       server: ;
			       serv: ;

			       film: ;

			       save: ;

			       settings: ;

			       telegram: ;

			       math: ;
			       maths: ;

			       upload: ;

			       usb: ;
			       
			       user: ;

			       camera: ;

			       check: ;
			       checked: ;

			       code: ;

			       fork: ;

			       dropbox: ;

			       warning: ;
			       warn: ;

			       watch: ;

			       flag: ;

			       wifi: ;
			       wireless: ;

			       keys: ;
			       keyboard: ;

			       map: ;

			       microphone: ;
			       phone: ;

			       qrcode: ;
			       qr: ;

			       question: ;

			       info: ;
			       information: ;

			       star: ;

			       record: ;

			       magic: ;

			       write: ;
			       pen: ;
			       "

	ex.rename = (name) ->
		exec (__dirname + "/i3-workspacer.py rename -na " + ex.table[name])

	# Binary
	do ->
		if program.symbol
			ex.rename program.symbol
			log "Symbol of workspace was changed to " + ex.table[program.symbol]

