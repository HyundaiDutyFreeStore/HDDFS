<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  
 * ProductList.jsp
 * 
 * @author 김가희
 * @since 01.15
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.15    김가희                        최초 생성
 *        
-->
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<!-- 정렬방식 선택시 이동 -->
<script>
const Presenturl = new URL(window.location.href);
const urlParams = Presenturl.searchParams;
//상품목록 리로드
function prodLoad(Purl,page){
	console.log("prodLoad함수 인자 url: "+Purl);
	var productArr;
	$.ajax({
		type : 'GET',
		url : "/product/filter?"+Purl,
		data : {pageNum : page},
		success: function(data){
			console.log("ajax성공");
			rate = data.rate;
			order = data.order;
			ppage = data.ppage;
			prodCnt = data.total;
			prodArr = data.products;
			
			console.log("정렬"+order);
			console.log("현재페이지"+ppage);
			//console.log(prodArr);
			
			//상품총개수 띄우기
			let total_html = "";
			
			total_html += "<span class='txt_total'>";
			total_html += "총 <strong id='goosListTotCnt'>" ;
			total_html += prodCnt ;
			total_html += "</strong>개</span>";
			
			total_html += "<div class='sort_r'>";
			total_html += "<select id='goodsListOrder' class='goodsListOrder' onchange='prodOrder(this.value)'>";
			total_html += "<option hidden disabled selected value='"+ order +"'>"+order+"</option>";
			total_html += "<option value='베스트순'>베스트순</option>";
			total_html += "<option value='신상품순'>신상품순</option>";
			total_html += "<option value='낮은가격순'>낮은가격순</option>";
			total_html += "<option value='높은가격순'>높은가격순</option>";
			total_html += "<option value='높은할인순'>높은할인순</option>";
			total_html += "</select>";
			total_html += "</div>";
			
			
			
			$(".sorting_wrap").html(total_html);
			
			//상품목록 띄우기
			let prod_html = "";
			
			for(let i=0; i<prodArr.length;i++){
				let product = prodArr.at(i);
				let pcode = product.pcode;
				let pname = product.pname;
				let pbrand = product.pbrand;
				let pprice = product.pprice;
				let pdiscount = product.pdiscount;
				let img1 = product.img1;
				
				let ppriceDC = Math.round(pprice*(1-(pdiscount / 100) )*100) /100;	//세일가격 소수점2째자리까지 반올림
				let pwon1 = Math.round(ppriceDC * rate); //환율적용 원화가격
				let pwon2 = pwon1.toString().replace(/\B(?=(\d{3})+(?!\d))/g,','); //원화가격 콤마
				//console.log("dc: "+pprice*(1-(pdiscount/100)));
				
				let tmp="";
				tmp += "<li class='product_itme goosList 10079280002701'>";
				tmp += "<a href='/product/Productdetail?pcode="+pcode+"'>";
				tmp += "<div class='img_w'>";
				tmp += "<img data-src='" + img1 + "' src='" + img1 + "' alt='" +pname +"'"
					   +"class='lazy-loaded'>";
				//장바구니,바로가기버튼 들어갈곳 - div class="on_btn"
				tmp += "</div>"	//img_w div끝
				
				tmp += "<div class='pro_i'>";
				tmp += "<p class='ti_brand'>"+pbrand+"</p>";
				tmp += "<p class='tx_ex goosNm'>"+pname+"</p>";
				tmp += "<p class='price1' style='height: 19px;'>";
				tmp += "<del>&#36;"+pprice+"</del>";
				tmp += "<strong>"+pdiscount+"&#37;</strong>";
				tmp +="</p>"
				tmp += "<p class='price2'>";
				tmp += "<strong>&#36;";
				tmp += ppriceDC;
				tmp += "</strong>";
				tmp += "<span>" + pwon2 + "<em>원</em> </span>";
				//console.log(tmp);
				prod_html += tmp;
			}
			$("#listBody").html(prod_html);
			showProductPage(Purl,prodCnt,page);
		}	
	});
	
}

//가격필터는 한가지 종류만 선택가능 (직접입력 / 필터선택)
$(function(){
	//가격 직접 입력 클릭 시 가격필터선택 초기화
	$("#priceFilterStr,#priceFilterEnd").on("focus", function(){
		$("input[name='priceFilter']").prop("checked",false);		
	});
	
	//가격 필터 선택시 가격 직접입력 초기화
	$("input[name='priceFilter']").on('click', function() {
	      if ($(this).prop('checked') ) {
	    	//가격직접 입력 초기화
	    	$("input[name=priceFilterStr]").val(0);
	    	$("input[name=priceFilterEnd]").val(0);
	      }
	  });
});

