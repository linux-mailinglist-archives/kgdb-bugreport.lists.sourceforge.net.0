Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDDC398D72
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 16:48:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loSAZ-0007hA-Uh
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 14:48:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <mark.rutland@arm.com>) id 1loSAX-0007h0-CF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SkDMlSa0YgeA1+Qy3i5IXBXxqbVS4AjXnyKNTbuxMsE=; b=EbsE83RFi5YGg1+r9b8f1FSpT3
 j4nDG7SlqbIKwjmDKKF6aqA5hCCdCQrB1rTwQvMdB9O7CfVugc6Sen56qTJuGDq9YnCeDQca8iIGc
 33J71xsSXmzLhs4No1fyws4Rg0TDyMnLyEmVHSTsy1qS8xyTsbi476j7DX1D78JxrH8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SkDMlSa0YgeA1+Qy3i5IXBXxqbVS4AjXnyKNTbuxMsE=; b=DITsrhznKsAW4/87cbaXOzQFQJ
 8opg5gXUK0KGSEIjXMxMMg/Dom0/w1DwX0K4DubC9NarEhGtr6mkbQqwxSEH//mkPhYeOXW7xtiC/
 5HKt5VLv7F3A4rpdjr+kREAt+5ih9bDLBx0O6+QgMTmQw7L8GNv0WP3dGTPjA3kKm+5I=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1loSAV-007MQP-QS
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:48:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35C8D1042;
 Wed,  2 Jun 2021 07:30:32 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.31.212])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D16593F73D;
 Wed,  2 Jun 2021 07:30:19 -0700 (PDT)
Date: Wed, 2 Jun 2021 15:30:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210602143016.GE12753@C02TD0UTHF1T.local>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.398289363@infradead.org>
 <1873020549.5854.1622642347895.JavaMail.zimbra@efficios.com>
 <YLeRVQbXt2hCiO8f@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLeRVQbXt2hCiO8f@hirez.programming.kicks-ass.net>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1loSAV-007MQP-QS
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Mike Snitzer <snitzer@redhat.com>,
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
 John Stultz <john.stultz@linaro.org>, paulmck <paulmck@kernel.org>,
 linux-pm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Waiman Long <longman@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 acme <acme@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 rcu <rcu@vger.kernel.org>, bristot <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 04:10:29PM +0200, Peter Zijlstra wrote:
> On Wed, Jun 02, 2021 at 09:59:07AM -0400, Mathieu Desnoyers wrote:
> > ----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:
> > 
> > > When ran from the sched-out path (preempt_notifier or perf_event),
> > > p->state is irrelevant to determine preemption. You can get preempted
> > > with !task_is_running() just fine.
> > > 
> > > The right indicator for preemption is if the task is still on the
> > > runqueue in the sched-out path.
> > > 
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > ---
> > > kernel/events/core.c |    7 +++----
> > > virt/kvm/kvm_main.c  |    2 +-
> > > 2 files changed, 4 insertions(+), 5 deletions(-)
> > > 
> > > --- a/kernel/events/core.c
> > > +++ b/kernel/events/core.c
> > > @@ -8568,13 +8568,12 @@ static void perf_event_switch(struct tas
> > > 		},
> > > 	};
> > > 
> > > -	if (!sched_in && task->state == TASK_RUNNING)
> > > +	if (!sched_in && current->on_rq) {
> > 
> > This changes from checking task->state to current->on_rq, but this change
> > from "task" to "current" is not described in the commit message, which is odd.
> > 
> > Are we really sure that task == current here ?
> 
> Yeah, @task == @prev == current at this point, but yes, not sure why I
> changed that... lemme change that back to task.

FWIW, with that:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I have no strong feelings either way w.r.t. the whitespace cleanup. ;)

Thanks,
Mark


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
