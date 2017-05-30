got 	=  require 'got'
program =  require 'commander'

fs 	=  require 'fs'

log =	console.log

# Parse args

program
	.version '0.0.1'

	.option '-l, --locationcode [code]',	'location code of your city'
	.option '-v, --view',			'log all location codes; useful with "| less"'
	.option '-m, --metric [symbol]',	'specify metric: C for celsius, F for farenhieght. Celsius defaultly.'

	.parse process.argv

if program.locationcode then task = 'get'
if program.view		then task = 'view'

if task is 'view'
	allcodes = fs.readFile __dirname + '/locationcodes', 'utf8', (err, data) ->
		if err then throw err
		if data then log data


if task is 'get'

	if not program.locationcode
		throw 'You need to specify your city. Start with -h for view help.'
		process.exit 1

	# Get data for search

	if program.metric is 'F'
		SYMB_METRIC 	= "F"
		METRIC		=  0
	else
		SYMB_METRIC 	= "C"
		METRIC		=  1

	LOCAL	= "ASI|RU|RS058|OMSK"
	ADDR	= 'http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=' + METRIC + '\&locCode\=' + LOCAL

	getCurrent = (text) ->
		res = (text.match /.*Currently.*/i)[0]

		res = res.replace /\t/ig,  ''

		res = res.replace /\\t/ig, ''

		res = res.replace /\<(\/*)title\>/ig, ''

		res

	matches = (text, args) ->
		for arg in args
			if text.match arg
				return true

		false

	contains = (obj, comp) ->
		res = []

		for prop, val of comp
			if obj[prop] then res.push val

		res

	weather =
		tests:
			sunny:	[ "Sunny", "Mostly Sunny", "Partly Sunny", "Intermittent Clouds", "Hazy Sunshine", "Hot" ]

			cloudy:	[ "Mostly Cloudy", "Cloudy", "Dreary (Overcast)", "Fog" ]
		
			rainy:	[ "Showers", "Mostly Cloudy w/ Showers", "Partly Sunny w/ Showers", "T-Storms", "Mostly Cloudy w/ T-Storms", "Partly Sunny w/ T-Storms", "Rain" ]

			windy:	[ 'Windy' ]

			snow:	[ "Flurries", "Mostly Cloudy w/ Flurries", "Partly Sunny w/ Flurries", "Snow", "Mostly Cloudy w/ Snow", "Ice", "Sleet", "Freezing Rain", "Rain and Snow", "Cold" ]
			
			night:	[ "Clear", "Mostly Clear", "Partly Cloudy", "Intermittent Clouds", "Hazy Moonlight", "Mostly Cloudy", "Partly Cloudy w/ Showers", "Mostly Cloudy w/ Showers", "Partly Cloudy w/ T-Storms", "Mostly Cloudy w/ Flurries", "Mostly Cloudy w/ Snow" ]

		test: (text, tests) ->
		
			if not tests
				tests = []

				for prop of weather.tests
					tests.push prop

			res = {}

			for test in tests
				if weather.tests[test]
					res[test] = matches text, weather.tests[test]

			res

		getSymbs: (test) ->
			symbs = contains test,
				sunny:	"",
				cloudy:	"",
				rainy:	"",
				windy:	"",
				snow:	"",
				night:	""

			symbs

		phrase: (text) ->
			test	= weather.test		text
			mas	= weather.getSymbs 	test

			temp = do ->
				regexp = new RegExp '\\d+' + SYMB_METRIC, 'i'

				(text.match regexp)[0]

			mas.push temp

			phrase = mas.join ' '

			phrase


	got ADDR
		.then (response) ->
			answer = response.body

			log weather.phrase getCurrent answer

		.catch (error) ->
			log error.response.body
