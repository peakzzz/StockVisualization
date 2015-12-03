function worldMapSeries(div,jsonData){
	$(function () {
	    var data = [
	                {
	                    "code": "DE.SH",
	                    "value": 728
	                },
	                {
	                    "code": "DE.BE",
	                    "value": 710
	                },
	                {
	                    "code": "DE.MV",
	                    "value": 963
	                },
	                {
	                    "code": "DE.HB",
	                    "value": 541
	                },
	                {
	                    "code": "DE.HH",
	                    "value": 622
	                },
	                {
	                    "code": "DE.RP",
	                    "value": 866
	                },
	                {
	                    "code": "DE.SL",
	                    "value": 398
	                },
	                {
	                    "code": "DE.BY",
	                    "value": 785
	                },
	                {
	                    "code": "DE.SN",
	                    "value": 223
	                },
	                {
	                    "code": "DE.ST",
	                    "value": 605
	                },
	                {
	                    "code": "DE.",
	                    "value": 361
	                },
	                {
	                    "code": "DE.NW",
	                    "value": 237
	                },
	                {
	                    "code": "DE.BW",
	                    "value": 157
	                },
	                {
	                    "code": "DE.HE",
	                    "value": 134
	                },
	                {
	                    "code": "DE.NI",
	                    "value": 136
	                },
	                {
	                    "code": "DE.TH",
	                    "value": 704
	                }
	            ];

	    $.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=world-population-density.json&callback=?', function (data) {

	        // Add lower case codes to the data set for inclusion in the tooltip.pointFormat
	        $.each(data, function () {
	            this.flag = this.code.replace('UK', 'GB').toLowerCase();
	        });

	        // Initiate the chart
	        $('#'+div).highcharts('Map', {

	            title: {
	                text: 'World Currency Map'
	            },

	            legend: {
	                title: {
	                    text: 'World Currency Rate Changes',
	                    style: {
	                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
	                    }
	                }
	            },

	            mapNavigation: {
	                enabled: true,
	                buttonOptions: {
	                    verticalAlign: 'bottom'
	                }
	            },

	            tooltip: {
	                backgroundColor: 'none',
	                borderWidth: 0,
	                shadow: false,
	                useHTML: true,
	                padding: 0,
	                valueSuffix: '$',
	                pointFormat: '<span class="f32"><span class="flag {point.flag}"></span></span>'
	                    + ' {point.name}: <b>{point.value}</b> |1 day Change',
	                positioner: function () {
	                    return { x: 0, y: 250 };
	                }
	            },

	            colorAxis: {
	                min: 1,
	                max: 1000,
	                type: 'logarithmic'
	            },

	            series : [{
	                data : data,
	                mapData: Highcharts.maps['custom/world'],
	                joinBy: ['iso-a2', 'code'],
	                name: 'Currency Rate change',
	                states: {
	                    hover: {
	                        color: '#BADA55'
	                    }
	                }
	            }]
	        });
	    });
	});
}