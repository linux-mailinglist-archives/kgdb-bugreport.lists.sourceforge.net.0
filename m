Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJtKHheP5Wk7lgEAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2026 04:27:35 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C28426437
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2026 04:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Mime-Version:References:In-Reply-To:
	Message-Id:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1WFxAPI/my5Ybc1BsLi0phZAYy+Jw8aO44X/IUjiQc=; b=f/y8MkjP6hKIP4TX6C/sH0maDO
	iv5/vpSyTBSa8fPdyG1Z8sXK36ycAIshPTYUxmQWwwMS07V9unbf0mpuwtiLBW9rWSDt1S3CTjFq4
	fvKQe3A/BVwr8yJfBLcBPxBCpEcp6J+APLWNIoEKv7TutnsNEYtSynHJuNN+opCl9aCU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wEeMG-00063a-Fv
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 20 Apr 2026 02:27:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mhiramat@kernel.org>) id 1wEeMF-00063R-1M
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 20 Apr 2026 02:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CgubQB1vW9wxC8N4CxmIVsMLaWELotlZaO7YsaSUdG0=; b=fR92l7zRdfLjuIstLTqj9TMP/N
 vTbyYs36SgkRqsYWlbf8AnZoCJKqG0iJ1IZsmECN+/bxia6pnejs1eXxHhnBvX6hwNtuNKYdiEHu4
 s/lRvdUWYeusZ37YLjPOkRi1ov/5Xx2AEGabzBrv0zGYJgoT292MTAZmvaViKayQtM9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CgubQB1vW9wxC8N4CxmIVsMLaWELotlZaO7YsaSUdG0=; b=E+NqkYP5zmf1uUMzHaewLY0OV/
 /+xeXLy/m3wCAEzO6YmhtQT2ACkKQF5Q33ZeLYQgadyI7e6ufCY93hkC8l3nlwhNUJ0W6P+byI8VR
 vEgFXPvkRURlMG4rdYkpxFHqN+wL2Q3t98IuYGIvtA96fvNzR1sxyue1QKO3+aB5UdkA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEeME-0005Zh-92 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 20 Apr 2026 02:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 611C360055;
 Mon, 20 Apr 2026 02:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F54C2BCAF;
 Mon, 20 Apr 2026 02:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776652038;
 bh=ITFfxWVYZShfg8ObCYl+/A7sDctvchvGVKnsu2Q0ZLU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q/f2q8YrNja2t4MOJ3XZm+daEZl1FcXY4nfOVvtrtjvqt5MbZxWUYOT3wirQo6FaB
 lOqgywkLPOjS1VIVUdoCXgyBgeqdQRzNwaylQtig4w+yS3qEz3gmO+SVZmZJKlQIS1
 5YnVfgyEXKpTOb6PrQd5kn+uZtfBKDFQ/8OCcifN8EDAPaZwjDRm8Zr0mh3XQALHBh
 Up6SdMQEWfpLr4yC73WCFbktXDXdQ7dXOqJfGS3V/MWdgRmzjD+Y1d8LwFkLfl9Ev0
 jN9uHYhQzEihNOM9Uulk+1xe1nQar6NN7XIMU3fvu8QzHpDFat9SPtxyteXUC9ijgd
 FqU1Wkd4FKflw==
