Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A26FF3C9
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 16:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px74F-0001o3-T9
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 14:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px74E-0001ns-Sl
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 14:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RsbmH7Uqop/nnM3vjIRjHRqffBOelcetDOasqeW6Jho=; b=AFO+8l/zasfZ459m1cgRTpp79g
 3bxAGhbVsHVq84Gx/z/rBgGnSbA1kQoV+sNcN0wrBt4gmlmjYsBdj6M7xdvF7HstPDMoq/MuwkzKf
 JvCUiVInfvAPX6sHYHk4CXdNohMqkEaEnO7FC7V/6011Bt8kc946BDbh1S4vPOglyhho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RsbmH7Uqop/nnM3vjIRjHRqffBOelcetDOasqeW6Jho=; b=cZpskgHO6B0a/pdk1r7pKz+Vr4
 M+piLjbTAedwNrL6XMTFwzsKNPqie6bXXxJKEKRizQuIxauqGQ/RjuUtUB38R2M7AAOGuRhcKU1BU
 I4FNJ8kCBiOoSbMEyvDZlbo0ix9svee6nA6xFuk/YmQ+SXTBDtnbYoUqseVuuwVhF9r0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px74E-0004xu-R5 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 14:14:51 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 75A5A21D09;
 Thu, 11 May 2023 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683814480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RsbmH7Uqop/nnM3vjIRjHRqffBOelcetDOasqeW6Jho=;
 b=pOJqJS5iXtgLyWgNrYikAH8lcP9VErhN6vam0bviIGKv5MIKfAJuXwdEnozUAl1mFiB4qM
 Td/bamTw2bqEgQNfkm93ZRlv/TH+VmTSwCohSr4w9x5dduYiCKpI5GaFu6jyUYqF9cD6Qa
 q9wqaGcZN1O3kEmspF38GXvD5Hh7KCE=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5B4622C141;
 Thu, 11 May 2023 14:14:37 +0000 (UTC)
Date: Thu, 11 May 2023 16:14:37 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZFz4TVOyEU51b898@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-05-04 15:13:41,
 Douglas Anderson wrote: > In preparation
 for the buddy hardlockup detector where the CPU > checking for lockup might
 not be the currently running CPU, add a > "cpu" paramet [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1px74E-0004xu-R5
Subject: Re: [Kgdb-bugreport] [PATCH v4 09/17] watchdog/hardlockup: Add a
 "cpu" param to watchdog_hardlockup_check()
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
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2023-05-04 15:13:41, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector where the CPU
> checking for lockup might not be the currently running CPU, add a
> "cpu" parameter to watchdog_hardlockup_check().
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -92,14 +92,14 @@ static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
>  static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
>  static unsigned long watchdog_hardlockup_dumped_stacks;
>  
> -static bool watchdog_hardlockup_is_lockedup(void)
> +static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
>  {
> -	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
> +	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);

My radar tells me that this should be
READ_ONCE(per_cpu(hrtimer_interrupts, cpu)) when the value might
be modified on another CPU. Otherwise, the compiler is allowed
to split the read into more instructions.

It will be needed for the buddy detector. And it will require
also incrementing the value in watchdog_hardlockup_interrupt_count()
an atomic way.

Note that __this_cpu_inc_return() does not guarantee atomicity
according to my understanding. In theory, the following should
work because counter will never be incremented in parallel:

static unsigned long watchdog_hardlockup_interrupt_count(void)
{
	unsigned long count;

	count = __this_cpu_read(hrtimer_interrupts);
	count++;
	WRITE_ONCE(*raw_cpu_ptr(hrtimer_interrupts), count);
}

but it is nasty. A more elegant solution might be using atomic_t
for hrtimer_interrupts counter.

> -	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
> +	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
>  		return true;
>  
> -	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> +	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;

IMHO, hrtimer_interrupts_saved might be handled this way.
The value is read/written only by this function.

The buddy watchdog should see consistent values even when
the buddy CPU goes offline. This check should never race
because this CPU should get touched when another buddy
gets assigned.

Well, it would deserve a comment.

>  
>  	return false;
>  }
> @@ -117,35 +117,50 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
>  	 * fired multiple times before we overflow'd. If it hasn't
>  	 * then this is a good indication the cpu is stuck
>  	 */
> -	if (watchdog_hardlockup_is_lockedup()) {
> +	if (watchdog_hardlockup_is_lockedup(cpu)) {
>  		unsigned int this_cpu = smp_processor_id();
> +		struct cpumask backtrace_mask = *cpu_online_mask;
>  
>  		/* Only handle hardlockups once. */
> -		if (__this_cpu_read(watchdog_hardlockup_processed))
> +		if (per_cpu(watchdog_hardlockup_processed, cpu))

This should not need READ_ONCE()/WRITE_ONCE() because it is just bool.
Also it is read/modified only in this function on the same CPU.

>  			return;
>  
> -		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
> +		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", cpu);
>  		print_modules();
>  		print_irqtrace_events(current);
> -		if (regs)
> +		if (regs) {
>  			show_regs(regs);
> -		else
> -			dump_stack();
> +			cpumask_clear_cpu(cpu, &backtrace_mask);
> +		} else {
> +			/*
> +			 * If the locked up CPU is different than the CPU we're
> +			 * running on then we'll try to backtrace the CPU that
> +			 * locked up and then exclude it from later backtraces.
> +			 * If that fails or if we're running on the locked up
> +			 * CPU, just do a normal backtrace.
> +			 */
> +			if (cpu != this_cpu && trigger_single_cpu_backtrace(cpu)) {
> +				cpumask_clear_cpu(cpu, &backtrace_mask);
> +			} else {
> +				dump_stack();
> +				cpumask_clear_cpu(this_cpu, &backtrace_mask);

This will dump the stack on the current CPU when
trigger_single_cpu_backtrace(cpu) is not supported.
It would be confusing because the buddy watchdog
could be here only when this_cpu is not hardlocked.

It should be:

	if (cpu == this_cpu) {
		if (regs)
			show_regs(regs);
		else
			dump_stack();
		cpumask_clear_cpu(cpu, &backtrace_mask);
	} else {
		if (trigger_single_cpu_backtrace(cpu)
			cpumask_clear_cpu(cpu, &backtrace_mask);
	}

> +			}
> +		}
>  
>  		/*
> -		 * Perform all-CPU dump only once to avoid multiple hardlockups
> -		 * generating interleaving traces
> +		 * Perform multi-CPU dump only once to avoid multiple
> +		 * hardlockups generating interleaving traces
>  		 */
>  		if (sysctl_hardlockup_all_cpu_backtrace &&
>  		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
> -			trigger_allbutself_cpu_backtrace();
> +			trigger_cpumask_backtrace(&backtrace_mask);
>  
>  		if (hardlockup_panic)
>  			nmi_panic(regs, "Hard LOCKUP");
>  
> -		__this_cpu_write(watchdog_hardlockup_processed, true);
> +		per_cpu(watchdog_hardlockup_processed, cpu) = true;
>  	} else {
> -		__this_cpu_write(watchdog_hardlockup_processed, false);
> +		per_cpu(watchdog_hardlockup_processed, cpu) = false;
>  	}
>  }
>  

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
