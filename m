Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 837493E2A49
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  6 Aug 2021 14:06:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mBycK-0007qN-Aj
	for lists+kgdb-bugreport@lfdr.de; Fri, 06 Aug 2021 12:06:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daniel.thompson@linaro.org>) id 1mBycI-0007qE-AF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 06 Aug 2021 12:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48bjwg3AjT99gLa7RaQ9PCD+xfcLUyRZELwltVsP3Kg=; b=hB6QpVShV89wHZf7zZFR6TZETp
 keRBkcv98bFQehHFIWLNmb+1rX1mggAOMYwUk61g6aKfhVPW6VLmR24rv+r9ZgmJAWGoG4ev0A32v
 tTBBhIwxPbicM1eVQBArpuCGJ82uMCh6CR7N7BcaoANkEBItF04qd7m7BchkG2mFn5wE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=48bjwg3AjT99gLa7RaQ9PCD+xfcLUyRZELwltVsP3Kg=; b=V+GLStBR6/1NAyH1QYrOUnmSo/
 GvgCseoWuZUn/8e1h5V1/d2JGN4cn80Gdb8rdjHeyJ6pJjjlkvjYGbZ5Noeas/piei4Wv3m/FT5ow
 rxzb0yi2+32HGetcS0/HZtVOyM1QhFLnqSd9n69BMuQnmtdxdmxq9x2KWH9VD6J+4Or4=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBycC-0008Em-Ew
 for kgdb-bugreport@lists.sourceforge.net; Fri, 06 Aug 2021 12:06:22 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so8781484wms.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 06 Aug 2021 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=48bjwg3AjT99gLa7RaQ9PCD+xfcLUyRZELwltVsP3Kg=;
 b=pAGL6ADJBrO9/JXB3svQangY9O2AdID/tDLSDaiYdMcRWFIfj+I0iRJJD1zhu5uIsw
 GMHPNupaMHHneKENEe/dpQYXbnC8Dg4DsNLC7CBg8F0LmE9GQjKw/f8zLaBXh+jhJVue
 MosLFrlExrC10R5w+d/B2+oOVhBDSzu81Hgx860e+WZpuLAz5tJIPZhC9qxmgr4yFPDS
 h5UILUvOzayafRp+8ds5qvMPPfsOvKhxMns+nIfc6Ipix+zCIkM+yWyUtF/lX5+LiV2S
 HxYD7wT9qXbQstveOf2dtRHH63aTUdE/hC/y/MaxS2/LAcfYXq3OQr6SvIHTzuJviUXK
 HROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=48bjwg3AjT99gLa7RaQ9PCD+xfcLUyRZELwltVsP3Kg=;
 b=bFSLZQ/kCQ5UKuDWzH20ZwTU8+PNLfIbb3jG4CZCqXGVGYDjgfVipuG+PqHesulybR
 OOsxm6BallWdsbobsWJ+12cQ0gN/a1xw8qdRotyZM9YfAQZwNI0/UXQN+8HfoBQroN+W
 Db/gdZWXAcu8KGN8Z20ovuhVtoiL3nO4fMqX6KZEbkh7KvqpRObfaYeKdGKeXT5jDSz0
 VrjotBYEiMfTsx6Zkemr7LbduSermc6Q7KtCyvRN+SWA1lchfLH47svbiEmuROLa2ZVE
 K0oIt7lp+VQuUVtJFsKYl43XTUKJC4NmfSvTedbYTlSb6ZANsqAIS0dg0CYcdHMxfcTc
 OQpA==
X-Gm-Message-State: AOAM532h0I5Uqz2hkKAnnZ3YIxrUSf+cSVmzzDFTD1LS55KWNDQFsEFG
 mW9W9MuFBinWwc32SZ6GVuDyag==
X-Google-Smtp-Source: ABdhPJz/cM3N6S1TaXClOMrLnVGAB3ZAHjMF9Ve81TBgUGNATDsTmRN9LaZ1NbWvcpSYbqTI5M47qQ==
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr20153350wmm.171.1628251569919; 
 Fri, 06 Aug 2021 05:06:09 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id a191sm8041124wme.15.2021.08.06.05.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 05:06:08 -0700 (PDT)
