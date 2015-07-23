module.exports = function(app) {
  var home;
  home = app.controllers.home;
  return app.get('/', home.index);
};
