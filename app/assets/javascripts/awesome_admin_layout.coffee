$(document).ready(->
  #
  # Variables
  #
  $layout = $('#awesome_admin_layout')
  $navigation = $('.awesome_admin_layout-navigation')
  $navigation_toggle = $('.awesome_admin_layout-navigation-toggle')

  #
  # Events
  #
  $navigation.on('click', 'li:not(.nested)', ->
    $navigation.find('.open').removeClass('open')
    $navigation.removeClass('expanded')
  )

  $navigation.on('click', 'li.nested', (event) ->
    $navigation.find('.open').removeClass('open')
    $navigation.addClass('expanded')
    $(this).find('.awesome_admin_layout-nested-navigation').addClass('open')
  )

  $navigation_toggle.on('click', 'i', ->
    $layout.toggleClass('open')
  )
)
