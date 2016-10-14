$ ->
  $('.js-switch').each ->
    options = {}
    if $(this).data('size')
      options = { size: $(this).data('size') }
    new Switchery(this, options)
