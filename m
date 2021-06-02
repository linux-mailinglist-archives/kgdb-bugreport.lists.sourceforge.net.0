Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C3398DFF
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 17:10:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loSVz-00059v-Jb
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 15:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1loSVz-00059l-4q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 15:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMoZMjkQxKDhX7c/vTuAXnZ7wKa26+4IsvXaiscLjJs=; b=PKH/rkrRGojMIiM8R4oeStUiLm
 iRL9K8eX6cjrKQluuKTfdT8VRLh/dotnAF0swVSDwChhbg4rpQn9Qcypm2FL5jUiYHoTmWo9Glk1x
 pmmirBVZyq1JFPMlNRocQKJekeHYbN8izWSqflrMQOZkt3nAVLm6oOm5g7YUXBzTyEfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lMoZMjkQxKDhX7c/vTuAXnZ7wKa26+4IsvXaiscLjJs=; b=LP/93sB7mGCClqmNfK3EpwLLar
 Xjh93ImLTKQNXqRRCB4VbYRra4zvj/z6Z4zu53WOuKbNzuksXgtyfejChb7vhWg1xyPNjnis+mhEI
 4Bpckoblr681nBYS6uiOhLOtS2F0+c8LZ0pB2fcqdo8pPnmf2NzeTEBXWTNOQJYS8uwM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loSVu-007Oec-0B
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 15:10:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73C1A61182;
 Wed,  2 Jun 2021 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622646628;
 bh=MmmB5edNPbRN/+c+2On4lV0BgwteW7Cw405ip5Z8YuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eoW8oxXoywj95HF19beDzh3Wa+WhWkiyj9FjvvSEw7ScJ8OuGQbEy6+2TGjP0xVYN
 XSSJAJXvhI5MOj1+GRdHIbg46k9rJSpJMlo/HDJefXpEwJPCDFcYn8COIR/VQO5DZl
 47yzM30C6QaWLqEpy6LeVNCLBHEk+aKjfkrC6CQ5ViDR3bMQ0fCKMIt+zFjJNZMY+v
 SNl2CwOo9QKvwQF6AUEFLQH9ccSyIziiULTl3YApDUWutkiYOLv0+Q04TM9wwWdkfx
 bdsysjlbcoFBsmj9C1l84fr+oHwMhBsnHonyI6jC2MFd17CoX0BlIS16/UkYyFRS6U
 MochfZ+/mAepQ==
Date: Wed, 2 Jun 2021 16:10:11 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210602151010.GE31179@willie-the-truck>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.587042016@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602133040.587042016@infradead.org>
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
X-Headers-End: 1loSVu-007Oec-0B
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

On Wed, Jun 02, 2021 at 03:12:31PM +0200, Peter Zijlstra wrote:
> Change the type and name of task_struct::state. Drop the volatile and
> shrink it to an 'unsigned int'. Rename it in order to find all uses
> such that we can use READ_ONCE/WRITE_ONCE as appropriate.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  block/blk-mq.c                 |    2 -
>  drivers/md/dm.c                |    6 ++--
>  fs/binfmt_elf.c                |    8 +++---
>  fs/userfaultfd.c               |    4 +--
>  include/linux/sched.h          |   31 +++++++++++------------
>  include/linux/sched/debug.h    |    2 -
>  include/linux/sched/signal.h   |    2 -
>  init/init_task.c               |    2 -
>  kernel/cgroup/cgroup-v1.c      |    2 -
>  kernel/debug/kdb/kdb_support.c |   18 +++++++------
>  kernel/fork.c                  |    4 +--
>  kernel/hung_task.c             |    2 -
>  kernel/kthread.c               |    4 +--
>  kernel/locking/mutex.c         |    6 ++--
>  kernel/locking/rtmutex.c       |    4 +--
>  kernel/locking/rwsem.c         |    2 -
>  kernel/ptrace.c                |   12 ++++-----
>  kernel/rcu/rcutorture.c        |    4 +--
>  kernel/rcu/tree_stall.h        |   12 ++++-----
>  kernel/sched/core.c            |   53 +++++++++++++++++++++--------------------
>  kernel/sched/deadline.c        |   10 +++----
>  kernel/sched/fair.c            |   11 +++++---
>  lib/syscall.c                  |    4 +--
>  net/core/dev.c                 |    2 -
>  24 files changed, 108 insertions(+), 99 deletions(-)

I think this makes the code a _lot_ easier to understand, so:

Acked-by: Will Deacon <will@kernel.org>

on the assumption that you'll fix get_wchan() for !x86 as well.

Cheers,

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
