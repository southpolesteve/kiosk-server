loadiframe = (position) ->
  index = position - 1
  window.current_position = position
  console.log("loading frame #{position}")
  iframe = document.createElement("iframe")
  iframe.id = "frame_#{position}"
  iframe.src = config[index].url
  iframe.frameborder = "0"
  iframe.marginheight = "0"
  iframe.marginwidth = "0"
  iframe.width = "100%"
  iframe.height = "100%"
  iframe.scrolling = "auto"
  iframe.onload = () ->
    console.log("#{position} - frame loaded")

  $('body').html("")
  document.body.appendChild(iframe)
  config[index].iframe = iframe
  if config[index].display_time > 0
    setTimeout( ()->
      loadNextIframe()
    , config[index].display_time)
    console.log("displaying #{position} for #{config[index].display_time}")
  else
    console.log("displaying #{position} forever")



loadNextIframe = ()->
  if window.current_position != window.config.length
    loadiframe(current_position + 1)
  else
    loadiframe(1)

window.keys = Object.keys(config).sort().map( (key)-> parseInt(key) )
loadiframe(1)