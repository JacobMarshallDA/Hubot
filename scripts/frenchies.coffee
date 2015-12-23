# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

frenchbulldogs = [
  "http://hellogiggles.com/wp-content/uploads/2014/10/16/frenchbulldog.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/3e/de/52/3ede52aa092642733ea9c1de8c9ec3cf.jpg",
  "https://www.expatads.com/adpics1/2015/10/Lovely-French-Bulldog-Puppy-56130d75277f258fb1b4.jpg",
]

module.exports = (robot) ->

  robot.hear /frenchie/i, (msg) ->
    msg.send msg.random frenchbulldogs

  robot.router.post '/hubot/git/webhook/:secret', (req, res) ->
    unless req.params.secret is process.env.GIT_WEBHOOK_SECRET
      res.writeHead 401, 'Content-Type': 'application/json'
      res.end JSON.stringify result: 'unauthorized'
      return

    try
      message = "[debug] message from git webhook: " + JSON.stringify req.body
      robot.messageRoom process.env.GIT_WEBHOOK_ROOM, message
    catch err
      res.writeHead 500, 'Content-Type': 'application/json'
      res.end JSON.stringify
        result: 'error'
        error: err
      return

    res.writeHead 200, 'Content-Type': 'application/json'
    res.end JSON.stringify result: 'success'
