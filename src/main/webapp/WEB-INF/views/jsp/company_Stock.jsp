<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
<script src="http://code.highcharts.com/stock/highstock.js"></script>
<script src="http://code.highcharts.com/stock/modules/exporting.js"></script>
<link rel="stylesheet" href="/stock/resources/core/css/style.css">
<link rel="stylesheet" href="/stock/resources/core/css/hello.css">
<script type="text/javascript">
	function initMap() {
		
		
	}
	$(function() {
		//Initializing map
		$('#tabs').tabs();
		var href = $('#tabs').find('a[href="#menu1"]');
		(href).on('click', function() {
			initMap();
		});
		$.ajax({
			url : "/stock/perCompany",
			context : document.body
		}).done(
				function(data) {
					dataa = JSON.parse(data);
					var series = [];
					for (var i = 0; i < dataa.length; i++) {

						series.push([ Date.parse(dataa[i].date),
								parseFloat(dataa[i].price) ]);

					}
					var stockName = dataa[0].name;
					series = series.reverse();
					window.chart = new Highcharts.StockChart({
						chart : {
							borderWidth: 3,
							renderTo : 'stocks',
							zoomType : 'x'
						},
						rangeSelector : {
							selected : 1
						},

						title : {
							text : stockName
						},

						series : [ {
							name : stockName,
							data : series,
							tooltip : {
								valueDecimals : 2
							}
						} ]

					}, function(chart) {

						// apply the date pickers
						setTimeout(function() {
							$('input.highcharts-range-selector',
									$('#' + chart.options.chart.renderTo))
									.datepicker()
						}, 0)
					});
				});
		// Set the datepicker's date format
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			onSelect : function(dateText) {
				this.onchange();
				this.onblur();
			}
		});

		//This is a little tweek to get the map
		$("a[href=#menu1]").click(function() {
			initMap();
			google.maps.event.trigger(map, 'resize');
		});

		//This is the bar chart
		$
				.ajax({
					url : "/stock/emplStrengthShareHolder",
					context : document.body
				})
				.done(
						function(data) {
							var companyData = JSON.parse(data);
							var desc = companyData.companyInfo.company_desc;
							$("#desc").html(desc);
							$("#indus").html(companyData.companyInfo.industry);
							$("#marketCap").html(
									companyData.companyInfo.market_cap);
							$("#sector").html(companyData.companyInfo.sector);
							$("#delayed").html(
									companyData.companyInfo.delayed_data);
							var ini = companyData.companyInfo.initial;
							var finalv = companyData.companyInfo.final;
							if (ini > finalv)
								$("#change").css("color", "red").html(
										ini + "/" + finalv + "%");
							else
								$("#change").css("color", "green").html(
										ini + "/" + finalv + "%");
							var yearTodate = companyData.companyInfo.year_to_date;
							if (yearTodate.indexOf("+") > 0)
								$("#yrtoDate").css("color", "green").html(
										yearTodate);
							else
								$("#yrtoDate").css("color", "red").html(
										yearTodate);
							
							
							
							var myLatLng = {
									lat : 39,
									lng : -122
								};
								var map = new google.maps.Map(document.getElementById('map-canvas'), {
									center : myLatLng,
									scrollwheel : false,
									zoom : 4
								});

							var bounds = new google.maps.LatLngBounds();
							var lat = companyData.companyInfo.lat;
							var lon = companyData.companyInfo.lon;
							var icon = "http://maps.google.com/mapfiles/ms/icons/yellow.png";

							var latlng = new google.maps.LatLng(parseFloat(lat), parseFloat(lon));
							var marker = new google.maps.Marker({
								position : latlng,
								map : map,
								animation : google.maps.Animation.DROP,
								icon : new google.maps.MarkerImage(icon)
							})
							var infowindow =  new google.maps.InfoWindow({
								content: companyData.companyInfo.address,
								map: map
							});
							marker.addListener('mouseover', function() {
							    infowindow.open(map, this);
							});
							
							
							var categories = [], values = [];
							for (var i = 0; i < companyData.strength.length; i++) {
								categories.push(companyData.strength[i].year);
								values.push(companyData.strength[i].strength);
							}
							var pieChartData = [];
							for (var i = 0; i < companyData.pie.length; i++) {
								pieChartData.push([ companyData.pie[i].name,
										parseFloat(companyData.pie[i].data) ])
							}
							pieChartData = pieChartData.reverse();
							$('#emp_strength')
									.highcharts(
											{
												chart : {
													type : 'column'
												},
												title : {
													text : 'Employee Strength'
												},
												xAxis : {
													categories : categories,
													crosshair : true
												},
												yAxis : {
													min : 0,
													title : {
														text : 'Number of employees (K)'
													}
												},
												tooltip : {
													headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
													pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
															+ '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
													footerFormat : '</table>',
													shared : true,
													useHTML : true
												},
												plotOptions : {
													column : {
														pointPadding : 0.2,
														borderWidth : 0
													}
												},
												series : [ {
													name : 'Employees',
													data : values

												} ]
											})

							//Pie chart
							$('#share_holder')
									.highcharts(
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : null,
													plotShadow : false,
													type : 'pie'
												},
												title : {
													text : 'Share Holders'
												},
												tooltip : {
													pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
												},
												plotOptions : {
													pie : {
														allowPointSelect : true,
														cursor : 'pointer',
														dataLabels : {
															enabled : true,
															format : '<b>{point.name}</b>: {point.percentage:.1f} %',
															style : {
																color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
																		|| 'black'
															},
															connectorColor : 'silver'
														}
													}
												},
												series : [ {
													name : 'Brands',
													data : pieChartData
												} ]
											});
						});
		//HighStock current price indicator

		$.ajax({
			url : "/stock/stockHighLowCompany",
			context : document.body
		}).done(
				function(data) {
					dataa = JSON.parse(data);
					var series = [];
					for (var i = 0; i < dataa.length; i++) {

						series.push([ Date.parse(dataa[i].date),
								parseFloat(dataa[i].open),
								parseFloat(dataa[i].high),
								parseFloat(dataa[i].low),
								parseFloat(dataa[i].close) ]);

					}
					series = series.reverse();
					// create the chart
					$('#chart').highcharts('StockChart', {

						chart : {
							borderWidth: 3,
							marginRight : 10
						},

						rangeSelector : {
							inputEnabled : $('#container').width() > 480,
							selected : 1
						},

						title : {
							text : 'Highstock Current Price Indicator'
						},

						series : [ {
							type : 'candlestick',
							name : 'AAPL Stock Price',
							data : series,
							dataGrouping : {
								units : [ [ 'week', // unit name
								[ 1 ] // allowed multiples
								], [ 'month', [ 1, 2, 3, 4, 6 ] ] ]
							}
						} ],

						yAxis : {
							opposite : true,
							labels : {
								x : 20
							}
						}
					});
				});

	});
