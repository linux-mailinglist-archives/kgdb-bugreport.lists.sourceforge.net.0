Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE17110E7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 May 2023 18:27:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2Do0-0000hy-Lw
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 25 May 2023 16:27:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q2Dnw-0000hr-CY
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 25 May 2023 16:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qBSf8dQvqenvM4XuaXqBfFlxjVrL5fPe+CB4lmnXjuk=; b=HO9EoTiUw4HONA3POYRMWsu0OM
 +npEBVwR4bW6/lnmor0+vJKLHM3nzuq/abIPsLQD8RAA9L/eHWlzvK3p5XuTB10w0bBZmCP44etLs
 4fwxUPYx6J0nyJ8OrkiA1M4d68fSZm5oa5KzvJr0gmS4kU0LYfRwPIl0gby2O/KEaMvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qBSf8dQvqenvM4XuaXqBfFlxjVrL5fPe+CB4lmnXjuk=; b=F6nqBK52BCAio6ynwzAqr5H42D
 ufrJgciQEj4rCJ9vyMZiKureNvjF3ro6TK+RaYQSQe/tmd16nMSN/X/UTdqrb1qY0U79Cq9bSjSsi
 O4O0SbC9mK99Y8mXztpSxwzQA1XUifQv+FxAhd9ZGZyBMEGfvIXyT1GiuLLdoZ4a1Mn0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2Dns-0000P9-PG for kgdb-bugreport@lists.sourceforge.net;
 Thu, 25 May 2023 16:27:08 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 34E5221C65;
 Thu, 25 May 2023 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685032018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBSf8dQvqenvM4XuaXqBfFlxjVrL5fPe+CB4lmnXjuk=;
 b=C4s+hdIyCnXmGRzN2XmAwfRTIB+9xRT+DvPlRO3vRcui7FbrbO1JQDWFx0rfTnZPSjX5i1
 rRTvdTF0fGM/eRmPRJQYStRfQXRzvjlNo/ZL8IUHR6kuT7x8QzWCoJZmsiqU3ukACJ1fan
 DauIAYjaJf8QRWaSlI7nNnrfcF7cPGY=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A2C412C141;
 Thu, 25 May 2023 16:26:55 +0000 (UTC)
