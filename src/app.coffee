
express = require 'express'
load = require 'express-load' #load the modules/webpages that i need.
app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'ejs' #Here I define my view engine 
app.use express.static("#{__dirname}/public")

load 'models'
  .then 'controllers'
  .then 'routes'
  .into app

app.listen 3000, ->
  console.log 'NodeWebSite rodando.'

