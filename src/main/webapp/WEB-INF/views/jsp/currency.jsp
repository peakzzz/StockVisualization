<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@ include file="main.jsp" %>
<script type="text/javascript" src="/stock/resources/core/js/custom/bar.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/currencyUtility.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/worldMapUtility.js"> </script>
<head>

	<!-- script references -->
		<!--  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>-->
		
		<script src="/stock/resources/core/js/highstock.js"></script>
		<script src="/stock/resources/core/js/modules/exporting.js"></script>
		
		
		<!-- Highmaps -->
		<script src="http://code.highcharts.com/maps/highmaps.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="http://code.highcharts.com/maps/modules/map.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>


<style type="text/css">
#currency-widget {
    width:223px;
}
</style>
</head>

<header class="masthead">
  <div class="container">
    <div class="row">
      <div class="col col-sm-6">
        <h1>Stock Market</h1>
      </div>
    </div>
  </div>

  <div class="container">
	<div class="row">
      <div class="col col-sm-12">
  
      <div class="panel">
       <div class="panel-body">    
        <div class="col-md-12">
	      
	      <div id="section1">
		    <div class="panel panel-green panel-default">
		      <div class="panel-heading"><h4>World Currencies</h4></div>
		      
		      <div class="panel-body" id="worldcurrency"></div>
		       
		       <div class="row" id="worldcurrencymap">
                
				 	<a href="/stock/resources/examples/tooltip/currencyMap.jsp">
	         			<img src="/stock/resources/images/world_currency.png" class="img-responsive" width="850" height="750" align="middle">
					</a>
                </div>
				
		    </div>
		  </div>
      	<div id="section2">
	    <div class="panel panel-green panel-default">
	      <div class="panel-heading"><h4>Stock Exchange</h4></div>
	      <div class="panel-body" id="worldmarkets"></div>
	          
	        <div class="row" id="stockexchangemap">
                
			 <!--<a href="/stock/resources/examples/tooltip/index.jsp">
         		<img src="/stock/resources/images/exchange_rates.png" class="img-responsive" width="780" height="900" align="middle">
			</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
	    </div> 
	  </div>
        </div>
        </div>
     
</header>

<!-- Begin Body -->
<body>
<div class="container">
	<div class="row">
  			<div class="col col-sm-3">
  			<div class="panel">
              	<div id="sidebar">
      			<ul class="nav nav-stacked">
                    <li><h3 class="highlight">World Markets<i class=" pull-right"></i></h3></li>
				</ul>
                      <table class="table">
                        <thead>
                          <tr>
                            <th>Index</th>
                            <th>1 day change</th>
                            <th>Level</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Nikkei 225 Japan</td>
                            <td><font color="green">+0.03%</font></td>
                            <td>19,697.77</td>
                          </tr>
                          <tr>
                            <td>Hang Seng China</td>
                            <td><font color="green">+2.35%</font></td>
                            <td>22,888.92</td>
                          </tr>
                          <tr>
                            <td>FTSE 100 England</td>
                            <td><font color="red">-1.94%</font></td>
                            <td>6,778.68</td>
                          </tr>
                           <tr>
                            <td>CAC 40 France</td>
                            <td><font color="red">-2.93%</font></td>
                            <td>4,856.65</td>
                          </tr>
                        </tbody>
                      </table>
               </div> 
               </div>
      		</div>  
      		<div class="col col-sm-9 pull-right">
              <div class="panel">
              <h3 class="highlight">You may also like</h3>
              
              <div class="row">
              	<div class="col col-sm-8">
                  <img src="/stock/resources/images/obama.jpg" height="350" width="350" class="img-responsive">
                  <h4><a href ="http://yzer.info/w/wiser/obama_solar_program/?s=2737898009&imb=eyJvZmZlciI6Imh0dHA6XC9cL2FkY2xrLmNvXC9nby5waHA/cz0yNzM3ODk4MDA5IiwibmV4dFBhZ2UiOiIifQ==">Obama giving owners </br>solar panels for free</a></h4>
                  <hr>
                  <h4><span class="label label-default">A Dollar Wiser</span></h4><h4>
                            <small class="text-muted">Posted November 12, 2015 &middot; <a href="#" class="text-muted">Read More</a></small>
                            </h4>
                </div> 
        		<div class="col col-sm-4">
                  <img src="/stock/resources/images//billionaire.jpg" class="img-responsive">
                  <h4><a href = "http://try.dollarshaveclub.com/disrupt-desktop5/?utm_medium=display&utm_source=outbrain&utm_campaign=disrupt-5&utm_content=meet-man&utm_term=46032174&cvosrc=display.outbrain.disrupt-5_meet-man">The one guy is taking down the big razor company</a></h4>
                  <h4><span class="label label-default">Dollar Shave club</span></h4><h4>
                  <hr>
                  <img src="/stock/resources/images/cashcard.jpg" class="img-responsive">
                  <h4><a href ="https://www.lendingtree.com/info/citi-doublecash?esourceid=6180996&cchannel=display&csource=outbrain&cname=HasTheHighestPayingCashBackCardJustEnteredTheMarket&ccontent=DoubleCashDesktop2">Has the highest paid cash back card just entered the market?</a></h4>
                 <h4><span class="label label-default">LendingTree</span></h4><h4>
              	</div>  
              </div>
        
              	<h4>Stock Market Updates</h4>
                Running shorts that talk to you. A dress that adjusts to your mood. A clip-on that acts as a posture coach. They're all part of a growing trend in wearable technology that goes beyond the fitness band and smartwatch to take a proactive role in managing health. <br> <br>
