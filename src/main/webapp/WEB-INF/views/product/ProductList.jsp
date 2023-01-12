<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>

<main id="container">
	<div class="location_all">
		<article class="location">
			<section class="box">
				<a href="https://www.hddfs.com/shop/dm/main.do" class="home">홈</a>

				<div>
					<strong>스킨케어</strong>
					<ul style="display: none;">
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0001">스킨케어</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0002">메이크업</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0003">향수/헤어/바디</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0004">가방/지갑</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0005">시계/쥬얼리</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0007">패션/잡화</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0013">스포츠/레저</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0008">전자/리빙</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0009">식품</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0010">유아동</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0011">국내브랜드</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0012">Adult
								(19)</a></li>
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
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000101">기초케어</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000102">선케어</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000103">클렌징</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000104">마스크팩</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000105">유아동</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000106">남성용</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000107">미용기기/도구</a></li>
					</ul>
				</div>

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
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010101">스킨/토너</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010102">에센스</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010103">크림</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010104">로션</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010105">페이스오일</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010106">미스트</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010107">기초케어세트</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010108">스페셜케어</a></li>
					</ul>
				</div>

			</section>
		</article>
	</div>
	<article id="content">
		<section>
			<div class="productlist">
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
									<td>전체</td>
							</c:if>
							<c:if test='${status.index%4 eq 3}'>
								<tr>
							</c:if>
							<td>${cate}</td>
							<c:if test='${status.index%4 eq 2}'>
								</tr>
							</c:if>
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
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterLgoosYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterLgoosYn">명품 브랜드 상품</label>
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterPrlIptYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterPrlIptYn">병행 수입 상품</label>
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterBigSaleYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterBigSaleYn">바겐 세일</label>
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterNewGoosYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterNewGoosYn">신상품</label>
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterCupYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterCupYn">쿠폰</label>
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterDcYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterDcYn">세일</label>
										</span> <span> <input type="checkbox" name="shopFilter"
											value="Y" id="filterFregfYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterFregfYn">사은 행사</label>
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
					<!-- <span class="txt_total">총 <strong id="goosListTotCnt">454</strong>개</span> -->
					<input type="hidden" name="reGoosListTotCnt" id="reGoosListTotCnt"
						value="454"> <input type="hidden" name="reGoosListTotPage"
						id="reGoosListTotPage" value="12"> <input type="hidden"
						name="filterResearchYn" id="filterResearchYn" value="N">
					<div class="sort_r">
						<select id="goodsListOrder" class="goodsListOrder">
							<option value="new">신상품순</option>
							<option value="priceAsc">낮은가격순</option>
							<option value="priceDesc">높은가격순</option>
							<option value="dcRate">높은할인순</option>
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
											alt="베르니 아 레브르 바이닐 크림 틴트#416"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=212X212';"
											class="lazy-loaded">
										<div class="on_btn">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
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
											<strong data-price="37.0">&#36;<fmt:formatNumber value="${product.pprice*(1-(product.pdiscount/100))}"  pattern="#,##0.##" /></strong> 
											<span
												data-price="46886.0"> <fmt:formatNumber
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
<!-- 김가희 페이지 번호 처리  -->
<div class="paging" style="display: block;">
	<input type="hidden" class="clarge" value="${category.clarge}">
	<input type="hidden" class="cmedium" value="${category.cmedium}">
	<input type="hidden" class="csmall" value="${category.csmall}">
	<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
	<a class="prev2" href="#"></a>
	<c:if test="${pageMaker.prev}">
		<!-- 이전 버튼 -->
		<a class="prev"
			href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&pageNum=${pageMaker.startPage - 1}">Previous</a>
	</c:if>

	<!-- 1~10 버튼 -->
	<span class="num">
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
				<a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&pageNum=${num}"
					class="pageBtn">${num}</a>
			</c:if>
		</c:forEach>
	</span>  
	<c:if test="${pageMaker.next}">
		<!-- 다음 버튼 -->
		<a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&pageNum=${pageMaker.endPage +1}"
			class="next">Next</a>
	</c:if>
	<a class="next2" href="#"></a>
</div>
<!--  end Pagination -->
<%@ include file="/WEB-INF/views/common/Footer.jsp"%>

