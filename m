Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51744398AC6
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 15:33:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loR00-0005xp-Ty
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 13:33:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1loQzc-0005um-LK
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 13:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Subject:Cc:To:
 From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MWif++fv4mdk5pz9anYuixYupfO2/j1D7alWDQJKz5g=; b=FbkI63ZvX91QuvuYQQh8K2Urmj
 pskLaMEiw+Z/0zn624/dNqvq1Jx0V6Id1TOcGfEqvScT94hVbiomewjJDyqkx0WCs9bTcCKU8V6DK
 mLblRTYYeA3YJd07haN1ZEFXSDO7nZ5qZqR5VXAdhDWiNnaSFiZ/TKYt1nfiuzJ2U3bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MWif++fv4mdk5pz9anYuixYupfO2/j1D7alWDQJKz5g=; b=O
 LqAxrp3UqIlen9DfzX+eQAaGpJXIynWk1gJvwwDGPzO6EJo+SZYKOla6SC+j0UmPNImuqGIJmyY3J
 3lnFqUHqiI93TYwUMsflsMTDhEbYKWtdMvozEsPkSeCjjJJp/hS4fA2abjksW4/TYQoREFE/Zvs9i
 FU7gSPt+oOT7LKuc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loQzX-0005VM-GY
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 13:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=MWif++fv4mdk5pz9anYuixYupfO2/j1D7alWDQJKz5g=; b=PZEfx4wzuQSJBf0ChNzA/G63R0
 ZKT9gZ2ZXo46GZP12y+35WNUglFSn/+AsIoDlhUVJ4OA1knBv8GxnoX6r35r9TYFOwQXJL+GT6zqj
 SOiJTsA8fxnoYg1WbLdmvcLGA1dLmZTTlA6NUI5k9SypIOpnw/3KanuE9xZiqf24DN1LYkv3thoZZ
 TOLfdLugvC21E0bMM0KcU8XTsq29FNKGa/HQqwPNyCBSH1GG57AC43Gy2r+1Q1k7EJ2B2GUumvy3R
 Vq7/OmNCDOXlizjZ/Z/XESgbXt+WYhqjvxT/7AszT4TsZ+S498S8ahrTlfsB4TSLuHAElzGfYYYdx
 v7lZNMZw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1loQxi-00B8o7-PT; Wed, 02 Jun 2021 13:31:16 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3E12D30036B;
 Wed,  2 Jun 2021 15:31:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 9B82F2C14C596; Wed,  2 Jun 2021 15:31:04 +0200 (CEST)
Message-ID: <20210602133040.398289363@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 02 Jun 2021 15:12:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
References: <20210602131225.336600299@infradead.org>
MIME-Version: 1.0
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
X-Headers-End: 1loQzX-0005VM-GY
Subject: [Kgdb-bugreport] [PATCH 3/6] sched, perf,
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
Cc: Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Zefan Li <lizefan.x@bytedance.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>,
 netdev@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Alasdair Kergon <agk@redhat.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org, x86@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, John Stultz <john.stultz@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-pm@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Waiman Long <longman@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Tejun Heo <tj@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

When ran from the sched-out path (preempt_notifier or perf_event),
p->state is irrelevant to determine preemption. You can get preempted
with !task_is_running() just fine.

The right indicator for preemption is if the task is still on the
runqueue in the sched-out path.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |    7 +++----
 virt/kvm/kvm_main.c  |    2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8568,13 +8568,12 @@ static void perf_event_switch(struct tas
 		},
 	};
 
-	if (!sched_in && task->state == TASK_RUNNING)
+	if (!sched_in && current->on_rq) {
 		switch_event.event_id.header.misc |=
 				PERF_RECORD_MISC_SWITCH_OUT_PREEMPT;
+	}
 
-	perf_iterate_sb(perf_event_switch_output,
-		       &switch_event,
-		       NULL);
+	perf_iterate_sb(perf_event_switch_output, &switch_event, NULL);
 }
 
 /*
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4869,7 +4869,7 @@ static void kvm_sched_out(struct preempt
 {
 	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
 
-	if (current->state == TASK_RUNNING) {
+	if (current->on_rq) {
 		WRITE_ONCE(vcpu->preempted, true);
 		WRITE_ONCE(vcpu->ready, true);
 	}




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
