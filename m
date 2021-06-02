Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCA399054
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 18:47:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loU1x-0006C6-31
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 16:47:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1loU1v-0006Bm-Hu
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 16:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7tohifuv5JYW3E7Hk1sVQuIjPI/C8MKSY3MQl5vvB4s=; b=JqQZDt/BWYPoTDazTebSanjQVH
 /3fX5wjvqWeNsGqdmjRzH33vdHSRN/oYiZwn8iCeOA9W3hi1UZzlc2lHC6fSZ+Kyg6w4/pZE/t99I
 SdIkl8QieyF6oBctiT1nMuPyFr6wqi1U0hop2pkz+F8Mi5jNsh8FDOwrUe73821tSPtc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7tohifuv5JYW3E7Hk1sVQuIjPI/C8MKSY3MQl5vvB4s=; b=hyYb4EflwMV75Mgf8eprEW9ufX
 EO7IbWUxQXyiotp9z0HW8qPwkFwLpTvCDCOOkAFFIvoeugoCAvL0y22WPtQtFS7PdJsEZFLq0Q6t0
 62aN8VoYL1MJP/kC/sRPaDR75ymoPyz42i2+w5ukTbz/yL75/bzF+kKT3SHkRts8FNmw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loU1q-0000ud-Kw
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 16:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7tohifuv5JYW3E7Hk1sVQuIjPI/C8MKSY3MQl5vvB4s=; b=kdu4BwlchYINw3C+EcBocsHDUy
 a91P+WO2n/ztNAZpC4i1gw7tqOKUFzwWu58suQdLAjM2YXFikv/5/oaqPmf99JVYKCNj2WJKpDQ0i
 S0c8GI0OlAIisTgxakan8G10HFtH5HuNw7Hqdqi3RHiYYq3zdmBzXy5lsDnRzF3TJVEtdO68TnpgS
 8K25eJH4v8dAAo7rswaiwcEE8nXrQyqHEIrzfWlp7ORDwYUd2bEDZxmNSuwBFuW4xEFDNeWs3Yg6U
 o+Kb0+cIMahvxPwVt/nlQwL5AtLXT/J6J+qePZba4xfUkA84xt+DhB39swRCy3609n/Mv+E85Mgmt
 FcuTDgEw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1loU0Z-00BKKZ-9j; Wed, 02 Jun 2021 16:46:22 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A2E72300091;
 Wed,  2 Jun 2021 18:46:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8A73D2016D6DD; Wed,  2 Jun 2021 18:46:16 +0200 (CEST)
Date: Wed, 2 Jun 2021 18:46:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Message-ID: <YLe12Ba4CrvhMhFI@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.334970485@infradead.org>
 <20210602145921.GB31179@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602145921.GB31179@willie-the-truck>
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [24.132.217.100 listed in zen.spamhaus.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1loU1q-0000ud-Kw
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

On Wed, Jun 02, 2021 at 03:59:21PM +0100, Will Deacon wrote:
> On Wed, Jun 02, 2021 at 03:12:27PM +0200, Peter Zijlstra wrote:
> > Replace a bunch of 'p->state == TASK_RUNNING' with a new helper:
> > task_is_running(p).
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  arch/x86/kernel/process.c |    4 ++--
> >  block/blk-mq.c            |    2 +-
> >  include/linux/sched.h     |    2 ++
> >  kernel/locking/lockdep.c  |    2 +-
> >  kernel/rcu/tree_plugin.h  |    2 +-
> >  kernel/sched/core.c       |    6 +++---
> >  kernel/sched/stats.h      |    2 +-
> >  kernel/signal.c           |    2 +-
> >  kernel/softirq.c          |    3 +--
> >  mm/compaction.c           |    2 +-
> >  10 files changed, 14 insertions(+), 13 deletions(-)
> > 
> > --- a/arch/x86/kernel/process.c
> > +++ b/arch/x86/kernel/process.c
> > @@ -931,7 +931,7 @@ unsigned long get_wchan(struct task_stru
> >  	unsigned long start, bottom, top, sp, fp, ip, ret = 0;
> >  	int count = 0;
> >  
> > -	if (p == current || p->state == TASK_RUNNING)
> > +	if (p == current || task_is_running(p))
> 
> Looks like this one in get_wchan() has been cargo-culted across most of
> arch/ so they'll need fixing up before you rename the struct member.

Yeah, this was x86_64 allmodconfig driven, I've already got a bunch of
robot mail telling me other archs need help, I'll fix it iup.

> There's also a weird one in tools/bpf/runqslower/runqslower.bpf.c (!)

I'm tempted to let the bpf people sort their own gunk. This is not an
ABI. I so don't care breaking every script out there.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
