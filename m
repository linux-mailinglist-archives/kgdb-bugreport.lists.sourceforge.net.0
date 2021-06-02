Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBED39DA04
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Jun 2021 12:46:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lqCls-0003W0-Gf
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Jun 2021 10:46:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <compudj@efficios.com>) id 1loRgc-0007hy-IO
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NQkpeJ7B+hKtKJgR6oI37w8WcTETaBafQ5/DPMEWwI=; b=FIoyDx9hVQoP+JtTjld/FchQMc
 6xr22wNbtTKcZdM5u/IjbkswO/04qBz75ZusPYqkXhhuGi3WBo1DSe8xa1eL0ZuHeK4fWX8mqxJh8
 UqtrF7KeSvz3G3GEa9x8NBGNkWW2WLW5yQO0j9RjgtI88Gn/b2NHe1E+1tjZgwdj39ZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3NQkpeJ7B+hKtKJgR6oI37w8WcTETaBafQ5/DPMEWwI=; b=Ys6W6E84StNCuah29NTZ3xDbFD
 TAzhRDwNJgkhpjx2X7X/vL9p29YG9wdxpVJaocR95Cq+AJ2IzX/lMc9qKxSvtJ04wxXtkHZH/lruw
 O82V4mY/2ED/vdz9CDs6ENN+Eq1LHCHfFAJrKTE+pzfHMNdDkjuZX6Fj1W90XkOUpaHI=;
Received: from mail.efficios.com ([167.114.26.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRgZ-0001VH-UX
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:17:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 0BB63302B2C;
 Wed,  2 Jun 2021 09:59:09 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zle7ixm03a6t; Wed,  2 Jun 2021 09:59:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 3623D302779;
 Wed,  2 Jun 2021 09:59:08 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 3623D302779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1622642348;
 bh=3NQkpeJ7B+hKtKJgR6oI37w8WcTETaBafQ5/DPMEWwI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ZlLvrNpb7FSQdBC5tIEKb93seCOYMQlGgXqNDCt4mx931pzNw8PkQPGTIAknvIKON
 NpDSBJXZebM5bdDBEXJUhkVKv214RxCfD9cnMAu+E9jlJUbxCT0sSH9pfYpV4sduq4
 x3/Ha4HOzhfJ5u6uVpyJg0D3SZEpnzu++L3CaXS5k4TUIGuZ+VTcOcX9C3+gYxGHL4
 vP87muDZtj763iw70P68DkCsJf/o77PvwVPhmezDZ6qbVfVNe7D4w95pMohMEmylCc
 wLPLpR4HOsL54+3PlAjOEK3N1Uw5WtMxdLnoo8ef/7RMfiFuOK3kBtQodyzCCa6QyK
 u+WAXvtkoLOCw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sGHjL0HFYOjb; Wed,  2 Jun 2021 09:59:08 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 00C463028D6;
 Wed,  2 Jun 2021 09:59:08 -0400 (EDT)
Date: Wed, 2 Jun 2021 09:59:07 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <1873020549.5854.1622642347895.JavaMail.zimbra@efficios.com>
In-Reply-To: <20210602133040.398289363@infradead.org>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.398289363@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF88 (Linux)/8.8.15_GA_4026)
Thread-Topic: sched,perf,kvm: Fix preemption condition
Thread-Index: r+iuleOU2QevO+uazLhH122pXkMx7g==
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: efficios.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1loRgZ-0001VH-UX
X-Mailman-Approved-At: Mon, 07 Jun 2021 10:46:13 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 3/6] sched, perf,
 kvm: Fix preemption condition
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Mike Snitzer <snitzer@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Ben Segall <bsegall@google.com>,
 linux-mm <linux-mm@kvack.org>, dm-devel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Zefan Li <lizefan.x@bytedance.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Joel Fernandes,
 Google" <joel@joelfernandes.org>, netdev <netdev@vger.kernel.org>,
 Jiri Olsa <jolsa@redhat.com>, Alasdair Kergon <agk@redhat.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Vincent Guittot <vincent.guittot@linaro.org>, KVM list <kvm@vger.kernel.org>,
 Will Deacon <will@kernel.org>, cgroups <cgroups@vger.kernel.org>,
 x86 <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 paulmck <paulmck@kernel.org>, linux-pm@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Waiman Long <longman@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, acme <acme@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, rcu <rcu@vger.kernel.org>,
 bristot <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:

> When ran from the sched-out path (preempt_notifier or perf_event),
> p->state is irrelevant to determine preemption. You can get preempted
> with !task_is_running() just fine.
> 
> The right indicator for preemption is if the task is still on the
> runqueue in the sched-out path.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
> kernel/events/core.c |    7 +++----
> virt/kvm/kvm_main.c  |    2 +-
> 2 files changed, 4 insertions(+), 5 deletions(-)
> 
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8568,13 +8568,12 @@ static void perf_event_switch(struct tas
> 		},
> 	};
> 
> -	if (!sched_in && task->state == TASK_RUNNING)
> +	if (!sched_in && current->on_rq) {

This changes from checking task->state to current->on_rq, but this change
from "task" to "current" is not described in the commit message, which is odd.

Are we really sure that task == current here ?

Thanks,

Mathieu

> 		switch_event.event_id.header.misc |=
> 				PERF_RECORD_MISC_SWITCH_OUT_PREEMPT;
> +	}
> 
> -	perf_iterate_sb(perf_event_switch_output,
> -		       &switch_event,
> -		       NULL);
> +	perf_iterate_sb(perf_event_switch_output, &switch_event, NULL);
> }
> 
> /*
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4869,7 +4869,7 @@ static void kvm_sched_out(struct preempt
> {
> 	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
> 
> -	if (current->state == TASK_RUNNING) {
> +	if (current->on_rq) {
> 		WRITE_ONCE(vcpu->preempted, true);
> 		WRITE_ONCE(vcpu->ready, true);
>  	}

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
