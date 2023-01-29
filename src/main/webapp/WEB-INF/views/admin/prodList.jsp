<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="./common/header.jsp"%>

<!-- sidebar -->
<%@ include file="./common/sidebar.jsp"%>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <%@ include file="./common/topbar.jsp"%>

        <!-- Begin Page Content -->
        <div class="container-fluid">


            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Tables</h1>
            <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                For more information about DataTables, please visit the <a target="_blank"
                    href="https://datatables.net">official DataTables documentation</a>.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>품번</th>
                                    <th>브랜드명</th>
                                    <th>상품명</th>
                                    <th>정가</th>
                                    <th>할인율</th>
                                    <th>재고량</th>
                                    <th>판매량</th>
                                    <th>등록일자</th>
                                </tr>
                            </thead>
                            <!-- <tfoot>
                                <tr>
                                    <th>품번</th>
                                    <th>브랜드명</th>
                                    <th>상품명</th>
                                    <th>정가</th>
                                    <th>할인율</th>
                                    <th>재고량</th>
                                    <th>판매량</th>
                                    <th>등록일자</th>
                                </tr>
                            </tfoot> -->
                            <tbody>
                            	<c:forEach items="${prodList}" var="prod">
                                <tr>
                                    <td>${prod.pcode}</td>
                                    <td>${prod.pbrand}</td>
                                    <td>${prod.pname}</td>
                                    <td>${prod.pprice}</td>
                                    <td>${prod.pdiscount}</td>
                                    <td>${prod.pstock}</td>
                                    <td>${prod.psel}</td>
                                    <td><fmt:formatDate value="${prod.pregdate}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
        </div>
			<!-- End of Main Content -->

<%@ include file="./common/footer.jsp"%>