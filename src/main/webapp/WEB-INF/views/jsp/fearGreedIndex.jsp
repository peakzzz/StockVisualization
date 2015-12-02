<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highstock Example</title>
		  
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<style>
		body {
	margin:0;
	padding:0px;
	height:100%;
	width:100%;
	background: url("/stock/resources/images/background.jpg") no-repeat center center fixed; 
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
		
		</style>
		<script type="text/javascript">
$(function () {

    Highcharts.setOptions({
        global : {
            useUTC : false
        }
    });

    // Create the chart
    $('#container2').highcharts('StockChart', {
        chart : {
            events : {
                load : function () {

                    // set up the updating of the chart each second
                    var series = this.series[0];
                    setInterval(function () {
                        var x = (new Date()).getTime(), // current time
                            y = Math.round(Math.random() * 100);
                        series.addPoint([x, y], true, true);
                    }, 1000);
                }
            }
        },

        rangeSelector: {
            buttons: [{
                count: 1,
                type: 'minute',
                text: '1M'
            }, {
                count: 5,
                type: 'minute',
                text: '5M'
            }, {
                type: 'all',
                text: 'All'
            }],
            inputEnabled: false,
            selected: 0
        },

        title : {
            text : 'Fear & Greed Over Time'
        },

        exporting: {
            enabled: false
        },

        series : [{
            name : 'Fear & Greed Index',
            data : (function () {
                // generate an array of random data
                var data = [], time = (new Date()).getTime(), i;

                for (i = -999; i <= 0; i += 1) {
                    data.push([
                        time + i * 1000,
                        Math.round(Math.random() * 100)
                    ]);
                }
                return data;
            }())
        }]
    });

});

		</script>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
		$(function () {

		    var gaugeOptions = {

		        chart: {
		            type: 'solidgauge'
		        },

		        title: null,

		        pane: {
		            center: ['50%', '85%'],
		            size: '140%',
		            startAngle: -90,
		            endAngle: 90,
		            background: {
		                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
		                innerRadius: '60%',
		                outerRadius: '100%',
		                shape: 'arc'
		            }
		        },

		        tooltip: {
		            enabled: false
		        },

		        // the value axis
		        yAxis: {
		            stops: [
		                [0.1, '#55BF3B'], // green
		                [0.5, '#DDDF0D'], // yellow
		                [0.9, '#DF5353'] // red
		            ],
		            lineWidth: 0,
		            minorTickInterval: null,
		            tickPixelInterval: 400,
		            tickWidth: 0,
		            title: {
		                y: -70
		            },
		            labels: {
		                y: 16
		            }
		        },

		        plotOptions: {
		            solidgauge: {
		                dataLabels: {
		                    y: 5,
		                    borderWidth: 0,
		                    useHTML: true
		                }
		            }
		        }
		    };

		    // The speed gauge
		    $('#container-speed').highcharts(Highcharts.merge(gaugeOptions, {
		        yAxis: {
		            min: 0,
		            title: {
		                text: 'Extreme Fear'
		            },
		            max: 200,
		            tooltip: {
		                valueSuffix: ' Extreme Greed'
		            }
		          
		        },

		        credits: {
		            enabled: false
		        },

		        series: [{
		            name: 'Speed',
		            data: [80],
		            dataLabels: {
		                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
		                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
		                       '<span style="font-size:12px;color:silver">NOW: Greed</span></div>'
		            },
		            tooltip: {
		                valueSuffix: ' NOW: Greed'
		            }
		        }]

		    }));

		 
		    // Bring life to the dials
		    setInterval(function () {
		        // Speed
		        var chart = $('#container-speed').highcharts(),
		            point,
		            newVal,
		            inc;

		        if (chart) {
		            point = chart.series[0].points[0];
		            inc = Math.round((Math.random() - 0.5) * 100);
		            newVal = point.y + inc;

		            if (newVal < 0 || newVal > 200) {
		                newVal = point.y - inc;
		            }

		            point.update(newVal);
		        }
		    }, 2000);

		});

		</script>
	</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="80" data-spy="affix">
<script src="/stock/resources/core/js/highstock.js"></script>
<script src="/stock/resources/core/js/modules/exporting.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
       <div class="panel-body"> 
    		<div class="col col-sm-6" style="float: center" >
        			<h1>Fear & Greed Index</h1>
        			<h5>What emotion is driving the market now?</h5>
    		</div>
  		
<div style="width: 600px; height: 400px; margin: 0 auto">
    <div id="container-speed" style="width: 300px; height: 200px; float: left"></div>
  			<div class="col col-sm-9 pull-right">
              <div class="panel">
                      <table class="table" style="width:60%">
                        <tbody>
                          <tr>
                            <td>Previous Close</td>
                            <td><font color="green">Greed</font></td>
                            <td><font color="green">58</font></td>
                          </tr>
                          <tr>
                            <td>1 Week Ago</td>
                            <td><font color="grey">Neutral</font></td>
                            <td><font color="grey">53</font></td>
                          </tr>
                          <tr>
                            <td>1 Month Ago</td>
                            <td><font color="green">Greed</font></td>
                            <td><font color="green">70</font></td>
                          </tr>
                           <tr>
                            <td>1 Year Ago</td>
                            <td><font color="green">Greed</font></td>
                            <td><font color="green">59</font></td>
                          </tr>
                        </tbody>
                      </table>
               </div> 
               </div>
 
               
               <img src="/stock/resources/images/put_call.png" class="img-responsive" width="300" height="200" align="right">
               <h2>Put and Call options</h2>
               During the last five trading days, volume in put options has lagged volume in call options by 34.70% as investors make bullish bets in their portfolios. This is among the lowest levels of put buying seen during the last two years, indicating extreme greed on the part of investors.
<br><br>
Last changed Nov 24 from a <font color="green">Greed </font> rating
<br><br>
<small class="text-muted">Updated Dec 1 | 4:19pm</small>

				<br><br><br>
				<img src="/stock/resources/images/sp_breadth.png" class="img-responsive" width="300" height="200" align="right">
 				<h2>Stock Price Breadth</h2>
                The McClellan Volume Summation Index measures advancing and declining volume on the NYSE. During the last month, approximately 3.52% more of each day's volume has traded in advancing issues than in declining issues, pushing this indicator towards the upper end of its range for the last two years.

Last changed Oct 9 from a Greed rating
<br><br>
<small class="text-muted">Updated Dec 1 | 4:10pm</small>


			   <br><br><br>
			   <img src="/stock/resources/images/sp_strength.png" class="img-responsive" width="300" height="200" align="right">
			  <h2>Stock Price Strength</h2>
			  The number of stocks hitting 52-week lows is slightly higher than the number hitting highs but is at the upper end of its range, indicating extreme greed.
Last changed Oct 23 from a <font color="green">Greed </font> rating
<br><br>
<small class="text-muted">Updated Dec 1 | 4:05pm</small>

                <br><br><br><br><br>
                <img src="/stock/resources/images/sp_demand.png" class="img-responsive" width="300" height="200" align="right">
               <h2>Safe Haven Demand</h2>
                Stocks and bonds have provided similar returns during the last 20 trading days. This performance is in-line with what has been typical for the last two years and does not indicate either fear or greed.
<br><br>
Last changed Nov 30 from a <font color="green">Greed </font> rating
<br><br>
<small class="text-muted">Updated Dec 1 | 4:00pm</small>

               <br><br><br>
               <img src="/stock/resources/images/market_volatility.png" class="img-responsive" width="300" height="200" align="right">
               <h2>Market Volatility</h2>
              The CBOE Volatility Index (VIX) is at 14.67. This is a neutral reading and indicates that market risks appear low.
<br><br>
Last changed Sep 1 from an <font color="red">Extreme Fear </font>rating
<br><br>
<small class="text-muted">Updated Dec 1 | 3:55pm</small>

				
				<br><br><br><br>
				<img src="/stock/resources/images/market_momentum.png" class="img-responsive" width="300" height="200" align="right">
               <h2>Market Momentum</h2>
                The S&P 500 is 2.77% above its 125-day average. During the last two years, the S&P 500 has typically been further above this average than it is now, indicating that investors are committing capital to the market at a slower rate than they had been previously.
<br><br>
Last changed Nov 17 from an <font color="red">Extreme Fear </font> rating
<br><br>
<small class="text-muted">Updated Dec 1 | 3:45pm</small>

			   <br><br><br>
			   <img src="/stock/resources/images/junk_bond.png" class="img-responsive" width="300" height="200" align="right">
               <h2>Junk Bond Demand</h2>
               Investors in low quality junk bonds are accepting 2.28 percentage points in additional yield over safer investment grade corporate bonds. While this spread is historically low, it is sharply higher than recent levels and suggests that investors are becoming more risk averse.
<br><br>
Last changed Nov 3 from a <font color="red">Fear </font> rating
<br><br>
<small class="text-muted">Updated Dec 1 | 3:30pm</small>


 <div id="container2" style="height: 400px; min-width: 310px"></div>
               
</div>
</div>
	</body>
