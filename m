Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6AC771E0C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:29:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxU3-0003KF-1J
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:29:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxU1-0003K8-2D
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cr+okNEufvH1wuNQ8QJpL028u93oM++dQHw/auZEerM=; b=Q+PPQajqefBG+ghPvIuzkWe5b2
 mL2MPgCqBZYTv0cGYlYTBe27CUysWVHUmwF1yRI7Li8ezI3V/CUgnzkT/DDsOu/OTA7tZV60lj7gX
 s3tdC5fJADkkh2/+EpxeDBr/XMlFpnTrdCrLy3Kc6h4nxyH6u4W8gUidEI9U/DJ0Wc38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cr+okNEufvH1wuNQ8QJpL028u93oM++dQHw/auZEerM=; b=KoFTE+zclHm3U4SGWCETZr23sP
 8SmyN1XeTxaXYZ2gXCbjqRP33yimpma5IEq33xbjmF8NwN8aPR1FMpHqOri1f0lvuzWLh0pYko0xj
 uBQ9jSMF3dc96PTsoWl8wanQFuOwYe3z6HCsOLxaAHSaUv4QmrhjCwo4onI46YJmRFPU=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxU0-00FpTj-Lb for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:29:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0571FB;
 Mon,  7 Aug 2023 03:29:42 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79A453F59C;
 Mon,  7 Aug 2023 03:28:56 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:28:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson
 wrote: > From: Sumit Garg <sumit.garg@linaro.org> > > Let's use the debug
 IPI for rounding up CPUs in kgdb. When the debug > IPI is backed by [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qSxU0-00FpTj-Lb
Subject: Re: [Kgdb-bugreport] [PATCH v9 7/7] arm64: kgdb: Roundup cpus using
 the debug IPI
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
 linux-arm-kernel@lists.infradead.org, Wei Li <liwei391@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
> From: Sumit Garg <sumit.garg@linaro.org>
> 
> Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
> IPI is backed by an NMI (or pseudo NMI) then this will let us debug
> even hard locked CPUs. When the debug IPI isn't backed by an NMI then
> this won't really have any huge benefit but it will still work.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v9:
> - Remove fallback for when debug IPI isn't available.
> - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> 
>  arch/arm64/kernel/ipi_debug.c |  5 +++++
>  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)

This looks fine to me, but I'd feel a bit happier if we had separate SGIs for
the backtrace and the KGDB callback as they're logically unrelated.

Thanks,
Mark.

> 
> diff --git a/arch/arm64/kernel/ipi_debug.c b/arch/arm64/kernel/ipi_debug.c
> index 6984ed507e1f..5794894d94f1 100644
> --- a/arch/arm64/kernel/ipi_debug.c
> +++ b/arch/arm64/kernel/ipi_debug.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/kgdb.h>
>  #include <linux/nmi.h>
>  #include <linux/smp.h>
>  
> @@ -40,6 +41,7 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  static irqreturn_t ipi_debug_handler(int irq, void *data)
>  {
>  	irqreturn_t ret = IRQ_NONE;
> +	unsigned int cpu = smp_processor_id();
>  
>  	/*
>  	 * NOTE: Just like in arch_trigger_cpumask_backtrace(), we're calling
> @@ -49,6 +51,9 @@ static irqreturn_t ipi_debug_handler(int irq, void *data)
>  	if (nmi_cpu_backtrace(get_irq_regs()))
>  		ret = IRQ_HANDLED;
>  
> +	if (!kgdb_nmicallback(cpu, get_irq_regs()))
> +		ret = IRQ_HANDLED;
> +
>  	return ret;
>  }
>  
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 4e1f983df3d1..9c4c47507cd4 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -20,6 +20,8 @@
>  #include <asm/patching.h>
>  #include <asm/traps.h>
>  
> +#include "ipi_debug.h"
> +
>  struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
>  	{ "x0", 8, offsetof(struct pt_regs, regs[0])},
>  	{ "x1", 8, offsetof(struct pt_regs, regs[1])},
> @@ -356,3 +358,15 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>  	return aarch64_insn_write((void *)bpt->bpt_addr,
>  			*(u32 *)bpt->saved_instr);
>  }
> +
> +void kgdb_roundup_cpus(void)
> +{
> +	struct cpumask mask;
> +
> +	cpumask_copy(&mask, cpu_online_mask);
> +	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> +	if (cpumask_empty(&mask))
> +		return;
> +
> +	arm64_debug_ipi(&mask);
> +}
> -- 
> 2.41.0.rc2.161.g9c6817b8e7-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
