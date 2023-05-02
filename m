Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C46F4716
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 May 2023 17:26:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ptrtf-0001k3-Mw
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 02 May 2023 15:26:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1ptrte-0001jx-Kw
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 02 May 2023 15:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CXWn7FssbrSs8MRrutlOtshdeBbrP/crYQCwv1Iexd0=; b=eYlvTFP28r5Hy2Rv3LjeMc5Otr
 ZzG+AvRW5gLoiWIclcR1UfA8lWZicP2ZNnfYyEPIMfFibqXlNukfMB84bkxAojdodDUQPyDyKOwaE
 Ax28kfNIVsyCI312ojE8otCVCpqezUoBlBmOiZ5gZ+zZNMIZcex8ky9y0uaZuIfkgMEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CXWn7FssbrSs8MRrutlOtshdeBbrP/crYQCwv1Iexd0=; b=S/+eqk3DblwXJvClYo7MKoEhxc
 oxHNojC+znrBUY2lPAhG4bYQA09RZKHAnR7crqLzEkAKs79zvPYnqKboVl0yPp94w1ngzfrU2J+ue
 9H2vHcXd35UfA7yQOcFB+PGBq/7Vba+wt04Plh83lxTny/CqYr4YbH4AR84n/K9QlPr0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ptrtd-00BgyN-Iw for kgdb-bugreport@lists.sourceforge.net;
 Tue, 02 May 2023 15:26:31 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A531421B0D;
 Tue,  2 May 2023 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683041179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CXWn7FssbrSs8MRrutlOtshdeBbrP/crYQCwv1Iexd0=;
 b=XxDdHFZlQui1F2WlF8bhbf41oWW6Fr9rAfk13WKktw/+Jtw97yL5A1Sttz4uqgqOcjRNii
 pj4J+Cp+HRg6BC0SrBdlXBmUXIj6XkAHYUWf0RbaKYkK6ZbWB8Cclv6Li0bhCJwINGjccy
 EBYuacjqAOW4uoLsHujhtJf/7MKOnXE=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AA2872C141;
 Tue,  2 May 2023 15:26:18 +0000 (UTC)
Date: Tue, 2 May 2023 17:26:18 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZFErmshcrcikrSU1@alley>
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2023-05-01 08:24:46, Douglas Anderson wrote: > From:
 Colin Cross <ccross@android.com> > > Implement a hardlockup detector that
 doesn't doesn't need any extra > arch-specific support code to det [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ptrtd-00BgyN-Iw
Subject: [Kgdb-bugreport] shared code: was: Re: [PATCH v3] hardlockup:
 detect hard lockups using secondary (buddy) CPUs
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
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Alexander Potapenko <glider@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>, Vlastimil Babka <vbabka@suse.cz>,
 Sami Tolvanen <samitolvanen@google.com>, kgdb-bugreport@lists.sourceforge.net,
 Miguel Ojeda <ojeda@kernel.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>, Stephen Boyd <swboyd@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Juergen Gross <jgross@suse.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
 ito-yuichi@fujitsu.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Colin Cross <ccross@android.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2023-05-01 08:24:46, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
> 
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
> 
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -134,6 +144,7 @@ void lockup_detector_reconfigure(void);
>  static inline void touch_nmi_watchdog(void)
>  {
>  	arch_touch_nmi_watchdog();
> +	buddy_cpu_touch_watchdog();

	touch_buddy_watchdog();    ??? to follow the naming scheme?

>  	touch_softlockup_watchdog();
>  }
>  
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -106,6 +108,13 @@ void __weak watchdog_nmi_disable(unsigned int cpu)
>  	hardlockup_detector_perf_disable();
>  }
>  
> +#else
> +
> +int __weak watchdog_nmi_enable(unsigned int cpu) { return 0; }
> +void __weak watchdog_nmi_disable(unsigned int cpu) { return; }

Honestly, the mix of softlockup and hardlockup code was a hard to
follow even before this patch. And it is going to be worse.

Anyway, the buddy watchdog is not using NMI at all. It should not
get enable using a function called *_nmi_enabled().

Also some comments are not longer valid, for example:

