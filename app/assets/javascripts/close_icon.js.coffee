$(document).ready ->
  $(".close.icon").on "click", ->
    $(this).closest(".message").transition "fly left"
