$(document).ready(->
  #
  # Variables
  #
  $layout = $('#awesome_admin_layout')
  $navigation = $('.awesome_admin_layout-navigation')
  $navigation_toggle = $('.awesome_admin_layout-navigation-toggle')

  #
  # Functions
  #
  active_nested_navigations = ->
    $nested_navigation = $('.awesome_admin_layout-nested-navigation')
    $nested_navigation.find('.active').closest('.awesome_admin_layout-nested-navigation')

  open_nested_navigation = ($navigation) ->
    $navigation.addClass('open')
    $navigation.closest('ul').addClass('expanded')
    $navigation.closest('li').addClass('active')

  open_active_nested_navigation = ->
    $active_nested_navigations = active_nested_navigations()
    open_nested_navigation($active_nested_navigations.first()) if $active_nested_navigations.length > 0

  #
  # Events
  #
  $navigation.on('click', 'li:not(.nested)', ->
    $navigation.find('.open').removeClass('open')
    $navigation.find('.expanded').removeClass('expanded')
  )

  $navigation.on('click', 'li.nested', (event) ->
    $navigation.find('.open').removeClass('open')
    $(this).closest('ul').addClass('expanded')
    $(this).find('.awesome_admin_layout-nested-navigation').addClass('open')
  )

  $navigation_toggle.on('click', ->
    $layout.toggleClass('open')
  )

  #
  # Main
  #
  open_active_nested_navigation()
)
