package com.hyundai.dutyfree.mapper;

import com.hyundai.dutyfree.vo.MemberVO;

/**
 * MemberMapper
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                        최초 생성
 *        </pre>
 */

public interface MemberMapper {
	public MemberVO selectMember(MemberVO member);
	
	// 회원가입
	public void memberJoin(MemberVO member);

	// 아이디 중복 검사
	public int idCheck(String mid);

	// 로그인
	public MemberVO memberLogin(MemberVO member);

	// 마이페이지
	public MemberVO myPage(String mid);
	
	//아이디 찾기
	public MemberVO findID(MemberVO member);
	
	// 회원탈퇴
    public void deleteMember(String mid);
    
    // 회원정보수정
    public void updateMember(MemberVO member);
}