Date: Fri, 6 Aug 2021 13:06:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20210806120606.uxm4qg4mk5s5ocbh@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
 <20210804113159.lsnoyylifg6v5i35@maple.lan>
 <YQqEJtmNFxVxH3U/@alley>
 <20210804150431.qtra3wvh2n4m6j64@maple.lan>
 <87tuk4lfj0.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuk4lfj0.fsf@jogness.linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBycC-0008Em-Ew
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
 kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Aug 05, 2021 at 05:52:43AM +0206, John Ogness wrote:
> On 2021-08-04, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > On Wed, Aug 04, 2021 at 02:12:22PM +0200, Petr Mladek wrote:
> >> On Wed 2021-08-04 12:31:59, Daniel Thompson wrote:
> >> > On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> >> > > On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> >> > > > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> >> > > >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> >> > > >> during cpu roundup. This will conflict with the printk cpulock.
> >> > > >
> >> > > > When the full vision is realized what will be the purpose of the printk
> >> > > > cpulock?
> >> > > >
> >> > > > I'm asking largely because it's current role is actively unhelpful
> >> > > > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> >> > > > be a better (and safer) solution. However it sounds like there is a
> >> > > > larger role planned for the printk cpulock...
> >> > > 
> >> > > The printk cpulock is used as a synchronization mechanism for
> >> > > implementing atomic consoles, which need to be able to safely interrupt
> >> > > the console write() activity at any time and immediately continue with
> >> > > their own printing. The ultimate goal is to move all console printing
> >> > > into per-console dedicated kthreads, so the primary function of the
> >> > > printk cpulock is really to immediately _stop_ the CPU/kthread
> >> > > performing write() in order to allow write_atomic() (from any context on
> >> > > any CPU) to safely and reliably take over.
> >> > 
> >> > I see.
> >> > 
> >> > Is there any mileage in allowing in_dbg_master() to suppress taking
> >> > the console lock?
> >> > 
> >> > There's a couple of reasons to worry about the current approach.
> >> > 
> >> > The first is that we don't want this code to trigger in the case when
> >> > kgdb is enabled and kdb is not since it is only kdb (a self-hosted
> >> > debugger) than uses the consoles. This case is relatively trivial to
> >> > address since we can rename it kdb_roundup_delay() and alter the way it
> >> > is conditionally compiled.
> 
> Well, _I_ want this code to trigger even without kdb. The printk cpulock
> is meant to be the innermost locking for the entire kernel. No code is
> allowed to block/spin on any kind of lock if holding the printk
> cpulock. This is the only way to guarantee the functionality of the
> atomic consoles.
>
> For example, if the kernel were to crash while inside kgdb code, we want
> to see the backtrace.

That would certainly help me debug any such problems in kgdb ;-) .


