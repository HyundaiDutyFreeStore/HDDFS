package com.hyundai.dutyfree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.dutyfree.mapper.MemberMapper;
import com.hyundai.dutyfree.vo.MemberVO;

/**
 * MemberServiceImpl
 * 
 * @author 김찬중, 김가희
 * @since 01.12
 *
 *        <pre>
 *        수정일 수정자 수정내용 ---------- --------------- ---------------------------
 *        2023.01.12 김찬중 최초 생성 2023.01.17 김가희 시큐리티적용
 * 
 */
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public MemberVO read(String mid) throws Exception {
		return memberMapper.read(mid);
	}

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

	// 회원정보 수정
	@Override
	public void updateMhpoint(MemberVO member) throws Exception {
		MemberVO mem = memberMapper.read(member.getMid());
		member.setMhpoint(mem.getMhpoint() + member.getMhpoint());
		member.setMtotal(mem.getMtotal() + member.getMtotal());
		memberMapper.updateMhpoint(member);
	}

	@Override
	public int mailCheck(String mail) throws Exception {
		return memberMapper.mailChk(mail);
	}

	// 회원마지막 접속 날짜 수정
	@Override
	public void lastlogindate(String mid) throws Exception {
		memberMapper.lastlogindate(mid);
	}
}
