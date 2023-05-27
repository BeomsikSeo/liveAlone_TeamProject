package com.multi.liveAlone.rice.order;

import lombok.Data;

@Data
public class KakaoPayAmountVO {

   private Integer total, tax_free, vat, point, discount;
}
