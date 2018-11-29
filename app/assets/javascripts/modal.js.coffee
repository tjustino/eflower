$(document).ready ->
  $("#terms").on "click", ->
    $(".ui.modal.terms").modal "show"
  $("#privacy").on "click", ->
    $(".ui.modal.privacy").modal "show"
  $("#contact").on "click", ->
    $(".ui.modal.contact").modal "show"
