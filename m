Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B339DA03
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Jun 2021 12:46:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lqCls-0003Vo-F4
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Jun 2021 10:46:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <compudj@efficios.com>) id 1loReb-0006au-L5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTS/crR/26N4BDTiNFNNZoqsETfUenagK9Jc/umukAM=; b=bqSg6qeRRFBmujXUcOQbHuRdQl
 8JzUpLFn+pXWbHmnwEDLU9puY3z/MOPGZ0S314GuJb0cJYOpnrjWIB3pT+XPuJCVvSE2i3llO04dv
 KhyHjMM/6PtzoJ4fi5BdAY3rPKkUmwTfHn9H/iU+VXbfHS9NNUFqfT6Y8vn0AB3s0M7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wTS/crR/26N4BDTiNFNNZoqsETfUenagK9Jc/umukAM=; b=K2T/HBbGzQwoNmojAZaoPmUHh/
 xp28BlPlUKcI17YIDhHzrcncwJtOkTRXoX7fLa/aiC/+6kcTv6YFSgsgTqjjhGbuBO122rFhzN4gP
 8SKsiGad2X9K/GD7doCbLYNnyai7R3E5G8YUaER9jYs6Q6iC23Ipn3H3Ut2T++mz+CzA=;
Received: from mail.efficios.com ([167.114.26.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loReV-007JM1-6S
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:15:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 678EE302DAA;
 Wed,  2 Jun 2021 10:15:17 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8RvjTnc1vjOW; Wed,  2 Jun 2021 10:15:17 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 9F3AF302B63;
 Wed,  2 Jun 2021 10:15:16 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9F3AF302B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1622643316;
 bh=wTS/crR/26N4BDTiNFNNZoqsETfUenagK9Jc/umukAM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=HjuuxeCx/W0ucWdgkdPe4Ltmueov6LEz9QoWVQ9n275sUH5V2BfBx2uLemee8nOgV
 iEPOUdYsPm3Mmmkxyd2M/xe2NzuiK0lte25kNJqF/D6aBdMudEsd6+/AvYnVI3XvQB
 I3eKlxdMnA/4sIrtiEyziYHBHFsURA8x1tU1usHbZhQ+Nqw4zpB4HKNzuSQ6QLswXS
 8VevSWMXfGVlYdJrwg5WBPwEe4w0fAdx0pE768+FRtKKL3etA75RfRjkypdxFoVZY5
 KUm3EJy+oFxv1WaIjL0MV00CLSuspl8VcSBxV1CpXr+Or5zRpRWJvt+/OT6gN/Sqjt
 hvtczOpS4cKPQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id INsgB7HWhvRx; Wed,  2 Jun 2021 10:15:16 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 702A6302A65;
 Wed,  2 Jun 2021 10:15:16 -0400 (EDT)
Date: Wed, 2 Jun 2021 10:15:16 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <1524365960.5868.1622643316351.JavaMail.zimbra@efficios.com>
In-Reply-To: <20210602133040.398289363@infradead.org>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.398289363@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF88 (Linux)/8.8.15_GA_4026)
Thread-Topic: sched,perf,kvm: Fix preemption condition
Thread-Index: NELkknquBPwUAC7hR8bH+DhrqDwz1A==
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: efficios.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1loReV-007JM1-6S
X-Mailman-Approved-At: Mon, 07 Jun 2021 10:46:13 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Mike Snitzer <snitzer@redhat.com>,
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
 paulmck <paulmck@kernel.org>, linux-pm@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Waiman Long <longman@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, acme <acme@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Jens Axboe <axboe@kernel.dk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, rcu <rcu@vger.kernel.org>,
 bristot <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:
[...]
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8568,13 +8568,12 @@ static void perf_event_switch(struct tas
> 		},
> 	};
> 
> -	if (!sched_in && task->state == TASK_RUNNING)
> +	if (!sched_in && current->on_rq) {
> 		switch_event.event_id.header.misc |=
> 				PERF_RECORD_MISC_SWITCH_OUT_PREEMPT;
> +	}
> 
> -	perf_iterate_sb(perf_event_switch_output,
> -		       &switch_event,
> -		       NULL);
> +	perf_iterate_sb(perf_event_switch_output, &switch_event, NULL);
> }

There is a lot of code cleanup going on here which does not seem to belong
to a "Fix" patch.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
