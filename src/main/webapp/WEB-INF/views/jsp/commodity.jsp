<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@ include file="main.jsp" %>
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="http://code.highcharts.com/highcharts.js" type="text/javascript"></script>
    <script src="http://code.highcharts.com/modules/exporting.js" type="text/javascript"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 
<br><br><br>

<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: center;
}
select { 
    border: 7px solid #CCC;
}

</style>
<center>
<div>
	<SELECT id="list" style="width: 150px height: 80px">
    <OPTION VALUE="Oil">Oil (Light Crud)</option>
    <OPTION VALUE="HeatingOil">Heating Oil</option>
    <OPTION VALUE="NaturalGas">Natural Gas</option>
    <OPTION VALUE="UnleadedGas">Unleaded Gas</option> 

    <OPTION VALUE="Gold">Gold</option>
    <OPTION VALUE="Silver">Silver</option>
    <OPTION VALUE="Platinum">Platinum</option>
    <OPTION VALUE="Copper">Copper</option>

    <OPTION VALUE="Corn">Corn</option>
    <OPTION VALUE="Soyabeans">Soyabeans</option>
    <OPTION VALUE="Wheat">Wheat</option>

    <OPTION VALUE="LeanHogs">Lean Hogs</option>
    <OPTION VALUE="LiveCattle">LiveCattle</option>
    <OPTION VALUE="FedderCattle">FedderCattle</option>

    <OPTION VALUE="Cocoa">Cocoa</option>
    <OPTION VALUE="Coffee">Coffee</option>
    <OPTION VALUE="Cotton">Cotton</option>
    <OPTION VALUE="Sugar">Sugar</option>   
</SELECT>


	<SELECT id="list1" style="width: 150px">
    <OPTION VALUE="Oil">Oil (Light Crud)</option>
    <OPTION VALUE="HeatingOil">Heating Oil</option>
    <OPTION VALUE="NaturalGas">Natural Gas</option>
    <OPTION VALUE="UnleadedGas">Unleaded Gas</option>

    <OPTION VALUE="Gold">Gold</option>
    <OPTION VALUE="Silver">Silver</option>
    <OPTION VALUE="Platinum">Platinum</option>
    <OPTION VALUE="Copper">Copper</option>

    <OPTION VALUE="Corn">Corn</option>
    <OPTION VALUE="Soyabeans">Soyabeans</option>
    <OPTION VALUE="Wheat">Wheat</option>

    <OPTION VALUE="LeanHogs">Lean Hogs</option>
    <OPTION VALUE="LiveCattle">LiveCattle</option>
    <OPTION VALUE="FedderCattle">FedderCattle</option>

    <OPTION VALUE="Cocoa">Cocoa</option>
    <OPTION VALUE="Coffee">Coffee</option>
    <OPTION VALUE="Cotton">Cotton</option>
    <OPTION VALUE="Sugar">Sugar</option>
   </SELECT>

<button id="change" class="btn btn-primary btn-sm">Refresh</button>
<br><br><br>

<div id="container" style="height: 400px"></div>

</center>


<br><br>
<div class="container-fluid">
    <div class="col-sm-8">
<table align="center">
    <col width="30%">
  <col width="35%">
  <col width="35%">
    <thead>
        <tr>
            <th class="col1">Energy</th>
            <th class="col2">Change</th>
            <th class="col3">% Change</th>
        </tr>
    </thead>
    <tbody>
        <TR>
            <TD class="col1"><strong>Oil(Light Crude)</strong></br> </TD>
            <TD id ="oil" class="col2">2.5110176173970107</TD>
            <TD id ="calc1" class="col3">13.473395881708713</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Heating Oil </strong><br/> </TD>
            <TD id ="heatingOil" class="col2">18.10687863754574</TD>
            <TD id ="calc2" class="col3">-67.00123124728941</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Natural Gas </strong><br/></TD>
            <TD id ="naturalGas" class="col2">56.10687863754574</TD>
            <TD id ="calc3" class="col3">42.65631543171614</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Unleaded Gas </strong><br/></TD>
            <TD id ="unleadedGas" class="col2">17.058681814372539</TD>
            <TD id ="calc4" class="col3">14.65631543171614</TD>
        </TR>
