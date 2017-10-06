$('.list > li a').click ->
  $(this).parent().find('ul').toggle()
  return
