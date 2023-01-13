<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<!-- 정렬방식 선택시 이동 -->
<script>
function prodOrder(str){
	console.log("정렬방식: "+str);
	location.href='/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&order='+str;
}

//필터설정 후 검색버튼눌렀을 때
function goosSearchItemFilter(researchYn){
	var html = "";
	//쇼핑정보
	var shopFilterLength = $("input[name='shopFilter']:checked").length;
	if(shopFilterLength > 0){
		$("#shoppingInfoFilterCnt").html( shopFilterLength > 0 ?  " "+shopFilterLength : "");
		$(".shoppingInfoFilterCnt").show();
		$(".shoppingInfoFilterCnt").find("button").show();
	}else{
		$("#shoppingInfoFilterCnt").html( shopFilterLength > 0 ?  " "+shopFilterLength : "");
		$(".shoppingInfoFilterCnt").hide();
		$(".shoppingInfoFilterCnt").find("button").hide();
	}
	$("input[name='shopFilter']:checked").each(function(){
		var txt = $(this).next("label").text();
		var pos = $(this).data("pos");
		var filterId = $(this).attr("id");
		console.log("filterId: "+filterId);
		html+="<li>"+txt+" <button class='ic_x' data-id='"+this.id+"' data-name='"+this.name+"' data-pos='"+pos+"'  onclick=\"removeSearchItem(this,'"+this.id+"','"+this.name+"','"+pos+"');\">x</button></li>";
	});
	
	$(".searchFilterArea").html(html);
	if($(".searchFilterArea > li").length <1){
		$(".sel_filter").hide();
	}else{
		$(".sel_filter").show();
	}
}

