package com.hyundai.dutyfree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.MemberMapper;
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
 * 2022.10.05	  이준석			최초 생성
 * 2022.10.07	  김찬중			로그인 서비스 구현
 *        </pre>
 */
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

    @Override
    public void memberJoin(MemberVO member) throws Exception {
        memberMapper.memberJoin(member);

    }

    @Override
    public MemberVO selectMember(MemberVO member) throws Exception {
        return memberMapper.selectMember(member);
    }

    // 로그인
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        return memberMapper.memberLogin(member);
    }

    @Override
    public MemberVO memberLogin2(String mid) throws Exception {
        return memberMapper.memberLogin2(mid);
    }

    @Override
    public int idCheck(String mid) throws Exception {
        return memberMapper.idCheck(mid);
    }

    @Override
    public MemberVO myPage(String mid) throws Exception {
        return memberMapper.myPage(mid);
    }

    // 아이디 찾기
    @Override
    public MemberVO findID(MemberVO member) throws Exception {
        return memberMapper.findID(member);
    }

    // 아이디 삭제
    @Override
    public void deleteMember(String mid) throws Exception {
        memberMapper.deleteMember(mid);
    }
    //회원정보 수정
    @Override
    public void updateMember(MemberVO member) throws Exception {
        memberMapper.updateMember(member);
    }
}
