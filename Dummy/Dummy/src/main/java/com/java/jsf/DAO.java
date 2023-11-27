package com.java.jsf;

import java.util.List;

public interface DAO {

	List<Recipient> showRecipient();
	//List<Subscription> showSubscription();
	List<ClaimHistory> showClaimHistory();
}
