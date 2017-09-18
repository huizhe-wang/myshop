(function($){
	// 轮播
	var Carousel = function (el) {
		this.carContent = $(el);
		this.nowImgNum = 1;
		this.animated = false;
	};

	Carousel.prototype.switchImg = function(direc) {
		var imgNum = 10, carOffset = 317, duration = 500;
		var carContent = this.carContent;
		var carousel = this;

		if (carousel.animated) return;

		carousel.animated = true;

		carContent.css({
			"transition": "all " + duration + "ms ease-out"
		});

		carContent.find('li').css({
			"transition": "all " + duration + "ms ease-out"
		})

		if (direc) {
			// turn left
			carContent.find('li').css({
				"opacity": .5,
				"transform": "scale(0.98)",
				"z-index": 0
			});

			carContent.find('li').eq(carousel.nowImgNum + 2).css({
				"opacity": 1,
				"transform": "scale(1.02)",
				"z-index": 10
			})

			carContent.css({
				"transform": "translate(-" + ((++carousel.nowImgNum) * carOffset) + "px)"
			});

		} else {
			// turn right

			carContent.find('li').css({
				"opacity": .5,
				"transform": "scale(0.98)",
				"z-index": 0
			});

			carContent.find('li').eq(carousel.nowImgNum).css({
				"opacity": 1,
				"transform": "scale(1.02)",
				"z-index": 10
			})

			carContent.css({
				"transform": "translate(-" + ((--carousel.nowImgNum) * carOffset) + "px)"
			});
		}

		setTimeout(function() {
			if (carousel.nowImgNum > imgNum) {
				carousel.nowImgNum = 1;
				carousel.imgSet(carousel.nowImgNum, duration);
			} else if (carousel.nowImgNum < 1) {
				carousel.nowImgNum = imgNum;
				carousel.imgSet(carousel.nowImgNum, duration);
			}

			carousel.animated = false;
		}, duration);
	};

	Carousel.prototype.autoRun = function (s) {
		var carousel = this;
		var delay = 5000;
		if (s) {
			carousel.autoRunSW = setInterval(function() {
				carousel.switchImg(true);
			}, delay);
		} else if (carousel.autoRunSW) {
			clearInterval(carousel.autoRunSW);
		}
			
	}

	Carousel.prototype.imgSet = function(n, duration, direc) {
		var carOffset = 317;
		var carContent = this.carContent;
		carContent.css({
			"transition": "none",
			"transform": "translateX(-" + n * carOffset + "px)"
		});

		if (direc) {
			var focusNum = n + 1;
		} else {
			var focusNum = n + 1;
		}

		carContent.find('li').css({
			"transition": "none",
			"opacity": .5,
			"transform": "scale(0.98)",
			"z-index": 0
		});

		carContent.find('li').eq(focusNum).css({
			"opacity": 1,
			"transform": "scale(1.02)",
			"z-index": 10
		})

		setTimeout(function() {
			carContent.css({
				"transition": "all " + duration + "ms ease-out"
			});

		}, 50);


	}

	var carousel_hot = new Carousel("#hotTab-content");
	var carousel_new = new Carousel("#newTab-content");
	var carousel_spe = new Carousel("#speTab-content");
	carousel_hot.autoRun(1);
	carousel_new.autoRun(1);
	carousel_spe.autoRun(1);

	$(".left-arrow").bind('click', function() {
		carousel_hot.switchImg(true);
		carousel_new.switchImg(true);
		carousel_spe.switchImg(true);
	});

	$(".right-arrow").bind('click', function() {
		carousel_hot.switchImg(false);
		carousel_new.switchImg(false);
		carousel_spe.switchImg(false);
	});

	$(".nav").each(function() {
		$(this).bind('click', function() {
			$(".nav").removeClass('active');

			$(this).addClass("active");

			$(".carousel-content").removeClass('active');
			$(".carousel-content").eq($(this).attr("index")).addClass("active");
		})
	})
})(jQuery)