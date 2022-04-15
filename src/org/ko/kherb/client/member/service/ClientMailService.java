package org.ko.kherb.client.member.service;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailService")
public class ClientMailService {

	@Resource(name = "mailSender")
	private JavaMailSender mailSender;

	public String sendMail(String email) {
		System.out.println("sendMail 시작");
		Random random = new Random();
		String key = "";

		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65;

			key += (char) index;
		}

		int numIndex = random.nextInt(9999) + 1000;

		key += numIndex;

		System.out.println("mail Service에서: " + key);
		// SimpleMailMessage (단순 텍스트 구성 메일 메시지 생성할 때 이용)
		SimpleMailMessage simpleMessage = new SimpleMailMessage();

		// 수신자 설정
		simpleMessage.setTo(email);

		// 메일 제목
		simpleMessage.setSubject("[KHerb] 회원가입을 위한 이메일 인증번호");
		// 메일 내용
		simpleMessage.setText("안녕하세요. 한약재 판매 사이트 KHerb 입니다.\n"
				+ "회원가입을 위한 이메일 인증번호를 알려드립니다.\n\n" + "인증 번호 : " + key);

		// 메일 발송
		mailSender.send(simpleMessage);

		return key;
	}
	

	public String pwSearchEmail(String email) {
		Random random = new Random();
		String key = "";

		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65;
			key += (char) index;
		}

		int numIndex = random.nextInt(9999) + 1000;
		key += numIndex;

		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		simpleMessage.setTo(email);
		simpleMessage.setSubject("[KHerb] 임시 비밀번호 발급");
		// 메일 내용
		simpleMessage.setText("안녕하세요. 한약재 판매 사이트 KHerb 입니다.\n"
				+ "아래의 임시 비밀번호로 로그인 하신 후 반드시 비밀번호를 변경해 주세요.\n\n" + "임시 비밀번호 : " + key);

		mailSender.send(simpleMessage);
		return key;
	}
}
