package com.multi.liveAlone.rice.order;

import lombok.Data;

@Data
public class KakaoPayCardInfo {
	private String purchase_corp, purchase_corp_code;
    private String issuer_corp, issuer_corp_code;
    private String kakaopay_purchase_corp, kakaopay_purchase_corp_code, kakaopay_issuer_corp, kakaopay_issuer_corp_code;
    private String bin, card_type, install_month, approved_id, card_mid;
    private String interest_free_install, card_item_code;
}
