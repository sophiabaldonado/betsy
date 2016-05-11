// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// :javascript
  function fillAnswerNumber(){
    var question_type_name = $("#question_question_type_id :selected").text()
    if(question_type_name == "Single Input"){
      $("#answer_number")
        .find('option')
        .remove()
        .end()
        .append($('<option selected="selected"></option>').val("1").html("1"))
        .append($('<option></option>').val("2").html("2"))
        .append($('<option></option>').val("3").html("3"))
        .append($('<option></option>').val("4").html("4"))
      ;
    }else if(question_type_name == "Multiple Choice"){
       $("#answer_number")
        .find('option')
        .remove()
        .end()
        .append($('<option></option>').val("3").html("3"))
        .append($('<option selected="selected"></option>').val("4").html("4"))
        .append($('<option></option>').val("5").html("5"))
        .append($('<option></option>').val("6").html("6"))
      ;
    }
  }