//필터선택된거 체크
function filterChk(){
	var filterUrl = "";
	
	var shopFilterLength = $("input[name='shopFilter']:checked").length;
	if(shopFilterLength > 0){
		var filterList2 = "";
		$("input[name='shopFilter']:checked").each(function(){
			var filterId = $(this).attr("id");
			console.log("filterId: "+filterId);
			if(filterId=="filterSoldOutYn"){
				filterList2 += "X"
			}
			if(filterId=="filterNewGoosYn"){
				filterList2 += "N"
			}
			if(filterId=="filterDcYn"){
				filterList2 += "S"
			}
		});
		filterUrl += "&type="+filterList2;
	}
	
	
	//가격정보
	var priceFilterLength = $("input[name='priceFilter']:checked").length;
	if(priceFilterLength>0){
		var priceFilter = "";
		
		$("input[name='priceFilter']:checked").each(function(){
			var priceLevel = $(this).val();
			console.log("가격필터: "+priceLevel);
			priceFilter += priceLevel;
		});
		filterUrl += "&priceFilter="+priceFilter;
	}
	
	var strPrice = parseInt($("#priceFilterStr").val());
	var endPrice = parseInt($("#priceFilterEnd").val());
	if(endPrice>0){
		filterUrl += '&priceS='+strPrice +'&priceE='+endPrice;
	}
	
	
	return filterUrl;
}

//정렬방식 바꿀 때
function prodOrder(str){
	console.log("정렬방식: "+str);
	var purl = urlParams +'&order='+str+ filterChk();
	console.log("정렬: "+purl);
	prodLoad(purl,1);
}



//필터설정 후 검색버튼눌렀을 때
function goosSearchItemFilter(researchYn){
	//선택된 필터 표시할 html
	var html = "";
	
	//-----------쇼핑정보 필터------------------
	//쇼핑정보 필터선택개수 표시
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
	//적용한 필터 표시
	$("input[name='shopFilter']:checked").each(function(){
		var txt = $(this).next("label").text();
		var pos = $(this).data("pos");
		var filterId = $(this).attr("id");
		//html+="<li>"+txt+" <button class='ic_x' data-id='"+this.id+"' data-name='"+this.name+"' data-pos='"+pos+"'onclick=\"removeSearchItem(this,'"+this.id+"','"+this.name+"','"+pos+"');\">x</button></li>";
		html+="<li>"+txt+"</li>";
	});
	
	//----------- 가격 필터------------------
	//가격 직접 입력
	var strPrice = parseInt($("#priceFilterStr").val());
	var endPrice = parseInt($("#priceFilterEnd").val());
	var strPrice2 = $("#priceFilterStr").val();
	var endPrice2 = $("#priceFilterEnd").val();
	//가격 직접 입력시 유효성검사
	if(strPrice > endPrice || strPrice2 == null || endPrice2 == null || strPrice2 == "" || endPrice2 == ""){
			alert("가격범위를 다시 확인해주세요."); /* 가격범위를 다시 확인해주세요.*/
			return false;
	}
	//가격직접입력 적용한 필터 표시
	if(strPrice>=0 && endPrice>0){
		html+="<li>$"+strPrice2+"~"+endPrice2+"</li>";
	}
	
	//가격 필터선택개수 표시
	var priceFilterLength = $("input[name='priceFilter']:checked").length;
	if(priceFilterLength > 0){
		$("#priceFilterCnt").html( priceFilterLength > 0 ?  " "+priceFilterLength : "");
		$(".priceFilterCnt").show();
		$(".priceFilterCnt").find("button").show();
	}else{
		$("#priceFilterCnt").html( priceFilterLength > 0 ?  " "+priceFilterLength : "");
		$(".priceFilterCnt").hide();
		$(".priceFilterCnt").find("button").hide();
	}

	//가격필터 적용한 필터 표시
	$("input[name='priceFilter']:checked").each(function(){
		var txt = $(this).next("label").text();
		var pos = $(this).data("pos");
		var priceLevel = $(this).val();
		html+="<li>"+txt+"</li>";
	});

	//현재URL(카테고리선택)+필터적용 새 url만들기
	var Purl = urlParams+filterChk();

	
	//필터에 맞춰 상품목록 다시 띄우기
	prodLoad(Purl,1);
	
	//적용된 필터 표시하기
	$(".searchFilterArea").html(html);
	if($(".searchFilterArea > li").length <1){
		$(".sel_filter").hide();
	}else{
		$(".sel_filter").show();
	}
}

