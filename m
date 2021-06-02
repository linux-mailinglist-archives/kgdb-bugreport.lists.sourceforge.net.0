Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D30F398CAF
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 16:25:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loRoH-0006lq-AP
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 14:25:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1loRoG-0006li-O7
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FXtOoRkqKzh7kLJLNx1aUNoAKOt2OwhOUmVlEeFOV/k=; b=aJIN91vl5S85Y28mSKn4Q+NdX2
 Bw9gGSdMmzc8yUCRp9conU0x+LqdPo3upC168RWd9o02BxtZn0IaB++SypKvc4dCn6pFHBG9Q+Euw
 OToC4MmVu589DWk0EA8a+CtLwOl/p69yxkkiDa0+x+HbrtQPMwkxWoyAC80E2A6yDH2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FXtOoRkqKzh7kLJLNx1aUNoAKOt2OwhOUmVlEeFOV/k=; b=Geyl+Tp5QPNhPQk4ZDUXz4aWqB
 0GoAlhOEIDVfIYI2c4OU9wbNCFO2KnXH1F+CYmw3ECwns2ar5Cuwl6CKjyJ7t95Hq/kBgVa5/37oM
 sosTb0uuPRFo7pkt4g9WzzJnQxrtBA+ru/Sesa6ZqqfHcIbv0VoAPzLyGAnran+NUvzc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRoA-007KKa-3Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FXtOoRkqKzh7kLJLNx1aUNoAKOt2OwhOUmVlEeFOV/k=; b=aRuCf7uzTZTu6Zoj/CNNkrWz2p
 NiTO7Wp3c1qPbyOpXwrYp1PtzDWjm9lFd/a9yCbHrEoTHdjq7a3h6AyF0BhDXTQ3QxkDP57PRhMDO
 zEAZMYNvsYz4QiZA1N4mjgb4wXj7bSBZgp8Pj/xrfNSCm3M3p7yfnXQJFAELoJtdR+E6Ao31ANWBK
 327hKxLUv5HjbIqhiob98T4BjpKz+Vu+QWE82pAMH8ZWHQCaLUEhWPpOLHq5XbviYzak8e7g6jAgm
 AiylRMwPRrr6GP8fi1UzCBGjGo3iWRRsemSjXVXxNvj6tuH5bjajvu6yIt+A7WLPb35t2K8sXA42g
 5gfHi5dg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1loRmn-00BCUs-DM; Wed, 02 Jun 2021 14:24:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D1C23300269;
 Wed,  2 Jun 2021 16:23:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B6EF620223DA8; Wed,  2 Jun 2021 16:23:56 +0200 (CEST)
Date: Wed, 2 Jun 2021 16:23:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Message-ID: <YLeUfNEqKg27VwAB@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.398289363@infradead.org>
 <1524365960.5868.1622643316351.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1524365960.5868.1622643316351.JavaMail.zimbra@efficios.com>
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
X-Headers-End: 1loRoA-007KKa-3Q
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

On Wed, Jun 02, 2021 at 10:15:16AM -0400, Mathieu Desnoyers wrote:
> ----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:
> [...]
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -8568,13 +8568,12 @@ static void perf_event_switch(struct tas
> > 		},
> > 	};
> > 
> > -	if (!sched_in && task->state == TASK_RUNNING)
> > +	if (!sched_in && current->on_rq) {
> > 		switch_event.event_id.header.misc |=
> > 				PERF_RECORD_MISC_SWITCH_OUT_PREEMPT;
> > +	}
> > 
> > -	perf_iterate_sb(perf_event_switch_output,
> > -		       &switch_event,
> > -		       NULL);
> > +	perf_iterate_sb(perf_event_switch_output, &switch_event, NULL);
> > }
> 
> There is a lot of code cleanup going on here which does not seem to belong
> to a "Fix" patch.

Maybe, but I so hate whitespace only patches :-/


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
