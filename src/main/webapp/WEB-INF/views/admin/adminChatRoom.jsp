<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./common/header.jsp"%>

<!-- sidebar -->
<%@ include file="./common/sidebar.jsp"%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>현대백화점인터넷면세점 관리자페이지</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="../../resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
		<%-- <%@ include file="./common/topbar.jsp"%> --%>

		<!-- Begin Page Content -->
		<div class="container-fluid">


			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">
				<br>1대1 실시간 상담목록<br>
			</h1>
			<!-- <p class="mb-4">
				DataTables is a third party plugin that is used to generate the demo
				table below. For more information about DataTables, please visit the
				<a target="_blank" href="https://datatables.net">official
					DataTables documentation</a>.
			</p> -->
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables
						Example</h6> -->
				</div>

				<div class="card-body">
					<div class="table-responsive">
						<c:if test="${not empty memberInfoList }">
							<c:forEach items="${memberInfoList}" var="memberInfoList"
								varStatus="status">
								<c:if test="${status.count%4 eq 1}">
									<div class="row">
								</c:if>

								<div class="col-xl-3 col-md-6 mb-4">
									<a href="#" class="alink"
										onclick="window.open('/admin/adminChat?adminUsid=admin&memberUsid=${memberInfoList.mid}','일대일채팅','left=700, top=100, width=500,height=700,location=no,status=no,scrollbars=yes');">
										<div class="card border-left-warning shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-warning text-uppercase mb-1">
															고객ID:${memberInfoList.mid} <br> (고객명 :
															${memberInfoList.mname})
														</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">${memberInfoList.latestMsg}</div>
													</div>
													<div class="col-auto">
														<i class="fas fa-comments fa-2x text-gray-300"></i>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<c:if test="${status.count%4 eq 0}">
									</div>
								</c:if>
						</c:forEach>
					</c:if>

				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->
</div>
	<%@ include file="./common/footer.jsp"%>