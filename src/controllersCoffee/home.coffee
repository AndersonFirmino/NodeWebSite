module.export = (app) ->
  HomeController = {
    index: (req, res) ->
      res.render 'home/index'
  }
  return HomeController