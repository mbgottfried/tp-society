//= require bootstrap
//= require jquery
//= require shrink

jQuery(function() {
  jQuery("#credit-card input, #credit-card select").attr("disabled", false);

  jQuery("form:has(#credit-card)").submit(function() {
    var form = this;
    jQuery("#user_submit").attr("disabled", true);
    jQuery("#credit-card input, #credit-card select").attr("name", "");
    jQuery("#credit-card-errors").hide();

    if (!jQuery("#credit-card").is(":visible")) {
      jQuery("#credit-card input, #credit-card select").attr("disabled", true);
      return true;
    }
    
    var card = {
      number:   jQuery("#credit_card_number").val(),
      expMonth: jQuery("#_expiry_date_2i").val(),
      expYear:  jQuery("#_expiry_date_1i").val(),
      cvc:      jQuery("#cvv").val()
    };


    Stripe.createToken(card, function(status, response) {
      if (status === 200) {
        jQuery("#user_last_4_digits").val(response.card.last4);
        jQuery("#user_stripe_token").val(response.id);
        form.submit();
      } else {
        jQuery("#stripe-error-message").text(response.error.message);
        jQuery("#credit-card-errors").show();
        jQuery("#user_submit").attr("disabled", false);
      }
    });

    return false;
  });

  jQuery("#change-card a").click(function() {
    jQuery("#change-card").hide();
    jQuery("#credit-card").show();
    jQuery("#credit_card_number").focus();
    return false;
  });
});
