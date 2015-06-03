$(->
  $layout = $('#awesome_admin_layout')
  $navigation = $('.awesome_admin_layout-navigation')
  $navigation_toggle = $('.awesome_admin_layout-navigation-toggle')

  $navigation.on('click', ->
    $navigation.find('.open').removeClass('open')
    $navigation.find('.expanded').removeClass('expanded')
  )

  $navigation.find('li.nested').on('click', (event) ->
    event.stopPropagation()
    $navigation.find('.open').removeClass('open')
    $(this).closest('ul').addClass('expanded')
    $(this).find('.awesome_admin_layout-nested-navigation').addClass('open')
  )

  $navigation_toggle.on('click', ->
    $layout.toggleClass('open')
  )
)
