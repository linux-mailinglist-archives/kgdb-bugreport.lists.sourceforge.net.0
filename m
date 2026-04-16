Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJfYJ5/f4GkEnAAAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 15:09:51 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537D40E87E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 15:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o036rkDEhuly+X3EdfftRyUKGKagjZG/dbIG1n9ySwE=; b=YU0gjADpeeDF7j6WOGlIvTjG21
	7Usgh81e54JNGj3/BGwJ9XuWwBkoO03eqGMOx+vQbp6OyUbrcAIPsux6zG+McGeuLs6URb/Ty65DH
	PpPNJeeRsMu9kGPMZbipiOowQ9UlXE4HC2nfINRuE82Ne9e5qC1Wia1RYlaS+YxJx/Bk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wDMTc-0005kd-Bn
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Apr 2026 13:09:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1wDMTb-0005kU-9K
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 13:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m3piWCtfpN3U6w8bKY3YeNvzMYnQTdnw3h4KjP2i/sk=; b=a1ZXxEXtdyjqsM+S/gmuwhnk7+
 nFZAdlKKxpZN61/T5X+MfxdAGWIy5jCpQ/1Sm2ICpa6lxPkbmXhKKU0/RTO4kbP+zYGC1+DBAE4VD
 4zddKle8xG3icoCQRHUI7hHu584ih5BB8x5lN0vVoj3/qIutVyvUGLCXnk+Tbw02H2YA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m3piWCtfpN3U6w8bKY3YeNvzMYnQTdnw3h4KjP2i/sk=; b=MORUGlHC7HWDdXfxBEtKY71uX6
 dbwR6FKwpWHC+VtqlhHeHtBUZMYZRYm4o5nPk/R2lFR90OmZEq7Rq4+u1EtTiBfD5L4+gMaGhmu+R
 JuYq7ObL1o5ytCjwQ12C532Rr4c4IHGPdUUI6cPbihjkd3utSKfjVXNavVIVH4YoRzns=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wDMTa-0007A2-Iw for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 13:09:47 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so73756625e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Apr 2026 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1776344975; x=1776949775; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m3piWCtfpN3U6w8bKY3YeNvzMYnQTdnw3h4KjP2i/sk=;
 b=Frnuh9bFzrRpvE5xsPZI1CsSuz/2MtJ+SDmCNvq8oxwcaRSbFDSkvbGF3L60vIGWWs
 JnSMx9wgXxPKQBzZtJSwiBkBzoHg948JR4DnDLz1gJ0Yef3EAcVrLCM8sDA6kxsgqCTT
 wjMGEjEs/P+ubNLnLpGo3V4401Q6Ov+bkJ9UdU5x5m+Iwkem/Kq1RlJfNL7sXwedUwiz
 MtfT7xHbzNFYqjJQWAckVjTd7CNBEdf/7+wSfIHWHdkwrFMUQcmziKikCgcVbsSjfuwE
 GSPdkn5yX1jP2swKswSLc92eAh6P7VC//ePMYPuula2n2hy7NxkpqRqvIJQ7sZng+CU9
 8WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776344975; x=1776949775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3piWCtfpN3U6w8bKY3YeNvzMYnQTdnw3h4KjP2i/sk=;
 b=SYiFFbRUx2D4BoAdF93naCTJYUAMyBeKpZWNZ7Hs5rgvjGwxjHE4gR7r9CHDfb0YRU
 LbiEyg7Vf855DpyrvpsAcXzPrwzgvLMWdMTTg+ZWbqzszOfKeyytDg8lMweKbJLLNulw
 Znxj//Ld6DZSlxecDQf9T9jDokbXwQqfwIrR2MtV8NpBFW25sFyQsScArdVn1mrwoAnK
 JxdZ3FUQW35VBHzCzWu0TnFkPDnWIWyStc3CLB+UvicyblRLeNUY6oAcj6voPLCQLGrV
 yyDu3clZzf5jOnmJKNaSjQmmoLVOq42MYe5F/4SLbNgMkHAeJqlQ84xbklJZkd1IafUy
 32Pw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jGl0Yo0b8ofySlzix4WIRi8LV67z/I2JyDsqSKce4TiwEoiKRlFtwVRC2nZhOWelx/VR7lW3YMvN4rTJRzQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyTWZQp6K1mqBLeXblh2vMAsz+3xr9rQY8FfCj3WYao0UtDgUsj
 Up4Ru4D3uVSIdO+X+Wf031pUx3a29TUiPAQ/gMkD0re9uSQKCIrfPgVIQQ4N3EFxmBo=
