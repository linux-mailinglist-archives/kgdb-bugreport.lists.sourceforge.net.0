Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF06FE2B1
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 May 2023 18:43:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwmul-00034X-49
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 May 2023 16:43:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1pwmug-00034R-Ie
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 16:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eqD049xdLII1J9U9gwtXnfeWZPKVEUgztEiHJeEDXTM=; b=LHz7nP3WIiQDTBidL4KAEW+rcz
 CopcjZHSz5Feyxib24rvsjjUdIzgEJSAi6jUQdL0BgGP0+9jzb6UikwU5VK8pVIUKLT+/pU43MPNv
 zqZ36J0lktF5a8wpm2bKfysq4RcYJYNJTAPJYTczCvChunecrk5/wlNdIhtWEEvWKgr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eqD049xdLII1J9U9gwtXnfeWZPKVEUgztEiHJeEDXTM=; b=gE4PEtcrWlFA5g01jcra7SAw84
 wbY2DIoxKtI422MKGJzgS7v8teo0ftVziogd7FvwEj7TIoJ8hGWTvL5GrB0U+LjPT+s2zzXS7Xq63
 IvOVrWhys4cIf7Q2qJWczcKi8nJywqduNt/Fkfo3iTXexF2YITZ++02m6XKUNag35M4c=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1pwmuZ-00011a-Oo for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 16:43:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED6FD12FC;
 Wed, 10 May 2023 09:44:10 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.173])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BF0F3F67D;
 Wed, 10 May 2023 09:43:23 -0700 (PDT)
Date: Wed, 10 May 2023 17:43:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZFvJqIYo00vfqRiB@FVFF77S0Q05N.cambridge.arm.com>
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.6.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419155341.v8.6.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 19, 2023 at 03:56:00PM -0700, Douglas Anderson
 wrote: > As per the (somewhat recent) comment before the definition of >
 `__cpuidle`, the tag is like `noinstr` but also marks a function so [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1pwmuZ-00011a-Oo
Subject: Re: [Kgdb-bugreport] [PATCH v8 06/10] arm64: idle: Tag the arm64
 idle functions as __cpuidle
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

On Wed, Apr 19, 2023 at 03:56:00PM -0700, Douglas Anderson wrote:
> As per the (somewhat recent) comment before the definition of
> `__cpuidle`, the tag is like `noinstr` but also marks a function so it
> can be identified by cpu_in_idle(). Let'a add this.
> 
> After doing this then when we dump stack traces of all processors
> using nmi_cpu_backtrace() then instead of getting useless backtraces
> we get things like:
> 
>   NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98

As a heads-up, this is only going to work in the trivial case where a CPU is
within the default cpu_do_idle(), and not for anything using PSCI
cpu_suspend() (which I'd *really* hope is the common case).

That doesn't get inlined, and the invocation is shared with other SMCCC users,
so we probably need more work there if culling idle backtraces is important.

I'm not averse to this change itself.

Mark.

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
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
> 2.40.0.634.g4ca3ef3211-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
