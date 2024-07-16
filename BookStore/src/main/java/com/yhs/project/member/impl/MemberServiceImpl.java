package com.yhs.project.member.impl;


import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.yhs.project.dao.MemberDAO;
import com.yhs.project.dto.MemberVO;
import com.yhs.project.member.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO md;

	@Override
	public int loginID(MemberVO mv) {
		return md.loginID(mv);
	}
	
	@Override
	public MemberVO getMember(String id) {
		return md.getMember(id);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return md.idCheck(id);
	}
	
	@Override
	public int emailCheck(String email) throws Exception {
		return md.emailCheck(email);
	}
	
	@Override
	public int confirmID(String id) {
		return md.confirmID(id);
	}

	@Override
	public MemberVO getMemberId(MemberVO mv) {
		return md.getMemberId(mv);
	}

	@Override
	public MemberVO getMemberPwd(MemberVO mv) {
		return md.getMemberPwd(mv);
	}

	@Override
	public void updateMember(MemberVO mv) {
		md.updateMember(mv);
	}

	@Override
	public void insertMember(MemberVO mv) {
		md.insertMember(mv);
	}

	@Override
	public List<MemberVO> listMember() {
		return md.listMember();
	}

	@Override
	public void deleteMember(String id) {
		md.deleteMember(id);
	}
	
	// 이메일 보내기
	 // org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;

    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public boolean send(String subject, String text, String from, String to, String filePath) {
        // javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);

            // 첨부 파일 처리
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
	
}
