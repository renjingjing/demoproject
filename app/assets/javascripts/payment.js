$(document).ready(function(){
  var p = $("meta[name='stripe-publishable-key']").attr("value");
  console.log(p);
  Stripe.setPublishableKey('pk_test_gYzn0IAdi1OomHvMmKdPkVBr');
  // ($("meta[name='stripe-publishable-key']").attr("value"));

  $("#stripe-form").on("submit", function(e){
      e.preventDefault();
      Stripe.card.createToken({
          number:    $('#card-number').val(),
          cvc:       $('#cvc').val(),
          exp_month: $('#date_month').val(),
          exp_year:  $('#date_year').val()
    }, stripeResponseHandler);
    $("#submit-button").prop('disabled', true);
  });

  var stripeResponseHandler = function (status, response) {
    if (response.error) {
      $("#stripe-errors").text(response.error.message);
      $("#submit-button").prop('disabled', false);
    } else {
      $("#stripe_token").val(response.id);
      $("form")[0].submit();

    }
  }
});
