<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Hobby</title>

    <!-- Bootstrap Core CSS -->
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resource/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


</head>

<body>

    <div class="brand"></div>
    <div class="address-bar">Day At My University</div>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="#">Net Boss Intern</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="currentLocate">Current Location</a>
                    </li>
                    <li>
                           <a href="schedule">Schedule</a>
                        <!--  <a href="#" onclick="b();return false;">Weather Forecast</a> -->
                    </li>
                    
  <!--                  <li>
                    <form id="fr" action="schedule"  method=Request.GET style="margin-top:30px">
        <select name="trip" id="trip">
            <option value="#">Select day for your trip</option>
            <option value="Monday">Monday</option>
            <option value="Tuesday">Tuesday</option>
        </select> 
        <input type="submit"  value="Go!"/>
    </form></li> -->  
    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <p id="weather" style="display:none"></p>
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" id="one">
                            <div class="item active">
                                <img class="img-responsive img-full" src="resource/img/1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="resource/img/2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="resource/img/3.jpg" alt="">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                    <h2 class="brand-before">
                        <small></small>
                    </h2>
                    <p class="brand-name" id="two">Made By Abhinav Pandey</p>
                    
                   
                </div>
            </div>
        </div>
        </div>

        

    <!-- jQuery -->
    <script src="resource/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resource/js/bootstrap.min.js"></script>
<script>
$('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>
    <!-- Script to Activate the Carousel -->
    <script>
    var lat;
        var long;

        function b() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                x.innerHTML = "Geolocation is not supported by this browser.";
            }

            function showPosition(position) {
                lat = position.coords.latitude;
                long = position.coords.longitude;
                console.log(lat);
                console.log(long)
                bc();
            }
        }
        function bc() {

            var apiKey = '31b7ed68bc12616247a0f3e272fbb089';
            var url = 'https://api.forecast.io/forecast/';

            var data;

            $.getJSON(url + apiKey + "/" + lat + "," + long + "?callback=?",
                    function(data) {
                        $('#weather').show();
                        $('.carousel-indicators').hide();
                        $('#weather').html(
                                'Minutely summary is' + data.minutely.summary
                                        + 'Hourly summary is'
                                        + data.hourly.summary
                                        + ' Daily summary is: '
                                        + data.daily.summary);

                        $('#one').hide();
                    });
        }
    
    </script>

</body>

</html>
