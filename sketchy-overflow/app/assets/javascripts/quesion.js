$(function(){
  Question.bindEvents();
});

var Question = {
  bindEvents: function() {
    $('#new_question').on('ajax:success', this.appendQuestion);
    $('#new_question').on('ajax:error', this.appendQuestion);
  },

  appendQuestion: function(e, data) {
    $('#question_list').prepend(data)
  },

  displayError: function() {
    $('#question_list').prepend("There was an error")
  }
}