// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {

  jQuery(function($) {
  // when the #country field changes
    $("select#user_state_id").change(function() {
     // make a POST call and replace the content
     var state = $('select#user_state_id :selected').val();
     if(state == "") state="0";
     jQuery.get('/users/update_city_select/' + state, function(data){
       $("#addressCities").html(data);
     })
     return false;
    });
  })

  $('td a.remote-delete').click(function() {
    // we just need to add the key/value pair for the DELETE method
    // as the second argument to the JQuery $.post() call
    var answer = confirm('Are you sure?');
    if (answer===true){
      $.post(this.href, { _method: 'delete' }, null, "script");
      var x = parseInt($("h3#noProducts span").text());
      var ob = $(this).closest("tr");
      x -= parseInt($("td.prodQuant", ob).text());
      $("h3#noProducts span").text(x);
      $(this).closest("tr").fadeOut(600, function(){
        $(this).closest("tr").remove();
        if ($("tr").length ==1){
        $("div#cart_controls").fadeOut(600);
        $("div#cart").html('<div class="span5 offset1"><h5>Your shopping cart is empty.</h5></div>');
      }
      });
      return false; 
    }else  return false; 
  });

  $("input#addToCart").click(function(){
    if ($('select#cart_product_quantity').val() != ''){
      $("div#flash_notice").html("Product Added").addClass("add_message").show().fadeOut(4000);
      $("li#cartIcon").css({"background-image":"","background-color": "#BA0000"}).fadeOut().fadeIn().fadeOut(function(){
      $("li#cartIcon").fadeIn().css({"background-color": "#2C2C2C", "background-image": "-webkit-gradient(linear, 0 0, 0 100%, from(#333333), to(#222222))"});
      });
    }
  });

  jQuery(function($) {
    function changeTab(e){
     $("ul.tabs li.active").removeClass("active");
     $(this).addClass("active");
    }
     $("ul.tabs li").click(changeTab);
  });

  $('a.emptyCartButton').click(function(e) {
    // we just need to add the key/value pair for the DELETE method
    // as the second argument to the JQuery $.post() call
     e.preventDefault();
     var answer = confirm('Are you sure?');
      if (answer===true){
        $.ajax(this.href, null, "script");
        $("div#cart_controls").fadeOut(600);
       $("div#cart").html('<div class="span5 offset1"><h5>Your shopping cart is empty.</h5></div>');
       return false; 
      }else return false; 
    });

    $(document).on("focus", "[data-behaviour~='datepicker']", function(e){
      $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
    });
    
  });

/* Tooltip
  function showTitle(e){
    var title = $(this).data("title");
    $(this).append("<span class='tooltip'>" + title + "</span>");
  }
  function hideTitle(e){
    $("ul.tabs span.tooltip").remove();
  }
    $("ul.tabs li a").mouseenter(showTitle);
    $("ul.tabs li a").mouseleave(hideTitle);*/


 

