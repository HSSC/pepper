# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.continue-to-start').on 'click', ->
    $('.intro-step-1').hide()
    $('.intro-step-2').show()

  $('.continue-to-survey').on 'click', (event) ->
    sortedIDs = $('#sortable2').sortable("toArray")

    console.log sortedIDs.length

    if sortedIDs.length <= 5
      event.preventDefault()
      alert("Please select all outcomes and order them from worst to least")


  $('.connectedSortable').sortable({
    connectWith: "#sortable2",
    stop: (event, ui) ->
      $( "#sortable2" ).sortable( "refresh" )
      sortedIDs = $('#sortable2').sortable("toArray")

      textFields = ['#response_set_sixth', '#response_set_fifth', '#response_set_fourth', '#response_set_third', '#response_set_second', '#response_set_first']

      for i in sortedIDs
        $(textFields.pop()).val(i)

  }).disableSelection()

  $('[data-toggle="popover"]').popover(container: 'body')
  $('[data-toggle="tooltip"]').tooltip()

  $('.default-legend').on 'click', ->
    $('#default-message .modal').modal('show')

  if $('#slider').length
    slider = document.getElementById('slider')
    stepValues = {0:'Definitely prefer this option', 1:'', 2:'', 3:'', 4:'', 5:'Either option is fine/no preference', 6:'', 7:'', 8:'', 9:'', 10:'Definitely prefer this option'}

    noUiSlider.create(slider, {
      start: [5],
      range: {
          'min': 0,
          'max': 10
      },
      step: 1,
      pips: {
        mode: 'steps',
        density: 10,
        format: {
          to: (a) ->
            stepValues[a]
        }
      }
    })

    # retrieve values when user slides
    slider.noUiSlider.on 'slide', (values, handle) ->
      value = values[handle]
      if value >= 0 && value <= 4
        $('.question_0_weight').val(Math.abs(value))
        $('.question_0_id').prop('checked', true)
        $('.question_1_id').prop('checked', false)
        $('.question_0_weight').prop('checked', true)
        $('.question_1_weight').prop('checked', false)
      else if value >= 6 && value <= 10
        $('.question_1_weight').val(Math.abs(value))
        $('.question_1_id').prop('checked', true)
        $('.question_0_id').prop('checked', false)
        $('.question_1_weight').prop('checked', true)
        $('.question_0_weight').prop('checked', false)
      else
        $('.question_0_weight').val('')
        $('.question_1_weight').val('')
        $('.question_0_id').prop('checked', false)
        $('.question_1_id').prop('checked', false)
        $('.question_0_weight').prop('checked', false)
        $('.question_1_weight').prop('checked', false)
