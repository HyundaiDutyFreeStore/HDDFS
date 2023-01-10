<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>

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
                    <p class="tx_key">H.COS FACE 체험 (모바일)</p>
                    <p class="tx_ex goosNm">${product.pname}</p>
                    <p class="price1" style="height:19px;">
                        ${product.pdiscount}</p>
                    <p class="price2">
                        <strong data-price="37.0">${product.pprice}</strong>
                        <span data-price="46886.0">46,886<em>원</em></span>
                    </p>
                    <div class="por_icons">
                        <span>세일</span></div>
                </div>
            </a>
        </li>
        </c:forEach>
    </ul>
</div>