//필터 초기화
function goosSearchItemInit(reloadYn) {
	 $("input[name='shopFilter']").prop("checked", false); // 쇼핑정보 체크표시 초기화	
     $("input[name='priceFilter']").prop("checked", false); // 가격 체크표시 초기화
     
     //가격직접 입력 초기화
     $("input[name=priceFilterStr]").val(0);
	 $("input[name=priceFilterEnd]").val(0);
	
     //쇼핑정보 필터선택개수 초기화
     $(".shoppingInfoFilterCnt").hide();
	 $(".shoppingInfoFilterCnt").find("button").hide();
	//가격정보 필터선택개수 초기화
     $(".priceFilterCnt").hide();
	 $(".priceFilterCnt").find("button").hide();
	
	//적용된 필터보여주는 창 숨기기
     $(".sel_filter").hide();
	
	//카테고리 적용만 된 url(필터초기화)로 상품목록 리로드
     prodLoad(urlParams,1);
}
    
</script>
<main id="container">
	<div class="location_all">
		<article class="location">
			<!-- #######################이동네비게이션 S, 검색어 보여주기 ####################### -->
			<section class="box">
				<a href="/" class="home">홈</a>

				<div>
					 ${cri.keyword} 검색결과
<%-- 					<strong>${cri.keyword}</strong> --%>
				</div>
			</section>
			<!-- ********************** 이동네비게이션 E ********************** -->
		</article>
	</div>
	<article id="content">
		<section>
			<div class="productlist">
				<!-- ####################### 검색어 띄우기 S ####################### -->
				<h2 class="page_tit">
						<strong>'${cri.keyword}' 검색결과</strong>
				</h2>
				<!-- ********************** 검색어 띄우기 E ********************** -->
				
				<!-- ####################### 필터 선택 S ####################### -->
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
											value="Y" id="filterNewGoosYn" data-pos="1"
											class="filter_checkbox"
											onclick="searchTabFocus('shopFilter',1);"> <label
											for="filterNewGoosYn">신상품</label>
										</span> <span> <input type="checkbox" name="shopFilter"
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
											data-pos="2" min="0" maxlength="8" value="0">
										</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="filter_onoff">
						<!-- <button>열기/닫기</button> -->
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
				<!-- ********************** 필터 선택 E ********************** -->
				
				<div class="sorting_wrap" id="totalAndSort">
					<!-- ####################### 검색결과 상품 총 개수 띄우기 S ####################### -->
					<span class="txt_total">총 <strong id="goosListTotCnt">${searchTotal}</strong>개
					</span>
					<!-- *********************** 검색결과 상품 총 개수 띄우기 E *********************** -->
					
					<!-- <input type="hidden" name="reGoosListTotCnt" id="reGoosListTotCnt"
						value="454"> <input type="hidden" name="reGoosListTotPage"
						id="reGoosListTotPage" value="12"> <input type="hidden"
						name="filterResearchYn" id="filterResearchYn" value="N"> -->
						
					<!-- ####################### 정렬선택 S #######################  -->
					<div class="sort_r">
						<select id="goodsListOrder" class="goodsListOrder"
							onchange="prodOrder(this.value)">
							<option hidden="" disabled="disabled" selected="selected"
								value="${order}">${cri.order}</option>
							<option value="베스트순">베스트순</option>
							<option value="신상품순">신상품순</option>
							<option value="낮은가격순">낮은가격순</option>
							<option value="높은가격순">높은가격순</option>
							<option value="높은할인순">높은할인순</option>
						</select>
					</div>
					<!-- ********************** 정렬선택 E **********************  -->
				</div>
				<div class="product_list goosMoreArea">
					<ul id="listBody">
						<!-- ####################### 상품목록 띄우는 곳 S (리로드시 여기 바뀜) ####################### -->
						<c:forEach items="${list}" var="product" varStatus="status">
							<!-- <li data-gooscd="10079280002701" data-minbuyqty="1"
								class="product_itme goosList 10079280002701"> -->
							<li class="product_itme goosList 10079280002701">
								<!-- <span class="chk nolabel"> 
								<input type="checkbox"
									name="goosChk" value="10079280002701" id="10079280002701_1"
									data-stat="1" data-minqty="1" data-index="1"
									data-price="46886.0" data-priceus="37.0" data-stoc="46">
									<label for="10079280002701_1">선택</label>
								</span>  --> 
								
								<!-- 상품상세 이동 링크 -->
								<a href="/product/Productdetail?pcode=${product.pcode}">
									<div class="img_w">
										<img data-src="${product.img1}" src="${product.img1}"
											alt="${product.pname}"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=212X212';"
											class="lazy-loaded">
										<!-- <div class="on_btn">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10079280002701', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10079280002701', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div> -->
									</div>
									<div class="pro_i">
										<p class="ti_brand">${product.pbrand}</p>
										<p class="tx_ex goosNm">${product.pname}</p>
										<p class="price1" style="height: 19px;">
											<del>&#36;${product.pprice}</del>
											<strong>${product.pdiscount}&#37;</strong>
										</p>
										<p class="price2">
											<!-- <strong data-price="37.0">&#36; -->
											<strong>&#36; <fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))}"
													pattern="#,##0.##" />
											</strong> <span data-price="46886.0"> <fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))*KRW_WON}" pattern="#,#00" /> <em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a>
							</li>
						</c:forEach>
						<!-- ********************** 상품목록 띄우는 곳 E (리로드시 여기 바뀜) ********************** -->
					</ul>
				</div>
			</div>
		</section>
	<!--####################### 페이지 번호 처리 S #######################  -->
	<div class="paging" style="display: block;">
		<c:if test="${pageMaker.prev}">
			<!-- 첫페이지로 -->
			<a class="prev2" href="1"> << </a>
			<!-- 이전 버튼 -->
			<a class="prev" href="${pageMaker.startPage - 1}">prev</a>
		</c:if>

		<!-- 1~10 버튼 -->
		<span class="num"> 
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
				<a href="${num}" class="${pageMaker.cri.pageNum eq num ? 'active':''}">
					${num}
				</a>
			</c:if>
		</c:forEach>
		</span>  
	
		<c:if test="${pageMaker.next}">
		<!-- 다음 버튼 -->
		<a href="${pageMaker.endPage +1}" class="next">next</a>
		<!-- 마지막페이지로 -->
		<a class="next2" href="${pageMaker.realEnd}">>></a>
		</c:if>
	</div>
	<!--********************** 페이지 번호 처리 E **********************  -->
	</article>
