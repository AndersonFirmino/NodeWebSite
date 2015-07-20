
express = require 'express'
load = require 'express-load'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
expressSession = require 'express-session'
methodOverride = require 'method-override'

###############################
#maybe a put a error file here in these lines
###############################


app  =  express()
server = require('http').Server app

#mongo set-up here later...

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'ejs'

#CoffeeScript don't suport the static word ?
#It was necessary to use embedded JavaScript for this.
`app.use express.static(__dirname+"/public")`

load 'models'
  .then 'controllers'
  .then 'routes'
  .into app

#..

app.listen 3000, ->
  console.log 'NodeWebSite no ar.'