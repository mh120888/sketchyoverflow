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
  },

}

var Best = {
  bindEvents: function() {
    $('form.best-form').on('ajax:success', this.confirmBest)
    $('form.best-form').on('ajax:error', this.showError)
  },

  markBest: function() {
    $(this).parent().append("new text")
    $(this).remove()
  },

  confirmBest: function(event, data) {
    $('.best-answer').remove()
    $(this).parent().prepend(data)
    event.preventDefault()
  },

  showError: function(event) {
    debugger
    event.preventDefault()
  }
}

$(document).ready(function() {
  Answer.bindEvents()
  Best.bindEvents()
})