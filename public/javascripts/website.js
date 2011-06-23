$(function() {
  $(".operatives-list li").click(function(e) {
    $(".operatives-list li").removeClass("active"); // remove active class from all tabs
    $(this).addClass("active");                     // add active class to clicked tab
    $(".profile").hide();                           // hide all profiles
    
    id = $(this).attr("id").substr(7);
    $("#profile-"+id).show();                       // display active profile
  });
  
  $(".images a").fancybox({ overlayOpacity: 0.8 });
  
  $(".image a").mouseover(function(e) {
    images = $(this).parent().parent();
    
    img = $(this).attr("href");
    
    changed = images.find(".primary-image a").hide();
    images.find(".primary-image a").attr("href", img);
    images.find(".primary-image a img").attr("src", img);
    changed.fadeIn();
  });
  
  // $("a.lightbox").lightBox();
  // $("a.lightbox-0").lightBox();
  // $("a.lightbox-1").lightBox();
  // $("a.lightbox-2").lightBox();
  // $("a.lightbox-3").lightBox();
  // $("a.lightbox-4").lightBox();
  // $("a.lightbox-5").lightBox();
});