Date: Mon, 20 Apr 2026 11:27:07 +0900
To: Petr Mladek <pmladek@suse.com>
Message-Id: <20260420112707.aa3627ca9f975eeaf7d8ea0e@kernel.org>
In-Reply-To: <aeD2_FrFL6E3dbAC@pathway.suse.cz>
References: <20260413080701.180976-1-chensong_2000@189.cn>
 <1191caf5-6a61-4622-a15e-854d3701f4fc@suse.com>
 <a35f5f94-7d5a-4347-974b-b270c89ef241@189.cn>
 <1db425bf-58a9-4768-8c38-3ae25d7662a5@suse.com>
 <aeD2_FrFL6E3dbAC@pathway.suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu,
 16 Apr 2026 16:49:32 +0200 Petr Mladek <pmladek@suse.com>
 wrote: > On Thu 2026-04-16 13:18:30, Petr Pavlu wrote: > > On 4/15/26 8:43
 AM, Song Chen wrote: > > > On 4/14/26 22:33, Petr Pavlu wrote: > > >> On
 4/13/26 10:07 AM, chensong_2000@189.cn wrote: > > >>> diff [...] 
 Content analysis details:   (-1.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wEeME-0005Zh-92
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
From: "Masami Hiramatsu \(Google\) via Kgdb-bugreport"
 <kgdb-bugreport@lists.sourceforge.net>
Reply-To: "Masami Hiramatsu \(Google\)" <mhiramat@kernel.org>
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
 Song Chen <chensong_2000@189.cn>, mcgrof@kernel.org, mhiramat@kernel.org,
 horms@kernel.org, jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
 bmarzins@redhat.com, linux-trace-kernel@vger.kernel.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,linaro.org,baylibre.com,vger.kernel.org,google.com,suse.cz,redhat.com,atomlin.com,lists.sourceforge.net,huawei.com,lists.linux.dev,suse.com,goodmis.org,fnnas.com,189.cn,windriver.com,efficios.com,davemloft.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[kgdb-bugreport@lists.sourceforge.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[mhiramat@kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,189.cn:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: A4C28426437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 16 Apr 2026 16:49:32 +0200
Petr Mladek <pmladek@suse.com> wrote:

> On Thu 2026-04-16 13:18:30, Petr Pavlu wrote:
> > On 4/15/26 8:43 AM, Song Chen wrote:
> > > On 4/14/26 22:33, Petr Pavlu wrote:
> > >> On 4/13/26 10:07 AM, chensong_2000@189.cn wrote:
> > >>> diff --git a/include/linux/module.h b/include/linux/module.h
> > >>> index 14f391b186c6..0bdd56f9defd 100644
> > >>> --- a/include/linux/module.h
> > >>> +++ b/include/linux/module.h
> > >>> @@ -308,6 +308,14 @@ enum module_state {
> > >>>       MODULE_STATE_COMING,    /* Full formed, running module_init. */
> > >>>       MODULE_STATE_GOING,    /* Going away. */
> > >>>       MODULE_STATE_UNFORMED,    /* Still setting it up. */
> > >>> +    MODULE_STATE_FORMED,
> > >>
> > >> I don't see a reason to add a new module state. Why is it necessary and
> > >> how does it fit with the existing states?
> > >>
> > > because once notifier fails in state MODULE_STATE_UNFORMED (now only ftrace has someting to do in this state), notifier chain will roll back by calling blocking_notifier_call_chain_robust, i'm afraid MODULE_STATE_GOING is going to jeopardise the notifers which don't handle it appropriately, like:
> > > 
> > > case MODULE_STATE_COMING:
> > >      kmalloc();
> > > case MODULE_STATE_GOING:
> > >      kfree();
> > 
> > My understanding is that the current module "state machine" operates as
> > follows. Transitions marked with an asterisk (*) are announced via the
> > module notifier.
> > 
> > ---> UNFORMED --*> COMING --*> LIVE --*> GOING -.
> >         ^            |                     ^    |
> >         |            '---------------------*    |
> >         '---------------------------------------'
> > 
> > The new code aims to replace the current ftrace_module_init() call in
> > load_module(). To achieve this, it adds a notification for the UNFORMED
> > state (only when loading a module) and introduces a new FORMED state for
> > rollback. FORMED is purely a fake state because it never appears in
> > module::state. The new structure is as follows:
> > 
> >         ,--*> (FORMED)
> >         |
> > --*> UNFORMED --*> COMING --*> LIVE --*> GOING -.
> >         ^            |                     ^    |
> >         |            '---------------------*    |
> >         '---------------------------------------'
> > 
> > I'm afraid this is quite complex and inconsistent. Unless it can be kept
> > simple, we would be just replacing one special handling with a different
> > complexity, which is not worth it.
> 
> > >>
> > >>> +    if (err)
> > >>> +        goto ddebug_cleanup;
> > >>>         /* Finally it's fully formed, ready to start executing. */
> > >>>       err = complete_formation(mod, info);
> > >>> -    if (err)
> > >>> +    if (err) {
> > >>> +        blocking_notifier_call_chain_reverse(&module_notify_list,
> > >>> +                MODULE_STATE_FORMED, mod);
> > >>>           goto ddebug_cleanup;
> > >>> +    }
> > >>>   -    err = prepare_coming_module(mod);
> > >>> +    err = prepare_module_state_transaction(mod,
> > >>> +                MODULE_STATE_COMING, MODULE_STATE_GOING);
> > >>>       if (err)
> > >>>           goto bug_cleanup;
> > >>>   @@ -3522,7 +3519,6 @@ static int load_module(struct load_info *info, const char __user *uargs,
> > >>>       destroy_params(mod->kp, mod->num_kp);
> > >>>       blocking_notifier_call_chain(&module_notify_list,
> > >>>                        MODULE_STATE_GOING, mod);
> > >>
> > >> My understanding is that all notifier chains for MODULE_STATE_GOING
> > >> should be reversed.
> > > yes, all, from lowest priority notifier to highest.
> > > I will resend patch 1 which was failed due to my proxy setting.
> > 
> > What I meant here is that the call:
> > 
> > blocking_notifier_call_chain(&module_notify_list, MODULE_STATE_GOING, mod);
> > 
> > should be replaced with:
> > 
> > blocking_notifier_call_chain_reverse(&module_notify_list, MODULE_STATE_GOING, mod);
> > 
> > > 
> > >>
> > >>> -    klp_module_going(mod);
> > >>>    bug_cleanup:
> > >>>       mod->state = MODULE_STATE_GOING;
> > >>>       /* module_bug_cleanup needs module_mutex protection */
> > >>
> > >> The patch removes the klp_module_going() cleanup call in load_module().
> > >> Similarly, the ftrace_release_mod() call under the ddebug_cleanup label
> > >> should be removed and appropriately replaced with a cleanup via
> > >> a notifier.
> > >>
> > >     err = prepare_module_state_transaction(mod,
> > >                 MODULE_STATE_UNFORMED, MODULE_STATE_FORMED);
> > >     if (err)
> > >         goto ddebug_cleanup;
> > > 
> > > ftrace will be cleanup in blocking_notifier_call_chain_robust rolling back.
> > > 
> > >     err = prepare_module_state_transaction(mod,
> > >                 MODULE_STATE_COMING, MODULE_STATE_GOING);
> > > 
> > > each notifier including ftrace and klp will be cleanup in blocking_notifier_call_chain_robust rolling back.
> > > 
> > > if all notifiers are successful in MODULE_STATE_COMING, they all will be clean up in
> > >  coming_cleanup:
> > >     mod->state = MODULE_STATE_GOING;
> > >     destroy_params(mod->kp, mod->num_kp);
> > >     blocking_notifier_call_chain(&module_notify_list,
> > >                      MODULE_STATE_GOING, mod);
> > > 
> > > if  something wrong underneath.
> > 
> > My point is that the patch leaves a call to ftrace_release_mod() in
> > load_module(), which I expected to be handled via a notifier.
> 
> I think that I have got it. The ftrace code needs two notifiers when
> the module is being loaded and two when it is going.
> 
> This is why Sond added the new state. But I think that we would
> need two new states to call:
> 
>     + ftrace_module_init() in MODULE_STATE_UNFORMED
>     + ftrace_module_enable() in MODULE_STATE_FORMED
> 
> and
> 
>     + ftrace_free_mem() in MODULE_STATE_PRE_GOING
>     + ftrace_free_mem() in MODULE_STATE_GOING
> 
> 
> By using the ascii art:
> 
>  -*> UNFORMED -*> FORMED -> COMING -*> LIVE -*> PRE_GOING -*> GOING -.
>               |          |         |                ^           ^    ^
>               |          |         '----------------'           |    |
>               |          '--------------------------------------'    |
>               '------------------------------------------------------'
> 
> 
> But I think that this is not worth it.

Agree.

If this needs to be ordered so strictly, why we will use a "single"
module notifier chain for this complex situation?

I think the notifier call chain is just for notice a single signal,
instead of sending several different signals, especially if there is
any dependency among the callbacks.

If notification callbacks need to be ordered, they are currently
sorted by representing priority numerically, but this is quite
fragile for updating. It has to look up other registered priorities
and adjust the order among dependencies each time. For this reason,
this mechanism is not suitable for global ordering. (It's like line
numbers in BASIC.)
It is probably only useful for representing dependencies between
two components maintained by the same maintainer.

I'm against a general-purpose system that makes everything modular.
It unnecessarily complicates things. If there are processes that
require strict ordering, especially processes that must be performed
before each stage as part of the framework, they should be called
directly from the framework, not via notification callbacks.

This makes it simpler and more robust to maintain.

Only the framework's end users should utilize notification callbacks.

Thank you,


> 
> Best Regards,
> Petr
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