static void watchdog_enable(unsigned int cpu)
{
[...]
	/* Enable the perf event */
	if (watchdog_enabled & NMI_WATCHDOG_ENABLED)
		watchdog_nmi_enable(cpu);


I do not know. Maybe, fixing the mess is beyond any hope.
But we shold not make it worse.

I suggest to rename/shuffle at least functions touched
by this patchset to improve the meaning.

Sigh, it is hard to find a reasonable names. The code
already uses:

    + watchdog_*
    + watchdog_nmi_

    + softlockup_*

    + lockup_detector_*
    + hardlockup_detector_perf_*

and sysctl:

		.procname       = "watchdog",
		.procname	= "watchdog_thresh",
		.procname       = "nmi_watchdog",
		.procname	= "watchdog_cpumask",
		.procname       = "soft_watchdog",
		.procname	= "softlockup_panic",
		.procname	= "softlockup_all_cpu_backtrace",
		.procname	= "hardlockup_panic",
		.procname	= "hardlockup_all_cpu_backtrace",


So, I suggest, to use the names:


    + watchdog_*

	+ for the common infrastructure
	+ keep it in watchdog.c

    + hardlockup_detector_* or
      hardlockup_watchdog_* or
      watchdog_hld_*

	+ for the common hardlockup stuff.
	+ it t can stay in watchdog.c to keep shuffling bearable


    + hardlockup_detector_nmi_* or
      hardlockup_watchdog_nmi_* or
      watchdog_hld_nmi_* or
      watchdog_nmi_*

	+ for the arch specific hardlockup stuff that is
	  using NMI interrupts.

	+ it might either stay in watchdog_hld.c
	  or be moved to watchdog_nmi.c or
	  watchdog_hld_nmi.c

    + hardlockup_detector_buddy_* or
      hardlockup_watchdog_buddy_* or
      watchdog_hld_buddy_*
      watchdog_buddy_*

	+ for the arch specific hardlockup stuff that is
	  using buddy monitoring

	+ it might either be added to watchdog_hld.c
	  or be moved to watchdog_buddy.c or
	  watchdog_hld_buddy.c


Opinion:

     The buddy watchdog might actually be used also for
     softlockup detector. So, watchdog_buddy_* API
     and watchdog_buddy.c might make sense.


> +
> +#endif /* CONFIG_HARDLOCKUP_DETECTOR */
> +
>  /* Return 0, if a NMI watchdog is available. Error code otherwise */
>  int __weak __init watchdog_nmi_probe(void)
>  {
> @@ -364,6 +373,9 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  	/* kick the hardlockup detector */
>  	watchdog_interrupt_count();
>  
> +	/* test for hardlockups */
> +	watchdog_check_hardlockup();

  rename watchdog_buddy_check_hardlockup(); ???

> +
>  	/* kick the softlockup detector */
>  	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
>  		reinit_completion(this_cpu_ptr(&softlockup_completion));
> --- /dev/null
> +++ b/kernel/watchdog_buddy_cpu.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/kernel.h>
> +#include <linux/nmi.h>
> +#include <linux/percpu-defs.h>
> +
> +static DEFINE_PER_CPU(bool, watchdog_touch);
> +static DEFINE_PER_CPU(bool, hard_watchdog_warn);
> +static cpumask_t __read_mostly watchdog_cpus;
> +
> +static unsigned long hardlockup_allcpu_dumped;
> +
> +int __init watchdog_nmi_probe(void)
> +{
> +	return 0;
> +}

This is pretty strange. It shows that it was added a hacky way.

> +
> +notrace void buddy_cpu_touch_watchdog(void)
> +{
> +	/*
> +	 * Using __raw here because some code paths have
> +	 * preemption enabled.  If preemption is enabled
> +	 * then interrupts should be enabled too, in which
> +	 * case we shouldn't have to worry about the watchdog
> +	 * going off.
> +	 */
> +	raw_cpu_write(watchdog_touch, true);
> +}
> +EXPORT_SYMBOL_GPL(buddy_cpu_touch_watchdog);

Cut&pasted arch_touch_nmi_watchdog().

> +
> +static unsigned int watchdog_next_cpu(unsigned int cpu)
> +{
> +	cpumask_t cpus = watchdog_cpus;
> +	unsigned int next_cpu;
> +
> +	next_cpu = cpumask_next(cpu, &cpus);
> +	if (next_cpu >= nr_cpu_ids)
> +		next_cpu = cpumask_first(&cpus);
> +
> +	if (next_cpu == cpu)
> +		return nr_cpu_ids;
> +
> +	return next_cpu;
> +}
> +
[...]
> +static int is_hardlockup_buddy_cpu(unsigned int cpu)
> +{
> +	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);
> +
> +	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
> +		return 1;
> +
> +	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
> +	return 0;

This is cut&pasted is_hardlockup(). And the __this_cpu_* API
is replaced by per_cpu_* API.

> +}
> +
> +void watchdog_check_hardlockup(void)
> +{
> +	unsigned int next_cpu;
> +
> +	/*
> +	 * Test for hardlockups every 3 samples. The sample period is
> +	 *  watchdog_thresh * 2 / 5, so 3 samples gets us back to slightly over
> +	 *  watchdog_thresh (over by 20%).
> +	 */
> +	if (__this_cpu_read(hrtimer_interrupts) % 3 != 0)
> +		return;
> +
> +	/* check for a hardlockup on the next CPU */
> +	next_cpu = watchdog_next_cpu(smp_processor_id());
> +	if (next_cpu >= nr_cpu_ids)
> +		return;
> +
> +	/* Match with smp_wmb() in watchdog_nmi_enable() / watchdog_nmi_disable() */
> +	smp_rmb();
> +
> +	if (per_cpu(watchdog_touch, next_cpu) == true) {
> +		per_cpu(watchdog_touch, next_cpu) = false;
> +		return;
> +	}
> +
> +	if (is_hardlockup_buddy_cpu(next_cpu)) {
> +		/* only warn once */
> +		if (per_cpu(hard_watchdog_warn, next_cpu) == true)
> +			return;
> +
> +		/*
> +		 * Perform all-CPU dump only once to avoid multiple hardlockups
> +		 * generating interleaving traces
> +		 */
> +		if (sysctl_hardlockup_all_cpu_backtrace &&
> +				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
> +			trigger_allbutself_cpu_backtrace();
> +
> +		if (hardlockup_panic)
> +			panic("Watchdog detected hard LOCKUP on cpu %u", next_cpu);
> +		else
> +			WARN(1, "Watchdog detected hard LOCKUP on cpu %u", next_cpu);
> +
> +		per_cpu(hard_watchdog_warn, next_cpu) = true;
> +	} else {
> +		per_cpu(hard_watchdog_warn, next_cpu) = false;

Also this cut&pastes a lots of code from watchdog_overflow_callback().

I wonder if we could somehow share the code between the two hardlockup
detectors. It would be win-win. It might help a lot with maintenance.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
