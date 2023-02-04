package com.hyundai.dutyfree.service;

import com.hyundai.dutyfree.vo.MemberVO;

/**
 * MemberService
 *
 * @author 김찬중, 김가희
 * @since 01.12
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.12	 김찬중				최초 생성
 * 2023.01.17    김가희                            시큐리티적용
 *        </pre>
 */
public interface MemberService {
	// 시큐리티
	public MemberVO read(String mid) throws Exception;

	// 아이디 중복 검사
	public MemberVO selectMember(MemberVO member) throws Exception;

	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String mid) throws Exception;

	// 메일 중복 검사
	public int mailCheck(String mail) throws Exception;

	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;

	// 마이페이지
	public MemberVO myPage(String mid) throws Exception;

	// 아이디 찾기
	public MemberVO findID(MemberVO member) throws Exception;

	// 회원 탈퇴
	public void deleteMember(String mid) throws Exception;

	// 포인트 적립
	public void updateMhpoint(MemberVO member) throws Exception;

	// 회원마지막 접속 날짜 수정
	public void lastlogindate(String mid) throws Exception;

}
