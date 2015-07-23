module.exports = function(app) {
  var HomeController;
  HomeController = {
    index: function(req, res) {
      return res.render('home/index');
    }
  };
  return HomeController;
};
