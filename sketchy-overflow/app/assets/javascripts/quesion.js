$(function(){
  Question.bindEvents();
});

var Question = {
  bindEvents: function() {
    $('#new_question').on('ajax:success', this.appendQuestion);
    $('#new_question').on('ajax:error', this.appendQuestion);
  },

  appendQuestion: function(e, data) {
    var $user_question = $(data).addClass('user-owned')
    $('#question_list').prepend($user_question)
  },

  displayError: function() {
    $('#question_list').prepend("There was an error")
  }
}