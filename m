Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F0398C26
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 16:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loRcm-0007XE-OS
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 14:13:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1loRcT-0007Wh-7Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FzJfBljo4B8RxU2ilIDhSLr34HFST0rQLNCYNw/HW+w=; b=YCeecF0sL2ibRbFptkBep349kP
 QT/eL/27nuzrdOs0Eh10NsNI+uh6ffDs23ByXTWjImy4HoqKHOMEHnpvpZZuw2x47mPA5wHjrVmbe
 Dj3rBrb9x73RRapJgLPSiW7UCGROGsM8HKFuG4h03GEirruVrxp00HbWX7qEfpqUf+UE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FzJfBljo4B8RxU2ilIDhSLr34HFST0rQLNCYNw/HW+w=; b=NA9nXszPU1DFaIaOmeO4v4lVSI
 TdMGcV9zrZx+J8xk3D3SmHKQ46mJIbuBG0tPHng6XWorvH8AT533vC+ghKkPZGBzP8vUasMU5D07A
 rYFznNJd+zugX9A3K+iDV27vHm3ijE58mDrUfetrUxStIVfHSRpqxLkeFMTqBsmKnvsI=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRcO-00012m-6B
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FzJfBljo4B8RxU2ilIDhSLr34HFST0rQLNCYNw/HW+w=; b=L9vjUarjZTu6NzihPxyvfr9SrD
 cXp2K8L/lswul4alVU9a5KXYcmiYKaI0pVqEPrOTObk1bWVjIa727CcohFhQnptUDt9rVM7+wZokD
 bdiAP5TkdYqfBQHbyzuL3QwjL5RpkYojkJ5M5vFeN5hhURZOWxGVnCDXhqvgtesERKVZoPVmmu+1u
 zvBuQ/5U6yi+c+8BHLKEGRhN8+mOxmjvdNXmQvv5K7kABrgsWq6TQpgiZuniSUsdWGatjG0TQN4HN
 iyi9j9XYfQaN+mhBZrOglYAeu1Bmuw53jmWdaNNlHNX9gCtb8Ta+n9yUYscEboZQaYK4WTzPQHe3/
 3aLE6Hfw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRbc-002uVW-Rw; Wed, 02 Jun 2021 14:12:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D1A2330008D;
 Wed,  2 Jun 2021 16:12:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B760020223DA5; Wed,  2 Jun 2021 16:12:30 +0200 (CEST)
Date: Wed, 2 Jun 2021 16:12:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Message-ID: <YLeRzlEmbdsMrFcG@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.461908001@infradead.org>
 <1731339790.5856.1622642489232.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1731339790.5856.1622642489232.JavaMail.zimbra@efficios.com>
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
X-Headers-End: 1loRcO-00012m-6B
Subject: Re: [Kgdb-bugreport] [PATCH 4/6] sched: Add get_current_state()
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

On Wed, Jun 02, 2021 at 10:01:29AM -0400, Mathieu Desnoyers wrote:
> ----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:
> 
> > Remove yet another few p->state accesses.
> 
> [...]
> 
> > 
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -212,6 +212,8 @@ struct task_group;
> > 
> > #endif
> > 
> > +#define get_current_state()	READ_ONCE(current->state)
> 
> Why use a macro rather than a static inline here ?

Mostly to be consistent, all that state stuff is macros. I suppose we
could try and make them inlines at the end or so -- if the header maze
allows.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
