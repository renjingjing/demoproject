$(document).ready(function(){
  // silde_imagr_in_show_page
    $('a.carosel-control-right').click(function(e) {
      e.preventDefault();
      // console.log("right");
      $(this).blur();
      $(this).parent().find('.carosel-item').first().insertAfter($(this).parent().find('.carosel-item').last());
    });
    $('a.carosel-control-left').click(function(e) {
      e.preventDefault();
      // console.log("left");
      $(this).blur();
      $(this).parent().find('.carosel-item').last().insertBefore($(this).parent().find('.carosel-item').first());
    });

    //  slide_frame_in_show_page
    $('a.frame_right').click(function(e) {
      e.preventDefault();
      // console.log("right");
      $(this).blur();
      $(this).parent().find('.carosel-item').first().insertAfter($(this).parent().find('.carosel-item').last());
    });
    $('a.frame-left').click(function(e) {
      e.preventDefault();
      $(this).blur();
      $(this).parent().find('.carosel-item').last().insertBefore($(this).parent().find('.carosel-item').first());
    });

    $("#My_Demo").on("click",function(e){
      e.preventDefault();
      $(".demo_container").fadeIn("slow");
    });

    $("#Exit_Demo").on("click",function(e){
      e.preventDefault();
      $(".demo_container").fadeOut("slow");
    });

    $(".demo2").colorpicker(function(e){
      e.preventDefault();
    });


  $('.frame_lib').on('click',function(){
  var frame_src = $(this).attr("src");
  $("#demo_frame").attr("src", frame_src );
  });

   $("b").on("click",function(){
     var color = $("#color").val();
     $(".demo_board").css('backgroundColor', color);
   });

    $(".demo_board").click(function(event){
        var x=event.clientX;
        var y=event.clientY;
        var f_x_offset=parseInt($("#demo_frame").css("width"))/2;
        var f_y_offset=parseInt($("#demo_frame").css("height"))/2;
        $('#demo_frame').css({left:x-f_x_offset-40,top:y-f_y_offset});
        $('#demo_image').css({top:$('#demo_frame').css("top"),left:$('#demo_frame').css("left")});
//debug
        var padding_x = (parseInt($('#demo_frame').css("width"))-parseInt($('#demo_frame').css("width")))/2;
        var padding_y = (parseInt($('#demo_frame').css("height"))-parseInt($('#demo_frame').css("height")))/2;
        console.log(padding_x,padding_y);

    });
    $("#zoom_out").on('click',function(){
      var new_width = parseInt($('#demo_frame').css("width"))-22;
      var new_height = parseInt($('#demo_frame').css("height"))-16;
      console.log(new_width,new_height);
      $('#demo_frame').css({width:new_width,height:new_height});
      $('#demo_image').css({width:new_width,height:new_height});
    });

    $("#zoom_in").on('click',function(){
      var new_width = parseInt($('#demo_frame').css("width"))+22;
      var new_height = parseInt($('#demo_frame').css("height"))+16;
      console.log(new_width,new_height);
      $('#demo_frame').css({width:new_width,height:new_height});
      $('#demo_image').css({width:new_width,height:new_height});
    });

  $("#PicSmaller").on("click",function(){
    $('#demo_image').css('padding',parseInt($('#demo_image').css("padding"))+10);
  });


  $("#Picbigger").on("click",function(){
    $('#demo_image').css('padding',parseInt($('#demo_image').css("padding"))-10);
  });


});
