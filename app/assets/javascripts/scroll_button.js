$("#button").click(function() {
    $('html, body').animate({
        scrollTop: $("#button-scroll").offset().top
    }, 2000);
});
