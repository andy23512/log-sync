interval = setInterval ( ->
  r = Math.random!
  if r > 0.5
    console.error \fate
  else
    console.log \nanoha
), 500
<- setTimeout _, 30000
clearInterval interval
