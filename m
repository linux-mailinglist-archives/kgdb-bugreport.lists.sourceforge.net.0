Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D23E03D9
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  4 Aug 2021 17:04:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mBIRq-0007wS-ND
	for lists+kgdb-bugreport@lfdr.de; Wed, 04 Aug 2021 15:04:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1mBIRp-0007wI-5t
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 15:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6aUVH/oLofEmmm6h+v2hcxaCiBX9BgRXOiDFnU5oRiQ=; b=QEKPrX8vmFdKTcgoKfFetdDhAc
 +0ikN2yy1GmlUdAl1djH2Y46vwChsYzr2ldVuOto1hTlkZsFJRAK4N0jTM1nuqkIw+yslBNrdtX1L
 I1s0TqSfiSdQUJTOGeJ/REnwpy3X0uw08FvbhSePbSl/s98zUW6uJVFWg09/TLMBbkkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6aUVH/oLofEmmm6h+v2hcxaCiBX9BgRXOiDFnU5oRiQ=; b=R4s16Cef/kf4b9brQ2k05OkP8p
 51gCsqU2EvLdP+fRm/2Rg+ociog+IvJUrwjQxiNA2IfilZHkGpJdzSN7468Wh6fV1n3vIaFqAqayN
 kelw5Yf0teiQAi6M9u1uY944wCY5Vb0HrWI4iNkfJnvi3nnGK1fgVtVfg6YG4PNZg260=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBIRl-0006c1-0b
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 15:04:44 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so1450711wms.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 04 Aug 2021 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6aUVH/oLofEmmm6h+v2hcxaCiBX9BgRXOiDFnU5oRiQ=;
 b=AuCKuZ40QgcSYPXdblKcj4kcdmjIXcOcMu/6OXSijGIKG+9ZEduszPOpb6Wy7siTBu
 aDQVeDRRtfKHh0DSmUUnlF1MyhHeBuyTFWDz/rupBcCkanJFAcmVn1gxD3M6jhUJFR0c
 aoFBS42Y8iEZuJJQYwiiK3FqrE/vD3HCdLTc4iOAMmb39QE7stztPLYdeO1xj59IttAw
 Efh4T2Avp4vh+kGDf6xZUpTuy8gBk+TQ3lZ79PfmtRvth5ggDb7V/l4jQGHEnU2YolWg
 kMcSWvW28mM9WsaGCvSH5yGp2CcQgK5ZiNGB/S/efgdqNxucA/BVLVUMVAVuHWYqZwHs
 g0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6aUVH/oLofEmmm6h+v2hcxaCiBX9BgRXOiDFnU5oRiQ=;
 b=U/9mLiH1KIb/CEaWX7ABSWoVeRDmvPrYzuDbwLR8o8VsMbwXs9/XkhVQ0XobmyuVO4
 wAdXbjY9gLsXWyfi1+qHMmaXTUxo8ZSI+fY26nWEA8R9qPb48WbRfeAPUPP6EteDDheK
 e7N+YvyFG/WYzXuwq9LQN772rBQ9uHOv6+4Xrreqy5i+QG7kkBvRaCPQzEBTQmzZQDfI
 GDLdqE/V4h4P05E1XQPrxSvdL4inhiO/hZr0z6zMlb4sVbFFIaHehOFMHzlHOsOd8+I1
 odsSgCuUtO7/OCrdTP1MU67EdXVoxcUIcyryurxZSNsUEbnbjkS9E/qNt07JbTtDJ1q9
 deeA==
X-Gm-Message-State: AOAM531n1DwRuAKmfoRPs6QzltWoCQmVWYD6PrG2YDSVnnk0E+qmSbIZ
 G1+3W1T1BQFec+8Xi1D6oiQ37Q==
X-Google-Smtp-Source: ABdhPJyVKS2KYPrHTlu7TD/lkdA7+BjOWbghd40OQTpu+TAAM9zjd70hDbrMzKWO8CQhm4tJjA99gA==
X-Received: by 2002:a05:600c:4f0d:: with SMTP id
 l13mr93288wmq.18.1628089474526; 
 Wed, 04 Aug 2021 08:04:34 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w5sm3361185wro.45.2021.08.04.08.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:04:33 -0700 (PDT)
