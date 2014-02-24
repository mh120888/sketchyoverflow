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
    $('#container').on('ajax:success', 'form.best-form', this.confirmBest)
    $('#container').on('ajax:error', 'form.best-form', this.showError)
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
    event.preventDefault()
    console.log("There was an error")
  }
}

$(document).ready(function() {
  Answer.bindEvents()
  Best.bindEvents()
})