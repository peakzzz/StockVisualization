<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
  <script src="http://code.highcharts.com/stock/highstock.js"></script>
  <script src="http://code.highcharts.com/stock/modules/exporting.js"></script>
  <link rel="stylesheet" href="/stock/resources/core/css/style.css">
  
  <script type="text/javascript">
  	function initMap()
  	{
  		var myLatLng = {lat: 39, lng: -122};
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
                                      center: myLatLng,
                                      scrollwheel: false,
                                      zoom: 4
                                      });


        var bounds = new google.maps.LatLngBounds();
        var icon = "http://maps.google.com/mapfiles/ms/icons/" + icon + ".png";
           
    	var latlng = new google.maps.LatLng("37.483403", "-122.149513");
    	var marker = new google.maps.Marker({
    	position : latlng,
    	map: map,
    	animation: google.maps.Animation.DROP,
    	icon: new google.maps.MarkerImage(icon)
        })         
   

  	}
  	$(function() {
  		//Initializing map
  		$( '#tabs' ).tabs();
		var href = $('#tabs').find('a[href="#menu1"]');
		(href).on('click',function(){
    		initMap();
    	});

		//Getting json data for stocks and writing stock chart
		//DateTime","Series 1"
		//"2013-01-06",176
		//"2013-01-07",135.6
		//"2013-01-08",148.5
		//"2013-01-09",216.4
		//"2013-01-10",194.1
		//"2013-01-11",95.6
		//"2013-01-12",54.4
   		$.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?', function(data) {
        // Create the chart
        window.chart = new Highcharts.StockChart({
            chart: {
                renderTo: 'stocks'
            },

            rangeSelector: {
                selected: 1,
                inputDateFormat: '%Y-%m-%d'
            },

            title: {
                text: 'Facebook Stock Price'
            },

            series: [{
                name: 'FCBCK',
                data: data,
                tooltip: {
                    valueDecimals: 2
                }}]

        }, function(chart) {

            // apply the date pickers
            setTimeout(function() {
                $('input.highcharts-range-selector', $('#' + chart.options.chart.renderTo)).datepicker()
            }, 0)
        });
    });

   		//This is the bar chart
   	  $('#emp_strength').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Employee Strength'
        },
        xAxis: {
            categories: [
                '2010',
                '2011',
                '2012',
                '2013',
                '2014'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Number of employees (K)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Emplyees',
            data: [49.9, 71.5, 106.4, 129.2, 144.0]

        }]
    });

    // Set the datepicker's date format
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        onSelect: function(dateText) {
            this.onchange();
            this.onblur();
        }
    });
   
   	//This is a little tweek to get the map
     $("a[href=#menu1]").click(function() {
     	initMap();
     	google.maps.event.trigger( map, 'resize' );
	});
     //Pie chart
      $('#share_holder').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Share Holders'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    },
                    connectorColor: 'silver'
                }
            }
        },
        series: [{
            name: 'Brands',
            data: [
                { name: 'Individual Stakeholders', y: 4.84 },
                {
                    name: 'Mutual Fund holders',
                    y: 37.05,
                    sliced: true,
                    selected: true
                },
                { name: 'Other Institutional', y: 33.46 },
                {name:'Company Emplyees', y:24.65}
            ]
        }]
    });
	//HighStock current price indicator

    $.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=aapl-ohlc.json&callback=?', function (data) {

        // create the chart
        $('#chart').highcharts('StockChart', {
            
            chart: {
                marginRight: 40   
            },
            
            rangeSelector: {
                inputEnabled: $('#container').width() > 480,
                selected: 1
            },

            title: {
                text: 'Highstock Current Price Indicator'
            },

            series: [{
                type: 'candlestick',
                name: 'AAPL Stock Price',
                data: data,
                dataGrouping: {
                    units: [
                        ['week', // unit name
                        [1] // allowed multiples
                        ],
                        [
                            'month', [1, 2, 3, 4, 6]]
                    ]
                }
            }],
            
            yAxis: {
                opposite: true,
                labels: {
                    x: 20
                }
            }
        });
    });
});

  </script>

</head>
<body>

	<div class="container" bg-color = "#C0C0C0">
		<div class="panel panel-default">
			<div class="panel-body">
				<h1><div id = "company_name"> <span class="label label-default">Facebook</span></div></h1>
				<div class="grid">
		   			 <div class="row">
					      <div class = "col-md-2">
					      	<div class = "col-md-12">
						      	<label id = "delayed">103.95</label>
						      	<label id = "info">Delayed Data as Nov 19</label>
					     	</div>
					      </div>
					      <div class = "col-md-2">
					      	<div class = "col-md-12">
						      	<label id = "delayed" style = "color:red">-4.07/-3.77%</label>
						      	<label id = "info">Todays Change</label>
					     	</div>
					      </div>
					       <div class = "col-md-2">
					      	<div class = "col-md-12">
						      	<label id = "delayed" style = "color:green">+33.24%</label>
						      	<label id = "info">Year-to-Date</label>
					     	</div>
					      </div>
					 </div>
				  </div>     
			   </div>
			  <ul class="nav nav-tabs" id = "tabs">
			    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			    <li><a data-toggle="tab" href="#menu1">Profile</a></li>
			    <li><a data-toggle="tab" href="#menu2">Charts</a></li>
			    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
			  </ul>
			  
			<div class="tab-content">
			    <div id="home" class="tab-pane fade in active">			      
			      <div id = "stocks"></div>
			    </div>  
			    <div id="menu1" class="tab-pane fade">
			      <table id = "sector_industry" cellspacing = "0">
			      		<tbody>
			      			<tr>
			      				<td class = "wsod_tdfirst">
			      					SECTOR
			      					<div>
			      						Technology Services
			      					</div>
			      				</td>
			      				<td>
			      					INDUSTRY
			      					<div>
			      						Internet Software/Services
			      					</div>
			      				</td>
			      				<td class = "wsod_tdfirst">
			      					MARKET CAP
			      					<div>
			      						$294.0B
			      					</div>
			      				</td>

			      			</tr>
			      		</tbody>
			      </table>
			     <h3>
			     	<div class = "borderBottom">Company Description</div> </h3>
			     	<p>Facebook, Inc. is a social networking service and website. Its website allows people to communicate with their family, friends, and coworkers. The company offers advertisers a combination of reach, relevance, social context, and engagement to enhance the value of their ads. Its services include timeline, news feed, messages, lists, ticker and mobile apps. Facebook was founded by Mark Elliot Zuckerberg, Dustin Moskovitz, Chris R. Hughes, Andrew McCollum and Eduardo P. Saverin on February 4, 2004 and is headquartered in Menlo Park, CA.</p>
			    	<h4><div class = "borderBottom"> Contact Information</div></h4>
			    	<div class = "col-md-4"><div id="map-canvas" style="height: 300px;width:400px" > </div></div>
			    	<div class = "col-md-4"><div id = "emp_strength" style="height: 300px;width:400px"></div></div>
			    	<div class = "col-md-4"><div id = "share_holder" style="height: 300px;width:400px"></div></div>
			    </div>
			    <div id="menu2" class="tab-pane fade">
			    		<div class = "col-md-12" id = "chart"></div>
			    </div>
			    <div id="menu3" class="tab-pane fade">
			      <h3>Menu 3</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div>
			  </div>			
		    </div>
    </div>

</body>
</html>
