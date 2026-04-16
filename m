Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP0IDR+74GmIlAAAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 12:34:07 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 822BB40CF5B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 12:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAJpY0cIPTYOflCKCPrVVDJXmuzfcPCHfNW9QxnNch0=; b=lfZd9gWJN3LRXhVHwCC4abCCFy
	tus7JVfkrjZHDw5vRJigRpeKjqW+gjToH+ukS0I8JdqnxUmgt0WA4dMdlgtqEckj6PU/QCKKDRwCN
	rHdU/rrVRQ4tbr+AKcfKLgJa1C4qGzGMr4BjRY02D5zlkZ7d8kg0IMuycWcz9X2L19rs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wDK2u-0000Xo-18
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Apr 2026 10:34:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1wDK2o-0000XC-SA
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 10:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PFX0kfy1JVc6bVB6CE0bGMq+YH6jFLY5/9CO0YM6hrU=; b=VHpgFXb6ErF7OyCHJ7l2lEztBk
 RFbExUUwf04FjtbaMsbIRwVkBcM4u5KwrhfAEHVJHcj/ivhfNCcZHnmPFqIdFfvdYe8nGuLDGTNje
 Z7HCsKVKFTEtoBJ8DK8nWHSZSj2MqfnzzfLva1IWz6pIYM7HSMX33JE/FOQiBJJO5qOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PFX0kfy1JVc6bVB6CE0bGMq+YH6jFLY5/9CO0YM6hrU=; b=TKUXXQ4gEYZ0cOmr6t1j4cBQCE
 YxvhJB4swajCxcIkjQtjnowsphrkHJwN3Opled3Sz9zTTW0X6z+gN1/fvAmwAVhKzQhZ6ZmUDDsVm
 RZ5OikhxeDDK+8d0YCjHyvf4Q+ZhdzqTOKQrk6pAFmKL38oY1lcNtgu/bBf/AwWZBEg0=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wDK2o-0006iA-UF for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 10:33:59 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-483487335c2so85992005e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Apr 2026 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1776335627; x=1776940427; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PFX0kfy1JVc6bVB6CE0bGMq+YH6jFLY5/9CO0YM6hrU=;
 b=DD9KsFV/9Vu+9ofukKDi0NBvyijI700IDRaKqRlaeZGOnhPyN37BmEkQBZ0czpIAel
 2Vu5JsJccc0jsxVM3EgyGba3rjSeM1DP3og9Uenf+fy+NWoUX6+t2pujrPd98jNAov3h
 qvplq6dPJZt6fhyLsh5KN2Pf8/pOA3ZwvXpLeaaWoIXnFdxhHdn6n9buXmRf5h9FECZb
 4PNxFS9ZIAgrQ4pJUGbiAmyujAEiozQffdPYDYgUY0kl9/6nQkvXpg48izS/PSqxzQAq
 DXmPinlN4bDKA+AjngqIRMTbrUJ3iCYUrFmRR8s3JLJydob4M/64+1ull2EKrEN0Jh6m
 B1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776335627; x=1776940427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PFX0kfy1JVc6bVB6CE0bGMq+YH6jFLY5/9CO0YM6hrU=;
 b=UVV4mCiz5hvdgu4iLI7oEabUjs9N5Szmo3xbfnaNBJUdY7Csdr6BOqa2UU5WlpHqvi
 fOFX0IHWcSjU1hY60bWT4u2aYkB75DEecn9c35bw6bRk14aXf/nClm66rsVu/I6OOvDA
 u8iCE9v7mKTyMVw/X02tcdzb6gqsejqTL9Nv8kpsCzYkR1oFDGFQ5D7bZFZMjX3flxCd
 Mtecqi97emNf0/30pK+Rn/QRVe3/wowpWshoaiiw+c4ueiBdyE/aVFDn1dPB/0TMRsmJ
 spRWuhsfdTsYg5qJfnniRz0cdray7p9DFZaeTqNSE/oGKm3P1OqGmCWnbzK43d3n6MsE
 Tkxg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/d0akQAh7kXX0y8Cpq7ZSRh3WeA+0BDqEX5ZBRm475ouOhlLs5znC/A8Zr/QWW+n+EKPMXBc8CcM5N6o9CZg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyjWgrwd/V2cD0p8T85GfjUp0skkphq63P0G3o8RCGdRofxrecW
 uZNqTJt31KEB0RjaJeZ4ZzDsgbHtCcxxx4UxXrIcPFglevxuKffTYfGgN0CSXfTRD5o=