</script>

</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="80" data-spy="affix">>
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
					<li class="active"><a href="/stock/">DashBoard</a></li>
					<li><a href="/stock/markets">Markets</a></li>
					<li><a href="/stock/currency">Money</a></li>
					<li><a href="/stock/company">Company</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<input type="hidden" id="priceData">
	</input>
	<div class="container" bg-color="#C0C0C0">
		<div class="panel panel-default">
			<div class="panel-body">
				<h1>
					<div id="company_name">
						<span class="label label-default">Facebook</span>
					</div>
				</h1>
				<div class="grid">
					<div class="row">
						<div class="col-md-2">
							<div class="col-md-12">
								<label id="delayed"></label> <label id="info">Delayed
									Data as Nov 19</label>
							</div>
						</div>
						<div class="col-md-2">
							<div class="col-md-12">
								<label id="change" style="color: red">-4.07/-3.77%</label> <label
									id="info">Todays Change</label>
							</div>
						</div>
						<div class="col-md-2">
							<div class="col-md-12">
								<label id="yrtoDate" style="color: green">+33.24%</label> <label
									id="info">Year-to-Date</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<ul class="nav nav-tabs" id="tabs">
				<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
				<li><a data-toggle="tab" href="#menu1">Profile</a></li>
				<li><a data-toggle="tab" href="#menu2">Charts</a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<div id="stocks"></div>
				</div>
				<div id="menu1" class="tab-pane fade">
					<table id="sector_industry" cellspacing="0">
						<tbody>
							<tr>
								<td class="wsod_tdfirst">SECTOR
									<div id="sector"></div>
								</td>
								<td>INDUSTRY
									<div id="indus"></div>
								</td>
								<td class="wsod_tdfirst">MARKET CAP
									<div id="marketCap"></div>
								</td>

							</tr>
						</tbody>
					</table>
					<h3>
						<div class="borderBottom">Company Description</div>
					</h3>
					<p>
					<div id="desc"></div>
					</p>
					<h4>
						<div class="borderBottom">Contact Information</div>
					</h4>
					<div class="col-md-4">
						<div id="map-canvas" style="height: 300px; width: 400px"></div>
					</div>
					<div class="col-md-4">
						<div id="emp_strength" style="height: 300px; width: 400px"></div>
					</div>
					<div class="col-md-4">
						<div id="share_holder" style="height: 300px; width: 400px"></div>
					</div>
				</div>
				<div id="menu2" class="tab-pane fade">
						<div id="chart"></div>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>
