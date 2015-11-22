function createbar(div){
	console.log("hi",div);
var data= [
		{key: "Quorvo Inc",   	value: 23.23},
		{key: "NVIDIA Corp",    value:13.86 },
		{key: "Bank of America",value: 3.7},
		{key: "Citigroup",	value: 3.18},
		{key: "Disney",		value: 2.36}
	];
	var w = 400;
	var h = 300;
	var margin = {
		top:20,
		bottom: 40,
		left:80,
		right:20
	};
	var width = w - margin.left - margin.right;
	var height = h - margin.top - margin.bottom;
	var x = d3.scale.linear()
			  .domain([0,d3.max(data,function(d){
			  	return d.value;
			  })])
			  .range([0,width]);
	var y = d3.scale.ordinal()
			  .domain(data.map(function(entry){
			  	return entry.key;
			  }))
			  .rangeBands([0,height]);
			  console.log(y("Eclair")); //gives y position of eclair
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
		this.selectAll(".bar")
			.data(params.data)
			.enter()
				.append("rect")
				.classed("bar",true)
				.attr("x", 0)
				.attr("y", function(d,i){
					return y(d.key);
				})
				.attr("width", function(d,i){
					return x(d.value);
				})
				.attr("height", function(d,i){
					return y.rangeBand()-1;
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
					return x(d.value);
				})
				.attr("y", function(d,i){
					return y(d.key);
				})
				.attr("dx", -4)
				.attr("dy", function(d,i){
					return y.rangeBand()/1.5 +2;
				})
				.text(function(d,i){
					return d.value;
				})
		this.append("g")
				.classed("x axis",true)
				.attr("transform","translate("+0+","+height+")")
				.call(xAxis);
		this.append("g")
				.classed("y axis",true)
				.attr("transform","translate(0,0)")
				.call(yAxis);

	}
	// property data has data source which is "data". accordingly above .data has params.data
	//to get element that is drawing chart "this" object is used.
	//first argument of .call has the argument that is represented by this keyword
	//2nd argument is the first argument if we dint call the function with call
	plot.call(chart, {
		data: data
	})
}