X-Gm-Gg: AeBDievuciFi9ALs70eUMIMQ/AGbBSWR4GXcfox2sy1/wYvLg/sdPOtzWUbAjDUVXfn
 gq4e0dBbIErUfKGisDdN/kK7qTpaMMDIoG3Qr2cBvz2sg53Ef0EycxTxWzpKDsYzzgaR6IRa0Ys
 CjnVRKY7noWkmnrZiD6yAPzIJKGP1f64oUWtTRxR1NYS1DYw2isQATQVQL6fUJva8i6x6yjLdRE
 mod3qvSCDhCEFguT1JTB6GBqY0H8HHwXEH98ALbj0esRlyQF9aH2NhuVhK3vhei9ItHr7mlsf4T
 af9MuMcd78nqoR7X9HLdW30avn139Oma26LnpEV++EgJk3mYZLLhNsNmItAO9j3/PQ/4Hwbvnbk
 Ot7g9pTHrToqX5ej5+rBeT3AHt7biHoiAqMjVQFgrF2Dau06bVFkJ2TviHTyA3EpIA54tSyNxAG
 LHMJ4ZWhP/ssyZklqdOjJFuH34tA==
X-Received: by 2002:a05:600c:3b96:b0:488:b098:b653 with SMTP id
 5b1f17b1804b1-488d67f0a8amr350880245e9.13.1776335626808; 
 Thu, 16 Apr 2026 03:33:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead402ee8sm12369872f8f.37.2026.04.16.03.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 03:33:46 -0700 (PDT)