X-Gm-Gg: AeBDiesGt6UE2Nv6eQzf1qIceqxq8KOADFXD6vyZvJPvYcMznY5rMJ1/3Iu6F0O1wnt
 2SLbRP81/5FaUN2Wf0AWZ2/4HuboPg+9qGnlQv3wTrQzbmov+gGBgveJdF0VOukzDNzDzmMocKR
 9ml1T8D7Q0MY2jILaOCTHhs8O3a0tRkzaSMRhPMCr1wRupKSbDQi66++CCSpODqqYDJ90mwN9oi
 UNZr09kYFeqtMd/CfYCvcgGH60T45Vi4K07TS1HU38zBZIghdtchvzbO0UNpRRy/H4TihfrRF7Z
 nszjZqLRcIIHrBmBFfbnFR6f/51E8Asj/2XLCocO7vFSSo3AO/mW3wDkN/rdeVozDyTTPdPPmwU
 S4IpPvTx1q4gpgKo37qD7bo9s7tH5/1UNmpVRi3b8r4KHGclEnK2ArgcX2FPwrg+9EVirRHrMA/
 jbqQGwf3ELh00ETwVZLwV9re6Utg==
X-Received: by 2002:a05:600d:8449:b0:487:55c:e0c1 with SMTP id
 5b1f17b1804b1-488d68364fdmr279402625e9.14.1776344974877; 
 Thu, 16 Apr 2026 06:09:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f585cefdsm53796665e9.14.2026.04.16.06.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 06:09:34 -0700 (PDT)
Date: Thu, 16 Apr 2026 15:09:31 +0200
To: Song Chen <chensong_2000@189.cn>
Message-ID: <aeDfi98xpnKcAJx5@pathway.suse.cz>
References: <20260413080701.180976-1-chensong_2000@189.cn>
 <1191caf5-6a61-4622-a15e-854d3701f4fc@suse.com>
 <a35f5f94-7d5a-4347-974b-b270c89ef241@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a35f5f94-7d5a-4347-974b-b270c89ef241@189.cn>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2026-04-15 14:43:53, Song Chen wrote: > Hi, > > On
 4/14/26 22:33, Petr Pavlu wrote: > > On 4/13/26 10:07 AM, chensong_2000@189.cn
 wrote: > > > From: Song Chen <chensong_2000@189.cn> > > > > > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
