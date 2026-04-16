Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCtYLQ/34GnZnwAAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 16:49:51 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E789740FCCD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2026 16:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY30cPXAB/1BKrNcn/3wwy4Mt7L/82tnAQzNedj3m4U=; b=RtHLCuq9uQ6NXSqPPeoHee8NTe
	JihzEdJMy5qRE/o84bJjBKt6u9ZIO3rMyvbIL7xqRF/GSF40mlCHaPhFdVc6jGDe+cYRBhdZr41k3
	LwFQ97PU7Mv7CNbOtt1ROquU3wRbzBJBnL+3dhKCILPEx4Jv1IG4dmS3njmKq7H4Ou+M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wDO2P-0003hF-KP
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Apr 2026 14:49:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1wDO2O-0003h8-7G
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 14:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tXwMjFpu/xE0paqzhDs94eqBbHdGY9DRyzE65FFhgNk=; b=EfbIjGCHltg+O/2s0o+H0hZHpD
 bdfOuthJCIet6NqJzAquXhjG7YUlZZyr0/1KJc9PaD0a96RbELWIf+ixj2qyFtABrVnXr7C+yKn7S
 3+lAlMZNZyhcfL+4UJ2eSMNIINEc5vaOqO2b8ixmY2qwiGfInAx+Mfq5mR+PY15xK5cE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tXwMjFpu/xE0paqzhDs94eqBbHdGY9DRyzE65FFhgNk=; b=AVrArW+FlfQTtZf2v+ddmmdQGP
 E+0vRgsQ8VyvJkIFU4FlDr7F5k9g7Yb/hASkv9Sy7MYMVAmu9AFryxNKHScinmHrlYdtwlMwvtlg2
 dKYgJHdnR1ejwzZw0BPx5LYcSjndnXa8CqqdHtwoXU83EuVTOXq1gZWoYrT8kQyBAdXg=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wDO2N-00048l-KA for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Apr 2026 14:49:48 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488ad135063so78310905e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Apr 2026 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1776350976; x=1776955776; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tXwMjFpu/xE0paqzhDs94eqBbHdGY9DRyzE65FFhgNk=;
 b=I15S9IFrRaRtuLRDMVVohcZjUNasWverufV5ZEkctxN21UgrSgiBYOYh+MXQn2h5oq
 y5bZjufb1Hmu6aeQVmJqKf+KBqv8HcUrdf6XZ8Q3UdrH39UbFIgvmhCXkqHDQJ0UuMRe
 wcyiX/dJwwddZ8/nzJGpvRusDm0oXinwRS04UzQAcOdRL7CGF9sqKkMn3YeRZUNprp3t
 Q88NbAdggGaEbuHmn5rgK5RDAymnpbEmd8s+LshIqYjrQXObMd0oORJCJO/XuRGaq5Ps
 057wL+bIRbsP6mwScC6UA//zJNoXpbLSuZcPfDx8aVrcgyu4yzmWWyhbCYjUaMzA8q9h
 S/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776350976; x=1776955776;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXwMjFpu/xE0paqzhDs94eqBbHdGY9DRyzE65FFhgNk=;
 b=hrJvslvyYwAW7i3fg3zmOu+2o0IO/gNiwUO3IkHxc7ABGSk8EmZg2GO24ODJstiY88
 upXd1zXfkqIMJaeOL3uO1GWPhsBu3BiuGiZ1/Ze1raYki2UmBZJnYUrQ7CzU8aYcoMw0
 lkJtXRx3DKoo8+qPoZ5ge+G8jjeGko4zi+MrAdRcDGm42V2jNek9QdmkMfOHpwX5KZ8y
 UGrnQfUcocYEDSoFB+lV6Kypk5/8BQa58wskHdRRng/pA8SfP0jViiZ/ccgouTyWQhPA
 0QJwf/2K4zLGoe2hV34/NQZPMNB7W78O4ErgSk/HF+003iNjGeyraZBhc++hRZmjQvNd
 kD+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9A5khA+W5CX/OvueG2+ip6ijbb13FngQ5WOUcb0/SWnDLh+K9gUtKteyB40MPrTtQlPe16eiEsRC26XJGPUQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzYX+b3NlC13fWHMQyy1xWJXO9S9FNT1ByRKyaEZHyaUDwoJqZr
 cjhpuMmEsm1Pw1pMUQI/KuJWqyQNePv7/OHBMZyUjQNDzMUSDdVgT7WRFZpw3EeDrCY=
