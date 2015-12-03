function createcolumn(div,data){
	console.log("data:",data);
/*var data= [
		{key: "Quorvo Inc",   	value: 23.23},
		{key: "NVIDIA Corp",    	value:13.86 },
		{key: "Bank of America",    	value: 3.7},
		{key: "Citigroup",	value: 3.18},
		{key: "Disney",		value: 2.36}
	];
*/
var w = 800;
var h = 450;
var margin = {
	top:58,
	bottom: 100,
	left:80,
	right:40
};
var width = w - margin.left - margin.right;
var height = h - margin.top - margin.bottom;

var x = d3.scale.ordinal()
		  .domain(data.map(function(entry){
		  	return entry.key;
		  }))
		  .rangeBands([0,width]);
var y = d3.scale.linear()
		  .domain([0,d3.max(data,function(d){
		  	return d.value;
		  })])
		  .range([height,0]);

//gives y position of eclair
//linear color scale gives gradation of colors
//ordinal color scale gives distinct colors
var linearColorScale = d3.scale.linear()
						.domain([0,data.length])
						.range(["#572500","#F68026"]);
var ordinalColorScale = d3.scale.category20();
var xAxis = d3.svg.axis()
			.scale(x)
			.orient("bottom");
var yAxis = d3.svg.axis()
			.scale(y)
			.orient("left");
var yGridlines = d3.svg.axis()
					.scale(y)
					.tickSize(-width,0,0)
					.tickFormat("")
					.orient("left");
var svg = d3.select("#"+div).append("svg")
			.attr("id", "chart")
			.attr("width",w)
			.attr("height",h);
//to have margin in chart- use group - container to hold elements
//dont c groups, convenience elements to affect children elements
//transform -move the group and expects a value called translate
var chart = svg.append("g")
				.classed("display",true)
				.attr("transform","translate("+margin.left+","+margin.right+")");


//get rid of direct references within the plot function ie, 
//shdnt be calling variables within the function. pass them using params


function plot(params){
	//select all the elements withing the svg element that have bar class
	//.enter() first time data is bound

	console.log(this);
	
	this.append("g")
		.call(params.gridlines)
		.classed("gridline",true)
		.attr("transform","translate(0,0)")
	this.selectAll(".bar")
		.data(params.data)
		.enter()
			.append("rect")
			.classed("bar",true)
			.attr("x", function(d,i){
				return x(d.key);
			})
			.attr("y", function(d,i){
				return y(d.value);
			})
			.attr("width", function(d){
				return x.rangeBand()-50;
			})
			.attr("height", function(d,i){
				return height - y(d.value);
			})
			.style("fill", function(d,i){
				return ordinalColorScale(i);
				//return linearColorScale(i);
			});
			//creating text labels
			//select all the elements in svg element that have class bar-label
			//bind data to them
			//append text element
			//dy to nudge y 
			//text-anchor in css to position text
			//applied bar-label class to text using classed
	this.selectAll(".bar-label")
		.data(params.data)
		.enter()
			.append("text")
			.classed("bar-label",true)
			.attr("x",function(d,i){
				return x(d.key) + (x.rangeBand()/2);
			})
			.attr("y", function(d,i){
				return y(d.value);
			})
			.attr("dx", 0)
			.attr("dy", -6)
			.text(function(d,i){
				return d.value;
			})
	this.append("g")
			.classed("x axis",true)
			.attr("transform","translate("+0+","+height+")")
			.call(params.axis.x)
				.selectAll("text")
					.style("text-anchor","end")
					.attr("dx",-8)
					.attr("dy",8)
					.attr("transform","translate(0,0) rotate(-45)");
	this.append("g")
			.classed("y axis",true)
			.attr("transform","translate(0,0)")
			.call(params.axis.y);
	this.select(".y.axis")
		.append("text")
		.attr("x",0)
		.attr("y",0)
		.style("text-anchor","middle")
		.attr("transform","translate(-50,"+height/2+") rotate(-90)")
		.text("% Change");
	this.select(".x.axis")
		.append("text")
		.attr("x",0)
		.attr("y",0)
		.style("text-anchor","middle")
		.attr("transform","translate("+width/2+",80) ")
		.text("Companies");

		
}
// property data has data source which is "data". accordingly above .data has params.data
//to get element that is drawing chart "this" object is used.
//first argument of .call has the argument that is represented by this keyword
//2nd argument is the first argument if we dint call the function with call
plot.call(chart, {
	data: data,
	axis:{
		x: xAxis,
		y: yAxis
	},
	gridlines: yGridlines
})



////////////////////////
	
}

function createPositiveNegativeGraph(div,jsonGainer,jsonLoser){
	console.log("inside createPositiveNegativeGraph",jsonGainer);
	var processed_json = new Array();
	var category = new Array();
	$.map(jsonGainer, function(obj, i) {
	    processed_json.push([obj.key, parseInt(obj.value)]);
	    category.push(obj.name);
	});
	var processed_json2 = new Array();
	$.map(jsonLoser, function(obj, i) {
	    processed_json2.push([obj.key, parseInt(obj.value)]);
	    category.push(obj.key);
	});
	console.log(jsonGainer);
	$('#'+div).highcharts({
	        chart: {
	            type: 'column'
	        },
	        xAxis: {
	            title:{text:"Rank"},
	            //min:1,
	            offset:1,
	            type: category
	        },
	        series: [{
	            name: "Gainer",
	            data: processed_json
	        },{
	            name: "Loser",																																																										
	            data: processed_json2
	        }
	          ]
	    });
}


