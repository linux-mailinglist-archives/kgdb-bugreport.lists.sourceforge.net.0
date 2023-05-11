Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A66886FF65E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 17:46:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px8V4-0004e4-4K
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 15:46:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px8V2-0004dy-Q6
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 15:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O+WNLGZ1q9D+gmD3l0BETAfuL1MeSiB7Zp5Utl633Ws=; b=KgcSTZs3GD3rjY6rKaXCNHuyOY
 DkcZjVjW6T43/jDQu05Ns7TP2dH+s4Bc+3XHoDLxkfBXhGFw2RkGPrPK93zaNrlwSLSVWSlh2PDYv
 431ZP2AylMeMSgd193X4945w8BQV/J+N1Fl8cmq9EQB5HCF8mfVDHNJaphRnAIPBrhEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O+WNLGZ1q9D+gmD3l0BETAfuL1MeSiB7Zp5Utl633Ws=; b=cAdLHAtxpYRmC+YkLvAYduVzB+
 FYR5wAoKXRM/9rMLYgsgxR1fySIv8YJFjanhs48/dGy0umBkbMiKCeJnHAL32IlhVuHdrPbKFZcKp
 9455lcMgBR5hu+yXHFv5iaOV3EM4+Ecs8Sd0LMVH8+Cb6Z/iCtNEtMGl5p6V5x1m3lAw=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px8V0-0000Zx-TT for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 15:46:37 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8888221DF6;
 Thu, 11 May 2023 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683819988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+WNLGZ1q9D+gmD3l0BETAfuL1MeSiB7Zp5Utl633Ws=;
 b=Zq7AfBNF97Xrqxden+m2xxxrVOT7WIdxT4zaU0B11ZzrDPPF4umix8ROjZsj1Yqduhj2K4
 wGM3tgBLn5jPechHV8jYrk1e745lz7lAaGx8uE8MrE1r6njfUsjcmkhOBF6Rp/hp5Ezzds
 PDX4wIbB8mhF/MQqunXnk9vf5g/lR4s=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 50A782C145;
 Thu, 11 May 2023 15:46:24 +0000 (UTC)
Date: Thu, 11 May 2023 17:46:21 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZF0NzSCRCapqDbC4@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.10.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504151100.v4.10.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-05-04 15:13:42,
 Douglas Anderson wrote: > In preparation
 for the buddy hardlockup detector, which wants the same > petting logic as
 the current perf hardlockup detector, move the code > to [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1px8V0-0000Zx-TT
Subject: Re: [Kgdb-bugreport] [PATCH v4 10/17] watchdog/hardlockup: Move
 perf hardlockup watchdog petting to watchdog.c
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

On Thu 2023-05-04 15:13:42, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector, which wants the same
> petting logic as the current perf hardlockup detector, move the code
> to watchdog.c. While doing this, rename the global variable to match
> others nearby. The arch_touch_nmi_watchdog() function is not renamed
> since that is exported with "EXPORT_SYMBOL" and is thus ABI.
> 
> Currently the code in watchdog.c is guarded by
> CONFIG_HARDLOCKUP_DETECTOR_PERF, which makes this change seem
> silly. However, a future patch will change this.
> 
> NOTE: there is a slight side effect to this change, though from code
> analysis I believe it to be a beneficial one. Specifically the perf
> hardlockup detector will now do check the "timestamp" before clearing
> any watchdog pets. Previously the order was reversed. With the old
> order if the watchdog perf event was firing super fast then it would
> also be clearing existing watchdog pets super fast. The new behavior
> of handling super-fast perf before clearing watchdog pets seems
> better.

Ah, I think that this was actually pretty serious bug in the perf
detector. But I think that it should work another way, see below.

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -111,6 +125,11 @@ static void watchdog_hardlockup_interrupt_count(void)
>  
>  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
>  {
> +	if (__this_cpu_read(watchdog_hardlockup_touch)) {
> +		__this_cpu_write(watchdog_hardlockup_touch, false);
> +		return;
> +	}

If we clear watchdog_hardlockup_touch() here then
watchdog_hardlockup_check() won't be called yet another
watchdog_hrtimer_sample_threshold perior.

It means that any touch will cause ignoring one full period.
The is_hardlockup() check will be done after full two periods.

It is not ideal, see below.

> +
>  	/*
>  	 * Check for a hardlockup by making sure the CPU's timer
>  	 * interrupt is incrementing. The timer interrupt should have
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index 9be90b2a2ea7..547917ebd5d3 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -112,11 +98,6 @@ static void watchdog_overflow_callback(struct perf_event *event,
>  	/* Ensure the watchdog never gets throttled */
>  	event->hw.interrupts = 0;
>  
> -	if (__this_cpu_read(watchdog_nmi_touch) == true) {
> -		__this_cpu_write(watchdog_nmi_touch, false);
> -		return;
> -	}

The original code looks wrong. arch_touch_nmi_watchdog() caused
skipping only one period of the perf event.

I would expect that it caused restarting the period,
something like:

	if (__this_cpu_read(watchdog_nmi_touch) == true) {
		/*
		 * Restart the period after which the interrupt
		 * counter is checked.
		 */
		__this_cpu_write(nmi_rearmed, 0);
		__this_cpu_write(last_timestamp, now);
		__this_cpu_write(watchdog_nmi_touch, false);
		return;
	}

By other words, we should restart the period in the very next perf
event after the watchdog was touched.

That said, the new code looks better than the original.
IMHO, the original code was prone to false positives.

Best Regards,
Petr

PS: It might be worth fixing this problem in a separate patch at the
    beginning of this patchset. It might be a candidate for stable
    backports.

> -
>  	if (!watchdog_check_timestamp())
>  		return;
>  


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
