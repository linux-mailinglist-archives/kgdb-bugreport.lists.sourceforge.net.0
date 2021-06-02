Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265B39DA02
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Jun 2021 12:46:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lqCls-0003Vf-Dk
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Jun 2021 10:46:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <compudj@efficios.com>) id 1loRbq-0006Tt-2B
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ildkMTk0vYSZK39yeI6C0NluRoGntZ1yA5EuqMA4g8k=; b=gGRfXI244zds/PvKXmTr+ixtzZ
 5a9D7r/DRY2TcTUXCCRAQ3Pf9aMuo84DeIGosre2O8+A5Ou7FJQDScCkCPhl8le+PajxPnEm7XTtP
 A4TgC2b8T8Nf4Vm57VCyvyxMhTPp/0YpdAcY6en7mFoJGBKRnMlztlt2Msp1Vm28sgAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ildkMTk0vYSZK39yeI6C0NluRoGntZ1yA5EuqMA4g8k=; b=a8Zwn5jB2Efub2BhTXiR8mqcoK
 5GZxt6I8+AWjaqq9foRumqEFO8PHPpvBYomsDjpY49guOSY9y7RZaI6xxcF62sX10ig1iJQJwfS+I
 OlcOg0ziV9t6TjeNcHRUHTGqAZ3jkcs6PEsbjnz4LmCLt77C1diB/oE+IGHBlnWnYUIY=;
Received: from mail.efficios.com ([167.114.26.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loRbl-0000zI-CL
 for kgdb-bugreport@lists.sourceforge.net; Wed, 02 Jun 2021 14:12:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 805643029EA;
 Wed,  2 Jun 2021 10:01:30 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5aXZqKFUnM5u; Wed,  2 Jun 2021 10:01:29 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 78F88302B31;
 Wed,  2 Jun 2021 10:01:29 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 78F88302B31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1622642489;
 bh=ildkMTk0vYSZK39yeI6C0NluRoGntZ1yA5EuqMA4g8k=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=L/w8o2fJN3kmP73a2vMCtFWwO5YPeIOe9ZmTydEyFWmyEaOlcyFybIdRWoe8hmy34
 bHqWF5FDpTTdDr9jNR/6ossgQUg8/lo1uSvmOEMQI+8PvcMWXQjFHlESOaJErckXTB
 oIuIBEBiJQ9FvKa8qYSLXZLHpWnciBfTelSzOSmbORnUr52zBvJXfWQpx94UqNlbmY
 Y6yF4/4xX5ToklNVtEYeJ+rmH/TXxAzWx0JJ6vQD3FMua0nJmkIgpXS7yGiTDiDM65
 T6y687zdG38LDyLZ4Slpb06ysgcGN+OXRe4bfPmRBCeqmhnbNwAWPu5258Lpn1Ta7C
 10t9Cfwl8X+bQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6Pg28DJCgmhR; Wed,  2 Jun 2021 10:01:29 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 44D173029E9;
 Wed,  2 Jun 2021 10:01:29 -0400 (EDT)
Date: Wed, 2 Jun 2021 10:01:29 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <1731339790.5856.1622642489232.JavaMail.zimbra@efficios.com>
In-Reply-To: <20210602133040.461908001@infradead.org>
References: <20210602131225.336600299@infradead.org>
 <20210602133040.461908001@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4018 (ZimbraWebClient - FF88 (Linux)/8.8.15_GA_4026)
Thread-Topic: sched: Add get_current_state()
Thread-Index: E1ntXBdpTHBBRaSFxkm2wa7EtTrnhg==
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1loRbl-0000zI-CL
X-Mailman-Approved-At: Mon, 07 Jun 2021 10:46:13 +0000
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

----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:

> Remove yet another few p->state accesses.

[...]

> 
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -212,6 +212,8 @@ struct task_group;
> 
> #endif
> 
> +#define get_current_state()	READ_ONCE(current->state)

Why use a macro rather than a static inline here ?

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
