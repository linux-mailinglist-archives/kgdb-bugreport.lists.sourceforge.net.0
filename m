Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9672B771DE3
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:24:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxP6-0006v9-EO
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:24:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxP2-0006v2-VZ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yKkvi4Wsa+EfYkOf+E51XASb5rJ6l0yiLS4BEheBAZs=; b=EKGNG3WpeVHMDsKwfkzmoWF+hp
 EILsPIEexIbGyNAM1Kbg8AepwCvmJdFRp76bF0xrzDXHDRxqJrdxB/U8M3VWrslPOeGXiAvZD9SY2
 vLI9AmKOMXGUymdNbng454C3EVoJ6A7nXaMAm1zh55ClNMaLZZrLR7v85IBql0I9TjQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yKkvi4Wsa+EfYkOf+E51XASb5rJ6l0yiLS4BEheBAZs=; b=dMPUVB8a0SdEmLuhd09FPCnzTC
 zj9ee+kcPi8FRzpf5ZrGSmvDlxb6LUyH+6Me52gug5g4rsQtJ+v1126WUOki1iEy55tEdw0igLy2U
 O3C7rWknEEuiL1rxFmu82/CFSB0aWxWcGg4GFMfmPMBwnJJy5ND+OKsxO0h85MRL+SH8=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxP1-00FpBU-Ip for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:23:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235D01FB;
 Mon,  7 Aug 2023 03:24:33 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A24E3F59C;
 Mon,  7 Aug 2023 03:23:47 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:23:44 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZNDGMJW01avOMShn@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.5.I65981105e1f62550b0316625dd1e599deaf9e1aa@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601143109.v9.5.I65981105e1f62550b0316625dd1e599deaf9e1aa@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 02:31:49PM -0700, Douglas Anderson
 wrote: > From: Sumit Garg <sumit.garg@linaro.org> > > Enable
 arch_trigger_cpumask_backtrace()
 support on arm64 using the new > debug IPI. Wit [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qSxP1-00FpBU-Ip
Subject: Re: [Kgdb-bugreport] [PATCH v9 5/7] arm64: ipi_debug: Add support
 for backtrace using the debug IPI
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jun 01, 2023 at 02:31:49PM -0700, Douglas Anderson wrote:
> From: Sumit Garg <sumit.garg@linaro.org>
> 
> Enable arch_trigger_cpumask_backtrace() support on arm64 using the new
> debug IPI. With this arm64 can now get backtraces in cases where
> callers of the trigger_xyz_backtrace() class of functions don't check
> the return code and implement a fallback. One example is
> `kernel.softlockup_all_cpu_backtrace`. This also allows us to
> backtrace hard locked up CPUs in cases where the debug IPI is backed
> by an NMI (or pseudo NMI).
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v9:
> - Added comments that we might not be using NMI always.
> - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> - arch_trigger_cpumask_backtrace() no longer returns bool
> 
> Changes in v8:
> - Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
> 
>  arch/arm64/include/asm/irq.h  |  3 +++
>  arch/arm64/kernel/ipi_debug.c | 25 +++++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)

As with prior patches, I'd prefer if this lived in smp.c with the other IPI
logic.

> 
> diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
> index fac08e18bcd5..be2d103f316e 100644
> --- a/arch/arm64/include/asm/irq.h
> +++ b/arch/arm64/include/asm/irq.h
> @@ -6,6 +6,9 @@
>  
>  #include <asm-generic/irq.h>
>  
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self);
> +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> +
>  struct pt_regs;
>  
>  int set_handle_irq(void (*handle_irq)(struct pt_regs *));
> diff --git a/arch/arm64/kernel/ipi_debug.c b/arch/arm64/kernel/ipi_debug.c
> index b57833e31eaf..6984ed507e1f 100644
> --- a/arch/arm64/kernel/ipi_debug.c
> +++ b/arch/arm64/kernel/ipi_debug.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/nmi.h>
>  #include <linux/smp.h>
>  
>  #include "ipi_debug.h"
> @@ -24,11 +25,31 @@ void arm64_debug_ipi(cpumask_t *mask)
>  	__ipi_send_mask(ipi_debug_desc, mask);
>  }
>  
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +{
> +	/*
> +	 * NOTE: though nmi_trigger_cpumask_backtrace has "nmi_" in the name,
> +	 * nothing about it truly needs to be backed by an NMI, it's just that
> +	 * it's _allowed_ to be called from an NMI. If set_smp_debug_ipi()
> +	 * failed to get an NMI (or pseudo-NMI) this will just be backed by a
> +	 * regular IPI.
> +	 */
> +	nmi_trigger_cpumask_backtrace(mask, exclude_self, arm64_debug_ipi);
> +}
> +
>  static irqreturn_t ipi_debug_handler(int irq, void *data)
>  {
> -	/* nop, NMI handlers for special features can be added here. */
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	/*
> +	 * NOTE: Just like in arch_trigger_cpumask_backtrace(), we're calling
> +	 * a function with "nmi_" in the name but it works fine even if we
> +	 * are using a regulaor IPI.
> +	 */
> +	if (nmi_cpu_backtrace(get_irq_regs()))
> +		ret = IRQ_HANDLED;
>  

Does this need the printk_deferred_{enter,exit}() that 32-bit arm has?

Thanks,
Mark.

> -	return IRQ_NONE;
> +	return ret;
>  }
>  
>  void debug_ipi_setup(void)
> -- 
> 2.41.0.rc2.161.g9c6817b8e7-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
