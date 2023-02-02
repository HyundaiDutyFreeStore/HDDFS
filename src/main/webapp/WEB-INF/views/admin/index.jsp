<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="./common/header.jsp"%>

<!-- sidebar -->
<%@ include file="./common/sidebar.jsp"%>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
		<%-- <%@ include file="./common/topbar.jsp"%> --%>

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"><br>Dashboard</h1>
			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-primary shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										일매출</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800" id="totaldailysales">$${todaysales}</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										주간매출</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">$${weeklysales}</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-info text-uppercase mb-1">총
										회원 수 / 금일 방문자</div>
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${cnttotal}명 / ${cntVisiter}명</div>
										</div>
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Content Row -->

			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">일매출 통계</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="dailyTotalChart"></canvas>
							</div>
						</div>
					</div>
				</div>

				<!-- Pie Chart -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">판매량</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="categoryTotalChart"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-bag"></i>
									가방/지갑
								</span> <span class="mr-2"> <i
									class="fas fa-circle text-makeup"></i> 메이크업
								</span> <span class="mr-2"> <i class="fas fa-circle text-skincare"></i>
									스킨케어
								</span><span class="mr-2"> <i class="fas fa-circle text-sport"></i>
									스포트/레저
								</span> <br> <span class="mr-2"> <i
									class="fas fa-circle text-food"></i> 식품
								</span><span class="mr-2"> <i class="fas fa-circle text-electronic"></i>
									전자리빙
								</span><span class="mr-2"> <i class="fas fa-circle text-fasion"></i>
									패션/잡화
								</span><span class="mr-2"> <i class="fas fa-circle text-pufume"></i>
									향수/헤어/바디
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Content Column -->
				<div class="col-lg-6 mb-4">

					<!-- Project Card Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">총 회원 수</h6>
						</div>
						<div class="card-body">

							<h4 class="small font-weight-bold">
								남성 <span class="float-right">${cntm}%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar" role="progressbar" style="width: ${cntm}%"
									aria-valuenow="${cntm}" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h4 class="small font-weight-bold">
								여성 <span class="float-right">${cntw}%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: ${cntw}%" aria-valuenow="${cntw}" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<%-- <h4 class="small font-weight-bold">
								알수없음 <span class="float-right">${cnta}%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: ${cnta}%" aria-valuenow="${cnta}" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div> --%>
						</div>
					</div>
				</div>

				<div class="col-lg-6 mb-4">

					<!-- Illustrations -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">CopyRight</h6>
						</div>
						<div class="card-body">
							<p>
								현대 IT&E 5기 현면하다 팀의 최종 프로젝트 결제부터 인도까지 편리한 면세점입니다. 팀의 <a target="_blank" rel="nofollow" href="https://colding97.atlassian.net/jira/">개발과정</a>과 
								<a target="_blank" rel="nofollow" href="https://github.com/HyundaiDutyFreeStore/HDDFS">gitHub</a>가 궁금하시다면 저희 사이트를 방문해 주세요!
								
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->
	<script type="text/javascript">
		function number_format(number, decimals, dec_point, thousands_sep) {
			// * example: number_format(1234.56, 2, ',', ' ');
			// * return: '1 234,56'
			number = (number + '').replace(',', '').replace(' ', '');
			var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
					: Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
					: thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
					: dec_point, s = '', toFixedFix = function(n, prec) {
				var k = Math.pow(10, prec);
				return '' + Math.round(n * k) / k;
			};
			// Fix for IE parseFloat(0.55).toFixed(0) = 0;
			s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			if (s[0].length > 3) {
				s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			}
			if ((s[1] || '').length < prec) {
				s[1] = s[1] || '';
				s[1] += new Array(prec - s[1].length + 1).join('0');
			}
			return s.join(dec);
		}

		$(document).ready(function() {
			getDaily();
			getCategory();
		});

		function getDaily() {
			let odateList = [];
			let totalList = [];

			$
					.ajax({
						url : "/admin/index/dailyTotal",
						type : "get",
						data : {
							odate : "${dailyTotal.odate}",
							total : "${dailyTotal.total}"
						},
						dataType : "json",
						success : function(data) {
							for (let i = 0; i < data.length; i++) {
								odateList.push(data[i].odate);
								totalList.push(data[i].total);
								totaldailysales += data[i].total;
							}
							new Chart(
									document.getElementById("dailyTotalChart"),
									{
										type : 'line',
										data : {
											labels : odateList, // X축 
											datasets : [ {
												label : "일일 매출액",
												lineTension : 0.3,
												backgroundColor : "rgba(78, 115, 223, 0.05)",
												borderColor : "rgba(78, 115, 223, 1)",
												pointRadius : 3,
												pointBackgroundColor : "rgba(78, 115, 223, 1)",
												pointBorderColor : "rgba(78, 115, 223, 1)",
												pointHoverRadius : 3,
												pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
												pointHoverBorderColor : "rgba(78, 115, 223, 1)",
												pointHitRadius : 10,
												pointBorderWidth : 2,
												data : totalList, // 값
											} ]
										},
										options : {
											maintainAspectRatio : false,
											layout : {
												padding : {
													left : 10,
													right : 25,
													top : 25,
													bottom : 0
												}
											},
											scales : {
												xAxes : [ {
													time : {
														unit : 'date'
													},
													gridLines : {
														display : false,
														drawBorder : false
													},
													ticks : {
														maxTicksLimit : 7
													}
												} ],
												yAxes : [ {
													ticks : {
														maxTicksLimit : 5,
														padding : 10,
														// Include a dollar sign in the ticks
														callback : function(
																value, index,
																values) {
															return '$'
																	+ number_format(value);
														}
													},
													gridLines : {
														color : "rgb(234, 236, 244)",
														zeroLineColor : "rgb(234, 236, 244)",
														drawBorder : false,
														borderDash : [ 2 ],
														zeroLineBorderDash : [ 2 ]
													}
												} ],
											},
											legend : {
												display : false
											}

										}
									})
						}
					})
		}
		function getCategory() {
			let catList = [];
			let ccntList = [];

			$.ajax({
				url : "/admin/index/categoryTotal",
				type : "get",
				data : {
					cat : "${categoryTotal.cat}",
					ccnt : "${categoryTotal.ccnt}"
				},
				dataType : "json",
				success : function(data) {
					for (let i = 0; i < data.length; i++) {
						catList.push(data[i].cat);
						ccntList.push(data[i].ccnt);
					}
					new Chart(document.getElementById("categoryTotalChart"), {
						type : 'doughnut',
						data : {
							labels : catList, // X축 
							datasets : [ {
								data : ccntList,
								backgroundColor : [ '#08306B', '#08519C',
										'#2171B5', '#6BAED6', '#9ECAE1',
										'#C6DBEF', '#DEEBF7', '#F9F9F9' ],
								hoverBackgroundColor : [ '#FCC5C0', '#FA9FB5',
										'#F768A1', '#DD3497', '#AE017E',
										'#7A0177', '#7A0177', '#49006A' ],
								hoverBorderColor : "rgba(234, 236, 244, 1)",
							} ]
						},
						options : {
							maintainAspectRatio : false,
							tooltips : {
								backgroundColor : "rgb(255,255,255)",
								bodyFontColor : "#858796",
								borderColor : '#FFFFFF',
								borderWidth : 1,
								xPadding : 15,
								yPadding : 15,
								displayColors : false,
								caretPadding : 10,
							},
							legend : {
								display : false
							},
							cutoutPercentage : 80,
						}
					})
				}
			})
		}
	</script>

	<%@ include file="./common/footer.jsp"%>