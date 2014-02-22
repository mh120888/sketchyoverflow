var Answer = {
  bindEvents: function () {
    $('form#new_answer').on('ajax:success', this.appendAnswer)
    $('form#new_answer').on('ajax:error', this.appendError)
  },

  appendAnswer: function(event, data, status, xhr) {
    event.preventDefault()
    $('.answers_list').prepend(data)
    $('#answer_form textarea').val('')
  },

  appendError: function(event, xhr, status, error) {
    event.preventDefault()
    $('#answer_form p').text(xhr.responseText)
  }
}

$(document).ready(function() {
  Answer.bindEvents()
})