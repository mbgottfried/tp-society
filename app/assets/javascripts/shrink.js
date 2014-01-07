$(function(){
    $('.navbar-header').slideDown();
    var h = $('.navbar-brand img').height();        //get original height
    $(window).scroll(function() {               //scroll event is bound to the window object
        var $DivToHide = $('.navbar-brand img');    //create a jquery variable pointing to the div
        var st = $(this).scrollTop();           //capture the the number hidden pixels, from view above the scrollable area 
        $DivToHide.height( h - st );                //increase the height of the div by the same, number of hidden pixels
            }).scroll();                        //Fire the scroll even when the page loads; without this the #myDiv would show
       })