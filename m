Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DAC399AEB
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Jun 2021 08:41:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loh2i-0006bd-Us
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Jun 2021 06:41:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <peterz@infradead.org>) id 1loh2g-0006bV-9e
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Jun 2021 06:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kX55QmPWFxDII3Sge2GJJeSnbWWFYdnRducRMGOGHKQ=; b=Dir4N8n+przFOG2ckYALsKqm53
 c2Vw2sdFVjevED1WhznsBgsHGJ5J0bcomx/BEItZllDlL+Lvk+HMqys0MdUTKcK6FHhvz1JSc5aci
 PykrP3mbOlLiWaPtmoLckl33ZXswlWwiQT820M4MQnsiqBdmqSgNttL2ggZGdmYypQCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kX55QmPWFxDII3Sge2GJJeSnbWWFYdnRducRMGOGHKQ=; b=aW4g4e4fvSpHBIBsmmB6LJE5Hs
 uY1Kbc6Joh1REkJuWqxIxxNlUL87DVXm1SPkgVGl+z1mIDyThfPtlGbQP65AH4F6ut4DJnTZPmOO2
 H2iG2wqg5t99vMsiwx11GiBZ5NXb+1Lm+h7YycImiyp5T05XmA4EcfXw1hyE00WBdVDE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loh2e-008ZMC-ND
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Jun 2021 06:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kX55QmPWFxDII3Sge2GJJeSnbWWFYdnRducRMGOGHKQ=; b=hARedGyAr0sDE+BtvdYhtLLhqT
 xBRJL5OHbgF/0VaAM6QvlBJXr83HT5NVS7V8DRpuXyYFELaqdsUVDKE7xdQXCUsOoQxD+ZryBn0Lj
 TQUUpF9nIf+OhCYb2DCINiYA10TI8AImzzNG9gBDI61JDK4y9IyT9HC7swn3WceMAMX+pproGTr+z
 euH2oJmi+z8yDYk4o986bBSmMqnp2oduWzGnBnR6zXjKvIqpkjAsnYAK7TaquLehFRzRkMRw2LFzB
 sQkU84q2RHe9CpB6m2+QJnfPaODcV/HKj6IpiHproIA95ZpBeuavpXhNkqQKbgxpRXe24aJvU2Taj
 vd1R75YA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1loh0W-00Bsrp-Tp; Thu, 03 Jun 2021 06:39:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A34D330018A;
 Thu,  3 Jun 2021 08:39:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8DD1F20223DB5; Thu,  3 Jun 2021 08:39:05 +0200 (CEST)
Date: Thu, 3 Jun 2021 08:39:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
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
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
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
 Oleg Nesterov <oleg@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
 rcu@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org
Message-ID: <YLh5CaqPHBhBhfVu@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.524487671@infradead.org>
 <20210602195458.uj3rsci4suz4mufj@offworld>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602195458.uj3rsci4suz4mufj@offworld>
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
X-Headers-End: 1loh2e-008ZMC-ND
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 12:54:58PM -0700, Davidlohr Bueso wrote:
> On Wed, 02 Jun 2021, Peter Zijlstra wrote:
> 
> -ENOCHANGELONG

I completely failed to come up with something useful, still do. Subject
says it all.

> But yeah, I thought we had gotten rid of all these.

I too was surprised to find it :-)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
