<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.html"> <!-- <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div> --> <!-- <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div> -->
		<img
		src="https://cdn.hddfs.com/front/images/KO/common/logo.png?RS=192X40" />
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="index.html">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>홈</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<!-- <div class="sidebar-heading">회원관리</div>

			Nav Item - Pages Collapse Menu
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>Components</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					
				</div></li>

			Nav Item - Utilities Collapse Menu
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				</div></li> -->

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">관리자메뉴</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<!-- <li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
				</div></li> -->

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="/admin/prodList">
			<i class="fas fa-fw fa-table"></i> <span>상품목록</span>
	</a></li>

	<li class="nav-item"><a class="nav-link" href="/admin/orderList">
			<i class="fas fa-fw fa-table"></i> <span>주문목록</span>
	</a></li>

	<li class="nav-item"><a class="nav-link"
		href="/admin/adminChatRoom"> <i class="fas fa-fw fa-table"></i> <span>채팅목록</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	
	<li class="nav-item"><a class="nav-link"
		href="javascript:void(0)" onclick="gologout()"> <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> <span>로그아웃</span>
	</a></li>
	
	<form id="form_logout" action="/member/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
	</form>


</ul>

<script>
function gologout() {
    document.getElementById('form_logout').submit();
 }
</script>
<!-- End of Sidebar -->