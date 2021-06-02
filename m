Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA593398D98
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 16:59:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loSLb-0003Ro-G9
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 14:59:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1loSLa-0003RW-DW
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GHaClEUiLQFCIBfazPqox1yZaJuFzrRiz0M9odryER0=; b=ZrNiTWG5/EVX3kbrWBD3RSFh3b
 bfd74wMN8319L5/mHxY083mejBJjM2jlm7R3Ah+H2Ze7WW5ETBeJYLI2WyGPeRrfBWk0mYqb2BP4K
 GbHGvEO5qCz31b2KoFt1tTHOgAgQVRn4QhlbbkvsGSNR8QRi79bxNjljwKx1ANgO4NsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GHaClEUiLQFCIBfazPqox1yZaJuFzrRiz0M9odryER0=; b=UMa/eXNMSBS/i+MEyW7WnBszA4
 hLohn6aRUhy732CaZlo5X1evuoAJt1pc+kRKYuAqhMn369GJSmZmRYk+uK5/nKRk/q2fEpyAPWLBV
 Hvg2dSEm8Xf2dtg36xFa1/gwripmy0skQb7nT039raGPk0LUo3seUqBeYOuRfKMuFlnI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loSLP-007NVb-Rk
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:59:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B95E7613B4;
 Wed,  2 Jun 2021 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622645976;
 bh=lULBTNw8ShimVVrtBYDbb5vhV5dQ9U6lx3o98b0hW5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQiBvXalcmFDhP4VUJkLfFfjUL+AdCowcIIHtwCBDEqTOBmz1OdBU6rrODvuN+9rD
 mOLZKyuSS6i9EOd55gn+hVr2qB4URf3FK/46utTh8Mh1nd3yfAS9gC2T8qY5RT3IQY
 b4rlXGea5BqIi+sm9FltOrrnryu0LA5VhApDTgyH63PLiPiZ2y0qibL1ECCDe/bn4n
 SELGuhZLGN0WPbHVxREPrkTVpEWesEuUbZ+F7OzJ3FIIUPCtX92osJVk5KljY297eg
 yycYme0OjJHY2hdQ/MWGMhjJv0YWgp66DxbyRygrcbb6F9I+DfNX1xA1IgwfjJU0xb
 xfBJRIrGQb7lw==
Date: Wed, 2 Jun 2021 15:59:21 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210602145921.GB31179@willie-the-truck>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.334970485@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602133040.334970485@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loSLP-007NVb-Rk
Subject: Re: [Kgdb-bugreport] [PATCH 2/6] sched: Introduce task_is_running()
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
 linux-mm@kvack.org, dm-devel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Zefan Li <lizefan.x@bytedance.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>, netdev@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, Alasdair Kergon <agk@redhat.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Vincent Guittot <vincent.guittot@linaro.org>, kvm@vger.kernel.org,
 cgroups@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 John Stultz <john.stultz@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-pm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Waiman Long <longman@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 03:12:27PM +0200, Peter Zijlstra wrote:
> Replace a bunch of 'p->state == TASK_RUNNING' with a new helper:
> task_is_running(p).
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/kernel/process.c |    4 ++--
>  block/blk-mq.c            |    2 +-
>  include/linux/sched.h     |    2 ++
>  kernel/locking/lockdep.c  |    2 +-
>  kernel/rcu/tree_plugin.h  |    2 +-
>  kernel/sched/core.c       |    6 +++---
>  kernel/sched/stats.h      |    2 +-
>  kernel/signal.c           |    2 +-
>  kernel/softirq.c          |    3 +--
>  mm/compaction.c           |    2 +-
>  10 files changed, 14 insertions(+), 13 deletions(-)
> 
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -931,7 +931,7 @@ unsigned long get_wchan(struct task_stru
>  	unsigned long start, bottom, top, sp, fp, ip, ret = 0;
>  	int count = 0;
>  
> -	if (p == current || p->state == TASK_RUNNING)
> +	if (p == current || task_is_running(p))

Looks like this one in get_wchan() has been cargo-culted across most of
arch/ so they'll need fixing up before you rename the struct member.

There's also a weird one in tools/bpf/runqslower/runqslower.bpf.c (!)

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