Date: Thu, 16 Apr 2026 12:33:43 +0200
To: chensong_2000@189.cn
Message-ID: <aeC7ByGA5MHBcGQR@pathway.suse.cz>
References: <20260415070137.17860-1-chensong_2000@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415070137.17860-1-chensong_2000@189.cn>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2026-04-15 15:01:37, chensong_2000@189.cn wrote: >
 From: Song Chen <chensong_2000@189.cn> > > The current notifier chain
 implementation
 uses a single-linked list > (struct notifier_block *next) [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
X-Headers-End: 1wDK2o-0006iA-UF
Subject: Re: [Kgdb-bugreport] [RFC PATCH 1/2] kernel/notifier: replace
 single-linked list with double-linked list for reverse traversal
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: mark.rutland@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org, song@kernel.org,
 edumazet@google.com, da.gomez@kernel.org, live-patching@vger.kernel.org,
 mbenes@suse.cz, linux-clk@vger.kernel.org, agk@redhat.com,
 joe.lawrence@redhat.com, atomlin@atomlin.com, linux-acpi@vger.kernel.org,
 danielt@kernel.org, samitolvanen@google.com,
 kgdb-bugreport@lists.sourceforge.net, kuba@kernel.org, pabeni@redhat.com,
 linan122@huawei.com, lenb@kernel.org, dm-devel@lists.linux.dev,
 petr.pavlu@suse.com, paulmck@kernel.org, linux-pm@vger.kernel.org,
 frederic@kernel.org, jikos@kernel.org, snitzer@kernel.org, rostedt@goodmis.org,
 linux-raid@vger.kernel.org, mpatocka@redhat.com, yukuai@fnnas.com,
 jpoimboe@kernel.org, sboyd@kernel.org, netdev@vger.kernel.org,
 mcgrof@kernel.org, mhiramat@kernel.org, horms@kernel.org,
 jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
 bmarzins@redhat.com, linux-trace-kernel@vger.kernel.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[189.cn];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.com:s=google];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.com:-];
	FROM_NEQ_ENVFROM(0.00)[kgdb-bugreport@lists.sourceforge.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[pmladek@suse.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fhfr.pm:email,suse.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,189.cn:email]
X-Rspamd-Queue-Id: 822BB40CF5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed 2026-04-15 15:01:37, chensong_2000@189.cn wrote:
> From: Song Chen <chensong_2000@189.cn>
> 
> The current notifier chain implementation uses a single-linked list
> (struct notifier_block *next), which only supports forward traversal
> in priority order. This makes it difficult to handle cleanup/teardown
> scenarios that require notifiers to be called in reverse priority order.
> 
> A concrete example is the ordering dependency between ftrace and
> livepatch during module load/unload. see the detail here [1].
> 
> This patch replaces the single-linked list in struct notifier_block
> with a struct list_head, converting the notifier chain into a
> doubly-linked list sorted in descending priority order. Based on
> this, a new function notifier_call_chain_reverse() is introduced,
> which traverses the chain in reverse (ascending priority order).
> The corresponding blocking_notifier_call_chain_reverse() is also
> added as the locking wrapper for blocking notifier chains.
> 
> The internal notifier_call_chain_robust() is updated to use
> notifier_call_chain_reverse() for rollback: on error, it records
> the failing notifier (last_nb) and the count of successfully called
> notifiers (nr), then rolls back exactly those nr-1 notifiers in
> reverse order starting from last_nb's predecessor, without needing
> to know the total length of the chain.
> 
> With this change, subsystems with symmetric setup/teardown ordering
> requirements can register a single notifier_block with one priority
> value, and rely on blocking_notifier_call_chain() for forward
> traversal and blocking_notifier_call_chain_reverse() for reverse
> traversal, without needing hard-coded call sequences or separate
> notifier registrations for each direction.
> 
> [1]:https://lore.kernel.org/all
> 	/alpine.LNX.2.00.1602172216491.22700@cbobk.fhfr.pm/
> 
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -53,41 +53,41 @@ typedef	int (*notifier_fn_t)(struct notifier_block *nb,
[...]
>  struct notifier_block {
>  	notifier_fn_t notifier_call;
> -	struct notifier_block __rcu *next;
> +	struct list_head __rcu entry;
>  	int priority;
>  };
[...]
>  #define ATOMIC_INIT_NOTIFIER_HEAD(name) do {	\
>  		spin_lock_init(&(name)->lock);	\
> -		(name)->head = NULL;		\
> +		INIT_LIST_HEAD(&(name)->head);		\

I would expect the RCU variant here, aka INIT_LIST_HEAD_RCU().

> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -14,39 +14,47 @@
>   *	are layered on top of these, with appropriate locking added.
>   */
>  
> -static int notifier_chain_register(struct notifier_block **nl,
> +static int notifier_chain_register(struct list_head *nl,
>  				   struct notifier_block *n,
>  				   bool unique_priority)
>  {
> -	while ((*nl) != NULL) {
> -		if (unlikely((*nl) == n)) {
> +	struct notifier_block *cur;
> +
> +	list_for_each_entry(cur, nl, entry) {
> +		if (unlikely(cur == n)) {
>  			WARN(1, "notifier callback %ps already registered",
>  			     n->notifier_call);
>  			return -EEXIST;
>  		}
> -		if (n->priority > (*nl)->priority)
> -			break;
> -		if (n->priority == (*nl)->priority && unique_priority)
> +
> +		if (n->priority == cur->priority && unique_priority)
>  			return -EBUSY;
> -		nl = &((*nl)->next);
> +
> +		if (n->priority > cur->priority) {
> +			list_add_tail(&n->entry, &cur->entry);
> +			goto out;
> +		}
>  	}
> -	n->next = *nl;
> -	rcu_assign_pointer(*nl, n);
> +
> +	list_add_tail(&n->entry, nl);

I would expect list_add_tail_rcu() here.

> @@ -59,25 +67,25 @@ static int notifier_chain_unregister(struct notifier_block **nl,
>   *			value of this parameter is -1.
>   *	@nr_calls:	Records the number of notifications sent. Don't care
>   *			value of this field is NULL.
> + *	@last_nb:  Records the last called notifier block for rolling back
>   *	Return:		notifier_call_chain returns the value returned by the
>   *			last notifier function called.
>   */
> -static int notifier_call_chain(struct notifier_block **nl,
> +static int notifier_call_chain(struct list_head *nl,
>  			       unsigned long val, void *v,
> -			       int nr_to_call, int *nr_calls)
> +			       int nr_to_call, int *nr_calls,
> +				   struct notifier_block **last_nb)
>  {
>  	int ret = NOTIFY_DONE;
> -	struct notifier_block *nb, *next_nb;
> -
> -	nb = rcu_dereference_raw(*nl);
> +	struct notifier_block *nb;
>  
> -	while (nb && nr_to_call) {
> -		next_nb = rcu_dereference_raw(nb->next);
> +	if (!nr_to_call)
> +		return ret;
>  
> +	list_for_each_entry(nb, nl, entry) {

I would expect the RCU variant here, aka list_for_each_rcu()

These are just two random examples which I found by a quick look.

I guess that the notifier API is very old and it does not use all
the RCU API features which allow to track safety when
CONFIG_PROVE_RCU and CONFIG_PROVE_RCU_LIST are enabled.

It actually might be worth to audit the code and make it right.

>  #ifdef CONFIG_DEBUG_NOTIFIERS
>  		if (unlikely(!func_ptr_is_kernel_text(nb->notifier_call))) {
>  			WARN(1, "Invalid notifier called!");
> -			nb = next_nb;
>  			continue;
>  		}
>  #endif

That said, I am not sure if the ftrace/livepatching handlers are
the right motivation for this. Especially when I see the
complexity of the 2nd patch [*]

After thinking more about it. I am not even sure that the ftrace and
livepatching callbacks are good candidates for generic notifiers.
They are too special. It is not only about ordering them against
each other. But it is also about ordering them against other
notifiers. The ftrace/livepatching callbacks must be the first/last
during module load/release.

[*] The 2nd patch is not archived by lore for some reason.
    I have found only a review but it gives a good picture, see
    https://lore.kernel.org/all/1191caf5-6a61-4622-a15e-854d3701f4fc@suse.com/

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
