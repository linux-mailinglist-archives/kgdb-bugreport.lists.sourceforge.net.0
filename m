Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 198843E0034
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  4 Aug 2021 13:32:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mBF8F-0003J5-L3
	for lists+kgdb-bugreport@lfdr.de; Wed, 04 Aug 2021 11:32:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1mBF8E-0003It-1h
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 11:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ITDkwNA0SrOgCt3xKILvBBfzHrvWx642jjB6XzvfTgw=; b=Sf7jEcid22KiLUOzKsU/3wVdU0
 J0p/cwfbAQhbLsorSsyujQCFUNrRi7Vzaz+zfMOcNN3dW7+okxD+YDocoMaBz19B/v3VyX59p7wlp
 GP4WyLLToLYSNw9GP2DLWLN5JxDtGe+pGZlHsMQKrgnzfv/2Z23Dr8UEfoXKDAXnFgb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ITDkwNA0SrOgCt3xKILvBBfzHrvWx642jjB6XzvfTgw=; b=GB/CTdMjbCwDz5A6UwXQNwmOwj
 /wz2i5QEYq5o1FXRN/81R+SD+ToSrthtxamzFFOCyteZuhGkQeNnNzOtt1jonb7A6IqCmc2Y4sOyl
 o2YWIe7PewjBsildMYabaj+VXdkK8rAVP9hOVD46QiF8JXcWWOnQYmFGBA4lBgHwUwfw=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBF85-00C0qr-91
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Aug 2021 11:32:18 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso3679252wmg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 04 Aug 2021 04:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ITDkwNA0SrOgCt3xKILvBBfzHrvWx642jjB6XzvfTgw=;
 b=IIqny7kHdyo1TIIRVeGnK30q75dZHmNBPetoYhf9xuSUVj+HW1uX+ehq0Onoi6pQ62
 iYIcpwq+9tkd3XI5kMeSFTJShksqa3Bdy1vkQGXpnp0+aCyOQIkP2K3Vy1C0xnUPZDr5
 3wQWyF09PDzCtQQFKlOlnFYW1VU0MV8AuQ+5nl2adtN5blwmZGX0BHfxs0M1jGPidPf4
 IX6qqIQj5UAzAqiMqq21rtKWUuWwhQiEzGv3e1CrissJlKpqGdMojHcNHEtrlKIz2T00
 M4AeiKpp3pPUTLcjiWSgGx1opwpdZKB9fMXnZZSBrCDBYTgADeVtGjT6ZBGX+9U/xK5g
 h9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITDkwNA0SrOgCt3xKILvBBfzHrvWx642jjB6XzvfTgw=;
 b=O3gx7ZgZ8faYv7Ib6NdfNEY6BS2cK86bIdDi/cQqWrxPFSijdQ156yNZ0G3EqwCc/m
 ttIeYXWnAWP5LJxWAClFRnPJK+IPQpM3HAh/GJ+JQi1PxcY87QvJZOXJTA7sm6xbBATg
 nAnQMBbXy/M1NsDGzDTzppj63rXgvcWsFFF90T3njeA6vsvJ84c6lAEn43i1l2UymP9b
 Bz9qhqJkSMUS2d6D4x3vs3StTRlW9o/JBJsodxNJwPzrnToUqw+Wvc4Z/CKDbUrSIUqd
 KH2jxnHrm/gTScKoDOahyAmDy/hr8CuVUqtRFhxFK/L0R0feyje5AHo8LyV+GhfbeKP0
 zDtA==
X-Gm-Message-State: AOAM533SHOsDlSusuN04+eFgwdo0Fp3q/6Zmg2lnQBBPY8YEz8DsOayH
 O4Aham2q3MmtARqF4L6tu46dBg==
X-Google-Smtp-Source: ABdhPJy/y/96VfskHSf1nxHCfFTzgM1ULlQBbTosuqXARHtkKNr1SvBCiWrhCDLpQSPUVhnNS7JIXg==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr27852908wmj.4.1628076722619; 
 Wed, 04 Aug 2021 04:32:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f3sm2350593wro.30.2021.08.04.04.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:32:01 -0700 (PDT)
Date: Wed, 4 Aug 2021 12:31:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20210804113159.lsnoyylifg6v5i35@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
 <20210803142558.cz7apumpgijs5y4y@maple.lan>
 <87tuk635rb.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuk635rb.fsf@jogness.linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.51 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBF85-00C0qr-91
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

On Tue, Aug 03, 2021 at 05:36:32PM +0206, John Ogness wrote:
> On 2021-08-03, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> >> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> >> during cpu roundup. This will conflict with the printk cpulock.
> >
> > When the full vision is realized what will be the purpose of the printk
> > cpulock?
> >
> > I'm asking largely because it's current role is actively unhelpful
> > w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
> > be a better (and safer) solution. However it sounds like there is a
> > larger role planned for the printk cpulock...
> 
> The printk cpulock is used as a synchronization mechanism for
> implementing atomic consoles, which need to be able to safely interrupt
> the console write() activity at any time and immediately continue with
> their own printing. The ultimate goal is to move all console printing
> into per-console dedicated kthreads, so the primary function of the
> printk cpulock is really to immediately _stop_ the CPU/kthread
> performing write() in order to allow write_atomic() (from any context on
> any CPU) to safely and reliably take over.

