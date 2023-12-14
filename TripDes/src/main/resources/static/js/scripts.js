/*!
* Start Bootstrap - Modern Business v5.0.7 (https://startbootstrap.com/template-overviews/modern-business)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-modern-business/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project
$(document).ready(function() {
  $(".userBtn").click(function() {
    $("#userLogin").show();
    $("#adminLogin").hide();
    $(".userBtn").addClass("active");
    $(".adminBtn").removeClass("active");
  });

  $(".adminBtn").click(function() {
    $("#userLogin").hide();
    $("#adminLogin").show();
    $(".adminBtn").addClass("active");
    $(".userBtn").removeClass("active");
  });

  /* 메뉴 구성 드롭박스 */
  var $dropdownToggle = $('.dropdown-toggle');
  var $dropdownMenu = $('.dropdown-menu');

  $dropdownMenu.on('mouseover', function() {
    $(this).css('display', 'block');
  });

  $dropdownMenu.on('mouseleave', function() {
    $(this).css('display', 'none');
  });

  $dropdownToggle.on('click', function() {
    var $dropdownMenu = $(this).next('.dropdown-menu');
    $dropdownMenu.css('display', 'block');
  });
  
  $(".navbar").on('mouseover', function() {
    var navbarHeight = $(this).height() + parseFloat($(this).css('padding-top')) + parseFloat($(this).css('padding-bottom'));
    $("#navbar-line").css({
      'display': 'block',
      'transform': 'translateY(0)',
      'transition': 'transform 0.7s',
      'height' : navbarHeight + 'px'
    });
  });
  
  $(".navbar").on('mouseleave', function() {
    var navbarHeight = $(this).height() + parseFloat($(this).css('padding-top')) + parseFloat($(this).css('padding-bottom'));
    $("#navbar-line").css({
      'transform': 'translateY(-' + navbarHeight + 'px)',
      'transition': 'transform 0.7s'
    });
  });
});

