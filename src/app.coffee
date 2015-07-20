
express = require 'express'
load = require 'express-load'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
expressSession = require 'express-session'
methodOverride = require 'method-override'

###############################
#maybe a put a error file here
###############################
app  =  express()
server = require('http').Server app

#mongo set-up here later...

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'ejs'

#...

app.listen 3000, ->
  console.log 'NodeWebSite no ar.'