$(function(){

  $(".tab").on("click", function(e){
    // Change active tab
    $(this).toggleClass('active');
    // $(".tab").removeClass('active');

    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass('hidden');
    var selector = $(this).data('target');
    // Show target tab-content (use class="hidden")
    $(selector).removeClass('hidden');

  });

});
