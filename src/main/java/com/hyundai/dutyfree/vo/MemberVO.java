package com.hyundai.dutyfree.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * MemberVO
 * 
 * @author 김찬중
 * @since 01.09
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2023.01.09    김찬중                         최초 생성
 *        </pre>
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
    private String mid; // 회원 id
    private String mpassword; // 회원 pw
    private String memail; // 회원 이메일
    private String mphone; // 회원 전화번호
    private String mname; // 회원 이름
    private int mhpoint; // mpoint
    private Date mregdate; // 회원가입 날짜
    private String mgrade; // 회원 등급
    private String mgender; // 회원 성별
    @DateTimeFormat(pattern = "YYYY-MM-dd")
    private Date mbirth; // 회원 생일

    @Override
    public String toString() {
        return "MemberVO [mid=" + mid + ", mpassword=" + mpassword + ", memail=" + memail
                + ", mphone=" + mphone + ", mname=" + mname + ", mhpoint=" + mhpoint + ", mregdate=" + mregdate
                + ", mgrade=" + mgrade + ", mgender=" + mgender + ", mbirth=" + mbirth + "]";
    }

}
