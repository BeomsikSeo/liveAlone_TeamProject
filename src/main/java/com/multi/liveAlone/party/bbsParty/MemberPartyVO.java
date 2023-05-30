package com.multi.liveAlone.party.bbsParty;

public class MemberPartyVO {
	private String member_id;
	private int partyBbs_num;
	private int party_host;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPartyBbs_num() {
		return partyBbs_num;
	}
	public void setPartyBbs_num(int partyBbs_num) {
		this.partyBbs_num = partyBbs_num;
	}
	public int getParty_host() {
		return party_host;
	}
	public void setParty_host(int party_host) {
		this.party_host = party_host;
	}
	@Override
	public String toString() {
		return "memberPartyVO [member_id=" + member_id + ", partyBbs_num=" + partyBbs_num + ", party_host=" + party_host
				+ "]";
	}
}
