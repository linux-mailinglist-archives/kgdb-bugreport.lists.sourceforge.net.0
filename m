Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828539DA05
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Jun 2021 12:46:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lqCls-0003WG-IC
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Jun 2021 10:46:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <compudj@efficios.com>) id 1loRgh-0005zV-BG
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GwH0GdcKUFmXjwdSc5PC6qayNfPYEbeSfo7iFd8LGlc=; b=VW/4i0PwtO6TrQu3rx7Hd7o+aq
 PihK/0LVCip+SStCzN29PODvMkKg5lVZJ/BFN4kpdY/SpkpFMo35DLOgMoepTr5+O3bZ/4rRcNf03
 iZvVSiEUS2sfK3j0xR2hfNwHJJtjcxnL3gdg1qSYY1x2hrR/1uKfRNkCVAQEFvBK2AD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GwH0GdcKUFmXjwdSc5PC6qayNfPYEbeSfo7iFd8LGlc=; b=bW8GGIrsDL64ZhYd+B8o9HTc4W
 IEPo2NooYPZz8GhmUIt4buNtR3S3exF4f3ztp/5VlmbyfEZ449MkxKLOjKoxtIjcPmd+9bOJ6/3Tr
 /SYtTRe+yweHc41enGsSUt0WHZMyI4rmbswp6nxDnAs1Jqnbr6XWqR0ff1jXDsaU/or8=;
Received: from mail.efficios.com ([167.114.26.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRga-007JZk-ME
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:17:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 33F8E302B4C;
 Wed,  2 Jun 2021 10:07:03 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id g1z0V_wT7FT6; Wed,  2 Jun 2021 10:06:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 84F0C302AEF;
 Wed,  2 Jun 2021 10:06:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 84F0C302AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1622642818;
 bh=GwH0GdcKUFmXjwdSc5PC6qayNfPYEbeSfo7iFd8LGlc=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=IzY7rj9bG67qO5MhQCvNkTZ6NmKLl+j7CGAPSRZx3M3VXN4GE9cW/xiqKbb0lMrag
 set1cTsKpmrC3scRLhvadBwRFL0ucET03FgN+RYhAetywU7SMjz4Jzot43Al7b42/w
 wRf/j9ODOuM7qSvP03brlcfNA9m+dmMrwW5plmJFJwkQAs2hFyj/Dx0kstoADKFw0s
 PShGdCuiX9KikFibuSZcET8LNklvf4YN8WFNh0QHjOaoJ5JxioNYTizyl5WrJqstOz
 gIo6cZK3qsMar7jMzCrxaFOM5us8879gVttQyPgo4y+VuhrGp7sB3x4o9l+rwPGYzG
 yQHn8ljzHTpmw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l6BO-UHNT1BK; Wed,  2 Jun 2021 10:06:58 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 548823029F3;
 Wed,  2 Jun 2021 10:06:58 -0400 (EDT)
Date: Wed, 2 Jun 2021 10:06:58 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <896642516.5866.1622642818225.JavaMail.zimbra@efficios.com>
In-Reply-To: <20210602133040.587042016@infradead.org>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.587042016@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF88 (Linux)/8.8.15_GA_4026)
Thread-Topic: sched: Change task_struct::state
Thread-Index: DzXPoSkxk24gPNa4OEu5k5Jl7651YA==
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
X-Headers-End: 1loRga-007JZk-ME
X-Mailman-Approved-At: Mon, 07 Jun 2021 10:46:13 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 6/6] sched: Change task_struct::state
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
 kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Ben Segall <bsegall@google.com>, linux-mm <linux-mm@kvack.org>,
 dm-devel <dm-devel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zefan Li <lizefan.x@bytedance.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Joel Fernandes, Google" <joel@joelfernandes.org>,
 netdev <netdev@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Alasdair Kergon <agk@redhat.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Vincent Guittot <vincent.guittot@linaro.org>, KVM list <kvm@vger.kernel.org>,
 Will Deacon <will@kernel.org>, cgroups <cgroups@vger.kernel.org>,
 x86 <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 paulmck <paulmck@kernel.org>, linux-pm <linux-pm@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, rostedt <rostedt@goodmis.org>,
 linux-block <linux-block@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Waiman Long <longman@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 acme <acme@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-perf-users <linux-perf-users@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, rcu <rcu@vger.kernel.org>,
 bristot <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:

> Change the type and name of task_struct::state. Drop the volatile and
> shrink it to an 'unsigned int'. Rename it in order to find all uses
> such that we can use READ_ONCE/WRITE_ONCE as appropriate.
> 
[...]
> 
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c

[...]
> @@ -1559,7 +1560,8 @@ static int fill_psinfo(struct elf_prpsin
> 	psinfo->pr_pgrp = task_pgrp_vnr(p);
> 	psinfo->pr_sid = task_session_vnr(p);
> 
> -	i = p->state ? ffz(~p->state) + 1 : 0;
> +	state = READ_ONCE(p->__state);
> +	i = state ? ffz(~state) + 1 : 0;
> 	psinfo->pr_state = i;
> 	psinfo->pr_sname = (i > 5) ? '.' : "RSDTZW"[i];
> 	psinfo->pr_zomb = psinfo->pr_sname == 'Z';

[...]

> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -113,13 +113,13 @@ struct task_group;
> 					 __TASK_TRACED | EXIT_DEAD | EXIT_ZOMBIE | \
> 					 TASK_PARKED)
> 
> -#define task_is_running(task)		(READ_ONCE((task)->state) == TASK_RUNNING)
> +#define task_is_running(task)		(READ_ONCE((task)->__state) == TASK_RUNNING)
> 
> -#define task_is_traced(task)		((task->state & __TASK_TRACED) != 0)
> +#define task_is_traced(task)		((READ_ONCE(task->__state) & __TASK_TRACED) != 0)
> 
> -#define task_is_stopped(task)		((task->state & __TASK_STOPPED) != 0)
> +#define task_is_stopped(task)		((READ_ONCE(task->__state) & __TASK_STOPPED) !=
> 0)
> 
> -#define task_is_stopped_or_traced(task)	((task->state & (__TASK_STOPPED |
> __TASK_TRACED)) != 0)
> +#define task_is_stopped_or_traced(task)	((READ_ONCE(task->__state) &
> (__TASK_STOPPED | __TASK_TRACED)) != 0)
> 
> #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
> 
> @@ -134,14 +134,14 @@ struct task_group;
> 	do {							\
> 		WARN_ON_ONCE(is_special_task_state(state_value));\
> 		current->task_state_change = _THIS_IP_;		\
> -		current->state = (state_value);			\
> +		WRITE_ONCE(current->__state, (state_value));	\
> 	} while (0)

Why not introduce set_task_state(p) and get_task_state(p) rather than sprinkle
READ_ONCE() and WRITE_ONCE() all over the kernel ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
