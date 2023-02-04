<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://ssl.pstatic.net/sstatic/keypage/outside/scui/airport_condition/css/cs_airport_condition_211012.css"
    rel="stylesheet" type="text/css">
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
<%-- <div>
<ul>
<c:forEach items="${cnt}" var="hour" begin="0" end="1">
	<c:forEach items="${hour}" var="i">
		<li>${hour} : ${i}</li>
	</c:forEach>
	<hr>
</c:forEach>
</ul>
</div> --%>
<div class="api_subject_bx">
    <div class="cs_airport_condition _cs_airport_delay_person">
        <div class="_main_content">
            <div class="substance">
                <div class="day_tap sub">
                    <h4 class="blind">시간대별 예상 승객수</h4>
                </div>
                <div class="gate_detail _sub1_content">
                    <div class="th_scroll">
                        <table cellpadding="0" cellspacing="0">
                            <caption class="blind">시간대별 예상 승객수</caption>
                            <colgroup>
                                <col style="width:110px">
                                <col style="width:110px">
                                <col style="width:110px">
                                <col style="width:110px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span class="blind">인도장</span></th>
                                    <th><span class="gate_num">인천공항 T1</span></th>
                                    <th><span class="gate_num">인천공항 T2</span></th>
                                    <th><span class="gate_num">김포공항</span></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tb_scroll _schedule" data-done="true">
                        <table cellpadding="0" cellspacing="0" style="text-align: center;">
                            <caption class="blind">시간대별 예상 승객수</caption>
                            <colgroup>
                                <col style="width:110px">
                                <col style="width:110px">
                                <col style="width:110px">
                                <col style="width:110px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><span class="blind">인도장</span></th>
                                    <th><span class="gate_num">인천공항 T1</span></th>
                                    <th><span class="gate_num">인천공항 T2</span></th>
                                    <th><span class="gate_num">김포공항</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<tr class="_item" data-start="00:00:00" data-end="00:59:59" data-idx="0">
                                <th scope="row" class="txt_l"> 오전 <span class="num">0</span>시 </th>
                            	<c:forEach items="${cnt}" var="hour" begin="0" end="0">
									<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    	<td>
                                    	<span class="step1">
                                    	${i}
                                    	</span>
                                    	명
                                    	</td>
                                    	</font>
									</c:forEach>
								</c:forEach>
                                </tr>
                                <tr class="_item" data-start="01:00:00" data-end="01:59:59" data-idx="1">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">1</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="1" end="1">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="02:00:00" data-end="02:59:59" data-idx="2">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">2</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="2" end="2">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="03:00:00" data-end="03:59:59" data-idx="3">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">3</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="3" end="3">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="04:00:00" data-end="04:59:59" data-idx="4">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">4</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="4" end="4">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="05:00:00" data-end="05:59:59" data-idx="5">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">5</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="5" end="5">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="06:00:00" data-end="06:59:59" data-idx="6">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">6</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="6" end="6">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="07:00:00" data-end="07:59:59" data-idx="7">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">7</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="7" end="7">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="08:00:00" data-end="08:59:59" data-idx="8">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">8</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="8" end="8">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="09:00:00" data-end="09:59:59" data-idx="9">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">9</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="9" end="9">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="10:00:00" data-end="10:59:59" data-idx="10">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">10</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="10" end="10">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="11:00:00" data-end="11:59:59" data-idx="11">
                                    <th scope="row" class="txt_l"> 오전 <span class="num">11</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="11" end="11">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="12:00:00" data-end="12:59:59" data-idx="12">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">12</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="12" end="12">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="13:00:00" data-end="13:59:59" data-idx="13">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">1</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="13" end="13">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="14:00:00" data-end="14:59:59" data-idx="14">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">2</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="14" end="14">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item on" data-start="15:00:00" data-end="15:59:59" data-idx="15">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">3</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="15" end="15">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="16:00:00" data-end="16:59:59" data-idx="16">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">4</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="16" end="16">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="17:00:00" data-end="17:59:59" data-idx="17">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">5</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="17" end="17">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="18:00:00" data-end="18:59:59" data-idx="18">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">6</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="18" end="18">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="19:00:00" data-end="19:59:59" data-idx="19">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">7</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="19" end="19">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="20:00:00" data-end="20:59:59" data-idx="20">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">8</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="20" end="20">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="21:00:00" data-end="21:59:59" data-idx="21">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">9</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="21" end="21">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="22:00:00" data-end="22:59:59" data-idx="22">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">10</span>시 </th>
                                    <c:forEach items="${cnt}" var="hour" begin="22" end="22">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                                <tr class="_item" data-start="23:00:00" data-end="23:59:59" data-idx="23">
                                    <th scope="row" class="txt_l"> 오후 <span class="num">11</span>시 </th>
                                     <c:forEach items="${cnt}" var="hour" begin="23" end="23">
										<c:forEach items="${hour}" var="i" begin="0" end="2">
                                    		<td><span class="step1">${i}</span>명</td>
										</c:forEach>
									</c:forEach>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="legend_area">
                    <p class="info"><a nocr=""
                        onclick="popup();return false;"
                         class="layer_close _close">기준시간당 승객수<span class="ico_info _trigger"></span></a>
                    </p>
                    <ul style="list-style:none;">
                        <li><span class="step1"><em>파란색</em>원활</span></li>
                        <li><span class="step3"><em>노란색</em>적정</span></li>
                        <li><span class="step5"><em>빨간색</em>혼잡</span></li>
                    </ul>
                </div>
                <div class="airport_popup _popup" id="airport_popup _popup" style="display:none">
                <div class="pop_header"> <strong>혼잡도 기준</strong> <a nocr=""
                        onclick="goOtherTCR(this, 'a=nco_xw9*1.pcl&amp;r=1&amp;i=8816765e_0000009EC2A0');return false;"
                        href="javascript:;" class="layer_close _close"></a>
                </div>
                <div class="pop_content">
                    <ul>
                        <li> <strong class="number_of_cust"><em>파란색</em>원활</strong> <span class="people_total"><span
                                    class="num">210</span>명 미만</span> </li>

                        <li> <strong class="step3"><em>노란색</em>적정</strong> <span class="people_total"><span
                                    class="num">210~390</span>명</span> </li>

                        <li> <strong class="step5"><em>빨간색</em>혼잡</strong> <span class="people_total">
                                <span class="num">390</span>명 초과<br>
                        </li>
                    </ul>
                </div>
            </div>
            </div>
            
        </div>

    </div>
</div>

<script>
function popup(){
	console.log("누름");
	$('#airport_popup _popup').css('display', 'block');
}
</script>
<!-- <script>
    $( document ).ready(function() {
    let span_text = document.querySelectorAll('number_of_cust');
    
});
</script> -->