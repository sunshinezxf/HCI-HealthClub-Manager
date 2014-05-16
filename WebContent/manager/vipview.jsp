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
<title>VIP Statistics</title>
<script type="text/javascript"
	src="<s:url value="/js/jquery-1.11.0.js"></s:url>"></script>
<%
	Data[] gender = (Data[]) request.getAttribute("gender");
	Data[] address = (Data[]) request.getAttribute("address");
	Data[] age = (Data[]) request.getAttribute("age");
%>
<script type="text/javascript">
	$(function() {
		$('#container1')
				.highcharts(
						{
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false
							},
							title : {
								text : 'Gender Distribution'
							},
							tooltip : {
								pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									dataLabels : {
										enabled : true,
										color : '#000000',
										connectorColor : '#000000',
										format : '<b>{point.name}</b>: {point.percentage:.1f} %'
									}
								}
							},
							series : [ {
								type : 'pie',
								name : 'Browser share',
								data : [ [ "<%=gender[0].getName()%>",parseFloat(<%=gender[0].getData()%>)],
										[ "<%=gender[1].getName()%>",parseFloat(<%=gender[1].getData()%>)] ]
							} ]
						});
	});
	
	$(function() {
		$('#container2')
				.highcharts(
						{
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false
							},
							title : {
								text : 'Address Distribution'
							},
							tooltip : {
								pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									dataLabels : {
										enabled : true,
										color : '#000000',
										connectorColor : '#000000',
										format : '<b>{point.name}</b>: {point.percentage:.1f} %'
									}
								}
							},
							series : [ {
								type : 'pie',
								name : 'Browser share',
								data : [ [ "<%=address[0].getName()%>",parseFloat(<%=address[0].getData()%>)],
										[ "<%=address[1].getName()%>",parseFloat(<%=address[1].getData()%>)],
										[ "<%=address[2].getName()%>",parseFloat(<%=address[2].getData()%>)]]
							} ]
						});
	});
	
	$(function() {
		$('#container3')
				.highcharts(
						{
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false
							},
							title : {
								text : 'Age Distribution'
							},
							tooltip : {
								pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									dataLabels : {
										enabled : true,
										color : '#000000',
										connectorColor : '#000000',
										format : '<b>{point.name}</b>: {point.percentage:.1f} %'
									}
								}
							},
							series : [ {
								type : 'pie',
								name : 'Browser share',
								data : [ [ "<%=age[0].getName()%>",parseFloat(<%=age[0].getData()%>)],
										[ "<%=age[1].getName()%>",parseFloat(<%=age[1].getData()%>)],
										[ "<%=age[2].getName()%>",parseFloat(<%=age[2].getData()%>) ],
										[ "<%=age[3].getName()%>",parseFloat(<%=age[3].getData()%>) ],
										[ "<%=age[4].getName()%>",parseFloat(<%=age[4].getData()%>) ] ]
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

	<div id="container1"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	<div id="container2"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	<div id="container3"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>
