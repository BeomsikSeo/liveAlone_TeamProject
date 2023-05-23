package com.multi.liveAlone.rice.order;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.multi.liveAlone.rice.ticket.TicketVO;
 
@Service
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(TicketVO ticket) {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "aea7c3dec3ffe3a91765d3654f261635");		// 어드민 키 기입, 완료
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");					// 테스트 확인
        params.add("partner_order_id", "1001");				// 테스트 주문번호
        params.add("partner_user_id", "userA");				// 테스트 유저 아이디
        params.add("item_name", "나 혼자 식권");						// 테스트 이름
        params.add("quantity", "1");						
        params.add("total_amount", Integer.toString(ticket.getTicket_price()));					// 테스트
        params.add("tax_free_amount", "100");				// 
        params.add("approval_url", "http://localhost:8888/liveAlone/rice/order/kakaoPaySuccess");	// 카카오 페이 결제 성공
        params.add("cancel_url", "http://localhost:8888/liveAlone/rice/order/kakaoPayCancel");		// 카카오 페이 결제 취소
        params.add("fail_url", "http://localhost:8888/liveAlone/rice/order/kakaoPaySuccessFail");	// 카카오 페이 결제 실패
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
        
        RestTemplate restTemplate = new RestTemplate();
 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "admin key를 넣어주세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "2100");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
}