//package dao;
//
//import java.util.HashMap;
//import java.util.Random;
//
//import org.json.simple.JSONObject;
//
//import net.nurigo.java_sdk.exceptions.CoolsmsException;
//import oracle.jdbc.driver.Message;
//import vo.SmsVO;
//
//public class SmsDAO {
//
//	public int sms(SmsVO vo) {
//		String api_key = "NCSAYRI28CRZXD5G"; // 회원가입 시 발급받은 api키
//		String api_secret = "FLVOMXL86R6IEMSKLGKBAUKCULDIREZQ"; // 회원가입 시 발급받은 secret api키
//		Message coolsms = new Message(api_key, api_secret);
//		
//		Random rd = new Random();
//		int randMpw = rd.nextInt(899999)+100000; // 임의로 만든 랜덤 비밀번호 
//		
//		HashMap<String, String> params = new HashMap<String, String>();
//		params.put("to", vo.getPhoneNumber()); //받는 사람 번호
//		params.put("from", "01053694080"); //보내는 사람 번호
//		params.put("type", "SMS");
//		params.put("text", "임시비밀번호 ["+randMpw+"]");
//		params.put("app_version", "test app 1.2");
//
//		try {
//			JSONObject obj = (JSONObject) coolsms.send(params);
//			System.out.println(obj.toString());
//		} catch (CoolsmsException e) {
//			System.out.println("확인");
//			System.out.println(e.getMessage());
//			System.out.println(e.getCode());
//		}
//		return randMpw; // 인증번호를 리턴
//	}
//	
//}

