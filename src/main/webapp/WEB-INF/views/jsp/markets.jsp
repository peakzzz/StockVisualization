<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<%@ include file="main.jsp" %>

<input type="hidden" id="listgainer" value='${jsonGainer}'/>
<input type="hidden" id="listloser" value='${jsonLoser}'/>
<input type="hidden" id="listpopularstock" value='${jsonPopularStock}'/>
<input type="hidden" id="listdashboardcommodity" value='${jsonDashboardCommodity}'/>


<div class="container">
  <div class="row">
	<div class="col-sm-3" id="myScrollspy">
      <ul class="nav nav-stacked nav-pills fixed-nav"> 
        <li class="active"><a href="#section1">Most Popular Stocks</a></li>
        <li><a href="#section2">World Markets</a></li>   
        <li><a href="#section3">Gainers and Losers</a></li>
        <li><a href="#section4">Commodities</a></li>                     
      </ul>
    </div>

    <div class="col-md-9">
      <div id="section1">
	    <div class="panel panel-green panel-default">
	      <div class="panel-heading">Most Popular Stocks</div>
	      <div class="panel-body" id="popularstocks"></div>
	    </div>
	  </div>
  
      <div id="section2">
	    <div class="panel panel-green panel-default">
	      <div class="panel-heading">World Markets</div>
	      <div class="panel-body" id="worldmarkets"></div>
	          
	       <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-white">
                    	<div class="panel-body">
                        	<div class="row">
                                <div class="col-xs-6">
                                    <div class="big" >
                                    	<a href="http://money.cnn.com/data/world_markets/nikkei225/">Japan</a>
                                    </div>
                                    <div class="medium grey">NEKKEI 225</div>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <div class="huge red">-0.30%</div>
                                    <div> 19,883.94 </div>
                                    <div class="red">
                                    	<i class="fa fa-arrow-down fa-2x red"></i>
                                    	-60.47
                                    </div>
                                </div>
                            </div>
                    	</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="big" >
                                    	<a href="http://money.cnn.com/data/world_markets/hang_seng/">Hong Kong</a>
                                    </div>
                                    <div class="medium grey">HANG SENG</div>
                                   
                                </div>
                                <div class="col-xs-6 text-right">
                                    <div class="huge red">-1.87%
                                    </div>
                                    <div> 22,068.32 </div>
                                    <div class="red">
                                    	<i class="fa fa-arrow-down fa-2x red"></i>
                                    	-60.47
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                 <div class="col-md-6">
                    <div class="panel panel-white">
                    	<div class="panel-body">
                        	<div class="row">
                                <div class="col-xs-6">
                                    <div class="big" >
                                    	<a href="http://money.cnn.com/data/world_markets/ftse100">London</a>
                                    </div>
                                    <div class="medium grey">FTSE 100</div>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <div class="huge red">-0.28%</div>
                                    <div> 6,375.15 </div>
                                    <div class="red">
                                    	<i class="fa fa-arrow-down fa-2x red"></i>
                                    	-17.63
                                    </div>
                                </div>
                            </div>
                    	</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="big" >
                                    	<a href="hhttp://money.cnn.com/data/world_markets/dax/">Germany</a>
                                    </div>
                                    <div class="medium grey">DAX</div>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <div class="huge green">+1.87%</div>
                                    <div> 11,293.76 </div>
                                    <div class="green">
                                    	<i class="fa fa-arrow-up fa-2x green"></i>
                                    	+60.47
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
	    </div> 
	  </div>
	  
      <div id="section3">
	    <div class="panel panel-green panel-default">
	      <div class="panel-heading">Gainers and Losers</div>
	      <div class="panel-body" id="gainerloser">Panel Content</div>
	    </div>
	  </div>
  
	  <div id="section4">
	    <div class="panel panel-green panel-default">
	      <div class="panel-heading">Commodities</div>
	      <div class="panel-body" id="commodities">Panel Content</div>
	    </div>
	  </div>
    </div>
  </div>
</div>

<!-- Custom Scripts --> 
<script type="text/javascript" src="/stock/resources/core/js/custom/bar.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/dashboardColumn.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/dashboardPie.js"> </script>

<script>
window.onload = function() {
	var jsonGainer = JSON.parse($('#listgainer').val());
	//console.log("list category hi",jsonGainer);
	var jsonLoser = JSON.parse($('#listloser').val());
	//console.log("list category hi",jsonLoser);
	var jsonPopularStock = JSON.parse($('#listpopularstock').val());
	console.log("list category hi jsonPopularStock",jsonPopularStock);
	var jsonDashboardCommodity = JSON.parse($('#listdashboardcommodity').val());
	
	//createbar('dashpanel1');
	createcolumn('popularstocks',jsonPopularStock);
	createPositiveNegativeGraph('gainerloser',jsonGainer,jsonLoser);
	
	createTable('commodities',jsonDashboardCommodity);
}
</script>
<%@ include file="footer.jsp" %>