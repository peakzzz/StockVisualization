function createDashPie(div,title,jsonMyProfileGain){
	var processed_json = new Array();
	$.map(jsonMyProfileGain, function(obj, i) {
	    processed_json.push([obj.key, parseInt(obj.value)]);
	});
	console.log("div in createdashpie",div)
	$('#'+div).highcharts({
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 15,
	                beta: 15,
	                depth: 50,
	                viewDistance: 25
	          }
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                    }
	                }
	            }
	        },
	        title: {
	            text: title
	        },
	        series: [{
	        	name: 'Gaining percent',
	            data: processed_json
	        }]
	    });
}

function createDashDonut(div,title,jsonMyProfileLoss){
	/*var json = [{
	    "key": "Tesla",
	    "value": "4"
	}, {
	    "key": "HP",
	    "value": "3"
	}, {
	    "key": "CONSOL Energy Inc",
	    "value": "2"
	}, {
	    "key": "Owens-Illinois Inc",
	    "value": "1"
	}];*/
	var processed_json = new Array();
	$.map(jsonMyProfileLoss, function(obj, i) {
	    processed_json.push([obj.key, parseInt(obj.value)]);
	});

	$('#'+div).highcharts({
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },
	        xAxis: {
	            type: "category"
	        },
	         title: {
	            text: title
	        },
	        /*
	        subtitle: {
	            text: '3D donut in Highcharts'
	        },
	        */
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        series: [{
	            name: 'Losing percent',
	            data: processed_json
	        }]
	    });
}
function createTable(div,json){
	var processed_json = new Array();
	$.map(json, function(obj, i) {
	    processed_json.push([obj.key, parseInt(obj.value)]);
	});
	 var colData = ["Company", "%"];
	    var rowData = processed_json ;//[["111","Ryan Connolly"], ["10","Julie Connolly"], ["5","Chloe Connolly"]];
	    var data = {"Cols":colData, "Rows":rowData};
	    
	    var table = $('<table/>').attr("id", "userquerytable"+div).addClass("display").attr("cellspacing", "0").attr("width", "100%");
        
	    var tr = $('<tr/>');
	    table.append('<thead>').children('thead').append(tr);
	    
	    for (var i=0; i< data.Cols.length; i++) {
	      tr.append('<td>'+data.Cols[i]+'</td>'); 
	    }
	    
	    for(var r=0; r < data.Rows.length; r++){   
	        var tr = $('<tr/>');
	        table.append(tr);  
	        //loop through cols for each row...
	        for(var c=0; c < data.Cols.length; c++){
	            tr.append('<td>'+data.Rows[r][c]+'</td>');   
	        }
	    }
	    
	    $('#'+div).append(table);    
	    
	    
	    
	    $('#userquerytable'+div).DataTable({
	        responsive: true
	    });
}

function createTree(div,title,treeData){
	var margin = {top: 20, right: 120, bottom: 20, left: 120},
	width = 960 - margin.right - margin.left,
	height = 500 - margin.top - margin.bottom;
	
	var i = 0,
		duration = 750,
		root;
	
	var tree = d3.layout.tree()
		.size([height, width]);
	
	var diagonal = d3.svg.diagonal()
		.projection(function(d) { return [d.y, d.x]; });
	
	var svg = d3.select("#"+div).append("svg")
		.attr("width", width + margin.right + margin.left)
		.attr("height", height + margin.top + margin.bottom)
	  .append("g")
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
	root = treeData[0];
	root.x0 = height / 2;
	root.y0 = 0;
	  
	update(root);
	
	d3.select(self.frameElement).style("height", "500px");
	
	function update(source) {
	
	  // Compute the new tree layout.
	  var nodes = tree.nodes(root).reverse(),
		  links = tree.links(nodes);
	
	  // Normalize for fixed-depth.
	  nodes.forEach(function(d) { d.y = d.depth * 180; });
	
	  // Update the nodes…
	  var node = svg.selectAll("g.node")
		  .data(nodes, function(d) { return d.id || (d.id = ++i); });
	
	  // Enter any new nodes at the parent's previous position.
	  var nodeEnter = node.enter().append("g")
		  .attr("class", "node")
		  .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
		  .on("click", click);
	
	  nodeEnter.append("circle")
		  .attr("r", 1e-6)
		  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });
	
	  nodeEnter.append("text")
		  .attr("x", function(d) { return d.children || d._children ? -13 : 13; })
		  .attr("dy", ".35em")
		  .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
		  .text(function(d) { return d.name; })
		  .style("fill-opacity", 1e-6);
	
	  // Transition nodes to their new position.
	  var nodeUpdate = node.transition()
		  .duration(duration)
		  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });
	
	  nodeUpdate.select("circle")
		  .attr("r", 10)
		  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });
	
	  nodeUpdate.select("text")
		  .style("fill-opacity", 1);
	
	  // Transition exiting nodes to the parent's new position.
	  var nodeExit = node.exit().transition()
		  .duration(duration)
		  .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
		  .remove();
	
	  nodeExit.select("circle")
		  .attr("r", 1e-6);
	
	  nodeExit.select("text")
		  .style("fill-opacity", 1e-6);
	
	  // Update the links…
	  var link = svg.selectAll("path.link")
		  .data(links, function(d) { return d.target.id; });
	
	  // Enter any new links at the parent's previous position.
	  link.enter().insert("path", "g")
		  .attr("class", "link")
		  .attr("d", function(d) {
			var o = {x: source.x0, y: source.y0};
			return diagonal({source: o, target: o});
		  });
	
	  // Transition links to their new position.
	  link.transition()
		  .duration(duration)
		  .attr("d", diagonal);
	
	  // Transition exiting nodes to the parent's new position.
	  link.exit().transition()
		  .duration(duration)
		  .attr("d", function(d) {
			var o = {x: source.x, y: source.y};
			return diagonal({source: o, target: o});
		  })
		  .remove();
	
	  // Stash the old positions for transition.
	  nodes.forEach(function(d) {
		d.x0 = d.x;
		d.y0 = d.y;
	  });
	}
	
	// Toggle children on click.
	function click(d) {
	  if (d.children) {
		d._children = d.children;
		d.children = null;
	  } else {
		d.children = d._children;
		d._children = null;
	  }
	  update(d);
	}

}