</tbody>
</table>

 
  <br><br><br> 

</div>
    <div class="col-sm-8">
<table align="center">
  <col width="30%">
  <col width="35%">
  <col width="35%">
    <thead>
        <tr>
            <th class="col1">Metals</th>
            <th class="col2">Change</th>
            <th class="col3">% Change</th>
        </tr>
    </thead>
    <tbody>

        <TR>
            <TD class="col1"><strong>Gold</strong></br> </TD>
            <TD id ="gold" class="col2">2.5110176173970107</TD>
            <TD id ="calc5" class="col3">7.058681814372539 </TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Silver </strong><br/></TD>
            <TD id ="silver" class="col2">7.058681814372539 </TD>
            <TD id ="calc6" class="col3">17.107545334752649</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Platinum </strong><br/></TD>
            <TD id ="platinum" class="col2">43.194262933963905</TD>
            <TD id ="calc7" class="col3">10.107545334752649</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Copper </strong><br/></TD>
            <TD id ="copper" class="col2">10.107545334752649</TD>
            <TD id ="calc8" class="col3">1.194262933963905</TD>
        </TR>
</tbody>
</table>

<br><br><br> 
</div>
    <div class="col-sm-8">
<table align="center">
  <col width="30%">
  <col width="35%">
  <col width="35%">
    <thead>
        <tr>
            <th class="col1">Agriculture</th>
            <th class="col2">Change</th>
            <th class="col3">% Change</th>
        </tr>
    </thead>
    <tbody>

        <TR>
            <TD class="col1"><strong>Corn</strong></br> </TD>
            <TD id ="corn" class="col2">47.02201250456273</TD>
            <TD id ="calc9" class="col3">3.473395881708713</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Soybeans</strong><br/></TD>
            <TD id ="soybeans" class="col2">1.690136196184902</TD>
            <TD id ="calc10" class="col3">-13.473395881708713</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Wheat</strong><br/></TD>
            <TD id ="wheat" class="col2">20.542989963665605</TD>
            <TD id ="calc11" class="col3">13.3355881708713</TD>
        </TR>
</tbody>
</table>

<br><br><br>
</div> 
    <div class="col-sm-8">
<table align="center">
  <col width="30%">
  <col width="35%">
  <col width="35%">
    <thead>
        <tr>
            <th class="col1">Meat & LiveStock</th>
            <th class="col2">Change</th>
            <th class="col3">% Change</th>
        </tr>
    </thead>
    <tbody>

        <TR>
            <TD class="col1"><strong>Lean Hogs</strong></br> </TD>
            <TD id ="leanHogs" class="col2">32.29825646523386</TD>
            <TD id ="calc12" class="col3">-20.243356522504147</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Live Cattle</strong><br/></TD>
            <TD id ="liveCattle" class="col2">13.473395881708713</TD>
            <TD id ="calc13" class="col3">-2.243356522504147%</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Fedder Cattle</strong><br/></TD>
            <TD id ="fedderCattle" class="col2">-32.29825646523386</TD>
            <TD id ="calc14" class="col3">-23.473395881708713</TD>
        </TR>
</tbody>
</table>

<br><br><br> 
</div>
    <div class="col-sm-8">
<table align="center">
  <col width="30%">
  <col width="35%">
  <col width="35%">
    <thead>
        <tr>
            <th class="col1">Consumer</th>
            <th class="col2">Change</th>
            <th class="col3">% Change</th>
        </tr>
    </thead>
    <tbody>

        <TR>
            <TD class="col1"><strong>Cocoa</strong></br> </TD>
            <TD id ="cocoa" class="col2">2.5110176173970107</TD>
            <TD id ="calc15" class="col3">-13.473395881708713</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Coffee </strong><br/></TD>
            <TD id ="coffee" class="col2">42.65631543171614</TD>
            <TD id ="calc16" class="col3">23.473395881708713</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Cotton </strong><br/></TD>
            <TD id ="cotton" class="col2">17.473395881708713</TD>
            <TD id ="calc17" class="col3">2.5110176173970107</TD>
        </TR>

        <TR>
            <TD class="col1"><strong>Sugar #11</strong><br/></TD>
            <TD id ="sugar" class="col2">13.473395881708713</TD>
            <TD id ="calc18" class="col3">42.65631543171614</TD>
        </TR>
