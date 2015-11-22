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
