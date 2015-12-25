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
  "http://i.dailymail.co.uk/i/pix/2013/11/05/article-0-1933C07700000578-760_306x423.jpg",
  "https://i.ytimg.com/vi/sVqTQqnds20/maxresdefault.jpg",
  "http://www.frenchiefever.com/wordpress/wp-content/uploads/2012/01/french-bulldog-health.jpg",
  "http://www.dogwallpapers.net/wallpapers/french-bulldog-with-a-ball-photo.jpg",
  "http://i.imgur.com/8Nzy9zL.png",
  "http://www.warrenphotographic.co.uk/photography/bigs/35754-Dark-brindle-French-Bulldog-pup-white-background.jpg",
  "https://s3-eu-west-1.amazonaws.com/bowwowtimes-new/wp-content/uploads/2015/03/Frugg.jpg",
  "http://www.littlestarsweb.com/bull/files/french-bulldog-girl[2].jpg",
  "http://www.french-bulldog.com/attachments/Image/News/Colour.jpg",
  "http://d3s5vyi2vl8slq.cloudfront.net/wp-content/uploads/2015/09/October-26-2005-100groupstoopcrop.jpg",
  "http://www.frenchbulldogbreed.net/files/French-Bulldog-pros-and-cons-000.jpg"
  "http://dogmagz.com/wp-content/uploads/2015/03/french-bulldog.jpg",
  "http://images5.alphacoders.com/431/431480.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/6c/59/ca/6c59caa59912bf4fc7f72bc70779ae88.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/52/fd/2b/52fd2b86699f228ffcd80eed2abe6c0c.jpg",
  "http://i.dailymail.co.uk/i/pix/2014/04/29/article-2615513-1D6E57D000000578-997_634x607.jpg",
  "http://dingo.care2.com/pictures/causes/3107/3106298.large.jpg",
  "https://i.ytimg.com/vi/O80E1RdDghE/maxresdefault.jpg",
  "http://cache.lovethispic.com/uploaded_images/169838-Black-And-White-French-Bulldog.jpg",
]

module.exports = (robot) ->

  robot.hear /frenchie/i, (msg) ->
    msg.send msg.random frenchbulldogs

  robot.hear /frenchiebomb/i, (msg) ->
    msg.send msg.random frenchbulldogs
    msg.send msg.random frenchbulldogs
    msg.send msg.random frenchbulldogs
    msg.send msg.random frenchbulldogs
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