</tbody>
</table>

</div>

<script type="text/javascript">




var foo = {
  Oil: [1,7], 
  HeatingOil: [1,5],
  NaturalGas: [1,6],
  UnleadedGas: [1,3],
  Gold: [1,7], 
  Silver: [1,5],
  Platinum: [1,6],
  Copper: [1,3],
  Corn: [1,7], 
  Soybeans: [1,5],
  Wheat: [1,6],
  LeanHogs: [1,3],
  LiveCattle: [1,7], 
  FedderCattle: [1,5],
  Cocoa: [1,6],
  Coffee: [1,3],
  Cotton: [1,7], 
  Sugar: [1,5],

};
//console.log(foo.bar);
var options = {
    chart: {
        renderTo: 'container',
        defaultSeriesType: 'spline',
        width: 650,
        height: 350,
        borderWidth: 5,
        backgroundColor: "#CCC",

    },
    title: {
        useHTML: true,
        style: {
            color: '#0000FF',
            fontWeight: 'bold',
        },
        text: "Commodities"
    },
    subtitle: {
        useHTML: true,
        style: { "color": "#555555" },
        text: "Comparision"        
},

    series: [{name: 'Oil', data: [1,2]}, {name: 'HeatingOil', data: [1,8]} ]
};
var chart = new Highcharts.Chart(options);

