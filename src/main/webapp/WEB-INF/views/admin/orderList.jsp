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

<title>SB Admin 2 - Tables</title>

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
			<h1 class="h3 mb-2 text-gray-800"><br>주문목록</h1>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables
						Example</h6> -->
				</div>

				<div class="card-body">
					<div class="table-responsive">

						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문자(ID)</th>
									<th>주문총금액</th>
									<th>주문상태</th>
									<th>주문일자</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>주문번호</th>
									<th>주문자(ID)</th>
									<th>주문총금액</th>
									<th>주문상태</th>
									<th>주문일자</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${orderList}" var="order">
									<tr>
										<td>${order.oid}</td>
										<td>${order.mid}</td>
										<td>${order.ototal}</td>
										<td>
										<c:if test="${order.ostatus eq 'pay_complete'}">
											<span class="badge bg-secondary text-light w-75 py-2">결제완료</span>
										</c:if>
										<c:if test="${order.ostatus eq 'pay_cancel'}">
											<span class="badge bg-warning text-dark w-75 py-2">결제취소</span>
										</c:if>
										<c:if test="${order.ostatus eq 'on_delivery'}">
											<span class="badge bg-primary text-light w-75 py-2">인도중</span>
										</c:if>
										<c:if test="${order.ostatus eq 'delivery_complete'}">
											<span class="badge badge-success w-75 py-2">인도완료</span>
										</c:if>
										<c:if test="${order.ostatus eq 'fail_delivery'}">
											<a onclick="orderCancel('${order.oid}','${order.ototal}','${order.opaymentkey}');">
												<span class="badge bg-danger text-light w-75 py-2">미인도</span>
											</a>
										</c:if>
										</td>
										<td><fmt:formatDate value="${order.odate}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- /.container-fluid -->

<!-- End of Main Content -->


</div>
<!-- End of Page Wrapper -->



<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
<script
	src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script
	src="/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script
	src="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/admin/js/demo/datatables-demo.js"></script>

<script>
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";
	$(document).ajaxSend(function (e, xhr, options) {
    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	});
	
	function orderCancel(oid,ototal,opaymentkey){
		console.log("결제취소함소 들어옴 oid: "+oid);
		//console.log(typeOf(ototal));
		if (confirm("주문번호: "+oid+"해당 주문을 취소하시겠습니까?") == true) {
			const Data={
					oid: oid,
					order_dollar:ototal
			};
			$.ajax({
				method:"post",
				data : Data,
				url : "/order/cancelorder",
				success : function(data){
					console.log("ajax다녀옴");
				 	if(data=='yes'){
				 		console.log("결제Key: "+opaymentkey)
						tossPayCancel(opaymentkey,oid);
					} 
				},
				error : function(){
		    	}
			});
		}
	}
	
	function tossPayCancel(paymentKey,oid){
		 var paymentData = {
		            orderId : oid,
		            paymentKey: paymentKey
		        };
		        $.ajax({
		        	method:"post",
		        	data: paymentData,
		        	url : "/pay/cancelSuccess",
		        	success : function(data){
		        		alert("결제가 취소되었습니다");
		        		console.log("결제취소완");
		        	},
		        	error : function(){
		    		}
		        });
	}
</script>

</body>



</html>

