/*global jQuery 
URL: http://www.bootstrapmb.com
*/
(function ($) {
    "use strict";

    jQuery(document).ready(function ($) {

        /*=============================
	        Mini Cart Hide Show JS
        ==============================*/
        $('.btn-minicart').on('click', function () {
            $('.minicart-content').stop().slideToggle(300);
        });

        /*================================
            Responsive Menu JS / Slicknav
        ==================================*/
        $("#main-navbar").slicknav({
            label: '',
            prependTo: '.header-configure-area',
            closedSymbol: '+',
            openedSymbol: '-',
            removeClasses: true
        });

        /*================================
            Home Slider JS
        ==================================*/
        var sliderId = $(".slider-carousel-wrap");
        sliderId.imagesLoaded(function () {
            sliderId.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                cssEase: 'linear',
                fade: true,
                spped: 1000,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>'
            });
            // Animation Settings
            sliderId.on('init', function () {
                $(".slide-content-wrap *").addClass('fadeInLeft animated');
            });
            sliderId.on('afterChange', function () {
                $(".slide-content-wrap *").addClass('fadeInLeft animated');
            });
            sliderId.on('beforeChange', function () {
                $(".slide-content-wrap *").removeClass('fadeInLeft animated');
            });
        });

        /*================================
            Categories Gallery JS
        ==================================*/
        var categotyId = $(".categories-carousel-wrap");
        categotyId.imagesLoaded(function () {
            categotyId.slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive: [
                    // breakpoint max width (px) unit
                    {
                        breakpoint: 479,
                        settings: {
                            slidesToShow: 1,
                        }
                    },
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 3,
                        }
                    }
                ]
            });
        });

        /*=============================================
            Home 1 Top Interesting Product Carousel
        ===============================================*/
        var topProductCarousel = $(".products-carousel-wrap");
        topProductCarousel.imagesLoaded(function () {
            topProductCarousel.slick({
                infinite: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                rows: 2,
                centerMode: false,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive: [
                    // breakpoint max width (px) unit
                    {
                        breakpoint: 479,
                        settings: {
                            slidesToShow: 1,
                        }
                    },
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 3,
                        }
                    }
                ]
            });
        });

        /*=============================================
            Feature Products Carousel
        ===============================================*/
        var featureProducts = $(".feature-product-carousel");
        featureProducts.imagesLoaded(function () {
            featureProducts.slick({
                infinite: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                centerMode: false,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive: [
                    // breakpoint max width (px) unit
                    {
                        breakpoint: 479,
                        settings: {
                            slidesToShow: 1,
                        }
                    },
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 3,
                        }
                    }
                ]
            });
        });


        /*=============================================
            Special Product Carousel
        ===============================================*/
        var specialProductCarousel = $(".special-product-carousel");
        specialProductCarousel.slick({
            infinite: false,
            slidesToShow: 3,
            slidesToScroll: 1,
            rows: 2,
            centerMode: false,
            dots: false,
            arrows: true,
            prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
            nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
            responsive: [
                // breakpoint max width (px) unit
                {
                    breakpoint: 479,
                    settings: {
                        slidesToShow: 1,
                    }
                },
                {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 2,
                    }
                }
            ]
        });

        /*=============================================
            Small Product List View Carousel
        ===============================================*/
        var productListCarousel = $(".product-vertical-carousel");
        productListCarousel.imagesLoaded(function () {
            productListCarousel.slick({
                infinite: false,
                slidesToShow: 1,
                slidesToScroll: 1,
                rows: 3,
                centerMode: false,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
            });
        });

        /*=====================================
            Testimonial Carousel
        ======================================*/
        var testimonialCarousel = $(".testimonial-carousel");
        testimonialCarousel.imagesLoaded(function () {
            testimonialCarousel.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                dots: true,
                arrows: false,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>'
            });
        });

        /*=====================================
            Blog Section Carousel
        ======================================*/
        var blogCarousel = $(".blog-content-carousel");
        blogCarousel.imagesLoaded(function () {
            blogCarousel.slick({
                slidesToShow: 3,
                slidesToScroll: 2,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive: [
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1,
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1,
                        }
                    }
                ]
            })
        });
        // Blog Thumb Iframe Responsive
        $(".embed-responsive iframe").addClass('embed-responsive-item');

        /*=====================================
            Blog Thumbnail Carousel
        ======================================*/
        var blogThumbCarousel = $(".slider-thumbnail");
        blogThumbCarousel.slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            dots: false,
            arrows: true,
            prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
            nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>'
        });

        /*=====================================
               Instagram Feed JS
        ======================================*/
        // User Changeable Access
        var activeId = $("#instafeed");
        if (activeId.length) {
            var userID = activeId.attr('data-userid'),
                accessTokenID = activeId.attr('data-accesstoken'),

                userFeed = new Instafeed({
                    get: 'user',
                    userId: userID,
                    accessToken: accessTokenID,
                    resolution: 'standard_resolution',
                    template: '<div class="instagram-item"><a href="{{link}}" target="_blank" id="{{id}}"><img src="{{image}}" /></a></div>',
                    sortBy: 'most-recent',
                    limit: 15,
                    links: false
                });
            userFeed.run();
        }

        /*=====================================
            Brad Carousel Logo JS
        ======================================*/
        var brandLogoCarousel = $(".brand-logo-carousel");
        brandLogoCarousel.imagesLoaded(function () {
            brandLogoCarousel.slick({
                slidesToShow: 5,
                slidesToScroll: 2,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive: [
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1,
                        }
                    },
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1,
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1,
                        }
                    }
                ]
            })
        });

        /*=============================
	        bottomToTop Popup Modal JS
        ==============================*/
        $('.animate-modal-popup').magnificPopup({
            type: 'inline',
            fixedContentPos: !1,
            fixedBgPos: !0,
            overflowY: 'auto',
            closeBtnInside: !1,
            preloader: false,
            closeMarkup: "<button title=\"%title%\" type=\"button\" class=\"mfp-close\"><img src=\"assets/img/icons/cancel.png\" alt=\"Close\" /></button>",
            callbacks: {
                beforeOpen: function () {
                    this.st.mainClass = "mfp-slide-bottom bTot-popup"
                },
                open: function () {
                    $('body').css('overflowY', 'hidden');
                },
                close: function () {
                    $('body').css('overflowY', 'auto');
                }
            }
        });

        /*=============================
	        Product Quantity
        ==============================*/
        var proQty = $(".pro-qty");
        proQty.append('<a href="#" class="inc qty-btn">+</a>');
        proQty.append('<a href="#" class= "dec qty-btn">-</a>');
        $('.qty-btn').on('click', function (e) {
            e.preventDefault();
            var $button = $(this);
            var oldValue = $button.parent().find('input').val();
            if ($button.hasClass('inc')) {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 0) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 0;
                }
            }
            $button.parent().find('input').val(newVal);
        });

        /*=============================
	       product view mode change js
        ==============================*/
        $('.product-view li').on('click', function (e) {
            e.preventDefault();

            var shopProductWrap = $('.shop-page-content-wrap .products-wrapper');
            var viewMode = $(this).data('target');

            $('.product-view li').removeClass('current');
            $(this).addClass('current');
            shopProductWrap.removeClass('grid-view product-list-view').addClass(viewMode);
        })

        /*=============================
	        Scroll To Top
        ==============================*/
        $('.scrolltotop').smoothScroll({
            direction: 'top',
            scrollTarget: 'html',
            speed: 600
        });

        /*=============================
	        Nice Select Js
        ==============================*/
        $('select').niceSelect();

        /*=============================
	        Tooltip JS
        ==============================*/
        $('[data-toggle="tooltip"]').tooltip();

        /*=============================
	        Checkout Page Checkbox
        ==============================*/
        $("#create_pwd").on("change", function () {
            $(".account-create").slideToggle("100");
        });

        $("#ship_to_different").on("change", function () {
            $(".ship-to-different").slideToggle("100");
        });

        /*=============================
	        Payment Method Accordion
        ==============================*/
        $('input[name="paymentmethod"]').on('click', function () {

            var $value = $(this).attr('value');

            $('.payment-method-details').slideUp();
            $('[data-method="' + $value + '"]').slideDown();
        });

        /*================================
            Single Product Thumb Js
        ==================================*/
        var singleThumbSlide = $(".product-image-carousel");
        singleThumbSlide.imagesLoaded(function () {
            singleThumbSlide.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                dots: false,
                fade: false,
                asNavFor: '.pro-img-nav-carousel, .pro-img-nav-vertical'
            });
        });

        // Single Product tab horizontal
        var proImgNav = $(".pro-img-nav-carousel");
        proImgNav.imagesLoaded(function () {
            proImgNav.slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: '.product-image-carousel',
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                dots: false,
                centerMode: true,
                focusOnSelect: true
            });
        });

        // Single Product tab vertical
        var proImgNavLeft = $(".pro-img-nav-vertical");
        proImgNavLeft.imagesLoaded(function () {
            proImgNavLeft.slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: '.product-image-carousel',
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-down"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-up"></i></button>',
                dots: false,
                centerMode: false,
                focusOnSelect: true,
                vertical: true
            });
        });

        // Single Product Carousel
        var proCarousel = $(".product-thumbnail-carousel");
        proCarousel.imagesLoaded(function () {
            proCarousel.slick({
                slidesToShow: 3,
                slidesToScroll: 2,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                dots: false,
                centerMode: false,
                responsive: [
                    {
                        breakpoint: 575,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    },
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1
                        }
                    }
                ]
            });
        });

        /*================================
            Single Product Gallery Thumb
        ==================================*/
        var proThumbGallery = $(".gallery-popup");
        proThumbGallery.imagesLoaded(function () {
            proThumbGallery.magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        });

        /*================================
            Single Product Sticky
        ==================================*/
        var docWidth = $(document).width();
        if (992 <= docWidth) {
            $('#product-sticky-sidebar').stickySidebar({
                topSpacing: 100,
                bottomSpacing: -10
            });
        }

        /*================================
            Newsletter Form JS
        ==================================*/
        var subscribeUrl = $(".mc-form").attr('action');
        $('#mc-form').ajaxChimp({
            language: 'en',
            url: subscribeUrl,
            callback: mailChimpResponse
        });

        function mailChimpResponse(resp) {
            if (resp.result === 'success') {
                $('.mailchimp-success').html('' + resp.msg).fadeIn(900);
                $('.mailchimp-error').fadeOut(400);
                $("#mc-form").trigger('reset');
            } else if (resp.result === 'error') {
                $('.mailchimp-error').html('' + resp.msg).fadeIn(900);
            }
        }

        /*================================
            Header Fix JS
        ==================================*/
        if ($("#fixheader").length) {
            var header = document.getElementById("fixheader"),
                sticky = header.offsetTop;
        }

        function headerfix() {
            if (window.pageYOffset >= sticky) {
                header.classList.add("fixed");
            } else {
                header.classList.remove("fixed");
            }
        }

        /*================================
            Contact Page Map JS
        ==================================*/
        var map_id = $('#map_content');
        if (map_id.length > 0) {
            var $lat = map_id.data('lat'),
                $lng = map_id.data('lng'),
                $zoom = map_id.data('zoom'),
                $maptitle = map_id.data('maptitle'),
                $mapaddress = map_id.data('mapaddress'),
                mymap = L.map('map_content').setView([$lat, $lng], $zoom);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map',
                maxZoom: 18,
                id: 'mapbox.streets',
                scrollWheelZoom: false,
                accessToken: 'pk.eyJ1Ijoic2hha2lsYWhtbWVlZCIsImEiOiJjamk4anF6NDgwMGd5M3BwM2c4eHU5dmIzIn0.yBLGUAB8kV1I1yGGonxzzg'
            }).addTo(mymap);

            var marker = L.marker([$lat, $lng]).addTo(mymap);
            marker.bindPopup('<b>' + $maptitle + '</b><br>' + $mapaddress).openPopup();
            mymap.scrollWheelZoom.disable();
        }
        //Map Js end

        /*================================
            All Window Scroll Function
        ==================================*/
        $(window).on('scroll', function () {
            //Scroll top Hide Show
            if ($(window).scrollTop() >= 400) {
                $('.scrolltotop').addClass('show');
            } else {
                $('.scrolltotop').removeClass('show');
            }

            // Header Fix JS
            if ($('#fixheader').length) {
                headerfix();
            }
        });

    }); //Ready Function End


    /*================================
        All Window Load Function
    ==================================*/
    jQuery(window).on('load', function () {
        /*=====================================
               Instagram Feed Carousel JS
        ======================================*/
        var instagramFeed = $(".instagram-carousel");
        instagramFeed.imagesLoaded(function () {
            instagramFeed.slick({
                slidesToShow: 5,
                slidesToScroll: 2,
                dots: false,
                arrows: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive: [
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1,
                        }
                    },
                    {
                        breakpoint: 767,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1,
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1,
                        }
                    }
                ]
            })
        });

        /*=============================
            Parallax Bg JS
        ==============================*/
        var parallaxActive = '.parallaxBg',
            myParaxify;
        if (parallaxActive.length) {
            myParaxify = paraxify(parallaxActive);
        }

    }); //window load End
}(jQuery));