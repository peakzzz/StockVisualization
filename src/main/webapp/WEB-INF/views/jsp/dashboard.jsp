<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@ include file="main.jsp" %>

<input type="hidden" id="listmyprofile" value='${jsonMyProfile}'/>
<input type="hidden" id="listmyprofilegain" value='${jsonMyProfileGain}'/>
<input type="hidden" id="listmyprofileloss" value='${jsonMyProfileLoss}'/>

<div class="container">
	<div class="col-md-12">
		<div class="panel panel-green panel-default">
	      	<div class="panel-heading">My Profile</div>
	      	<div class="panel-body" id="dashpanel">
	       		<div class="col-md-6" id="stocktable"></div>
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
	
	createTable('stocktable',jsonMyProfile);
	createDashPie('gainpanel','My Gain',jsonMyProfileGain);
	createDashDonut('losspanel','My Loss',jsonMyProfileLoss);
}
</script>

<%@ include file="footer.jsp" %>