(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.parallax').parallax();
    var editor = ace.edit("editor");
  editor.setTheme("ace/theme/monokai");
  editor.getSession().setMode("ace/mode/javascript");
  }); // end of document ready
})(jQuery); // end of jQuery name space