The Bay Area is alive with wearable startups and Silicon Valley's largest companies have dived in, seeing a potentially vast market on the horizon. Fitbit, which makes a fitness tracker, went public in June. Intel Relevant Products/Services has engineers working with New York fashion designers on wearable tech and sponsored a "Make it Wearable" contest which CEO Brian Krzanich helped judge. Apple sold 1 million watches on the first weekend. <br> <br>

A small part of the Internet of Things market that Cisco Relevant Products/Services Systems sees as a future $19 trillion industry, wearables are becoming "trainables" that not only track your biometrics, but also double as digital coaches. <br> <br>

That's just for starters. Someday your body may have its own set of Internet of devices monitoring various vital signs and relaying them back to trainers and doctors. I recently borrowed a gadget called the Lumo Lift [pictured] from its maker, Lumo Bodytech in Palo Alto, and wore it around for a few days.


              	<br><br>
                <button class="btn btn-default">More...</button>
                
                </div>
                <div class="row">
                  <div class="col col-sm-6">
                    <img src="/stock/resources/images/market.jpeg " height="200" width="200" class="img-responsive">
                    
                  </div> 
                  <div class="col col-sm-6">
                    <h3><a href ="http://www.thestreet.com/story/13363838/1/stocks-get-hammered-again-by-oil-selloff-rate-worries.html">Dow dives 254, US oil price around $42</a></h3>
                    <h4><span class="label label-default">USA Today</span></h4><h4>
                            <small class="text-muted">Posted 3 hours ago </small>
                            </h4>
                            <br>
                			<button class="btn btn-default">More...</button> 
                  </div> 
                  
                </div>
                
                <hr>
              
              	 <h4><a href ="http://www.thestreet.com/story/13363838/1/stocks-get-hammered-again-by-oil-selloff-rate-worries.html">Stocks Get Hammered Again by Oil Selloff, Rate Worries</a></h4>
                 <h4><span class="label label-default">TheStreet.com</span></h4><h4>
                 <small class="text-muted">Posted 4 hours ago </small>
              
                <hr>
                
              	 <h4><a href ="http://www.thestreet.com/story/13363435/1/stocks-fall-back-to-lows-as-crude-oil-drops.html">Stocks Slide as Crude Oil Is Pushed Lower</a></h4>
                 <h4><span class="label label-default">TheStreet.com</span></h4><h4>
                 <small class="text-muted">Posted 6 hours ago </small>
              
                <hr>
                
              	 <h4><a href ="http://www.newsmax.com/Finance/StreetTalk/USA-Today-stocks-market-investing/2015/11/11/id/701686/">USA Today: Stock Market Gains Stand on Narrow Shoulders</a></h4>
                 <h4><span class="label label-default">USA Today</span></h4>
                 <small class="text-muted">Posted 7 hours ago </small>
              
              
              	<h1><a href="#"><i class="glyphicon glyphicon-user"></i> <i class="glyphicon glyphicon-chevron-down"></i> <i class="glyphicon glyphicon-chevron-down"></i></a></h1>
              
              <br><br>
                
             	</div>
              
             	</div>
      	</div> 
		
		<script>
		window.onload = function() {
			<!--worldMapSeries('worldcurrencymap');-->
				currencySeries('stockexchangemap');
}
		</script>

<%@ include file="footer.jsp" %> 