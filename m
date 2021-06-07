Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F1C39DAD5
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Jun 2021 13:11:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lqDAg-00029L-3U
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Jun 2021 11:11:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1lqDAf-000295-0A
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Jun 2021 11:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NLj4NYDQW6SbenCIcbS9QrwkO4aohp/HPEuCGPuaREs=; b=EeYreDCD8RV1t40esTkM8FL4G4
 t2+i3WREtmAD+9xBxDT7WEXTsJXeyic18i0KOiJR/uD9vCGkwj37V033XvwrwTKVDnNFH557m6kBf
 lNqyei9I2xemaigJ1AejyZYZtVgC7SbDF+UWOf7F0h9YSd813iM+cQ8CWJzX71KCjIH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NLj4NYDQW6SbenCIcbS9QrwkO4aohp/HPEuCGPuaREs=; b=chR1CzQko3osiHe3beJVEGCgPJ
 sztu7Wvc/cuKe7Vtp+eQIR9C/+P5DT0khyR41GaX/7JqeHOwnx+7XTBr4cy46EMXrYYzeW1UHkjk4
 ZbW0cjbzuNaJquTC1R4U0hz8n/KsQ5u0tkSu811IjPxQsxeSXXUCyPX3N5L7JXVJRBqA=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqDAT-00081F-Tf
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Jun 2021 11:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NLj4NYDQW6SbenCIcbS9QrwkO4aohp/HPEuCGPuaREs=; b=cPnEKquwt970ZOfmptV8ZPqMgA
 nDKIN3sS9ih9nuu8IzgPQnkE+3vwyvAnDc2ZrMU9wmERzTb3IGMYGi4WE6+4lUgqF2JtL/lM/I5kJ
 eiHF9IMB2d+Y9lTFFFVOwPJJI9S76oa/nkFLOGjGCPqHZTpDXHEuTaeqYbLfHC8bQodhRsFoh+Qy8
 dTHV3vTaUZfqdQXrfYxuM6d63mJeyrNKoQ2Zm8n4XPuwlvYtbjKQlZwLanaf8FCczQxwMbK2aY9KZ
 5ZBbcHBMtWS/MR3PhHmCJk3dhHVW0UT+bEq4donFnJVNzTVZUBUUF9jUBREUKuzW6aCVhr/V5xCxL
 LVjMXPEw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqD9a-004Mvt-Aj; Mon, 07 Jun 2021 11:10:53 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 12A093002CA;
 Mon,  7 Jun 2021 13:10:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A8BB82CF3852B; Mon,  7 Jun 2021 13:10:49 +0200 (CEST)
Date: Mon, 7 Jun 2021 13:10:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <YL3+ucpG/LOcO35G@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.587042016@infradead.org>
 <20210607104500.sopvslejuoxwzhrs@maple.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607104500.sopvslejuoxwzhrs@maple.lan>
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [24.132.217.100 listed in zen.spamhaus.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lqDAT-00081F-Tf
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
 Davidlohr Bueso <dave@stgolabs.net>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 07, 2021 at 11:45:00AM +0100, Daniel Thompson wrote:
> On Wed, Jun 02, 2021 at 03:12:31PM +0200, Peter Zijlstra wrote:
> > Change the type and name of task_struct::state. Drop the volatile and
> > shrink it to an 'unsigned int'. Rename it in order to find all uses
> > such that we can use READ_ONCE/WRITE_ONCE as appropriate.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  ...
> >  kernel/debug/kdb/kdb_support.c |   18 +++++++------
> >  ...
> > --- a/kernel/debug/kdb/kdb_support.c
> > +++ b/kernel/debug/kdb/kdb_support.c
> > @@ -609,23 +609,25 @@ unsigned long kdb_task_state_string(cons
> >   */
> >  char kdb_task_state_char (const struct task_struct *p)
> >  {
> > -	int cpu;
> > -	char state;
> > +	unsigned int p_state;
> >  	unsigned long tmp;
> > +	char state;
> > +	int cpu;
> >  
> >  	if (!p ||
> >  	    copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
> >  		return 'E';
> >  
> >  	cpu = kdb_process_cpu(p);
> > -	state = (p->state == 0) ? 'R' :
> > -		(p->state < 0) ? 'U' :
> > -		(p->state & TASK_UNINTERRUPTIBLE) ? 'D' :
> > -		(p->state & TASK_STOPPED) ? 'T' :
> > -		(p->state & TASK_TRACED) ? 'C' :
> > +	p_state = READ_ONCE(p->__state);
> > +	state = (p_state == 0) ? 'R' :
> > +		(p_state < 0) ? 'U' :
> 
> Looks like the U here stands for Unreachable since this patch makes it
> more obvious that this clause is (and previously was) exactly that!
> 
> Dropping the U state would be good since I guess this will show up as a
> "new" warning in some tools. However it was a preexisting problem so with
> or without this cleaned up:
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks!

Note that there's a second instance of this exact code in
arch/powerpc/xmon/xmon.c, with the same 'U' issue.

I'll repost this soon, as it seems I've fixed all robot failout (fingers
crossed).


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
