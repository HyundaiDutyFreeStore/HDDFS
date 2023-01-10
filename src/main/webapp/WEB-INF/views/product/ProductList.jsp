<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<body>
<main id="container">
<div class="location_all">
<article class="location">
    <section class="box">
        <a href="https://www.hddfs.com/shop/dm/main.do" class="home">홈</a>
        
        <div>
	            <strong>스킨케어</strong>
	            <ul style="display: none;">
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0001">스킨케어</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0002">메이크업</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0003">향수/헤어/바디</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0004">가방/지갑</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0005">시계/쥬얼리</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0007">패션/잡화</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0013">스포츠/레저</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0008">전자/리빙</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0009">식품</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0010">유아동</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0011">국내브랜드</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=0012">Adult (19)</a></li>
	                </ul>
	        </div>
	         
        	<div>
	            <strong>기초케어</strong>
	            <ul style="display: none;">
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000101">기초케어</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000102">선케어</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000103">클렌징</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000104">마스크팩</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000105">유아동</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000106">남성용</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=000107">미용기기/도구</a></li>
	                </ul>
	        </div>
	         
        	<div>
	            <strong>스킨/토너</strong>
	            <ul style="display: none;">
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010101">스킨/토너</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010102">에센스</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010103">크림</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010104">로션</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010105">페이스오일</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010106">미스트</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010107">기초케어세트</a></li>
	                <li><a href="https://www.hddfs.com/shop/dm/ctg/category.do?goosCtgId=00010108">스페셜케어</a></li>
	                </ul>
	        </div>
	         
</section>
</article>
</div>
<article id="content">
<section>
<div class="productlist">
<div class="sorting_wrap">
	    <!-- <span class="txt_total">총 <strong id="goosListTotCnt">454</strong>개</span> -->
	    <input type="hidden" name="reGoosListTotCnt" id="reGoosListTotCnt" value="454">
	    <input type="hidden" name="reGoosListTotPage" id="reGoosListTotPage" value="12">
	    <input type="hidden" name="filterResearchYn" id="filterResearchYn" value="N">
	    <div class="sort_r">
	        <select id="goodsListOrder" class="goodsListOrder">
	            <option value="new">신상품순</option>
	            <option value="priceAsc">낮은가격순</option>
	            <option value="priceDesc">높은가격순</option>
	            <option value="dcRate">높은할인순</option>
	        </select>
	    </div>
</div>
<div class="product_list goosMoreArea ">
    <ul>
    	<c:forEach items="${list}" var="product" varStatus="status">
        <li data-gooscd="10079280002701" data-minbuyqty="1" class="product_itme goosList 10079280002701">
            <span class="chk nolabel">
                <input type="checkbox" name="goosChk" value="10079280002701" id="10079280002701_1" data-stat="1"
                    data-minqty="1" data-index="1" data-price="46886.0" data-priceus="37.0" data-stoc="46">
                <label for="10079280002701_1">선택</label>
            </span>
            <a href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10079280002701">
                <div class="img_w">
                	<img
                        data-src="${product.img1}"
                        src="${product.img1}"
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
                    <p class="price1" style="height:19px;">
                        ${product.pdiscount}&#37;</p>
                    <p class="price2">
                        <strong data-price="37.0">&#36;${product.pprice}</strong>
                        <span data-price="46886.0">
                        <fmt:formatNumber value="${product.pprice*1267}" pattern="#,#00"/>
                        <em>원</em></span>
                    </p>
                    <div class="por_icons">
                        <span>세일</span></div>
                </div>
            </a>
        </li>
        </c:forEach>
    </ul>
</div>
</div>
</section>
</article>
</main>
<%@ include file="/WEB-INF/views/common/Footer.jsp"%>