Date: Thu, 25 May 2023 18:26:52 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZG-MTPSZakRDl2CP@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.14.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.14.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:38,
 Douglas Anderson wrote: > Implement
 a hardlockup detector that doesn't doesn't need any extra > arch-specific
 support code to detect lockups. Instead of using > something a [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q2Dns-0000P9-PG
Subject: Re: [Kgdb-bugreport] [PATCH v5 14/18] watchdog/hardlockup: detect
 hard lockups using secondary (buddy) CPUs
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>,
 npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-19 10:18:38, Douglas Anderson wrote:
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -85,7 +85,7 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
>  
>  #endif /* CONFIG_HARDLOCKUP_DETECTOR */
>  
> -#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
>  
>  static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
>  static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
> @@ -106,6 +106,14 @@ notrace void arch_touch_nmi_watchdog(void)
>  }
>  EXPORT_SYMBOL(arch_touch_nmi_watchdog);
>  
> +void watchdog_hardlockup_touch_cpu(unsigned int cpu)
> +{
> +	per_cpu(watchdog_hardlockup_touched, cpu) = true;
> +
> +	/* Match with smp_rmb() in watchdog_hardlockup_check() */
> +	smp_wmb();

It is great that you described where the related barrier is.

Another important information is what exactly is synchronized.
And I am actually not sure what we are synchronizing here.

My understanding is that a write barrier should synchronize
related writes, for example:

	X = ...;
	/* Make sure that X is modified before Y */
	smp_wmb();
	Y = ...;

And the related read barrier should synchronize the related reads,
for example:

	if (test(Y)) {
		/*
		 * Make sure that we use the updated X when
		 * we saw the updated Y.
		 */
		 smp_rmb();
		 do_something(X);
	 }

IMHO, we do not need any barrier here because we have only
one variable "watchdog_hardlockup_touched" here.
watchdog_hardlockup_check() will either see the updated value
or not. But it does not synchronize it against any other
variables or values.

> +}
> +
>  static bool is_hardlockup(unsigned int cpu)
>  {
>  	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> @@ -443,11 +454,15 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  	struct pt_regs *regs = get_irq_regs();
>  	int duration;
>  	int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
> +	unsigned long hrtimer_interrupts;
>  
>  	if (!watchdog_enabled)
>  		return HRTIMER_NORESTART;
>  
> -	watchdog_hardlockup_kick();
> +	hrtimer_interrupts = watchdog_hardlockup_kick();
> +
> +	/* test for hardlockups */

I would omit the comment. It is not valid when perf detector is used.
And checking the buddy is clear from the function name.

> +	watchdog_buddy_check_hardlockup(hrtimer_interrupts);

I would personally move this into watchdog_hardlockup_kick().
watchdog_timer_fn() is already complex enough. And checking
the buddy when kicking a CPU makes sense.

Also I would not pass "hrtimer_interrupts". I guess that it is
just an optimization. It is an extra churn in the code. IMHO,
is is not wort it. This code does not need to be super optimized.

> +

>  
>  	/* kick the softlockup detector */
>  	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
> diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
> new file mode 100644
> index 000000000000..fee45af2e5bd
> --- /dev/null
> +++ b/kernel/watchdog_buddy.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/kernel.h>
> +#include <linux/nmi.h>
> +#include <linux/percpu-defs.h>
> +
> +static cpumask_t __read_mostly watchdog_cpus;
> +
> +static unsigned int watchdog_next_cpu(unsigned int cpu)
> +{
> +	cpumask_t cpus = watchdog_cpus;

A copy should be done by cpumask_copy().

But the question is why a copy would be needed. When called from
watchdog_buddy_check_hardlockup(), this function is not sychronized
against the CPU hotplug. And even the copying would be racy.

IMHO, the copy does not help much and we do not need it.

The only important this is that this function would return
a valid CPU. And I think that it is guarantted because
CPU0 could not be disabled.

> +	unsigned int next_cpu;
> +
> +	next_cpu = cpumask_next(cpu, &cpus);
> +	if (next_cpu >= nr_cpu_ids)
> +		next_cpu = cpumask_first(&cpus);
> +
> +	if (next_cpu == cpu)
> +		return nr_cpu_ids;
>> +	return next_cpu;
> +}
> +
> +int __init watchdog_hardlockup_probe(void)
> +{
> +	return 0;
> +}
> +
> +void watchdog_hardlockup_enable(unsigned int cpu)
> +{
> +	unsigned int next_cpu;
> +
> +	/*
> +	 * The new CPU will be marked online before the hrtimer interrupt
> +	 * gets a chance to run on it. If another CPU tests for a
> +	 * hardlockup on the new CPU before it has run its the hrtimer
> +	 * interrupt, it will get a false positive. Touch the watchdog on
> +	 * the new CPU to delay the check for at least 3 sampling periods
> +	 * to guarantee one hrtimer has run on the new CPU.
> +	 */
> +	watchdog_hardlockup_touch_cpu(cpu);
> +
> +	/*
> +	 * We are going to check the next CPU. Our watchdog_hrtimer
> +	 * need not be zero if the CPU has already been online earlier.
> +	 * Touch the watchdog on the next CPU to avoid false positive
> +	 * if we try to check it in less then 3 interrupts.
> +	 */
> +	next_cpu = watchdog_next_cpu(cpu);
> +	if (next_cpu < nr_cpu_ids)
> +		watchdog_hardlockup_touch_cpu(next_cpu);

Thinking loudly:

This feels racy when many CPUs are enabled/disabled in parallel.
I am not 100% sure it it can happen though.

My understanding is that it can't happen because the CPU hotplug
is serialized by cpu_add_remove_lock.

So, this seems to work after all.

> +
> +	cpumask_set_cpu(cpu, &watchdog_cpus);
> +}
> +
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1035,10 +1035,55 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
>  
>  	  Say N if unsure.
>  
> -config HARDLOCKUP_DETECTOR_PERF
> +# Both the "perf" and "buddy" hardlockup detectors count hrtimer
> +# interrupts. This config enables functions managing this common code.
> +config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
>  	bool
>  	select SOFTLOCKUP_DETECTOR
>  
> +config HARDLOCKUP_DETECTOR_PERF
> +	bool
> +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
> +	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> +
> +config HARDLOCKUP_DETECTOR_BUDDY
> +	bool
> +	depends on SMP
> +	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> +
> +# For hardlockup detectors you can have one directly provided by the arch
> +# or use a "non-arch" one. If you're using a "non-arch" one that is
> +# further divided the perf hardlockup detector (which, confusingly, needs
> +# arch-provided perf support) and the buddy hardlockup detector (which just
> +# needs SMP). In either case, using the "non-arch" code conflicts with
> +# the NMI watchdog code (which is sometimes used directly and sometimes used
> +# by the arch-provided hardlockup detector).
> +config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	bool
> +	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
> +	default y
> +
> +config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> +	bool "Prefer the buddy CPU hardlockup detector"
> +	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH && HAVE_HARDLOCKUP_DETECTOR_PERF && SMP

Huh, I have big troubles to scratch my head around this check:

       HAVE_HARDLOCKUP_DETECTOR_NON_ARCH depends on HAVE_HARDLOCKUP_DETECTOR_PERF and SMP

       and this depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH and again
	       on HAVE_HARDLOCKUP_DETECTOR_PERF and SMP.

> +	help
> +	  Say Y here to prefer the buddy hardlockup detector over the perf one.
> +
> +	  With the buddy detector, each CPU uses its softlockup hrtimer
> +	  to check that the next CPU is processing hrtimer interrupts by
> +	  verifying that a counter is increasing.
> +
> +	  This hardlockup detector is useful on systems that don't have
> +	  an arch-specific hardlockup detector or if resources needed
> +	  for the hardlockup detector are better used for other things.
> +
> +# This will select the appropriate non-arch hardlockdup detector
> +config HARDLOCKUP_DETECTOR_NON_ARCH
> +	bool
> +	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
> +	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
> +
>  #
>  # Enables a timestamp based low pass filter to compensate for perf based
>  # hard lockup detection which runs too fast due to turbo modes.
> @@ -1053,9 +1098,10 @@ config HARDLOCKUP_CHECK_TIMESTAMP
>  config HARDLOCKUP_DETECTOR
>  	bool "Detect Hard Lockups"
>  	depends on DEBUG_KERNEL && !S390

Is there any reason why S390 could not or do not want to use the buddy
hardlockup detector.

> -	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_ARCH
> +	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
>  	select LOCKUP_DETECTOR
> -	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF
> +	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH

Anyway, the configuration of the hard lockup detectors is insane and
this patchset makes it even worse, especially the new
HARDLOCKUP_DETECTOR_NON_ARCH stuff.

It seems that sparc, powerpc and s390 are somehow special. Do you
still have in mind how they are distinguished using the Kconfig
variables?

For example, I am pretty confused by the meaning of HAVE_NMI_WATCHDOG.

And sparc has its own variant of
watchdog_hardlockup_enable()/disable(). It means that it is
arch-specific. Does it work with the 13th patch which made
watchdog_hardlockup_enable()/disable() to be watchdog-hardlockup-type
specific? Is is somehow related to HAVE_NMI_WATCHDOG?
Does this replace the entire watchdog only only the enable part?

I think that we need to make this more straightforward. But I first
need to understand the existing maze of config variables.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
