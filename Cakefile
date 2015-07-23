#-----------------------------------
# Personal CakeFile for Express    #
#-----------------------------------

#node modules
fs = require 'fs'
{exec} = require 'child_process'
util = require 'util'

#Directory where the files to be compiled .coffee
prodSrcCoffeeDir     = 'src'

#if you have any directory test file
#testSrcCoffeeDir     = 'test/src/coffee-script'

#Directory where the file will be created with all the coffee concatenated js files
prodTargetJsDir      = 'script'

#if you have any directory test file
#testTargetJsDir      = 'test/src/js'

#End file name js
prodTargetFileName   = 'main'


prodTargetCoffeeFile = "#{prodSrcCoffeeDir}/#{prodTargetFileName}.coffee"
prodTargetJsFile     = "#{prodTargetJsDir}/#{prodTargetFileName}.js"

#Command executed for compilation
prodCoffeeOpts = "--bare --output #{prodTargetJsDir} --compile #{prodTargetCoffeeFile}"
#Exit to the tests file
#testCoffeeOpts = "--output #{testTargetJsDir}"

#list here all CoffeeScript files that you have and they will be compiled at the end in a JS
prodCoffeeFiles = [
    #files names here    
]


task 'build', 'Build a single JavaScript file from prod files', ->
    util.log "Building #{prodTargetJsFile}"
    appContents = new Array remaining = prodCoffeeFiles.length
    util.log "Appending #{prodCoffeeFiles.length} files to #{prodTargetCoffeeFile}"

    for file, index in prodCoffeeFiles then do (file, index) ->
        fs.readFile "#{prodSrcCoffeeDir}/#{file}.coffee"
                  , 'utf8'
                  , (err, fileContents) ->
            util.log err if err

            appContents[index] = fileContents
            util.log "[#{index + 1}] #{file}.coffee"
            process() if --remaining is 0

    process = ->
        fs.writeFile prodTargetCoffeeFile
                   , appContents.join('\n\n')
                   , 'utf8'
                   , (err) ->
            util.log err if err

            exec "coffee #{prodCoffeeOpts}", (err, stdout, stderr) ->
                util.log err if err
                message = "Compiled -> #{prodTargetJsFile}"
                util.log message
                fs.unlink prodTargetCoffeeFile, (err) -> util.log err if err


task 'watch', 'Watch prod source files and build changes', ->
    util.log "Watching for changes in -> #{prodSrcCoffeeDir}"

    for file in prodCoffeeFiles then do (file) ->
        fs.watchFile "#{prodSrcCoffeeDir}/#{file}.coffee", (curr, prev) ->
            if +curr.mtime isnt +prev.mtime
                util.log "Saw change in -> #{prodSrcCoffeeDir}/#{file}.coffee"
                invoke 'build'


#-----------------------------
#   Build Routes JS
#-----------------------------

#prodTargetRoutesJS = "path/to/routes"
prodTargetRoutesJS = "routes/"
#prodTargetRoutesCoffee = "path/to/routes"
prodTargetRoutesCoffee = "src/routesCoffee/"


task 'buildRoutes', 'build routes from coffee to js', ->
  util.log "Building routes js"
  util.log "Running coffee --compile -b --no-header -o #{prodTargetRoutesJS} #{prodTargetRoutesCoffee}"    
  exec "coffee --compile -b --no-header -o  #{prodTargetRoutesJS} #{prodTargetRoutesCoffee}", (err, stdout, stderr) ->
    if err
      util.log err 
      console.log stdout + stderr
    else
      util.log "Success! :D"

#-----------------------------
#   Build Controllers JS
#-----------------------------

#prodTargetControllersJS = "path/to/controller"
prodTargetControllersJS = "controllers/"
#prodTargetControllersCoffee = "path/to/controller"
prodTargetControllersCoffee = "src/controllersCoffee/"


task 'buildControllers', 'build controllers from coffee to js', ->
  util.log "Building routes js"
  util.log "Running coffee --compile -b --no-header -o #{prodTargetControllersJS} #{prodTargetControllersCoffee}"    
  exec "coffee --compile -b --no-header -o #{prodTargetControllersJS} #{prodTargetControllersCoffee}", (err, stdout, stderr) ->
    if err
      util.log err 
      console.log stdout + stderr
    else
      util.log "Success! :D"


#-----------------------------
#   Build Model JS
#-----------------------------

#prodTargetControllersJS = "path/to/model"
prodTargetModelsJS = "models/"
#prodTargetControllersCoffee = "path/to/model"
prodTargetModelsCoffee = "src/modelsCoffee/"


task 'buildModels', 'build models from coffee to js', ->
  util.log "Building routes js"
  util.log "Running coffee --compile -b --no-header -o #{prodTargetModelsJS} #{prodTargetModelsCoffee}"    
  exec "coffee --compile -b --no-header -o #{prodTargetModelsJS} #{prodTargetModelsCoffee}", (err, stdout, stderr) ->
    if err
      util.log err 
      console.log stdout + stderr
    else
      util.log "Success! :D"