package com.hyundai.dutyfree.service;

import com.hyundai.dutyfree.vo.MemberVO;

/**
 * MemberMepper
 *
 * @author 김찬중, 이준석
 * @since 10.06
 *
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.05	  이준석			최초 생성, 리스트 테스트 코드 작성
 * 2022.10.07	  이준석			로그인 작성
 *        </pre>
 */
public interface MemberService {
//	회원 리스트를 불러오기 위한 코드(Test)
//	public List<MemberVO> selectMember() throws Exception;

    public MemberVO selectMember(MemberVO member) throws Exception;

    public void memberJoin(MemberVO member) throws Exception;

    // 아이디 중복 검사
    public int idCheck(String mid) throws Exception;

    // 로그인
    public MemberVO memberLogin(MemberVO member) throws Exception;
    
    public MemberVO memberLogin2(String mid) throws Exception;

    public MemberVO myPage(String mid) throws Exception;

   //아이디 찾기
    public MemberVO findID(MemberVO member) throws Exception;
    
    public void deleteMember(String mid) throws Exception;
    
    public void updateMember(MemberVO member) throws Exception;

}
