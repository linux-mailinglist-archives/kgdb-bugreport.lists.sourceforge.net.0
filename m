Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D6398DE8
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 17:06:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loSRy-0004Ut-5O
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 15:06:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1loSRw-0004Ua-Pl
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 15:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7s9ProXz8HvTT7b1bS1dvJrD+lubfiJ24aOEj43w2fQ=; b=h+eZ06BPiGlolFh8L3JTvKWv2Z
 5LKfn5w7rGIZa/gROeK8LwMhWNBinUv/fVNrXV/rhJfz+FFtzWAY9tvgddRfmlaVloycXlni0qomv
 gr1Txmbn6Lr4VSoCOUyp6OPnjnCO8n/SBvWjI63PQBR9S9OLLixfftQe1h4r8ueCxjIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7s9ProXz8HvTT7b1bS1dvJrD+lubfiJ24aOEj43w2fQ=; b=mur+y4elfQGjcx/0Tcjfh0EPVg
 DrSvfnhnQ4Hbfk77F8cLtpnUcG2dZZD+ZWlGXSq7RvxAt3VPibxqaPZlIMkZz9QXwwYrEv+0cudgd
 B+WxOodIN+uw59P4n5OOwvD5rT2jsl3L8GX3lel2yqpqqPwLmifQdCqI6LuoE/CtUpYM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loSRv-007O8F-EB
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 15:06:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA65E613B1;
 Wed,  2 Jun 2021 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622646382;
 bh=BP0oFnLplpQzbCvalvHpB7NqrdywR5DFEAfyxB1g9Jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jt/JfwEGGlSy3hTqeZO3M/TRZGRYdN+uS6BuUDgGWYc5+7OM1jehc/I9GyTKk2giU
 x8Fz6MywEP2GyftaSPZuTT4frUE4LJJFTbKNlFpWaV8FNSJBHs39bu4E9I4SLfLcqO
 HMHRVnWqIqa56gxBT11Ofr79h6KJWIenXTFIjgotpx1WoRwxUuESzepF3f2J82onWW
 6KmGn6d5Bc6iSjd3ikJm06ctf56Aqa5WONxHcW0SvlYtFWsSxXD7djl+hbn3SCVIAR
 qZZg4puE8ocBtV+bfRn446ajL6ZLJwoZfD6XNzRQcxu8UqCMnHwciVTCXlxPOmPFq8
 KdRM+B30YEPFA==
Date: Wed, 2 Jun 2021 16:06:09 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20210602150609.GD31179@willie-the-truck>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.524487671@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602133040.524487671@infradead.org>
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
X-Headers-End: 1loSRv-007O8F-EB
Subject: Re: [Kgdb-bugreport] [PATCH 5/6] sched,
 timer: Use __set_current_state()
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

On Wed, Jun 02, 2021 at 03:12:30PM +0200, Peter Zijlstra wrote:
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/time/timer.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -1879,7 +1879,7 @@ signed long __sched schedule_timeout(sig
>  			printk(KERN_ERR "schedule_timeout: wrong timeout "
>  				"value %lx\n", timeout);
>  			dump_stack();
> -			current->state = TASK_RUNNING;
> +			__set_current_state(TASK_RUNNING);

Acked-by: Will Deacon <will@kernel.org>

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
