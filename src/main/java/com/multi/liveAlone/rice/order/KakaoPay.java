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

import lombok.extern.java.Log;
 
@Service
@Log
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    private KakaoPayRefundVO kakaoPayRefundVO;
    
    public String kakaoPayReady(TicketVO ticket) {
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "aea7c3dec3ffe3a91765d3654f261635");		// 어드민 키 기입, 완료
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");					// 확인
        params.add("partner_order_id", "1001");				// 확인
        params.add("partner_user_id", "가맹점");			// 확인
        params.add("item_name", "나 혼자 식권");					// 확인
        params.add("quantity", "1");						// 확인
        params.add("total_amount", Integer.toString(ticket.getTicket_price()));					// 확인
        params.add("tax_free_amount", "100");				// 확인
        params.add("approval_url", "http://localhost:8888/liveAlone/rice/order/kakaoPaySuccess");	// 확인
        params.add("cancel_url", "http://localhost:8888/liveAlone/rice/order/kakaoPayCancel");		// 확인
        params.add("fail_url", "http://localhost:8888/liveAlone/rice/order/kakaoPaySuccessFail");	// 확인
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/index";
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token,TicketVO ticket) {
        RestTemplate restTemplate = new RestTemplate();
 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "aea7c3dec3ffe3a91765d3654f261635");		// 어드민 키 기입, 완료
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");				// 확인
        params.add("tid", kakaoPayReadyVO.getTid());	// 확인
        params.add("partner_order_id", "1001");			// 확인
        params.add("partner_user_id", "가맹점");		// 확인
        params.add("pg_token", pg_token);				// 확인
        params.add("total_amount", Integer.toString(ticket.getTicket_price()));				// 확인
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
            
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
    
    public KakaoPayRefundVO kakaoPayRefund(TicketVO ticket) {
    	RestTemplate restTemplate = new RestTemplate();
    	System.out.println(Long.toString(Math.round(ticket.getTicket_price()*0.9)));
    	
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "aea7c3dec3ffe3a91765d3654f261635");		// 어드민 키 기입, 완료
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");					
        params.add("tid", ticket.getTicket_tid());					
        params.add("cancel_amount", Long.toString(Math.round(ticket.getTicket_price()*0.9)));
        params.add("cancel_tax_free_amount", "100");
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayRefundVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, KakaoPayRefundVO.class);
            
            log.info("" + kakaoPayRefundVO);
            
            return kakaoPayRefundVO;
            
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        System.out.println("오류 발생");
        return kakaoPayRefundVO;
    }

    
    
    
    
    // TID 저장용
	public KakaoPayReadyVO getKakaoPayReadyVO() {
		return kakaoPayReadyVO;
	}

	public void setKakaoPayReadyVO(KakaoPayReadyVO kakaoPayReadyVO) {
		this.kakaoPayReadyVO = kakaoPayReadyVO;
	}
    
   
}