X-Headers-End: 1wDMTa-0007A2-Iw
Subject: Re: [Kgdb-bugreport] [RFC PATCH 2/2] kernel/module: Decouple klp
 and ftrace from load_module
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
 Petr Pavlu <petr.pavlu@suse.com>, paulmck@kernel.org, linux-pm@vger.kernel.org,
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[189.cn];
	RCVD_COUNT_FIVE(0.00)[5];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.com:s=google];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.com:-];
	FROM_NEQ_ENVFROM(0.00)[kgdb-bugreport@lists.sourceforge.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[pmladek@suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,189.cn:email,pathway.suse.cz:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 6537D40E87E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed 2026-04-15 14:43:53, Song Chen wrote:
> Hi,
> 
> On 4/14/26 22:33, Petr Pavlu wrote:
> > On 4/13/26 10:07 AM, chensong_2000@189.cn wrote:
> > > From: Song Chen <chensong_2000@189.cn>
> > > 
> > > ftrace and livepatch currently have their module load/unload callbacks
> > > hard-coded in the module loader as direct function calls to
> > > ftrace_module_enable(), klp_module_coming(), klp_module_going()
> > > and ftrace_release_mod(). This tight coupling was originally introduced
> > > to enforce strict call ordering that could not be guaranteed by the
> > > module notifier chain, which only supported forward traversal. Their
> > > notifiers were moved in and out back and forth. see [1] and [2].
> > 
> > I'm unclear about what is meant by the notifiers being moved back and
> > forth. The links point to patches that converted ftrace+klp from using
> > module notifiers to explicit callbacks due to ordering issues, but this
> > switch occurred only once. Have there been other attempts to use
> > notifiers again?
> > 
> > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > index 14f391b186c6..0bdd56f9defd 100644
> > > --- a/include/linux/module.h
> > > +++ b/include/linux/module.h
> > > @@ -308,6 +308,14 @@ enum module_state {
> > >   	MODULE_STATE_COMING,	/* Full formed, running module_init. */
> > >   	MODULE_STATE_GOING,	/* Going away. */
> > >   	MODULE_STATE_UNFORMED,	/* Still setting it up. */
> > > +	MODULE_STATE_FORMED,
> > 
> > I don't see a reason to add a new module state. Why is it necessary and
> > how does it fit with the existing states?
> > 
> because once notifier fails in state MODULE_STATE_UNFORMED (now only ftrace
> has someting to do in this state), notifier chain will roll back by calling
> blocking_notifier_call_chain_robust, i'm afraid MODULE_STATE_GOING is going
> to jeopardise the notifers which don't handle it appropriately, like:
> 
> case MODULE_STATE_COMING:
>      kmalloc();
> case MODULE_STATE_GOING:
>      kfree();
> 
> 
> > > +};
> > > +
> > > +enum module_notifier_prio {
> > > +	MODULE_NOTIFIER_PRIO_LOW = INT_MIN,	/* Low prioroty, coming last, going first */
> > > +	MODULE_NOTIFIER_PRIO_MID = 0,	/* Normal priority. */
> > > +	MODULE_NOTIFIER_PRIO_SECOND_HIGH = INT_MAX - 1,	/* Second high priorigy, coming second*/
> > > +	MODULE_NOTIFIER_PRIO_HIGH = INT_MAX,	/* High priorigy, coming first, going late. */
> > 
> > I suggest being explicit about how the notifiers are ordered. For
> > example:
> > 
> > enum module_notifier_prio {
> > 	MODULE_NOTIFIER_PRIO_NORMAL,	/* Normal priority, coming last, going first. */
> > 	MODULE_NOTIFIER_PRIO_LIVEPATCH,
> > 	MODULE_NOTIFIER_PRIO_FTRACE,	/* High priority, coming first, going late. */
> > };
> > 

I like the explicit PRIO_LIVEPATCH/FTRACE names.

But I would keep the INT_MAX - 1 and INT_MAX priorities. I believe
that ftrace/livepatching will always be the first/last to call.
And INT_MAX would help to preserve kABI when PRIO_NORMAL is not
enough for the rest of notifiers.

That said, I am not sure whether this is worth the effort.
This patch tries to move the explicit callbacks in a generic
notifiers API. But it will still need to use some explictly
defined (reserved) priorities. And it will
not guarantee a misuse. Also it requires the double linked
list which complicates the notifiers code.


> > >   };
> > >   struct mod_tree_node {
> > > --- a/kernel/module/main.c
> > > +++ b/kernel/module/main.c
> > > @@ -3281,20 +3277,14 @@ static int complete_formation(struct module *mod, struct load_info *info)
> > >   	return err;
> > >   }
> > > -static int prepare_coming_module(struct module *mod)
> > > +static int prepare_module_state_transaction(struct module *mod,
> > > +			unsigned long val_up, unsigned long val_down)
> > >   {
> > >   	int err;
> > > -	ftrace_module_enable(mod);
> > > -	err = klp_module_coming(mod);
> > > -	if (err)
> > > -		return err;
> > > -
> > >   	err = blocking_notifier_call_chain_robust(&module_notify_list,
> > > -			MODULE_STATE_COMING, MODULE_STATE_GOING, mod);
> > > +			val_up, val_down, mod);
> > >   	err = notifier_to_errno(err);
> > > -	if (err)
> > > -		klp_module_going(mod);
> > >   	return err;
> > >   }

I personally find the name "prepare_module_state_transaction"
misleading. What is the "transaction" here? If this was a "preparation"
step then where is the transaction done/finished?

It might be better to just opencode the
blocking_notifier_call_chain_robust() instead.

> > > @@ -3468,14 +3458,21 @@ static int load_module(struct load_info *info, const char __user *uargs,
> > >   	init_build_id(mod, info);
> > >   	/* Ftrace init must be called in the MODULE_STATE_UNFORMED state */
> > > -	ftrace_module_init(mod);
> > > +	err = prepare_module_state_transaction(mod,
> > > +				MODULE_STATE_UNFORMED, MODULE_STATE_FORMED);
> > 
> > I believe val_down should be MODULE_STATE_GOING to reverse the
> > operation. Why is the new state MODULE_STATE_FORMED needed here?
> to avoid this:
> 
> case MODULE_STATE_COMING:
>      kmalloc();
> case MODULE_STATE_GOING:
>      kfree();

Hmm, the module is in "FORMED" state here.

> > > +	if (err)
> > > +		goto ddebug_cleanup;
> > >   	/* Finally it's fully formed, ready to start executing. */
> > >   	err = complete_formation(mod, info);

And we call "complete_formation()" function. This sounds like
it was not really "FORMED" before. => It is confusing and nono.

Please, try to avoid the new state if possible. My experience
with reading the module loader code is that any new state
brings a lot of complexity. You need to take it into account
when checking correctness of other changes, features, ...

Something tells me that if the state was not needed before
then we could avoid it.

> > > -	if (err)
> > > +	if (err) {
> > > +		blocking_notifier_call_chain_reverse(&module_notify_list,
> > > +				MODULE_STATE_FORMED, mod);
> > >   		goto ddebug_cleanup;
> > > +	}
> > > -	err = prepare_coming_module(mod);
> > > +	err = prepare_module_state_transaction(mod,
> > > +				MODULE_STATE_COMING, MODULE_STATE_GOING);
> > >   	if (err)
> > >   		goto bug_cleanup;
> > > --- a/kernel/trace/ftrace.c
> > > +++ b/kernel/trace/ftrace.c
> > > @@ -5241,6 +5241,44 @@ static int __init ftrace_mod_cmd_init(void)
> > >   }
> > >   core_initcall(ftrace_mod_cmd_init);
> > > +static int ftrace_module_callback(struct notifier_block *nb, unsigned long op,
> > > +			void *module)
> > > +{
> > > +	struct module *mod = module;
> > > +
> > > +	switch (op) {
> > > +	case MODULE_STATE_UNFORMED:
> > > +		ftrace_module_init(mod);
> > > +		break;
> > > +	case MODULE_STATE_COMING:
> > > +		ftrace_module_enable(mod);
> > > +		break;
> > > +	case MODULE_STATE_LIVE:
> > > +		ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
> > > +				mod->mem[MOD_INIT_TEXT].base + mod->mem[MOD_INIT_TEXT].size);
> > > +		break;
> > > +	case MODULE_STATE_GOING:
> > > +	case MODULE_STATE_FORMED:
> > > +		ftrace_release_mod(mod);

This calls "release" in a "FORMED" state. It does not make any
sense. Something looks fishy, either the code or the naming.

> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > 

I am sorry for being so picky about names. I believe that good names
help to prevent bugs and reduce headaches.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
