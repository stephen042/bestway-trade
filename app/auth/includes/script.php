
<script src="../libs/js/jquery.js"></script>
    <script src="../libs/js/bootstrap.bundle.min.js"></script>
    <script src="../libs/js/bootstrap.min.js"></script>
    <script src="../libs/js/owl.carousel.min.js"></script>
    <script src="../libs/build/js/intlTelInput.js"></script>
    <script src="../libs/build/js/utils.js"></script>
    <script src="../alert/js/jquery.fake-notification.min.js"></script>
    <script src="../../cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js">

        <script >
            var input = document.querySelector("#phone");
            window.intlTelInput(input, {
                // any initialisation options go here
                initialCountry: "auto",
            geoIpLookup: function(success, failure) {
                $.get("https://ipinfo.io/", function () { }, "jsonp").always(function (resp) {
                    var countryCode = (resp && resp.country) ? resp.country : "";
                    success(countryCode);
                });
          },
        });
    </script>
    <script>

        $('.carousel-client').bxSlider({
            auto: true,
        slideWidth: 234,
        minSlides: 2,
        maxSlides: 5,
        controls: false
        });
        jQuery('.home-carousel-1').owlCarousel({
            loop:true,
        margin:15,
        nav:false,
        dots: true,
        navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
        responsive:{
            0:{
            items:1
                },
        480:{
            items:1
                },

        767:{
            items:1,
        margin:50
                },
        1000:{
            items:2
                }
            }
            
        });

        $(document).ready(function(){
            $(".menu-links").hide();
        $(".lins").click(function(){
            $(".menu-links").toggle('slow');
            });

        if ($(window).width() < 960) {
            $(".before-scroll-links").hide();
        $(".scroll-links").show();
            }
        else{
            $(".scroll-links").hide();
        $(window).scroll(function() {    
                    var scroll = $(window).scrollTop();
                    if (scroll >= 60) {
            //clearHeader, not clearheader - caps H
            $(".scroll-links").show();
        $(".before-scroll-links").hide();
                    }
        else{
            $(".before-scroll-links").show();
        $(".scroll-links").hide();
                    }
                });
            }
            
        });
        window.onload = function () {
            $('#preloader').fadeOut(500, function () { $('#preloader').remove(); });
        startTime();
        }
        $(document).ready(function() {
            $('#notification-1').Notification({
                // Notification varibles
                Varible1: ["Dirk", "Johnny", "Watkin ", "Alejandro", "Vina", "Tony", "Ahmed", "Jackson", "Noah", "Aiden", "Darren", "Isabella", "Aria", "John", "Greyson", "Peter", "Mohammed", "William",
                    "Lucas", "Amelia", "Mason", "Mathew", "Richard", "Chris", "Mia", "Oliver"],
                Varible2: ["USA", "UAE", "ITALY", "FLORIDA", "MEXICO", "INDIA", "CHINA", "CAMBODIA", "UNITED KINGDOM", "GERMANY", "AUSTRALIA", "BANGLADESH", "SWEDEN", "PAKISTAN", "MALDIVES", "SEYCHELLES",
                    "BOLIVIA",
                    "SOUTH AFRICA", "ZAMBIA", "ZIMBABWE", "LEBANESE", "SAUDI ARABIA", "CHILE", "PEUTO RICO"],

                Amount: [9000, 2500, 5000, 6669, 4440, 7989, 7052],
                Content: '[Varible1] from [Varible2] has just Earned <b>$[Amount]</b>',
                // Timer
                Show: ['stable', 5, 10],
                Close: 5,
                Time: [0, 23],
                // Notification style 
                LocationTop: [false, '30%'],
                LocationBottom: [true, '40%'],
                LocationRight: [true, '10px'],
                LocationLeft: [false, '10px'],
                Background: '#000000',
                BorderRadius: 5,
                BorderWidth: 1,
                BorderColor: '#73ae20',
                TextColor: 'white',
                IconColor: '#ffffff',
                // Notification Animated   
                AnimationEffectOpen: 'slideInUp',
                AnimationEffectClose: 'slideOutDown',
                // Number of notifications
                Number: 40,
                // Notification link
                Link: [false, 'index.html', '_blank']
            });     
        });
    </script>

    <!-- GetButton.io widget -->
    <script type="text/javascript">
        (function () {
            var options = {
            whatsapp: "+1 (936) 226-8078", // WhatsApp number
        call_to_action: "Message Us", // Call to action
        position: "left", // Position may be 'right' or 'left'
            };
        var proto = document.location.protocol, host = "getbutton.io", url = proto + "//static." + host;
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
        s.onload = function () {WhWidgetSendButton.init(host, proto, options); };
        var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
        })();
    </script>
    <!-- /GetButton.io widget -->
    <script src="../code.tidio.co_443/rwpdkxm3bm88ant1lstsbi4ixq78uhau.js" async>
    </script>