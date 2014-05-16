<%@page import="model.Data"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club login page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<link rel="stylesheet"
	href="<s:url value="/css/bootstrap-theme.min.css"></s:url>" />
<title>Club Statistics</title>
<%
	int[][] card = (int[][]) request.getAttribute("card");
	int[] coach = (int[]) request.getAttribute("coach");
	double[] predict = (double[]) request.getAttribute("predict");
%>
<script type="text/javascript"
	src="<s:url value="/js/jquery-1.11.0.js"></s:url>"></script>
<script type="text/javascript">
	$(function() {
		$('#container1').highcharts({
			chart : {
				type : 'bar'
			},
			title : {
				text : 'Usage of Coach Distribution'
			},
			subtitle : {
				text : 'HealthClub'
			},
			xAxis : {
				categories : [ 'QQ', 'Baidu', 'Google' ],
				title : {
					text : null
				}
			},
			yAxis : {
				min : 0,
				title : {
					text : 'Count',
					align : 'high'
				},
				labels : {
					overflow : 'justify'
				}
			},
			tooltip : {
				valueSuffix : null
			},
			plotOptions : {
				bar : {
					dataLabels : {
						enabled : true
					}
				}
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'top',
				x : -40,
				y : 100,
				floating : true,
				borderWidth : 1,
				backgroundColor : '#FFFFFF',
				shadow : true
			},
			credits : {
				enabled : false
			},
			series : [ {
				name : 'Coach Usage',
				data : [
<%=coach[0]%>
	,
<%=coach[1]%>
	,
<%=coach[2]%>
	]
			} ]
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$('#container2').highcharts(
				{
					data : {
						table : document.getElementById('datatable')
					},
					chart : {
						type : 'column'
					},
					title : {
						text : 'VIP Card Usage'
					},
					yAxis : {
						allowDecimals : false,
						title : {
							text : 'Units'
						}
					},
					tooltip : {
						formatter : function() {
							return '<b>' + this.series.name + '</b><br/>'
									+ this.point.y + ' '
									+ this.point.name.toLowerCase();
						}
					}
				});
	});
</script>

<script type="text/javascript">
	$(function() {
		$('#predict').highcharts({
			chart : {
				type : 'bar'
			},
			title : {
				text : 'Prediction'
			},
			subtitle : {
				text : 'HealthClub'
			},
			xAxis : {
				categories : [ 'VIP', 'Activity' ],
				title : {
					text : null
				}
			},
			yAxis : {
				min : 0,
				title : {
					text : 'Count',
					align : 'high'
				},
				labels : {
					overflow : 'justify'
				}
			},
			tooltip : {
				valueSuffix : null
			},
			plotOptions : {
				bar : {
					dataLabels : {
						enabled : true
					}
				}
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'top',
				x : -40,
				y : 100,
				floating : true,
				borderWidth : 1,
				backgroundColor : '#FFFFFF',
				shadow : true
			},
			credits : {
				enabled : false
			},
			series : [ {
				name : 'Prediction',
				data : [
<%=predict[0]%>
	,
<%=predict[1]%>
	]
			} ]
		});
	});
</script>
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<s:url value="/member/index.jsp"></s:url>"><img
					alt="logo" src="<s:url value="/material/HealthClub.png"></s:url>" /></a>
			</div>
			<s:div cssClass="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<s:url value="/manager/index.jsp"></s:url>">Home</a></li>
					<li><s:a action="sumvip" namespace="/action">VIP Statistics</s:a></li>
					<li><s:a action="sumclub" namespace="/action">Club Statistics</s:a></li>
				</ul>
			</s:div>
		</div>
	</div>
	<script src="<s:url value="/js/highcharts.js"></s:url>"></script>
	<script src="<s:url value="/js/modules/exporting.js"></s:url>"></script>
	<script src="<s:url value="/js/modules/data.js"></s:url>"></script>
	<div id="container1"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	<div id="container2"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	<table id="datatable" style="display: none;">
		<thead>
			<tr>
				<th></th>
				<th>Normal</th>
				<th>Unnormal</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>Card</th>
				<td><%=card[0][0]%></td>
				<td><%=card[0][1]%></td>
			</tr>
			<tr>
				<th>Activated</th>
				<td><%=card[1][0]%></td>
				<td><%=card[1][1]%></td>
			</tr>
			<tr>
				<th>Payed</th>
				<td><%=card[2][0]%></td>
				<td><%=card[2][1]%></td>
			</tr>
		</tbody>
	</table>

	<div id="predict"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>
