Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4C398B37
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  2 Jun 2021 15:58:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1loRO6-0001sY-0o
	for lists+kgdb-bugreport@lfdr.de; Wed, 02 Jun 2021 13:58:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1loRO5-0001sN-2Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 13:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uy7ii+V6J9fjAIXfDMO/I2VrXHeAnD78tKr+Nb1/9Os=; b=Kd4Zozk0oLMKfu6N7epai0I/YW
 NbAcuBzdgW0xWdNK/2b49abohjVbOMXZn/j1jDGittAHZkX4HsQhsYNN2Z7oLz6/OD8C+VXKK4xXJ
 LrAIKmgHLx1bsD/L98qSYb8j5Cyb3wdo9eeUYrab1qouOhrMVg04Y9G/gGfPmW3chSe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uy7ii+V6J9fjAIXfDMO/I2VrXHeAnD78tKr+Nb1/9Os=; b=PTA8QaxVkihzrqzicZUjeRCplB
 selbzNX0fl8ZFOAVSTTwtDjcNjZ08buegfCz89RPsSmczWu5U02ae6JJD2dYqO1A2Swbf6ZPehB4X
 Stz/k+VxlvlZ33BDxVNHpQjC6o0X0s1MKhXviTki+F54sziii0N8t0BkIRyrULu+Q2/8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRNx-007HUl-La
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 13:58:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09B1D60FE3;
 Wed,  2 Jun 2021 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622642287;
 bh=dHpSABRDz/ACjiNwYplGY79xrERr0Xgmy3y4+S1hSB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DyLYFBMg9k5l89eFjJpIxjBnu2FGj82B4XdXYxhPkhiK5M5yuGrI9d91r/PWv2LiV
 K/2h7mAR3azlB6I5M5ciHb74VYjP7zKuJQjACzKPP/OA2ba9LiDUk+xvlBhBE/gp12
 vi5CNlvHSLUJYVKuxJf36nLKhtJxH/zOZTChLuKQ=
Date: Wed, 2 Jun 2021 15:58:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <YLeObHTKKDGd3pdA@kroah.com>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.271625424@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602133040.271625424@infradead.org>
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
X-Headers-End: 1loRNx-007HUl-La
Subject: Re: [Kgdb-bugreport] [PATCH 1/6] sched: Unbreak wakeups
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
 Joel Fernandes <joel@joelfernandes.org>, Jiri Olsa <jolsa@redhat.com>,
 Alasdair Kergon <agk@redhat.com>, Daniel Thompson <daniel.thompson@linaro.org>,
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
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 03:12:26PM +0200, Peter Zijlstra wrote:
> Remove broken task->state references and let wake_up_process() DTRT.
> 
> The anti-pattern in these patches breaks the ordering of ->state vs
> COND as described in the comment near set_current_state() and can lead
> to missed wakeups:
> 
> 	(OoO load, observes RUNNING)<-.
> 	for (;;) {                    |
> 	  t->state = UNINTERRUPTIBLE; |
> 	  smp_mb();          ,-----> ,' (OoO load, observed !COND)
>                              |       |
> 	                     |       |	COND = 1;
> 			     |	     `- if (t->state != RUNNING)
>                              |		  wake_up_process(t); // not done
> 	  if (COND) ---------'
> 	    break;
> 	  schedule(); // forever waiting
> 	}
> 	t->state = TASK_RUNNING;
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/net/ethernet/qualcomm/qca_spi.c |    6 ++----
>  drivers/usb/gadget/udc/max3420_udc.c    |   15 +++++----------
>  drivers/usb/host/max3421-hcd.c          |    3 +--
>  kernel/softirq.c                        |    2 +-
>  4 files changed, 9 insertions(+), 17 deletions(-)

For USB stuff:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