> Since kgdb _does_ take locks (spinning on @dbg_slave_lock during roundup
> and the master's own cpu lock as a retry loop on @dbg_master_lock),
> clearly it is not allowed to hold the printk cpulock. The simplest
> solution I could find was just to make sure kgdb_cpu_enter() isn't
> called while holding the printk cpulock.

We might have to come back to this. I'm pretty certain your patch
does not currently achieve this goal.


> >> > The second is more of a problem however. kdb will only call into the
> >> > console code from the debug master. By default this is the CPU that
> >> > takes the debug trap so initial prints will work fine. However it is
> >> > possible to switch to a different master (so we can read per-CPU
> >> > registers and things like that). This will result in one of the CPUs
> >> > that did the IPI round up calling into console code and this is unsafe
> >> > in that instance.
> 
> It is only unsafe if a CPU enters "kgdb/kdb context" while holding the
> printk cpulock. That is what I want to prevent.

Currently you can preventing this only for CPUs that enter the debugger
via an IPI. CPUs that enter due to a breakpoint (and there can be more
than one at a time) cannot just continue until the lock is dropped
since they would end up re-executing the breakpoint instruction.


> >> > There are a couple of tricks we could adopt to work around this but
> >> > given the slightly odd calling context for kdb (all CPUs quiesced, no
> >> > log interleaving possible) it sounds like it would remain safe to
> >> > bypass the lock if in_dbg_master() is true.
> >> > 
> >> > Bypassing an inconvenient lock might sound icky but:
> >> > 
> >> > 1. If the lock is not owned by any CPU then what kdb will do is safe.
> 
> No. The printk cpulock exists for low-level synchronization. The atomic
> consoles need this synchronization. (For example, the 8250 needs this
> for correct tracking of its interrupt register, even for
> serial8250_put_poll_char().)

What I mean is that because kdb is mono-threaded (even on SMP systems
due to the quiescing of other CPUs) then if the lock is not taken when
we enter kdb then it is safe for kdb to contend for the lock in the
normal way since it cannot deadlock.

BTW the synchronization in question is the need for strict nesting, is
that right? (e.g.  that each context that recursively acquires the lock
will release it in strict reverse order?).


> >> > 2. If the lock is owned by any CPU then we have quiesced it anyway
> >> >    and this makes is safe for the owning CPU to share its ownership
> >> >    (since it isn't much different to recursive acquisition on a single
> >> >    CPU)
> 
> Quiescing the printk cpulock is not permitted.

Sorry I wasn't quite clear in phrasing here. I don't think of it as
quiescing the lock, I think of it as quiescing the CPU that owns the
lock.

If any CPU that owns the lock *and* all CPUs except the debug master are
quiesced then allowing the debug master to take the lock is essentially
a special case of recursive acquisition and it will nest correctly.


> Just because it is kdb, does not mean that the atomic consoles were
> interrupted in a convenient place. The whole purpose of the atomic
> consoles is so that we can have guaranteed console output from _any_
> context and _any_ line of code in the kernel.
> 
> >> I think about the following:
> >> 
> >> void kgdb_roundup_cpus(void)
> >> {
> >> 	__printk_cpu_lock();
> >> 	__kgdb_roundup_cpus();
> >> }
> >> 
> >> , where __printk_cpu_lock() waits/takes printk_cpu_lock()
> >> 	__kgdb_roundup_cpus() is the original kgdb_roundup_cpus();
> >> 
> >> 
> >> The idea is that kgdb_roundup_cpus() caller takes the printk_cpu lock.
> >> The owner will be well defined.
> >> 
> >> As a result any other CPU will not be able to take the printk_cpu lock
> >> as long as it is owned by the kgdb lock. But as you say, kgdb will
> >> make sure that everything is serialized at this stage. So that
> >> the original raw_printk_cpu_lock_irqsave() might just disable
> >> IRQs when called under debugger.
> >> 
> >> Does it make any sense?
> >
> > Yes but I think it is still has problems.
> >
> > Primarily is doesn't solve the issue I raised. It would still be unsafe
> > to change debug master: we can guarantee the initial master owns the
> > lock but if it has been multiply acquired we cannot transfer ownership
> > when we want to change master.
> >
> > Additionally it will delay the round up of cores that do not own the
> > lock. The quiescing is never atomic and the operator needs to know
> > that but the longer CPUs are allows to execute for the more confusing
> > things can become for the operator.
> >
> > Finally on machines without an NMI this could cause trouble with the
> > interrupt disable in raw_printk_cpu_lock_irqsave() (or any outer level
> > interrupt disable). If the master get the lock then the other processes
> > will become incapable of being rounded up if they are waiting for the
> > printk lock).
> 
> I am also not happy with such a solution. Aside from Daniel's comments,
> it also violates the basic principle of the printk cpulock by allowing
> further locking while holding the print cpulock. That is a recipe for
> deadlock.
> 
> >> I have to say that it is a bit hairy. But it looks slightly better
> >> than the delayed/repeated IPI proposed by this patch.
> >
> > I'd like to reserve judgement for now which one is least worst...
> > largely because if the purpose of the lock simply to prevent interleaving
> > of console output then the debugger quiescing code should already have
> > this covered.
> >
> > It leaves me wondering if a change like the one below is sufficient
> > (based on code without John's patches but hopefully still clear enough).
> > I've given the new code it's own branch which it doesn't, strictly
> > speaking, need but it is easier to comment this way... and perhaps also
> > just a little easier for people who have not set CONFIG_KGDB to
> > ignore ;-).
> >
> > ~~~
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 142a58d124d9..41a7e103bb66 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3599,6 +3599,18 @@ int __printk_cpu_trylock(void)
> >                 /* This CPU is already the owner. */
> >                 atomic_inc(&printk_cpulock_nested);
> >                 return 1;
> > +       } else if (in_dbg_master()) {
> > +               /*
> > +                * If we are executing as the primary CPU and with the debugger
> > +                * active than all other CPUs in the system are quiesced by
> > +                * the time kdb winds up calling this function. To execute this
> > +                * branch then the lock must be owned by one of the quiesced CPUs.
> > +                * Happily, because it is quiesced and cannot release it, it is
> > +                * safe for us to allow the lock to be taken from a different CPU!
> > +                * The lock will be released prior to resuming the real owner.
> > +                */
> > +               atomic_inc(&printk_cpulock_nested);
> > +               return 1;
> >         }
> >  
> >         return 0;
> > ~~~
> 
> Being in kgdb/kdb context is similar to being in atomic console
> context. (Of course, they are both using cpu locks.) But the contexts
> are not the same. It is incorrect to handle them as the same.
> 
> We need to decide who is inside of who. Either printk is the innermost,
> in which case the printk cpulock cannot be held when calling
> kgdb_cpu_enter().

