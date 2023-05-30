package com.multi.liveAlone.rice.order;

import lombok.Data;

@Data
public class KakaoPayAmount {

   private Integer total, tax_free, vat, point, discount, green_deposit;
}