Date: Wed, 4 Aug 2021 16:04:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20210804150431.qtra3wvh2n4m6j64@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
 <20210804113159.lsnoyylifg6v5i35@maple.lan>
 <YQqEJtmNFxVxH3U/@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQqEJtmNFxVxH3U/@alley>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.52 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBIRl-0006c1-0b
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 03/10] kgdb: delay roundup if
 holding printk cpulock
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, John Ogness <john.ogness@linutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 04, 2021 at 02:12:22PM +0200, Petr Mladek wrote:
> On Wed 2021-08-04 12:31:59, Daniel Thompson wrote:
> > On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> > > On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > > > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> > > >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> > > >> during cpu roundup. This will conflict with the printk cpulock.
> > > >
> > > > When the full vision is realized what will be the purpose of the printk
> > > > cpulock?
> > > >
> > > > I'm asking largely because it's current role is actively unhelpful
> > > > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> > > > be a better (and safer) solution. However it sounds like there is a
> > > > larger role planned for the printk cpulock...
> > > 
> > > The printk cpulock is used as a synchronization mechanism for
> > > implementing atomic consoles, which need to be able to safely interrupt
> > > the console write() activity at any time and immediately continue with
> > > their own printing. The ultimate goal is to move all console printing
> > > into per-console dedicated kthreads, so the primary function of the
> > > printk cpulock is really to immediately _stop_ the CPU/kthread
> > > performing write() in order to allow write_atomic() (from any context on
> > > any CPU) to safely and reliably take over.
> > 
> > I see.
> > 
> > Is there any mileage in allowing in_dbg_master() to suppress taking
> > the console lock?
> > 
> > There's a couple of reasons to worry about the current approach.
> > 
> > The first is that we don't want this code to trigger in the case when
> > kgdb is enabled and kdb is not since it is only kdb (a self-hosted
> > debugger) than uses the consoles. This case is relatively trivial to
> > address since we can rename it kdb_roundup_delay() and alter the way it
> > is conditionally compiled.
> > 
> > The second is more of a problem however. kdb will only call into the
> > console code from the debug master. By default this is the CPU that
> > takes the debug trap so initial prints will work fine. However it is
> > possible to switch to a different master (so we can read per-CPU
> > registers and things like that). This will result in one of the CPUs
> > that did the IPI round up calling into console code and this is unsafe
> > in that instance.
> > 
> > There are a couple of tricks we could adopt to work around this but
> > given the slightly odd calling context for kdb (all CPUs quiesced, no
> > log interleaving possible) it sounds like it would remain safe to
> > bypass the lock if in_dbg_master() is true.
> > 
> > Bypassing an inconvenient lock might sound icky but:
> > 
> > 1. If the lock is not owned by any CPU then what kdb will do is safe.
> >
> > 2. If the lock is owned by any CPU then we have quiesced it anyway
> >    and this makes is safe for the owning CPU to share its ownership
> >    (since it isn't much different to recursive acquisition on a single
> >    CPU)
> 
> I think about the following:
> 
> void kgdb_roundup_cpus(void)
> {
> 	__printk_cpu_lock();
> 	__kgdb_roundup_cpus();
> }
> 
> , where __printk_cpu_lock() waits/takes printk_cpu_lock()
> 	__kgdb_roundup_cpus() is the original kgdb_roundup_cpus();
> 
> 
> The idea is that kgdb_roundup_cpus() caller takes the printk_cpu lock.
> The owner will be well defined.
> 
> As a result any other CPU will not be able to take the printk_cpu lock
> as long as it is owned by the kgdb lock. But as you say, kgdb will
> make sure that everything is serialized at this stage. So that
> the original raw_printk_cpu_lock_irqsave() might just disable
> IRQs when called under debugger.
> 
> Does it make any sense?

Yes but I think it is still has problems.

Primarily is doesn't solve the issue I raised. It would still be unsafe
to change debug master: we can guarantee the initial master owns the
lock but if it has been multiply acquired we cannot transfer ownership
when we want to change master.

Additionally it will delay the round up of cores that do not own the
lock. The quiescing is never atomic and the operator needs to know
that but the longer CPUs are allows to execute for the more confusing
things can become for the operator.

Finally on machines without an NMI this could cause trouble with the
interrupt disable in raw_printk_cpu_lock_irqsave() (or any outer level
interrupt disable). If the master get the lock then the other processes
will become incapable of being rounded up if they are waiting for the
printk lock).


> I have to say that it is a bit hairy. But it looks slightly better
> than the delayed/repeated IPI proposed by this patch.

I'd like to reserve judgement for now which one is least worst...
largely because if the purpose of the lock simply to prevent interleaving
of console output then the debugger quiescing code should already have
this covered.

It leaves me wondering if a change like the one below is sufficient
(based on code without John's patches but hopefully still clear enough).
I've given the new code it's own branch which it doesn't, strictly
speaking, need but it is easier to comment this way... and perhaps also
just a little easier for people who have not set CONFIG_KGDB to
ignore ;-).

~~~
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 142a58d124d9..41a7e103bb66 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3599,6 +3599,18 @@ int __printk_cpu_trylock(void)
                /* This CPU is already the owner. */
                atomic_inc(&printk_cpulock_nested);
                return 1;
+       } else if (in_dbg_master()) {
+               /*
+                * If we are executing as the primary CPU and with the debugger
+                * active than all other CPUs in the system are quiesced by
+                * the time kdb winds up calling this function. To execute this
+                * branch then the lock must be owned by one of the quiesced CPUs.
+                * Happily, because it is quiesced and cannot release it, it is
+                * safe for us to allow the lock to be taken from a different CPU!
+                * The lock will be released prior to resuming the real owner.
+                */
+               atomic_inc(&printk_cpulock_nested);
+               return 1;
        }
 
        return 0;
~~~


Daniel.


PS In the interested of full disclosure there is a special case
   in the debugger to allow it to try to cope if it fails to
   quiesce a CPU and I deliberately omitted this from the long
   comment above. That special case is expected to be unstable
   but since the alternative is likely to be a permanent deadlock
   without any indication of why we choose to take the risk of
   continuing. Personally I don't recommend reasoning about
   console safety based on this emergency case hence omitting the
   comment.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