</main>


<script>

var pageNum = 1;
var pageNation = $(".paging");
var filterUrl = "";
					
//페이지 번호표시
function showProductPage(url,totalCnt,page) {
	var pageHtml = "";
	filterUrl = url;
	var pagingurl = "/product/filterPaging?"+url+"&total="+totalCnt+"&pageNum="+page;
	console.log("paging찍기 url: "+pagingurl);
	console.log("paging찍기 totalCnt: "+totalCnt);
	$.ajax({
		type : 'GET',
		url : pagingurl,
		success: function(data){
			console.log("paging갓다옴");
			<!-- prev 버튼 -->
			if(data.prev){
				pageHtml += "<a class='prev2' href='";
				pageHtml += 1;
				pageHtml += "'> << </a>";
				pageHtml += "<a class='prev' href='";
				pageHtml += data.startPage-1;
				pageHtml += "'> prev </a>";
			}
       
			pageHtml += "<span class='num'>";
			for(var i=data.startPage; i<=data.endPage; i++) {
				pageHtml += "<a href='"+i+"'";
				console.log("i: "+i+" pageNum: "+"${pageMaker.cri.pageNum}");
				if(i==ppage){
					pageHtml += "class='active'";
				}
				pageHtml += ">" + i + "</a>";
			}
			pageHtml += "</span>";
			
			<!-- next 버튼 -->
			if(data.next){
				pageHtml += "<a class='next' href='";
				pageHtml += data.endPage+1;
				pageHtml += "'> next </a>";
				pageHtml += "<a class='next2' href='";
				pageHtml += data.realEnd;
				pageHtml += "'> >> </a>";
			}
			pageNation.html(pageHtml);
		}
	});
}

//페이지 눌렀을 때 이동
$(".paging").on("click", "a", function(e) {
	e.preventDefault(); //<a> 동작 중지
	console.log("page click");
	
	if(filterUrl===""){
		var Presenturl = new URL(window.location.href);
		var urlParams = Presenturl.searchParams;  
		console.log("이시점 urlParams:"+urlParams);
		filterUrl = urlParams;
	}
	console.log("필터url: "+filterUrl);
	//누른 페이지넘버 가져오기	 
	var targetPageNum = $(this).attr("href");       
	console.log("targetPageNum: " + targetPageNum);
	//해당페이지 상품띄우기
	prodLoad(filterUrl,targetPageNum);
	//위로이동
	window.scrollTo(0,200);
});
</script>

<%@ include file="/WEB-INF/views/common/Footer.jsp"%>

