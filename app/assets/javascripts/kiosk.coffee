class Kiosk

  constructor: (@config) ->
    @loadFirstFrame()

  loadFirstFrame: ()->
    @loadPosition(1)

  loadNextFrame: ()->
    if @position != @config.length
      @loadPosition(@position + 1)
    else
      @loadPosition(1)

  loadPosition: (position)->
    @position = position
    unless @currentFrame().length
      @loadFrame()
    @currentFrame().show()
    @otherFrames().hide()
    if @displayTime() > 0
      setTimeout (=> @loadNextFrame()), @displayTime()
      debug("displaying #{@position} for #{@displayTime()}")
    else
      debug("displaying #{@position} forever")

  loadFrame: ()->
    iframe = $('<iframe />',
      id: "f#{@position}"
      src: @positionConfig().url
      frameborder: "0"
      marginheight: "0"
      marginwidth: "0"
      width: "100%"
      height: "100%"
      scrolling: "auto"
    )
    iframe.appendTo('body')

  currentFrame: ()->
    $("#f#{@position}")

  otherFrames: ()->
    $("iframe:not(#f#{@position})")

  index: ()->
    @position - 1

  positionConfig: ()->
    @config[@index()]

  displayTime: ()->
    @positionConfig().display_time

  debug = (message) ->
    console.log(message)

window.kiosk = new Kiosk(window.config)
