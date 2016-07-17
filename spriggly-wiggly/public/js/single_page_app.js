$(document).ready( function () {
  var createNewRestaurant = function () {  
    $('#newRestaurant').submit( function(event) {
      event.preventDefault()
      var restaurantName = $('#newRestaurantName').val()
      var restaurantLocation = $('#newRestaurantLocation').val()
      var restaurantDetails = { name: restaurantName, location: restaurantLocation }
      $.post("/api/restaurants", restaurantDetails)
        .done( function(response) {
          var newlyCreateRestaurant = JSON.parse(response).restaurant
          restaurantElement = buildRestaurantElement(newlyCreateRestaurant) 
          $('#restaurants').append(restaurantElement)
        })
    })
  }

  var buildRestaurantElement = function (restaurantObject) {
    var ordersElementId = buildRestaurantOrdersId(restaurantObject.id)
    var paragraphElement = "<p> Restaurant id:" + restaurantObject.id + " " + restaurantObject.name + "</p>"
    var ordersElement = "<div id='" + ordersElementId + "'></div>"
    var deleteButton = "<button class='super-sport deleteRestaurant pull-right' data-restaurant-id='" + restaurantObject.id + "' >X</button>"
    return(
      "<div class='display-tile restaurantContainer'>" + deleteButton + paragraphElement + ordersElement + "</div>"
    )
  }

  var buildRestaurantOrdersId = function (restaurantId, appendHashMark = false) {
    var hash = ''
    if (appendHashMark == true) {
      hash = '#'
    }
    return(hash + 'restaurant-' + restaurantId + '-orders')
  }

  var renderRestaurants = function (restaurantObjects) {
    $(restaurantObjects).each( function (index, restaurant) {
      restaurantElement = buildRestaurantElement(restaurant) 
      restaurantIdOption = buildIdOption(restaurant)
      $('#restaurants').append(restaurantElement)
      $('#restaurantIds').append(restaurantIdOption)
      renderOrders(restaurant)
    });
  };

  var renderOrders = function(restaurant) {
    var apiUrl = '/api/restaurants/' + restaurant.id + '/orders'
    $.get(apiUrl)
      .done( function (serverResponse) {
        orders = JSON.parse(serverResponse).orders
        $(orders).each(function (index, order) {
          renderOrder(order, restaurant.id)
        });
      });
  };

  var renderOrder = function (order, restaurantId) {
    var orderElement = buildOrderElement(order)
    var restaurantOrdersId = buildRestaurantOrdersId(restaurantId, true) 
    $(restaurantOrdersId).append(orderElement)
  }

  var buildIdOption = function (restaurant) {
    return("<option value='" + restaurant.id + "'>" + restaurant.name + "</option>")
  }

  var buildOrderElement = function (order) {
    return (
      "<h4> order id: " + order.id + " and it is '" + order.description + "' !</h4>"
    )
  }

  var getRestaurants = function () {
    $.get('/api/restaurants')
    .done(function (serverResponse) {
      var response_as_json = JSON.parse(serverResponse)
      renderRestaurants(response_as_json.restaurants)
      deleteRestaurants()
    })
  }

  var createNewOrder = function () {
    $('#newOrder').submit( function(event) {
      event.preventDefault()
      var orderDescription = $('#newOrderDescription').val()
      var restaurantId = $('#restaurantIds').val()
      var orderDetails = { description: orderDescription, restaurant_id: restaurantId }
      $.post("/api/orders", orderDetails)
        .done( function(response) {
          var newlyCreatedOrder = JSON.parse(response).order
          renderOrder(newlyCreatedOrder, restaurantId)
        })
    })
  }

  var deleteRestaurants = function () {
    $('.deleteRestaurant').click( function (clickEvent) {
      var restaurantId = $(clickEvent.target).data('restaurant-id')
      var deleteRestaurantUrl = '/api/restaurants/' + restaurantId
      $.ajax({
        url: deleteRestaurantUrl,
        type: 'DELETE',
        success: function(response) {
          $(clickEvent.target).parent('.restaurantContainer').remove()
        } 
      })
    });
  }

  getRestaurants()
  createNewRestaurant()
  createNewOrder()
});