//필터 초기화
function goosSearchItemInit(reloadYn) {
	 $("input[name='shopFilter']").prop("checked", false); // 쇼핑정보 초기화	
     $("input[name='priceFilter']").prop("checked", false); // 가격 초기화
     $(".sel_filter").hide();	//필터선택창 숨기기
}
</script>
<main id="container">
	<div class="location_all">
		<article class="location">
			<!-- 이동네비게이션, 모든대분류 + 선택한카테고리의 중/소분류 링크 -->
			<section class="box">
				<a href="/" class="home">홈</a>

				<div>
					<strong>${category.clarge}</strong>
					<ul style="display: none;">
						<li><a href="/list?clarge=스킨케어&cmedium=&csmall=&order=">스킨케어</a></li>
						<li><a href="/list?clarge=메이크업&cmedium=&csmall=&order=">메이크업</a></li>
						<li><a href="/list?clarge=향수/헤어/바디&cmedium=&csmall=&order=">향수/헤어/바디</a></li>
						<li><a href="/list?clarge=가방/지갑&cmedium=&csmall=&order=">가방/지갑</a></li>
						<li><a href="/list?clarge=패션/잡화&cmedium=&csmall=&order=">패션/잡화</a></li>
						<li><a href="/list?clarge=스포츠/레저&cmedium=&csmall=&order=">스포츠/레저</a></li>
						<li><a href="/list?clarge=전자/리빙&cmedium=&csmall=&order=">전자/리빙</a></li>
						<li><a href="/list?clarge=식품&cmedium=&csmall=&order=">식품</a></li>
					</ul>
				</div>

				<div>
					<c:choose>
						<c:when test="${category.cmedium ne ''}">
							<strong>${category.cmedium}</strong>
						</c:when>
						<c:otherwise>
							<strong>전체</strong>
						</c:otherwise>
					</c:choose>
					<ul style="display: none;">
						<c:forEach items="${cateMedList}" var="cMed">
							<li><a href="/list?clarge=${category.clarge}&cmedium=${cMed}&csmall=&order=">${cMed}</a></li>
						</c:forEach>
					</ul>
				</div>
				
				<c:if test="${category.cmedium ne ''}">
				<div>
					<c:choose>
						<c:when test="${category.csmall ne ''}">
							<strong>${category.csmall}</strong>
						</c:when>
						<c:otherwise>
							<strong>전체</strong>
						</c:otherwise>
					</c:choose>
					<ul style="display: none;">
						<c:forEach items="${cateSmallList}" var="cSmall">
							<li><a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${cSmall}&order=">${cSmall}</a></li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
			</section>
		</article>
	</div>
	<article id="content">
		<section>
			<div class="productlist">
				<!-- 선택한 카테고리 명 띄우기 -->
				<h2 class="page_tit">
					<c:choose>
						<c:when test="${category.csmall ne ''}">
							<strong>${category.csmall}</strong>
						</c:when>
						<c:when test="${category.cmedium ne ''}">
							<strong>${category.cmedium}</strong>
						</c:when>
						<c:otherwise>
							<strong>${category.clarge}</strong>
						</c:otherwise>
					</c:choose>

				</h2>
				<!-- 선택한 카테고리의 하위카테고리 목록 표로 띄우기 -->
				<table class="depthlist">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
					</colgroup>

					<tbody>
						<c:forEach items="${cateList}" var="cate" varStatus="status">
							<c:if test='${status.count eq 1}'>
								<tr>
									<c:choose>
									<c:when test="${category.cmedium eq ''}">
										<td><a href="/list?clarge=${category.clarge}&cmedium=&csmall=&order=">전체</a></td>
									</c:when>
									<c:when test="${category.csmall eq ''}">
										<td><a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=&order=">전체</a></td>
									</c:when>
									</c:choose>
							</c:if>
							<c:choose>
								<c:when test="${category.csmall eq ''}">
									<c:if test='${status.index%4 eq 3}'>
										<tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test='${status.index%4 eq 0}'>
										<tr>
									</c:if>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
							<c:when test="${category.cmedium eq ''}">
								<td><a href="/list?clarge=${category.clarge}&cmedium=${cate}&csmall=&order=">${cate}</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${cate}&order=">${cate}</a></td>
							</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${category.csmall eq ''}">
									<c:if test='${status.index%4 eq 2}'>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test='${status.index%4 eq 3}'>
										</tr>
									</c:if>
								</c:otherwise>
							</c:choose>
							
							
						</c:forEach>

					</tbody>
				</table>
				<div class="filter_wrap goosFilterTabArea mt60">

					<input type="hidden" id="startPrice" value="0"> <input
						type="hidden" id="endPrice" value="3411">

					<table>
						<colgroup>
							<col style="width: 160px">
							<col>
						</colgroup>
						<tbody>
							<tr data-seq="1" data-type="shoppingInfo">
								<th>쇼핑정보
									<div class="check_all_group shoppingInfoFilterCnt"
										style="display: none;">
										<span class="count" id="shoppingInfoFilterCnt"></span>
										<button type="button" class="btn_all_x"
											onclick="searchTabInit(1);" title="전체 해제"></button>
									</div>
								</th>
								<td>
									<div class="check_group">
										<span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterSoldOutYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterSoldOutYn"><strong>품절 상품 제외</strong></label>
										</span>
										<span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterNewGoosYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterNewGoosYn">신상품</label>
										</span>
										<span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterDcYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterDcYn">세일</label>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th data-seq="2" data-type="price">가격
									<div class="check_all_group priceFilterCnt"
										style="display: none;">
										<span class="count" id="priceFilterCnt"></span>
										<button type="button" class="btn_all_x"
											onclick="searchTabInit(2);" title="전체 해제"></button>
									</div>
								</th>
								<td>
									<div class="check_group priceCheckGroup" style="">
										<span> <input type="checkbox" name="priceFilter"
											id="priceFilter01" data-str="0" data-end="100" data-pos="2"
											class="filter_checkbox" value="1"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter01">$0~100</label>
										</span> <span> <input type="checkbox" name="priceFilter"
											id="priceFilter02" data-str="100" data-end="200" data-pos="2"
											class="filter_checkbox" value="2"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter02">$100~200</label>
										</span> <span> <input type="checkbox" name="priceFilter"
											id="priceFilter03" data-str="200" data-end="300" data-pos="2"
											class="filter_checkbox" value="3"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter03">$200~300</label>
										</span> <span> <input type="checkbox" name="priceFilter"
											id="priceFilter04" data-str="300" data-end="400" data-pos="2"
											class="filter_checkbox" value="4"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter04">$300~400</label>
										</span> <span> <input type="checkbox" name="priceFilter"
											id="priceFilter05" data-str="400" data-end="500" data-pos="2"
											class="filter_checkbox" value="5"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter05">$400~500</label>
										</span> <span> <input type="checkbox" name="priceFilter"
											id="priceFilter06" data-str="500" data-end="1000"
											data-pos="2" class="filter_checkbox" value="6"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter06">$500~1,000</label>
										</span> <span> <input type="checkbox" name="priceFilter"
											id="priceFilter07" data-str="1000" data-end="0" data-pos="2"
											class="filter_checkbox" value="7"
											onclick="searchTabFocus('priceFilter',2);"> <label
											for="priceFilter07">$1,000 ~</label>
										</span>
									</div>
									<div class="input_group1 price">
										<span>직접입력</span> <span class="input_w"> <em>$</em> <input
											type="number" name="priceFilterStr" id="priceFilterStr"
											data-pos="2" min="0" maxlength="8" value="0">
										</span> ~ <span class="input_w"> <em>$</em> <input
											type="number" name="priceFilterEnd" id="priceFilterEnd"
											data-pos="2" min="0" maxlength="8" value="3411">
										</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="filter_onoff">
						<button>열기/닫기</button>
					</div>
					<div class="search_btnarea">
						<button class="reset_btn" onclick="goosSearchItemInit('Y');">
							<i class="ico_s reset"></i> 초기화
						</button>
						<a href="javascript:" onclick="goosSearchItemFilter('Y');"
							class="search_btn">검색</a>
					</div>
					<div class="sel_filter" style="display: none;">
						<ul class="searchFilterArea"></ul>
					</div>
				</div>
				<div class="sorting_wrap">
					<span class="txt_total">총 <strong id="goosListTotCnt">${totalProducts}</strong>개</span>
					<!-- <input type="hidden" name="reGoosListTotCnt" id="reGoosListTotCnt"
						value="454"> <input type="hidden" name="reGoosListTotPage"
						id="reGoosListTotPage" value="12"> <input type="hidden"
						name="filterResearchYn" id="filterResearchYn" value="N"> -->
					<!-- 정렬선택 -->
					<div class="sort_r">
						<select id="goodsListOrder" class="goodsListOrder" onchange="prodOrder(this.value)">
							<option hidden="" disabled="disabled" selected="selected" value="${order}">${order}</option>
							<option value="베스트순">베스트순</option>
							<option value="신상품순">신상품순</option>
							<option value="낮은가격순">낮은가격순</option>
							<option value="높은가격순">높은가격순</option>
							<option value="높은할인순">높은할인순</option>
						</select>
					</div>
				</div>
				<div class="product_list goosMoreArea">
					<ul>
						<c:forEach items="${list}" var="product" varStatus="status">
							<li data-gooscd="10079280002701" data-minbuyqty="1"
								class="product_itme goosList 10079280002701"><span
								class="chk nolabel"> <input type="checkbox"
									name="goosChk" value="10079280002701" id="10079280002701_1"
									data-stat="1" data-minqty="1" data-index="1"
									data-price="46886.0" data-priceus="37.0" data-stoc="46">
									<label for="10079280002701_1">선택</label>
							</span> <a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10079280002701">
									<div class="img_w">
										<img data-src="${product.img1}" src="${product.img1}"
											alt="${product.pname}"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=212X212';"
											class="lazy-loaded">
										<div class="on_btn">
											<!-- <div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div> -->
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10079280002701', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10079280002701', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">${product.pbrand}</p>
										<p class="tx_ex goosNm">${product.pname}</p>
										<p class="price1" style="height: 19px;">
											<del>&#36;${product.pprice}</del>
											<strong>${product.pdiscount}&#37;</strong>
										</p>
										<p class="price2">
											<strong data-price="37.0">&#36;<fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))}"
													pattern="#,##0.##" /></strong> <span data-price="46886.0"> <fmt:formatNumber
													value="${product.pprice*1267}" pattern="#,#00" /> <em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
	</article>
