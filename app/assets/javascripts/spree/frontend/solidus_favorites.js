Spree.ready(function() {
  $('.favorite_product_link').on('click', function(e) {
    e.preventDefault();

    var $el = $(e.currentTarget);

    if ($el.hasClass('fa-heart-o')) {
      $el.removeClass('fa-heart-o').addClass('fa-heart');
    } else {
      $el.removeClass('fa-heart').addClass('fa-heart-o');
    }
  })

  $('.favorite_add_to_cart_link').on('click', function(e) {
    e.preventDefault();

    var addToCartLink = $(e.currentTarget);
    var removeFavoriteLink = $('.favorite_remove_link');
    var el = $(e.currentTarget);
    var variantID = $(e.currentTarget).parents('.favorite_item').data('variantId');
    var actionsContent = $(e.currentTarget).parent();
    var actionLinks = $(e.currentTarget).parents('.favorite-product-actions');

    actionsContent.addClass('hidden');
    actionLinks.append("<i class='fa fa-refresh fa-spin'></i>")

    $.ajax({
      method: 'POST',
      url: '/orders/populate',
      dataType: 'html',
      data: 'variant_id=' + variantID + '&quantity=1',
      success: function(data) { Spree.fetch_cart('/cart_link'); },
      error: function(jqXHR, textStatus, errorThrown) {},
      complete: function(data) {
        actionsContent.removeClass('hidden');
        actionLinks.find('.fa-refresh').remove();
      }
    })
  })
})