I see.

Is there any mileage in allowing in_dbg_master() to suppress taking
the console lock?

There's a couple of reasons to worry about the current approach.

The first is that we don't want this code to trigger in the case when
kgdb is enabled and kdb is not since it is only kdb (a self-hosted
debugger) than uses the consoles. This case is relatively trivial to
address since we can rename it kdb_roundup_delay() and alter the way it
is conditionally compiled.

The second is more of a problem however. kdb will only call into the
console code from the debug master. By default this is the CPU that
takes the debug trap so initial prints will work fine. However it is
possible to switch to a different master (so we can read per-CPU
registers and things like that). This will result in one of the CPUs
that did the IPI round up calling into console code and this is unsafe
in that instance.

There are a couple of tricks we could adopt to work around this but
given the slightly odd calling context for kdb (all CPUs quiesced, no
log interleaving possible) it sounds like it would remain safe to
bypass the lock if in_dbg_master() is true.

Bypassing an inconvenient lock might sound icky but:

1. If the lock is not owned by any CPU then what kdb will do is safe.

2. If the lock is owned by any CPU then we have quiesced it anyway
   and this makes is safe for the owning CPU to share its ownership
   (since it isn't much different to recursive acquisition on a single
   CPU)


> Atomic consoles are actually quite similar to the kgdb_io ops. For
> example, comparing:
> 
> serial8250_console_write_atomic() + serial8250_console_putchar_locked()
> 
> with
> 
> serial8250_put_poll_char()
> 
> The difference is that serial8250_console_write_atomic() is line-based
> and synchronizing with serial8250_console_write() so that if the kernel
> crashes while outputing to the console, write() can be interrupted by
> write_atomic() and cleanly formatted crash data can be output.
> 
> Also serial8250_put_poll_char() is calling into __pm_runtime_resume(),
> which includes a spinlock and possibly sleeping. This would not be
> acceptable for atomic consoles.

spinlocks aren't allowed in polled I/O either.

However IIRC there is a rather nasty trick being played here to allow
code sharing. I believe there was a deliberate unbalanced resume in the
poll_init() function that results (again IIRC) in the PM calls in
poll_char() becoming nothing but atomic add and subtract (e.g. enabling
polled I/O effectively suppresses PM activity).


Daniel.

> Although, as Andy pointed out [0], I
> will need to figure out how to deal with suspended consoles. Or just
> implement a policy that registered atomic consoles may never be
> suspended.
> 
> I had not considered merging kgdb_io ops with atomic console ops. But
> now that I look at it more closely, there may be some useful overlap. I
> will consider this. Thank you for this idea.
> 
> >> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> >> index 3d0c933937b4..1b546e117f10 100644
> >> --- a/kernel/printk/printk.c
> >> +++ b/kernel/printk/printk.c
> >> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
> >>  #ifdef CONFIG_SMP
> >>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
> >>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
> >> +static unsigned int kgdb_cpu = -1;
> >
> > Is this the flag to provoke retriggering? It appears to be a write-only
> > variable (at least in this patch). How is it consumed?
> 
> Critical catch! Thank you. I am quite unhappy to see these hunks were
> accidentally dropped when generating this series.
> 
> @@ -3673,6 +3675,9 @@ EXPORT_SYMBOL(__printk_cpu_trylock);
>   */
>  void __printk_cpu_unlock(void)
>  {
> +	bool trigger_kgdb = false;
> +	unsigned int cpu;
> +
>  	if (atomic_read(&printk_cpulock_nested)) {
>  		atomic_dec(&printk_cpulock_nested);
>  		return;
> @@ -3683,6 +3688,12 @@ void __printk_cpu_unlock(void)
>  	 * LMM(__printk_cpu_unlock:A)
>  	 */
>  
> +	cpu = smp_processor_id();
> +	if (kgdb_cpu == cpu) {
> +		trigger_kgdb = true;
> +		kgdb_cpu = -1;
> +	}
> +
>  	/*
>  	 * Guarantee loads and stores from this CPU when it was the
>  	 * lock owner are visible to the next lock owner. This pairs
> @@ -3703,6 +3714,21 @@ void __printk_cpu_unlock(void)
>  	 */
>  	atomic_set_release(&printk_cpulock_owner,
>  			   -1); /* LMM(__printk_cpu_unlock:B) */
> +
> +	if (trigger_kgdb) {
> +		pr_warn("re-triggering kgdb roundup for CPU#%d\n", cpu);
> +		kgdb_roundup_cpu(cpu);
> +	}
>  }
>  EXPORT_SYMBOL(__printk_cpu_unlock);
> 
> John Ogness
> 
> [0] https://lore.kernel.org/lkml/YQlKAeXS9MPmE284@smile.fi.intel.com


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
