Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B75398C97
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 16:21:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loRk9-0006Kc-Af
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 14:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1loRk8-0006KS-9k
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jwYPkOxp8bIiCCDES8Qxb1QGLyBu3SVZdBROZyNFfA0=; b=DWk/q1Uti77TSDGsNiUjnqtiTT
 yM68Rw3a2mLxaVsk+E/l4Syzx/cVxY3roJpLgw3z8zeN9ph/X6DTG7+ysjU+1COBggs5jDOnkmhcj
 dmzA6hBXBtLfpt5Ig6p8yq/Z/YOdiVLM3ViXn4s7kkKL3cWLlR1Da+lYwKBTKprPT9ns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jwYPkOxp8bIiCCDES8Qxb1QGLyBu3SVZdBROZyNFfA0=; b=KK5Gie0U8bpeHMBB1jd4oaQGRW
 Zf6oF3ezJL+j8SegQGdt+Wina6lOjh//93wa5Pf98pGcv/9umPTY50jPO130Y+CtcH4sGntfuoDQs
 Q4Fayp81ykv0OYmN6lmtijdyUQoD7e8gDFhFZx4PdWcGTWjcsGdIMDTczmSNJXwUO2yQ=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRjz-0001o4-73
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jwYPkOxp8bIiCCDES8Qxb1QGLyBu3SVZdBROZyNFfA0=; b=Xxv615xncdZQEFrr1bHRLMMu2U
 OqaCFWc54sHFbTJW13AtDPYewqZ8YcVTPwpd9Qc5OnoRpWsz8cfAQ9eSQ5KwoRC3/+EzjpcSDWh0H
 7W8reQPpnsPRXAwnvQmGxgENdJISBUxRfQv5GPB1VAMjsjLbgKsStP7MzLEasOohCJxysGOkYECMg
 Gwxo27rOG3a3S55yEdquv7sYRJNKvPMn8Kfz+MsY9z6svoP1ekd/je9c+Jaqi8y/arGNfbGhikW+b
 mNh4hH1eic9Rqr3hoPm+9JiRu5HuJ/MAdfZebjLsT7iBJPHGKrZ9jTKO2FPHmhESyUiqFe2yraAZt
 seVktLsg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRjL-002ucj-FS; Wed, 02 Jun 2021 14:20:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 09CFB300269;
 Wed,  2 Jun 2021 16:20:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EBF7120223DBF; Wed,  2 Jun 2021 16:20:28 +0200 (CEST)
Date: Wed, 2 Jun 2021 16:20:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Message-ID: <YLeTrNDgBnAMMwEX@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.587042016@infradead.org>
 <896642516.5866.1622642818225.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <896642516.5866.1622642818225.JavaMail.zimbra@efficios.com>
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
X-Headers-End: 1loRjz-0001o4-73
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

On Wed, Jun 02, 2021 at 10:06:58AM -0400, Mathieu Desnoyers wrote:
> ----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:

> > @@ -134,14 +134,14 @@ struct task_group;
> > 	do {							\
> > 		WARN_ON_ONCE(is_special_task_state(state_value));\
> > 		current->task_state_change = _THIS_IP_;		\
> > -		current->state = (state_value);			\
> > +		WRITE_ONCE(current->__state, (state_value));	\
> > 	} while (0)
> 
> Why not introduce set_task_state(p) and get_task_state(p) rather than sprinkle
> READ_ONCE() and WRITE_ONCE() all over the kernel ?

set_task_state() is fundamentally unsound, there's very few sites that
_set_ state on anything other than current, and those sites are super
tricky, eg. ptrace.

Having get_task_state() would seem to suggest it's actually a sane thing
to do, it's not really. Inspecting remote state is full of races, and
some of that really wants cleaning up, but that's for another day.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
