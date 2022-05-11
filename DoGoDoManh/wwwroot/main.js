$(document).ready(function () {
	$(".slider-for").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: false,
		asNavFor: ".slider-nav",
		lazyLoad: "ondemand"
	});
	$(".slider-x").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		fade: false,
		asNavFor: ".slider-nav",
		lazyLoad: "ondemand",
		dots: false,
	});
	$(".slider-nav").slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		asNavFor: ".slider-for",
		dots: false,
		focusOnSelect: true,
		lazyLoad: 'ondemand',
		prevArrow: '<button class="slide-arrow slick-prev"><i class="fas fa-chevron-left"></i></button>',
		nextArrow: '<button class="slide-arrow slick-next"><i class="fas fa-chevron-right"></i></button>'
	});
	$(".button-grid").click(() => {
		$(".item-prod").addClass("col-md-4");
		$(".item-prod").removeClass("col-10");
		$(".product-card").removeClass("d-flex");
		$(".product-img").addClass("width-100");
		$(".product-img").removeClass("width-45");
	})
	$(".button-list").click(() => {
		$(".item-prod").addClass("col-10")
		$(".item-prod").removeClass("col-md-4");
		$(".product-card").addClass("d-flex");
		$(".product-img").addClass("width-45");
		$(".product-img").removeClass("width-100");
	})
});
