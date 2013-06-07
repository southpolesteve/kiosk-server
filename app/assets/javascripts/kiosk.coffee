loadiframe = (url) ->
  iframe = document.createElement("iframe")
  iframe.id = "frame"
  iframe.src = url
  iframe.frameborder = "0"
  iframe.marginheight = "0"
  iframe.marginwidth = "0"
  iframe.width = "100%"
  iframe.height = "100%"
  iframe.scrolling = "auto"
  iframe.onload = () ->
    console.log('frame_loaded')

  $('#frame').remove()
  document.body.appendChild(iframe)



next_url = ()->
  if window.current == "post"
    console.log("loading bus")
    loadiframe('http://www.smsmybus.com/kiosk?s=1559,1750&d=East,West')
    window.current = "bus"
  else
    console.log("loading post")
    loadiframe('http://www.huffingtonpost.com')
    window.current = "post"

loadiframe('http://www.smsmybus.com/kiosk?s=1559,1750&d=East,West')
window.current = "bus"
setInterval( ()->
  next_url()
, 10000)