X-Gm-Gg: AeBDieuLlBriCVaHjqp+ZIuwZfowe+vtrIZIIxYjT+BsOgH4Bpc9TVo1+79KgtbpPyN
 PMhQ8ypu39FcSS9ucv5YbLGaW5qvStnbPj0vM9aFTDzE3ssNUbswrAEMzAzcG7vo1JYseEdGX9j
 QJVl3IbBm8bzD50jNj3+TLKH6kBVEIXynMNpaASN2RL+bLxuERCrvCfR/cTOuBwIyk0sMi9/lpm
 diFK6+Fsqf85KWjQqgtIjw1KpukGtQwqsk9RHMco27jQMlepgyiwSBRLWuiRYJNlwvBuHGSnlZD
 BB2XAPXm+MITQC91zDsgYsL0Kxu1aYFlxICmrmnhmNdshzR6XJywjNGRTxtObR3bfnaRFtymHh9
 BvHnNJYERUZPHW1sJPHG6KMFeJntItG5QfhcelIOpOkJdA+Dif8YPOcJpGJ2EjFS/7DhTpeGIA2
 nDt7wvtWjlqorcfL5wJsGjW/m4+bVQaH/ZRH19
X-Received: by 2002:a05:600c:8904:b0:487:1c2:6a56 with SMTP id
 5b1f17b1804b1-488d67ec89amr276975035e9.3.1776350975981; 
 Thu, 16 Apr 2026 07:49:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818e51sm95699055e9.5.2026.04.16.07.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 07:49:35 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:49:32 +0200
To: Petr Pavlu <petr.pavlu@suse.com>
Message-ID: <aeD2_FrFL6E3dbAC@pathway.suse.cz>
References: <20260413080701.180976-1-chensong_2000@189.cn>
 <1191caf5-6a61-4622-a15e-854d3701f4fc@suse.com>
 <a35f5f94-7d5a-4347-974b-b270c89ef241@189.cn>
 <1db425bf-58a9-4768-8c38-3ae25d7662a5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1db425bf-58a9-4768-8c38-3ae25d7662a5@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2026-04-16 13:18:30, Petr Pavlu wrote: > On 4/15/26
 8:43 AM, Song Chen wrote: > > On 4/14/26 22:33, Petr Pavlu wrote: > >> On
 4/13/26 10:07 AM, chensong_2000@189.cn wrote: > >>> diff --git a/in [...]
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
 [209.85.128.44 listed in wl.mailspike.net]