</main>
<!--페이지 번호 처리  -->
<div class="paging" style="display: block;">
	<input type="hidden" class="clarge" value="${category.clarge}">
	<input type="hidden" class="cmedium" value="${category.cmedium}">
	<input type="hidden" class="csmall" value="${category.csmall}">
	<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">

	<c:if test="${pageMaker.prev}">
		<a class="prev2"
			href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&order=${order}&pageNum=1">
			<< </a>
		<!-- 이전 버튼 -->
		<a class="prev"
			href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&order=${order}&pageNum=${pageMaker.startPage - 1}">Previous</a>
	</c:if>

	<!-- 1~10 버튼 -->
	<span class="num"> <c:forEach var="num"
			begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
				<a
					href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&order=${order}&pageNum=${num}"
					class="pageBtn">${num}</a>
			</c:if>
		</c:forEach>
	</span>  
	<c:if test="${pageMaker.next}">
		<!-- 다음 버튼 -->
		<a
			href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&order=${order}&pageNum=${pageMaker.endPage +1}"
			class="next">Next</a>
		<a class="next2"
			href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&order=${order}&pageNum=${pageMaker.realEnd}">>></a>
	</c:if>

</div>
<!--  end Pagination -->
<%@ include file="/WEB-INF/views/common/Footer.jsp"%>

