<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@ include file="main.jsp" %>

<input type="hidden" id="listmyprofile" value='${jsonMyProfile}'/>
<input type="hidden" id="listmyprofilegain" value='${jsonMyProfileGain}'/>
<input type="hidden" id="listmyprofileloss" value='${jsonMyProfileLoss}'/>
<input type="hidden" id="jsonMyInvestmentSector" value='${jsonMyInvestmentSector}'/>

<div class="container">
	<div class="col-md-12">
		<div class="row">
        	<div class="col-lg-3 col-md-6">
            	<div class="panel panel-primary">
                	<div class="panel-heading">
						<div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-sort-amount-desc fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>Date</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Portfolio</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-money fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>Gain</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Profit & Loss</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-star fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>Most success</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Most Successful Stock</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tachometer fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">58</div>
                                    <div>Greed</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">Fear & Greed Index</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
   		</div>  
  
    	<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body" id="timepanel">
					time panel
				</div>
			</div>
		</div>
	
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-12">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3 big"> DOW </div>
                                <div class="col-xs-9 text-right">
                                    <div class="big red">-0.08%</div>
                                    <div> 17,796.49 </div>
                                    <div class="red">
                                    	-19.90
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="http://money.cnn.com/data/markets/dow/">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-external-link-square"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
           </div>
           <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3 big"> Nasdaq </div>
                                <div class="col-xs-9 text-right">
                                    <div class="big green">+0.22%</div>
                                    <div> 5,127.53 </div>
                                    <div class="green">
                                    	+11.38
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="http://money.cnn.com/data/markets/nasdaq/">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-external-link-square"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3 big"> S&P </div>
                                <div class="col-xs-9 text-right">
                                    <div class="big green">+0.06%</div>
                                    <div> 2,090.11 </div>
                                    <div class="green">
                                    	+1.24
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="http://money.cnn.com/data/markets/nasdaq/">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-external-link-square"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
	</div>


	<div class="col-md-12">
		<div class="panel panel-green panel-default">
	      	<div class="panel-heading">My Profile</div>
	      	<div class="panel-body" id="dashpanel">
	       		<div class="col-md-12" id="stocktable"></div>
	       		<div class="col-md-12">My Investment Sector
	       			<div id="MyInvestmentSector"></div>
	       		</div>
	       		
	       		<div class="row">
	               <div class="col-md-6">
	       		       <div id="gainpanel"></div>
	       		   </div>
	       		   <div class="col-md-6">
	       		       <div id="losspanel"></div>
	       		   </div>
	       		</div>
	       		<div class="row">
	               <div class="col-md-6">
	       		       <div id="sankey_multiple"></div>
	       		   </div>
	       		</div>
	  		</div>    	
	    </div>
	</div>
</div>

<!--  Custom Scripts -->
<script type="text/javascript" src="/stock/resources/core/js/custom/bar.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/dashboardColumn.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/dashboardPie.js"> </script>
<script>

google.load("visualization","1",{packages:["sankey"]});
google.setOnLoadCallback(drawChart);
function drawChart() {
	console.log("in drawChart");
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'From');
    data.addColumn('string', 'To');
    data.addColumn('number', 'Weight');
    data.addRows([
         [ 'TotalInvestment', '1stInvestment', 5 ],
         [ 'TotalInvestment', '2ndInvestment', 5 ],
         [ '1stInvestment', 'FB', 2 ],
         [ '1stInvestment', 'Tesla', 2 ],
         [ '1stInvestment', 'Google', 1 ],
         [ '2ndInvestment', 'FB', 1 ],
         [ '2ndInvestment', 'Tesla', 1 ],
         [ '2ndInvestment', 'Amazon', 3 ],
        ]);
    var colors = ['#a6cee3', '#b2df8a', '#fb9a99', '#fdbf6f',
                  '#cab2d6', '#ffff99', '#1f78b4', '#33a02c'];
    // Set chart options
    var options = { width: 600,
                    sankey: {
                        node: {
                            colors: colors
                        },
                        link: {
                            colorMode: 'gradient',
                            colors: colors
                        }
                    }
                  };

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.Sankey(document.getElementById('sankey_multiple'));
    chart.draw(data, options);
}

window.onload = function() {
	var jsonMyProfile = JSON.parse($('#listmyprofile').val());
	var jsonMyProfileGain = JSON.parse($('#listmyprofilegain').val());
	//console.log("list category hi",jsonMyProfileGain);
	var jsonMyProfileLoss = JSON.parse($('#listmyprofileloss').val());
	//console.log("list category hi",jsonMyProfileLoss);
	var jsonMyInvestmentSector = JSON.parse($('#jsonMyInvestmentSector').val());
	createTable('stocktable',jsonMyProfile);
	createDashPie('gainpanel','My Gain',jsonMyProfileGain);
	createDashDonut('losspanel','My Loss',jsonMyProfileLoss);
	createTree('MyInvestmentSector','',jsonMyInvestmentSector);
}
</script>

<%@ include file="footer.jsp" %>