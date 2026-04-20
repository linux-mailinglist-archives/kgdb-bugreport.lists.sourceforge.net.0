Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEeqB1S95Wk8ngEAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2026 07:44:52 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CA426ED9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2026 07:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Mime-Version:References:In-Reply-To:
	Message-Id:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTknQgmT4DX45zLBCddUO3D20hLDPLsF7MgchBPbwSI=; b=aHkER5TKhCadJLzfWYR3vmu2xE
	ZRLaptr4PpZBB/t0nE6XQYQ2AK7n7nsbxXVKufyDfY24YUie2SaQZmgyVHMrtooU3SZBrB1zkY7Ma
	64NaTKW8IMEr5Eytqllz7Etr1XRkrcJ531a9/7BE47at6baLG0b+iNpfF0Eqem68AI/E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wEhRB-0006qs-Ty
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 20 Apr 2026 05:44:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mhiramat@kernel.org>) id 1wEhRA-0006qm-OW
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 20 Apr 2026 05:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ul/PI0KwFPLV1FSKn1kEQGeZDHmgR81pq0U3RKNv7qw=; b=lmZ1Ww4kRaGqBx1kUZlYI4s0Dr
 R2iFnpWIGz7j5U1rZXYOKPG5leypuezKW5r+NMYfILZghicZU47Kouypn8BqHO083wXPCjkJmkjEh
 ffxlpn/geyXsShTgaLSrjLYvhSBmYaid42Rg8xFgpt/AgSSJ+l2+7kfR3ycVgN1DRBsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ul/PI0KwFPLV1FSKn1kEQGeZDHmgR81pq0U3RKNv7qw=; b=l9AZnVgRAQl34QrtXpKvi5kvow
 e8IkKcp8AzT0R1Pr6L6KElT7ESUIPJoPDrFvB2AWPbz53vi331f1aMIIA2fDajuPjSO60W7CJHGsN
 b0V3tzi0A1zIkrH660YxDvhhUHhMBycAQCNvbTQ9bbL5fzazx5/gZ4Za2TWH8BZ+KGIY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEhRA-00058P-58 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 20 Apr 2026 05:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E1226011F;
 Mon, 20 Apr 2026 05:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37CCC19425;
 Mon, 20 Apr 2026 05:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776663881;
 bh=xkmJx488oioqlVuBsBzqvzkV5ymXtO1NzGZYZJ9TN6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q5kXwHULe0trWEeW3PwHiwxYGtKmrwmWyVHVaGSkUoY3z3Mo0/bAik7KYgBHhgIq7
 quTUXQCdK5BfLEChkYI14e5JXsFGCpWvmTE+wW1Bz6AinJmPQYkeV1Gojt53OvGMap
 qTj3Ncjit17pKYlm0HroYdtdqlFVmo0KZ/K8H2PIGK1QEykw6Ib4z5u8zWI6gjicEN
 rrkIeFBWlAj3n5GwnrGD7tJr/aS9NJ/j1Gjd4rRDlXUsAZ4XUaf46iG7dq7K0UOWpD
 qs5bnkYdCRwClUqH1xONKowKxlWBpz19Lx3F7K4JDdkwljBS2HiPwqM0j8LXwF7Ws+
 U8TrOa5Lke3nw==
Date: Mon, 20 Apr 2026 14:44:29 +0900
To: chensong_2000@189.cn
Message-Id: <20260420144429.57b45f2beece690bceea96ec@kernel.org>
In-Reply-To: <20260415070137.17860-1-chensong_2000@189.cn>
References: <20260415070137.17860-1-chensong_2000@189.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Song, On Wed,
 15 Apr 2026 15:01:37 +0800 chensong_2000@189.cn
 wrote: > From: Song Chen <chensong_2000@189.cn> > > The current notifier
 chain implementation uses a single-linked list > (struct notifier_block *next),
 which only supports forward traversal > in priority or [...] 
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
X-Headers-End: 1wEhRA-00058P-58
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
 pmladek@suse.com, petr.pavlu@suse.com, paulmck@kernel.org,
 linux-pm@vger.kernel.org, frederic@kernel.org, jikos@kernel.org,
 snitzer@kernel.org, rostedt@goodmis.org, linux-raid@vger.kernel.org,
 mpatocka@redhat.com, yukuai@fnnas.com, jpoimboe@kernel.org, sboyd@kernel.org,
 netdev@vger.kernel.org, mcgrof@kernel.org, horms@kernel.org,
 jason.wessel@windriver.com, mathieu.desnoyers@efficios.com,
 bmarzins@redhat.com, linux-trace-kernel@vger.kernel.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[189.cn];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[kgdb-bugreport@lists.sourceforge.net,kgdb-bugreport-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[mhiramat@kernel.org]
X-Rspamd-Queue-Id: 584CA426ED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Song,

On Wed, 15 Apr 2026 15:01:37 +0800
chensong_2000@189.cn wrote:

> From: Song Chen <chensong_2000@189.cn>
> 
> The current notifier chain implementation uses a single-linked list
> (struct notifier_block *next), which only supports forward traversal
> in priority order. This makes it difficult to handle cleanup/teardown
> scenarios that require notifiers to be called in reverse priority order.

What about introducing a new notification callback API that allows you
to describe dependencies between callback functions?

For example, when registering a callback, you could register a string
as an ID and specify whether to call it before or after that ID,
or you could register a comparison function that is called when adding
to a list. (I prefer @name and @depends fields so that it can be easily
maintained.)

This would allow for better dependency building when adding to the list.

> 
> A concrete example is the ordering dependency between ftrace and
> livepatch during module load/unload. see the detail here [1].

If this only concerns notification callback issues with the ftrace
and livepatch modules, it's far more robust to simply call the
necessary processing directly when the modules load and unload,
rather than registering notification callbacks externally.

There are fprobe, kprobe and its trace-events, all of them are using
ftrace as its fundation layer. In this case, I always needs to
consider callback order when a module is unloaded.

If ftrace is working as a part of module callbacks, it will conflict
with fprobe/kprobe module callback. Of course we can reorder it with
modifying its priority. But this is ugly, because when we introduce
a new other feature which depends on another layer, we need to
reorder the callback's priority number on the list.

Based on the above, I don't think this can be resolved simply by
changing the list of notification callbacks to a bidirectional list.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
