$(document).ready(function(){
    $('a.carosel-control-right').click(function(e) {
      e.preventDefault();
      console.log("right");
      $('a.carosel-control-right').blur();
      $(this).parent().find('.carosel-item').first().insertAfter($(this).parent().find('.carosel-item').last());
    });
    $('a.carosel-control-left').click(function(e) {
      e.preventDefault();
      console.log("left");
      $(this).blur();
      $(this).parent().find('.carosel-item').last().insertBefore($(this).parent().find('.carosel-item').first());
    });
});
