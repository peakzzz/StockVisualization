<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highmaps Example</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
#container {
	height: 500px; 
	width: 800px; 
	margin: 0 auto; 
}

.highcharts-tooltip>span {
	padding: 10px;
	white-space: normal !important;
	width: 200px;
}

.loading {
	margin-top: 10em;
	text-align: center;
	color: gray;
}

.f32 .flag {
	vertical-align: middle !important;
}
		</style>
		<script type="text/javascript">
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
        $('#container').highcharts('Map', {

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
		</script>
	</head>
	<body>
<script src="/stock/resources/core/js/highmaps.js"></script>
<script src="/stock/resources/core/js/modules/data.js"></script>
<script src="/stock/resources/core/js/modules/exporting.js"></script>
<script src="http://code.highcharts.com/mapdata/custom/world.js"></script>

<!-- Flag sprites service provided by Martijn Lafeber, https://github.com/lafeber/world-flags-sprite/blob/master/LICENSE -->
<link rel="stylesheet" type="text/css" href="http://cloud.github.com/downloads/lafeber/world-flags-sprite/flags32.css" />


<div id="container"></div>
	</body>