function timeSeries(divId,jsonData){
	console.log("in timeSeries")
	var chart = {
	      zoomType: 'x'
	   }; 
	   var title = {
	      text: 'Profit and Loss'   
	   };
	   var subtitle = {
	      text: document.ontouchstart === undefined ?
	                    'Click and drag in the plot area to zoom in' :
	                    'Pinch the chart to zoom in'
	   };
	   var xAxis = {
	      type: 'datetime',
	      minRange: 14 * 24 * 3600000 // fourteen days
	   };
	   var yAxis = {
	      title: {
	         text: 'Investment in $'
	      }
	   };
	   var legend = {
	      enabled: false 
	   };
	   var plotOptions = {
	      area: {
	         fillColor: {
	            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
	            stops: [
	               [0, Highcharts.getOptions().colors[0]],
	               [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
	            ]
	         },
	         marker: {
	            radius: 2
	         },
	         lineWidth: 1,
	         states: {
	            hover: {
	               lineWidth: 1
	            }
	         },
	         threshold: null
	      }
	   };
	   var series= [{
	      type: 'area',
	      name: 'Investment',
	      pointInterval: 24 * 3600 * 1250,
	      pointStart: Date.UTC(2015, 5, 2),
	      data: [23851.049780000001, 23298.899474999998, 23530.249790000002, 23518.350605, 23411.700315000002, 23625.649890000001, 23481.900155000003, 23159.650405000004, 23259.349699999999, 22701.449555000003, 22805.549854999997, 22541.449675, 23194.949854999999, 23462.400069999996, 23178.250094999999, 23086.300040000002, 23280.949620000003, 23247.90022, 22861.250274999999, 22423.300134999994, 22509.649465000002, 22303.400420000002, 22482.699549999998, 22271.249449999999, 22086.150155000003, 22029.699714999999, 21688.750540000001, 20642.249734999998, 20374.150204999998, 20614.000165000001, 21106.650500000007, 20995.750209999998, 20775.700150000001, 20274.15004, 20391.850280000002, 20335.850034999999, 20121.649695, 19984.199645000001, 20166.50013, 20151.699949999998, 20306.799854999997, 19930.549575000005, 19480.649494999998, 19327.450164999998, 18819.649865000003, 18998.299915, 19645.550149999999, 20012.099795000002, 20028.349910000001, 20047.000450000003, 20434.300125000002, 20188.499980000001, 20309.7997, 20083.100345000003, 19925.750110000001, 19733.149745000002, 19888.79996, 19709.250115000003, 19537.000005000002, 19539.899695000004, 19031.950269999998, 19265.549965000002, 19444.899549999998, 18952.85022, 19540.000309999999, 19774.100155, 19826.250235000003, 19280.749749999999, 18105.449605000002, 18119.249650000002, 19093.550330000002, 19999.600134999997, 20622.649454999999, 20643.050079999997, 20644.649360000003, 20478.150215000005, 20380.549625, 20339.149435000003, 20372.250179999995, 20121.000199999999, 20101.650129999998, 20296.250630000002, 20616.850050000001, 20334.100590000002, 20368.300070000001, 20342.95032, 20468.450114999996, 20346.899904999998, 20244.050235000002, 20233.399680000002, 20315.799850000003, 19841.549780000001, 20154.799675000002, 20197.699649999999, 20242.950445000002, 20141.400140000002, 18921.300325, 18473.700389999998, 18550.949999999997, 18259.94989, 17841.999934999996, 17527.600480000001, 17365.200405000003, 17700.600305, 17751.550140000003, 17814.000124999999, 17711.400169999997, 17592.299769999998, 17516.649769999996, 17890.900069999996, 18008.650335000002, 18006.000075, 18120.100034999999, 17830.450099999998, 17705.700390000002, 17791.350349999997, 17474.49971, 17382.800049999998, 17277.800185, 17359.099875, 17464.299790000001, 17487.249660000001, 17270.199905000001, 17259.149775000002, 17393.350465000003, 17444.800084999999, 17622.749715000002, 17481.950035000002, 17452.900395000001, 17345.400280000002, 17403.050035, 17465.500260000001, 17251.700090000002, 17413.350340000001, 17479.000034999997, 17302.650044999998, 17221.100124999997, 17324.749640000002, 17327.849819999999, 17456.700264999999, 17187.649870000001, 17215.299634999999, 17275.600390000003, 17335.15021, 17124.74986, 16847.350159999998, 16974.599725, 17142.500394999999]
	      }
	   ];
	   
	   var json = {};
	   json.chart = chart;
	   json.title = title;
	   json.subtitle = subtitle;
	   json.legend = legend;
	   json.xAxis = xAxis;
	   json.yAxis = yAxis;  
	   json.series = series;
	   json.plotOptions = plotOptions;
	   $('#'+divId).highcharts(json);
}