$("#change").on('click', function(){
    //alert(list)
    var selVal = $("#list").val();
    var selVal2 = $("#list1").val();

        console.log(foo[selVal]);
            console.log(foo[selVal2]);


    options.series = [{name: selVal, data: foo[selVal]}, {name: selVal2, data: foo[selVal2]}]
    
    var chart = new Highcharts.Chart(options);    
});

  
    setInterval(function() {

        var oldoil = document.getElementById("oil").innerHTML;
        var oldheatingOil = document.getElementById("heatingOil").innerHTML;
        var oldnaturalGas = document.getElementById("naturalGas").innerHTML;
        var oldunleadedGas = document.getElementById("unleadedGas").innerHTML;
        
        var oldgold = document.getElementById("gold").innerHTML;
        var oldsilver = document.getElementById("silver").innerHTML;
        var oldplatinum = document.getElementById("platinum").innerHTML;
        var oldcopper = document.getElementById("copper").innerHTML;

        var oldcorn = document.getElementById("corn").innerHTML;
        var oldsoybeans = document.getElementById("soybeans").innerHTML;
        var oldwheat = document.getElementById("wheat").innerHTML;
        
        var oldleanHogs = document.getElementById("leanHogs").innerHTML;
        var oldliveCattle = document.getElementById("liveCattle").innerHTML;
        var oldfedderCattle = document.getElementById("fedderCattle").innerHTML;

        var oldcocoa = document.getElementById("cocoa").innerHTML;
        var oldcoffee = document.getElementById("coffee").innerHTML;
        var oldcotton = document.getElementById("cotton").innerHTML;
        var oldsugar = document.getElementById("sugar").innerHTML;

        
        var oil = Math.random()* (10.3 - 1.7) + 1;
        var heatingOil = Math.random()* (40.4 - 1.4) + 1;
        var naturalGas = Math.random()* (20.7 - 1.8) + 1;
        var unleadedGas = Math.random()* (70.5 - 1.5) + 1;
        
        var gold = Math.random()* (30.2 - 2.5) + 1;
        var silver = Math.random()* (50.3 - 0.7) + 1;
        var platinum = Math.random()* (60.9 - 5.5) + 1;
        var copper = Math.random()* (80.1 - 2.3) + 1;

        var corn = Math.random()* (20.3 - 1.7) + 1;
        var soybeans = Math.random()* (50.4 - 1.5) + 1;
        var wheat = Math.random()* (25.7 - 1.9) + 1;
        
        var leanHogs = Math.random()* (56.3 - 0.1) + 1;
        var liveCattle = Math.random()* (63.9 - 5.4) + 1;
        var fedderCattle = Math.random()* (88.1 - 2.9) + 1;

        var cocoa = Math.random()* (32.2 - 2.2) + 1;
        var coffee = Math.random()* (55.3 - 0.3) + 1;
        var cotton = Math.random()* (67.9 - 5.9) + 1;
        var sugar = Math.random()* (89.1 - 2.1) + 1;

        var calc1 = ((oil-oldoil)/oldoil);

        var col1 = document.getElementById("calc1");

        if( oldoil > oil)
        {
            col1.style.color = "#ff0000";

        }
        else
           col1.style.color = "#30C149";    

        col1.innerHTML = calc1;   

        //

        var calc2 = ((heatingOil-oldheatingOil)/oldheatingOil)*100;

        var col2 = document.getElementById("calc2");

        if( oldheatingOil > heatingOil)
        {
            col2.style.color = "#ff0000";
        }
        else
            col2.style.color = "#30C149";

        col2.innerHTML = calc2;  

        //

        var calc3 = ((naturalGas-oldnaturalGas)/oldnaturalGas)*100;

        var col3 = document.getElementById("calc3");

        if( oldnaturalGas > naturalGas)
        {
            col3.style.color = "#ff0000";
        }
        else
            col3.style.color = "#30C149";

        col3.innerHTML = calc3;

        //

        var calc4 = ((unleadedGas-oldunleadedGas)/oldunleadedGas)*100;

        var col4 = document.getElementById("calc4");

        if( oldunleadedGas > unleadedGas)
        {
            col4.style.color = "#ff0000";
        }
        else
            col4.style.color = "#30C149";

        col4.innerHTML = calc4;

        //

        var calc5 = ((gold-oldgold)/oldgold)*100;

        var col5 = document.getElementById("calc5");

        if( oldgold > gold)
        {
            col5.style.color = "#ff0000";
        }
        else
            col5.style.color = "#30C149";

        col5.innerHTML = calc5;       

       //

       var calc6 = ((silver-oldsilver)/oldsilver)*100;

        var col6 = document.getElementById("calc6");

        if( oldsilver > silver)
        {
            col6.style.color = "#ff0000";
        }
        else
            col6.style.color = "#30C149";

        col6.innerHTML = calc6;   

        //

        var calc7 = ((platinum-oldplatinum)/oldplatinum)*100;

        var col7 = document.getElementById("calc7");

        if( oldplatinum > platinum)
        {
            col7.style.color = "#ff0000";
        }
        else
            col7.style.color = "#30C149";

        col7.innerHTML = calc7;   

        //

        var calc8 = ((copper-oldcopper)/oldcopper)*100;

        var col8 = document.getElementById("calc8");

        if( oldcopper > copper)
        {
            col8.style.color = "#ff0000";
        }
        else
            col8.style.color = "#30C149";

        col8.innerHTML = calc8; 

        //

        var calc9 = ((corn-oldcorn)/oldcorn)*100;

        var col9 = document.getElementById("calc9");

        if( oldcorn > corn)
        {
            col9.style.color = "#ff0000";
        }
        else
            col9.style.color = "#30C149";

        col9.innerHTML = calc9; 

        //

        var calc10 = ((soybeans-oldsoybeans)/oldsoybeans)*100;

        var col10 = document.getElementById("calc10");

        if( oldsoybeans > soybeans)
        {
            col10.style.color = "#ff0000";
        }
        else
            col10.style.color = "#30C149";

        col10.innerHTML = calc10;  

        //

        var calc11 = ((wheat-oldwheat)/oldwheat)*100;

        var col11 = document.getElementById("calc11");

        if( oldwheat > wheat)
        {
            col11.style.color = "#ff0000";
        }
        else
            col11.style.color = "#30C149";

        col11.innerHTML = calc11;  

        //

        var calc12 = ((leanHogs-oldleanHogs)/oldleanHogs)*100;

        var col12 = document.getElementById("calc12");

        if( oldleanHogs > leanHogs)
        {
            col12.style.color = "#ff0000";
        }
        else
            col12.style.color = "#30C149";

        col12.innerHTML = calc12;         
        
        //

        var calc13 = ((liveCattle-oldliveCattle)/oldliveCattle)*100;

        var col13 = document.getElementById("calc13");

        if( oldliveCattle > liveCattle)
        {
            col13.style.color = "#ff0000";
        }
        else
            col13.style.color = "#30C149";

        col13.innerHTML = calc13;   

        //

        var calc14 = ((fedderCattle-oldfedderCattle)/oldfedderCattle)*100;

        var col14 = document.getElementById("calc14");

        if( oldfedderCattle > fedderCattle)
        {
            col14.style.color = "#ff0000";
        }
        else
            col14.style.color = "#30C149";

        col14.innerHTML = calc14;  

        

        //

        var calc15 = ((cocoa-oldcocoa)/oldcocoa)*100;

        var col15 = document.getElementById("calc15");

        if( oldcocoa > cocoa)
        {
            col15.style.color = "#ff0000";
        }
        else
            col15.style.color = "#30C149";

        col15.innerHTML = calc15;  

        //

        var calc16 = ((coffee-oldcoffee)/oldcoffee)*100;

        var col16 = document.getElementById("calc16");

        if( oldcoffee > coffee)
        {
            col16.style.color = "#ff0000";
        }
        else
            col16.style.color = "#30C149";

        col16.innerHTML = calc16; 

        //

        var calc17 = ((cotton-oldcotton)/oldcotton)*100;

        var col17 = document.getElementById("calc17");

        if( oldcotton > cotton)
        {
            col17.style.color = "#ff0000";
        }
        else
            col17.style.color = "#30C149";

        col17.innerHTML = calc17;  

        //

        var calc18 = ((sugar-oldsugar)/oldsugar)*100;

        var col18 = document.getElementById("calc18");

        if( oldsugar > sugar)
        {
            col18.style.color = "#ff0000";
        }
        else
            col18.style.color = "#30C149";

        col18.innerHTML = calc18;   

        document.getElementById("oil").innerHTML = oil; 
        document.getElementById("heatingOil").innerHTML = heatingOil; 
        document.getElementById("naturalGas").innerHTML = naturalGas; 
        document.getElementById("unleadedGas").innerHTML = unleadedGas; 
        
        document.getElementById("gold").innerHTML = gold; 
        document.getElementById("silver").innerHTML = silver; 
        document.getElementById("platinum").innerHTML = platinum; 
        document.getElementById("copper").innerHTML = copper; 
        
        document.getElementById("corn").innerHTML = corn; 
        document.getElementById("soybeans").innerHTML = soybeans; 
        document.getElementById("wheat").innerHTML = wheat; 

        document.getElementById("leanHogs").innerHTML = leanHogs; 
        document.getElementById("liveCattle").innerHTML = liveCattle; 
        document.getElementById("fedderCattle").innerHTML = fedderCattle; 

        document.getElementById("cocoa").innerHTML = cocoa; 
        document.getElementById("coffee").innerHTML = coffee; 
        document.getElementById("cotton").innerHTML = cotton; 
        document.getElementById("sugar").innerHTML = sugar;

    }, 3000);


    
</script>

  

<!--  Custom Scripts -->
<script type="text/javascript" src="/stock/resources/core/js/custom/bar.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/dashboardColumn.js"> </script>
<script type="text/javascript" src="/stock/resources/core/js/custom/dashboardPie.js"> </script>


<%@ include file="footer.jsp" %>