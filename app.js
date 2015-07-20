var app, bodyParser, cookieParser, express, expressSession, load, methodOverride, server;

express = require('express');

load = require('express-load');

bodyParser = require('body-parser');

cookieParser = require('cookie-parser');

expressSession = require('express-session');

methodOverride = require('method-override');

app = express();

server = require('http').Server(app);

app.set('views', __dirname + "/views");

app.set('view engine', 'ejs');

app.use express.static(__dirname+"/public");

load('models').then('controllers').then('routes').into(app);

app.listen(3000, function() {
  return console.log('NodeWebSite no ar.');
});