X-Headers-End: 1wDO2N-00048l-KA
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
 paulmck@kernel.org, linux-pm@vger.kernel.org, frederic@kernel.org,
 jikos@kernel.org, snitzer@kernel.org, rostedt@goodmis.org,
 linux-raid@vger.kernel.org, mpatocka@redhat.com, yukuai@fnnas.com,
 jpoimboe@kernel.org, sboyd@kernel.org, netdev@vger.kernel.org,
 Song Chen <chensong_2000@189.cn>, mcgrof@kernel.org, mhiramat@kernel.org,
 horms@kernel.org, jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
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
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,linaro.org,baylibre.com,vger.kernel.org,google.com,suse.cz,redhat.com,atomlin.com,lists.sourceforge.net,huawei.com,lists.linux.dev,goodmis.org,fnnas.com,189.cn,windriver.com,efficios.com,davemloft.net];
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[pmladek@suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pathway.suse.cz:mid,suse.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: E789740FCCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu 2026-04-16 13:18:30, Petr Pavlu wrote:
> On 4/15/26 8:43 AM, Song Chen wrote:
> > On 4/14/26 22:33, Petr Pavlu wrote:
> >> On 4/13/26 10:07 AM, chensong_2000@189.cn wrote:
> >>> diff --git a/include/linux/module.h b/include/linux/module.h
> >>> index 14f391b186c6..0bdd56f9defd 100644
> >>> --- a/include/linux/module.h
> >>> +++ b/include/linux/module.h
> >>> @@ -308,6 +308,14 @@ enum module_state {
> >>>       MODULE_STATE_COMING,    /* Full formed, running module_init. */
> >>>       MODULE_STATE_GOING,    /* Going away. */
> >>>       MODULE_STATE_UNFORMED,    /* Still setting it up. */
> >>> +    MODULE_STATE_FORMED,
> >>
> >> I don't see a reason to add a new module state. Why is it necessary and
> >> how does it fit with the existing states?
> >>
> > because once notifier fails in state MODULE_STATE_UNFORMED (now only ftrace has someting to do in this state), notifier chain will roll back by calling blocking_notifier_call_chain_robust, i'm afraid MODULE_STATE_GOING is going to jeopardise the notifers which don't handle it appropriately, like:
> > 
> > case MODULE_STATE_COMING:
> >      kmalloc();
> > case MODULE_STATE_GOING:
> >      kfree();
> 
> My understanding is that the current module "state machine" operates as
> follows. Transitions marked with an asterisk (*) are announced via the
> module notifier.
> 
> ---> UNFORMED --*> COMING --*> LIVE --*> GOING -.
>         ^            |                     ^    |
>         |            '---------------------*    |
>         '---------------------------------------'
> 
> The new code aims to replace the current ftrace_module_init() call in
> load_module(). To achieve this, it adds a notification for the UNFORMED
> state (only when loading a module) and introduces a new FORMED state for
> rollback. FORMED is purely a fake state because it never appears in
> module::state. The new structure is as follows:
> 
>         ,--*> (FORMED)
>         |
> --*> UNFORMED --*> COMING --*> LIVE --*> GOING -.
>         ^            |                     ^    |
>         |            '---------------------*    |
>         '---------------------------------------'
> 
> I'm afraid this is quite complex and inconsistent. Unless it can be kept
> simple, we would be just replacing one special handling with a different
> complexity, which is not worth it.

> >>
> >>> +    if (err)
> >>> +        goto ddebug_cleanup;
> >>>         /* Finally it's fully formed, ready to start executing. */
> >>>       err = complete_formation(mod, info);
> >>> -    if (err)
> >>> +    if (err) {
> >>> +        blocking_notifier_call_chain_reverse(&module_notify_list,
> >>> +                MODULE_STATE_FORMED, mod);
> >>>           goto ddebug_cleanup;
> >>> +    }
> >>>   -    err = prepare_coming_module(mod);
> >>> +    err = prepare_module_state_transaction(mod,
> >>> +                MODULE_STATE_COMING, MODULE_STATE_GOING);
> >>>       if (err)
> >>>           goto bug_cleanup;
> >>>   @@ -3522,7 +3519,6 @@ static int load_module(struct load_info *info, const char __user *uargs,
> >>>       destroy_params(mod->kp, mod->num_kp);
> >>>       blocking_notifier_call_chain(&module_notify_list,
> >>>                        MODULE_STATE_GOING, mod);
> >>
> >> My understanding is that all notifier chains for MODULE_STATE_GOING
> >> should be reversed.
> > yes, all, from lowest priority notifier to highest.
> > I will resend patch 1 which was failed due to my proxy setting.
> 
> What I meant here is that the call:
> 
> blocking_notifier_call_chain(&module_notify_list, MODULE_STATE_GOING, mod);
> 
> should be replaced with:
> 
> blocking_notifier_call_chain_reverse(&module_notify_list, MODULE_STATE_GOING, mod);
> 
> > 
> >>
> >>> -    klp_module_going(mod);
> >>>    bug_cleanup:
> >>>       mod->state = MODULE_STATE_GOING;
> >>>       /* module_bug_cleanup needs module_mutex protection */
> >>
> >> The patch removes the klp_module_going() cleanup call in load_module().
> >> Similarly, the ftrace_release_mod() call under the ddebug_cleanup label
> >> should be removed and appropriately replaced with a cleanup via
> >> a notifier.
> >>
> >     err = prepare_module_state_transaction(mod,
> >                 MODULE_STATE_UNFORMED, MODULE_STATE_FORMED);
> >     if (err)
> >         goto ddebug_cleanup;
> > 
> > ftrace will be cleanup in blocking_notifier_call_chain_robust rolling back.
> > 
> >     err = prepare_module_state_transaction(mod,
> >                 MODULE_STATE_COMING, MODULE_STATE_GOING);
> > 
> > each notifier including ftrace and klp will be cleanup in blocking_notifier_call_chain_robust rolling back.
> > 
> > if all notifiers are successful in MODULE_STATE_COMING, they all will be clean up in
> >  coming_cleanup:
> >     mod->state = MODULE_STATE_GOING;
> >     destroy_params(mod->kp, mod->num_kp);
> >     blocking_notifier_call_chain(&module_notify_list,
> >                      MODULE_STATE_GOING, mod);
> > 
> > if  something wrong underneath.
> 
> My point is that the patch leaves a call to ftrace_release_mod() in
> load_module(), which I expected to be handled via a notifier.

I think that I have got it. The ftrace code needs two notifiers when
the module is being loaded and two when it is going.

This is why Sond added the new state. But I think that we would
need two new states to call:

    + ftrace_module_init() in MODULE_STATE_UNFORMED
    + ftrace_module_enable() in MODULE_STATE_FORMED

and

    + ftrace_free_mem() in MODULE_STATE_PRE_GOING
    + ftrace_free_mem() in MODULE_STATE_GOING


By using the ascii art:

 -*> UNFORMED -*> FORMED -> COMING -*> LIVE -*> PRE_GOING -*> GOING -.
              |          |         |                ^           ^    ^
              |          |         '----------------'           |    |
              |          '--------------------------------------'    |
              '------------------------------------------------------'


But I think that this is not worth it.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
