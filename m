Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6C39963E
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Jun 2021 01:16:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loa5s-0000JX-Qo
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 23:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dave@stgolabs.net>) id 1loa5q-0000JP-Co
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 23:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zqex69WfVkOhBU9ZajH7dNpOt7vZ9l9Cp7EKghNQGLQ=; b=IQmIko+l0dt9HAWLkq0rnNTCL2
 KvfQLBKr7tZJUOMoZsQQ8TUSPsc0E/U5nf/zq4Q4hG34ffqWvNmyd3pgErQnCIQUD/YwXKrfwzuqq
 FULkuEKYLcfDfCQcNLUB1BCqgvs6cKLm4acyuR1L1Hdml+b639CbZaDfz+tPvOvr8eCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zqex69WfVkOhBU9ZajH7dNpOt7vZ9l9Cp7EKghNQGLQ=; b=FkN1qFqCoi6QZI2CCf3Q4jL6zh
 QEG6OMUYrXS4hyRv+1KsDoDQfWkFaSbGxWx7usqJmeD2LjoNn+v3ue/5z8gX1jQNRUF5S9eOX4O8R
 nADsye0KoIFhorNUL4R8lCmaY8/jK7gZLMaK0YzE6KB7nh52x4fyZpM2+cHiPCQOI0FI=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1loa5m-00062l-7R
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 23:16:10 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43EC1219D7;
 Wed,  2 Jun 2021 23:16:00 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4AECA118DD;
 Wed,  2 Jun 2021 23:15:48 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id VMCuCCQRuGAfYQAALh3uQQ
 (envelope-from <dave@stgolabs.net>); Wed, 02 Jun 2021 23:15:48 +0000
Date: Wed, 2 Jun 2021 16:15:42 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210602231542.ejrjbilfggq4whg7@offworld>
Mail-Followup-To: Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Jens Axboe <axboe@kernel.dk>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
 rcu@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org
References: <20210602131225.336600299@infradead.org>
 <20210602133040.334970485@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602133040.334970485@infradead.org>
User-Agent: NeoMutt/20201120
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1loa5m-00062l-7R
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
 Vincent Guittot <vincent.guittot@linaro.org>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, John Stultz <john.stultz@linaro.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-pm@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Jason Wessel <jason.wessel@windriver.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 02 Jun 2021, Peter Zijlstra wrote:

>Replace a bunch of 'p->state == TASK_RUNNING' with a new helper:
>task_is_running(p).
>
>Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Acked-by: Davidlohr Bueso

But afaict ....

>---
> arch/x86/kernel/process.c |    4 ++--
> block/blk-mq.c            |    2 +-
> include/linux/sched.h     |    2 ++
> kernel/locking/lockdep.c  |    2 +-
> kernel/rcu/tree_plugin.h  |    2 +-
> kernel/sched/core.c       |    6 +++---
> kernel/sched/stats.h      |    2 +-
> kernel/signal.c           |    2 +-
> kernel/softirq.c          |    3 +--
> mm/compaction.c           |    2 +-
> 10 files changed, 14 insertions(+), 13 deletions(-)

there are also (on top of the already mentioned arch/):

kernel/kcsan/report.c:  const bool is_running = current->state == TASK_RUNNING;
kernel/locking/lockdep.c:       if (p->state == TASK_RUNNING && p != current)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
