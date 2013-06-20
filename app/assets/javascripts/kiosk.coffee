class Kiosk

  constructor: (@config) ->
    @loadPosition(1)

  loadNextPosition: ()->
    if @position != @config.length
      @loadPosition(@position + 1)
    else
      @loadPosition(1)

  loadPosition: (position)->
    @previousPosition = @position
    @position = position
    @loadFrame()

  loadFrame: ()->
    frame = $('<iframe />',
      id: "f#{@position}"
      src: @positionConfig().url
      frameborder: "0"
      marginheight: "0"
      marginwidth: "0"
      width: "100%"
      height: "100%"
      scrolling: "auto"
    )
    frame.hide()
    frame.appendTo('body')
    frame.load ()=>
      debug("Frame #{@position} - Finished Loaded")
      @currentFrame().show()
      debug("Frame #{@position} - Shown")
      if @previousPosition
        @previousFrame().hide()
        debug("Frame #{@previousPosition} - Hidden")
      @scheduleNextFrame()

  scheduleNextFrame: ()->
    if @displayTime() > 0
      setTimeout (=> @loadNextPosition()), @displayTime()
      debug("Frame #{@position} - Displaying for #{@displayTime()}")
    else
      debug("Frame #{@position} - Displaying indefinitely")

  currentFrame: ()->
    $("#f#{@position}")

  previousFrame: ()->
    $("#f#{@previousPosition}")

  positionConfig: ()->
    @config[@index()]

  displayTime: ()->
    @positionConfig().display_time

  index: ()->
    @position - 1

  debug = (message) ->
    console.log(message)

window.kiosk = new Kiosk(window.config)