It is difficult to prevent this for the breakpoint cases... although
since everything about your current work is difficult I don't expect
that to be a sufficient argument on its own!


> Or kgdb is the innermost, meaning that the atomic
> consoles are no longer atomic/reliable while in kgdb.
> 
> I prefer and am pushing for the first, but am willing to accept the
> second (i.e. that kgdb is the innermost function of the kernel).

I think it will always be the case that we might execute breakpoints in
an NMI context since the collateral damage from forbidding breakpoints
on all API that *might* be called from NMI is likely to constrain the
not-NMI debugging experience too much. However it *is* possible to defer
breakpoints: we could defer them by calling into the
out-of-line-single-step logic that is needed to support kprobes.  I
dislike this approach since there is no way to fixup the PC so when
we eventually stop then gdb would have trouble figuring out
why the system has stopped.

However taking on board what you are saying about innermost functions
I think there might be a we could look into that is much nicer from an
analysis point of view than relying in in_dbg_master() to implicitly
borrow the printk lock.

Would you consider a means for kgdb to *explicitly* allow a slave CPU
to donate ownership to the debug master as part of it's spin loop (e.g.
explicitly transfer ownership if and only if we are quiesced). This
has a number of nice properties:

1. The ownership transfer happens *after* we have decided who the
   master actually is and before that point everything works as
   normal!

2. Safe-nesting is guaranteed by the slave CPUs exception stack.

3. We can print (and expect it to be seen) pretty much anywhere in the
   master code path (including the ones before we find out who will be
   master since that happens before the IPIs) with no trouble.

3. Handling change of master is easy... we can re-donate the lock
   to the new master using the same or similar API.

4. We can print anywhere in the slave code *except* for the tight
   loop we run after donating ownership to the master and the code
   after an former master CPU donates the lock to the next master
   and before the former master drops into the slave loop.

5. Apart from the function to donate ownership all the nasty code
   to handle it ends up in kgdb where is belongs rather than smeared
   in your lock code.

I can't decide if this makes a tiny piece of kgdb inner-most or not
but it is certainly much easier to analyse how kgdb and atomic consoles
interact.


> > PS In the interested of full disclosure there is a special case
> >    in the debugger to allow it to try to cope if it fails to
> >    quiesce a CPU and I deliberately omitted this from the long
> >    comment above. That special case is expected to be unstable
> >    but since the alternative is likely to be a permanent deadlock
> >    without any indication of why we choose to take the risk of
> >    continuing. Personally I don't recommend reasoning about
> >    console safety based on this emergency case hence omitting the
> >    comment.

The above idea of explicitly transferring lock ownership also allows us
to analyse this case (where as the in_dbg_master() approach meant it was
too hard). If the CPU cannot be rounded up (will not react to the NMI
IPI) *and* it owns the printk lock and won't give it back then kdb will
deadlock. Given your goals w.r.t. reliability of atomic consoles then I
am more than happy to live with this!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
