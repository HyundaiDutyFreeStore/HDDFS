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
		<%@ include file="./common/topbar.jsp"%>

		<!-- Begin Page Content -->
		<div class="container-fluid">


			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">상품목록</h1>
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

				<!-- <div class="row">
            <div class="col-sm-12 col-md-6">
                <div class="dataTables_length" id="dataTable_length"><label>Show <select name="dataTable_length"
                            aria-controls="dataTable"
                            class="custom-select custom-select-sm form-control form-control-sm">
                            <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select> entries</label></div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div id="dataTable_filter" class="dataTables_filter"><label>Search:<input type="search"
                            class="form-control form-control-sm" placeholder="" aria-controls="dataTable"></label></div>
            </div>
        </div> -->
				<div class="card-body">
					<div class="table-responsive">

						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th>상품코드</th>
									<th>브랜드명</th>
									<th>상품명</th>
									<th>정가</th>
									<th>할인율</th>
									<th>재고량</th>
									<th>판매량</th>
									<th>등록일자</th>
									<th>수정</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>상품코드</th>
									<th>브랜드명</th>
									<th>상품명</th>
									<th>정가</th>
									<th>할인율</th>
									<th>재고량</th>
									<th>판매량</th>
									<th>등록일자</th>
									<th>수정</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${prodList}" var="prod">
									<tr>
										<td>${prod.pcode}</td>
										<td>${prod.pbrand}</td>
										<td>${prod.pname}</td>
										<td><div class="input-group mb-3">${prod.pprice}</div></td>
										<td>${prod.pdiscount}</td>
										<td>${prod.pstock}</td>
										<td>${prod.psel}</td>
										<td><fmt:formatDate value="${prod.pregdate}"
												pattern="yyyy-MM-dd" /></td>
										<td><a href="javascript:modifyModal('${prod.pcode}','${prod.pbrand}','${prod.pname}','${prod.pprice}','${prod.pdiscount}','${prod.pstock}');"
											class="btn btn-info btn-circle btn-sm"> <i
												class="fas fa-info-circle"></i>
										</a> <a href="javascript:deleteProduct('${prod.pcode}');"
											class="btn btn-danger btn-circle btn-sm"> <i
												class="fas fa-trash"></i>
										</a></td>
									</tr>
									<div class="modal fade" id="testModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">상품정보수정</h5>
													<button class="close" type="button" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">X</span>
													</button>
												</div>
												<div class="modal-body">
														<div class="mb-3">
															<label for="exampleInputEmail1" class="form-label">상품코드</label> 
															<input type="text" class="form-control" id="pcode" readonly>
														</div>
														<div class="mb-3">
															<label for="exampleInputEmail1" class="form-label">브랜드명</label> 
															<input type="text" class="form-control" id="pbrand" readonly>
														</div>
														<div class="mb-3">
															<label for="exampleInputEmail1" class="form-label">상품명</label> 
															<input type="text" class="form-control" id="pname"  readonly>
														</div>
														<div class="mb-3">
															<label for="exampleInputEmail1" class="form-label">정가</label> 
															<input type="number" class="form-control" id="pprice">
														</div>
														<div class="mb-3">
															<label for="exampleInputEmail1" class="form-label">할인율</label> 
															<input type="number" class="form-control" id="pdiscount" >
														</div>
														<div class="mb-3">
															<label for="exampleInputEmail1" class="form-label">재고</label> 
															<input type="number" class="form-control" id="pstock" >
														</div>
												</div>
												<div class="modal-footer">
													<a class="btn" id="modalY" onclick="updateProd();">수정</a>
													<button class="btn" type="button" data-dismiss="modal">취소</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 
        <div class="row">
            <div class="col-sm-12 col-md-5">
                <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 41 to 50 of 57
                    entries</div>
            </div>
            <div class="col-sm-12 col-md-7">
                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                    <ul class="pagination">
                        <li class="paginate_button page-item previous" id="dataTable_previous"><a href="#"
                                aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                        </li>
                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="1"
                                tabindex="0" class="page-link">1</a></li>
                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2"
                                tabindex="0" class="page-link">2</a></li>
                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3"
                                tabindex="0" class="page-link">3</a></li>
                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4"
                                tabindex="0" class="page-link">4</a></li>
                        <li class="paginate_button page-item active"><a href="#" aria-controls="dataTable"
                                data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6"
                                tabindex="0" class="page-link">6</a></li>
                        <li class="paginate_button page-item next" id="dataTable_next"><a href="#"
                                aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
             
        </div>
        -->
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
	//상품삭제
	function deleteProduct(pcode) {
		console.log("상품삭제함수");
		if (confirm("품번: "+pcode+"해당 상품을 삭제하시겠습니까?") == true) {
			$.ajax({
				url : "/product/delete",
				type : "get",
				data : {
					pcode : pcode
				},
				success : function() {
					console.log("상품삭제완료");
					//location.href = "/cart/cartList";
				}
			});
		}
	}

	//상품수정
	function modifyModal(pcode,pbrand,pname,pprice,pdiscount,pstock) {
		console.log(pcode+ "수정모달 띄우기");
		 $(".modal-body #pcode").val(pcode);
		 $(".modal-body #pbrand").val(pbrand);
		 $(".modal-body #pname").val(pname);
		 $(".modal-body #pprice").val(pprice);
		 $(".modal-body #pdiscount").val(pdiscount);
		 $(".modal-body #pstock").val(pstock);
		$('#testModal').modal("show");
	}
	
	//상품수정 함수
	function updateProd(){
		var pcode = $(".modal-body #pcode").val();
		var pprice = $(".modal-body #pprice").val();
		var pdiscount = $(".modal-body #pdiscount").val();
		var pstock = $(".modal-body #pstock").val();
		
		console.log(pcode+ "상품수정 들어옴");
		//pprice = parseFloat(pprice);
		pdiscount = parseInt(pdiscount);
		pstock = parseInt(pstock);
		
		if (confirm("품번: "+pcode+"해당 상품을 수정하시겠습니까?") == true) {
			$.ajax({
				url : "/product/update",
				type : "get",
				data : {
					pcode : pcode,
					pprice : pprice,
					pdiscount : pdiscount,
					pstock : pstock
				},
				success : function() {
					console.log("상품수정완료");
					$('#testModal').modal("hide");
					location.reload();
					//location.href = "/cart/cartList";
				}
			});
		}
	}
</script>

</body>



</html>

