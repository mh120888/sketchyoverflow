var Banner = {
  bindEvent: function() {
    $('h1').hover(this.addInstructions, this.removeInstructions)
  },

  addInstructions: function() {
    $('#messages').text("See all sketchy questions")
  },

  removeInstructions: function() {
    $('#messages').empty()
  }
}


$( document ).ready(function() {
    Banner.bindEvent()
});