Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 863D0771D8D
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 11:52:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSwul-0003sx-12
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 09:52:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSwuW-0003sK-QT
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 09:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fKqxdhVEJs55QDKQhgIwghmnBdVVmRsYXm5A/kn0ltw=; b=ipTUNJ1G5PpJOD+pov8VK1gv/G
 2cGAM5YmlEHGWfr8KnwQ+wbY8Ts/dlvITXLMaE9NWXtg/7/4dBuaoROjoW5a9KjqGwPOdWptFEeyA
 5fdfY1GL1qd5uQLgjliQTgTnkeZDT/Z2OzVd0P5/OMnAdxxlKF2Ws4zWLbMjFQFD7w5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fKqxdhVEJs55QDKQhgIwghmnBdVVmRsYXm5A/kn0ltw=; b=BPAIdF5N3KoJoX/aQ7ZqNKtK0G
 C6EOIo3U9xsRKn3Jj+m+lrX2DNYNam9e3ZMT4DRosw99ShSmQ39KKXW0cMGZQ2M6ci2nSIXM4nqOS
 DqP5TvQCg8SIfT6NJ/9MSgoW+O4xEHM+cm8gIW4xI4TBSGXg9l6++KE+qDxMPCCFuGbk=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSwuS-0004Z2-CJ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 09:52:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 015E01FB;
 Mon,  7 Aug 2023 02:52:58 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013183F59C;
 Mon,  7 Aug 2023 02:52:11 -0700 (PDT)
Date: Mon, 7 Aug 2023 10:52:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZNC-yX9bW1iRShbh@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601143109.v9.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 02:31:46PM -0700, Douglas Anderson
 wrote: > As per the (somewhat recent) comment before the definition of >
 `__cpuidle`, the tag is like `noinstr` but also marks a function so [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qSwuS-0004Z2-CJ
Subject: Re: [Kgdb-bugreport] [PATCH v9 2/7] arm64: idle: Tag the arm64 idle
 functions as __cpuidle
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
Cc: Ingo Molnar <mingo@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Frederic Weisbecker <frederic@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jun 01, 2023 at 02:31:46PM -0700, Douglas Anderson wrote:
> As per the (somewhat recent) comment before the definition of
> `__cpuidle`, the tag is like `noinstr` but also marks a function so it
> can be identified by cpu_in_idle(). Let'a add this.
> 
> After doing this then when we dump stack traces of all processors
> using nmi_cpu_backtrace() then instead of getting useless backtraces
> we get things like:
> 
>   NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98
> 
> NOTE: this patch won't make cpu_in_idle() work perfectly for arm64,
> but it doesn't hurt and does catch some cases. Specifically an example
> that wasn't caught in my testing looked like this:
> 
>  gic_cpu_sys_reg_init+0x1f8/0x314
>  gic_cpu_pm_notifier+0x40/0x78
>  raw_notifier_call_chain+0x5c/0x134
>  cpu_pm_notify+0x38/0x64
>  cpu_pm_exit+0x20/0x2c
>  psci_enter_idle_state+0x48/0x70
>  cpuidle_enter_state+0xb8/0x260
>  cpuidle_enter+0x44/0x5c
>  do_idle+0x188/0x30c
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I don't have strong feelings either way for this, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.

> ---
> 
> Changes in v9:
> - Added to commit message that this doesn't catch all cases.
> 
> Changes in v8:
> - "Tag the arm64 idle functions as __cpuidle" new for v8
> 
>  arch/arm64/kernel/idle.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
> index c1125753fe9b..05cfb347ec26 100644
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -20,7 +20,7 @@
>   *	ensure that interrupts are not masked at the PMR (because the core will
>   *	not wake up if we block the wake up signal in the interrupt controller).
>   */
> -void noinstr cpu_do_idle(void)
> +void __cpuidle cpu_do_idle(void)
>  {
>  	struct arm_cpuidle_irq_context context;
>  
> @@ -35,7 +35,7 @@ void noinstr cpu_do_idle(void)
>  /*
>   * This is our default idle handler.
>   */
> -void noinstr arch_cpu_idle(void)
> +void __cpuidle arch_cpu_idle(void)
>  {
>  	/*
>  	 * This should do all the clock switching and wait for interrupt
> -- 
> 2.41.0.rc2.161.g9c6817b8e7-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
