loadiframe = (row) ->
  window.current = row
  console.log("loading frame #{row}")
  iframe = document.createElement("iframe")
  iframe.id = "frame_#{row}"
  iframe.src = config[row].url
  iframe.frameborder = "0"
  iframe.marginheight = "0"
  iframe.marginwidth = "0"
  iframe.width = "100%"
  iframe.height = "100%"
  iframe.scrolling = "auto"
  iframe.onload = () ->
    console.log('frame_loaded')

  $('body').html("")
  document.body.appendChild(iframe)
  config[row].iframe = iframe


loadNextIframe = ()->
  if window.current != _.last(window.keys)
    loadiframe(current + 1)
  else
    loadiframe(1)

window.config =
  1:
    url: 'http://www.smsmybus.com/kiosk?s=1559,1750&d=East,West'
  2:
    url: 'http://www.huffingtonpost.com'
  3:
    url: 'http://www.wunderground.com/cgi-bin/findweather/getForecast?query=53715&wuSelect=WEATHER'

window.ttd = 15000

window.keys = Object.keys(config).sort().map( (key)-> parseInt(key) )
loadiframe(1)

setInterval( ()->
  loadNextIframe()
, window.ttd)