<head>
  <title>Wall Street</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Complete stock market coverage.">
 
  <script src="/stock/resources/core/js/jquery.js"></script>
  <script src="/stock/resources/core/js/bootstrap.min.js"></script>
  
  <script src="/stock/resources/core/js/d3.min.js"></script>
  <script src="/stock/resources/core/js/jquery.js"></script>
  <script src="/stock/resources/core/js/angular.min.js"></script>
  <script src="/stock/resources/core/js/bootstrap.min.js"></script>
  <script src="/stock/resources/core/js/highcharts.js"></script>
  <script src="/stock/resources/core/js/highcharts-3d.js"></script>
  <script src="/stock/resources/core/js/modules/exporting.js"></script>
  <script src="/stock/resources/core/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
  <link rel="stylesheet" href="/stock/resources/core/css/bootstrap.min.css">
  <link rel="stylesheet" href="/stock/resources/core/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="/stock/resources/core/css/hello.css">
  
  <link rel="shortcut icon" href="/stock/resources/images/stock-favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

</head>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="80" data-spy="affix">

<!--
	Reference: http://www.bootply.com/IsRfOyf0f9
    <script>
	$(".nav a").on("click", function(){
		   $(".nav").find(".active").removeClass("active");
		   $(this).parent().addClass("active");
		});
	</script>
-->

<nav class="navbar navbar-grey" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbarCollapse">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<!--   
				<a class="navbar-brand" href="/stock/">Brand</a> 
				-->
                <a class="navbar-brand" href="/stock/">
                    <img class="logo" src="/stock/resources/images/stock-logo.png" alt="stock"> 
                </a>
			</div>

			<div class="collapse navbar-collapse navbarCollapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active">
						<a href="/stock/">
							<i class="fa fa-dashboard "></i>
							DashBoard
						</a>
					</li>
					<li>
						<a href="/stock/markets">
							<i class="fa fa-line-chart "></i>
							Markets
						</a>
					</li>
					<li>
						<a href="/stock/currency">
							<i class="fa fa-dollar "></i>
							Money
						</a>
					</li>
					<li>
						<a href="/stock/company">
							<i class="fa fa-building "></i>
							Company
						</a>
					</li>
					<li>
						<a href="/stock/about">
							<i class="fa fa-users "></i>
							AboutUs
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="wrapper">

