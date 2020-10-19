Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE829270E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Oct 2020 14:16:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUU5G-0006Vc-PJ
	for lists+kgdb-bugreport@lfdr.de; Mon, 19 Oct 2020 12:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUU5E-0006VC-V0
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 12:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSU7leaB88OfQMwrMZxZZ6qb/UjpQzYDftO6z5zyL8I=; b=acGGCMAibLZ0TPcCZvIlekPn/b
 H6Lwy0SfGAlWPXUcGWX16QwP4Ib0IYkxb5mcchNm1kaED8s63UWdhNoC/QHS0HXbXfdT+tv/HnKaT
 5Bc3lq58VJFS5Hpc7ACn8savh7/aiM1jxMXCo/78xFrZNlsMdupdB3NY29ARy8g6hIK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSU7leaB88OfQMwrMZxZZ6qb/UjpQzYDftO6z5zyL8I=; b=XEjbPwRzQCDVISbosiA+rqmP6Q
 c+cFW3zi5Lemg/Wwo2xS50XXO5AWnZDMOvOnZPRLDk5//3RAGYm935Qxosv1hRNTFF623ckC3vPEL
 qkgy9ZldcFrY9nRjQsK/iS/cRRsgM6wknSfNFip0MBuBaDVxDE7LiEFD51LiZC26H5PI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUU59-003jds-BX
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 12:16:12 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A74D222268;
 Mon, 19 Oct 2020 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603109749;
 bh=RYQpI+PlsEdpivnE+YOvprJVaqwBNAEJkR9tx1GcJa4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=clVAWMr3IFUpwbSGLYMFnhoyCjXo84OlYKfpqaNOO+RlNVrhG0ePOhZMv7ThU0Grk
 HN5gRo4gYu4Zgzc5851pH/KlhbP1JUrPDjWrVDMDFBnJZugMi/n1aGYdz/JiF9c+w0
 AYzxWQwRXEJq2Lly7B2Q5NN72fAI5MuLdmxYOYq0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUU4p-002PeW-Im; Mon, 19 Oct 2020 13:15:47 +0100
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 13:15:47 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <1602673931-28782-5-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-5-git-send-email-sumit.garg@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <0899dcad304ac8bf0ea7d5308ec2e263@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 jason@lakedaemon.net, mark.rutland@arm.com, julien.thierry.kdev@gmail.com,
 dianders@chromium.org, daniel.thompson@linaro.org, jason.wessel@windriver.com,
 msys.mizuma@gmail.com, ito-yuichi@fujitsu.com,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kUU59-003jds-BX
Subject: Re: [Kgdb-bugreport] [PATCH v5 4/5] arm64: kgdb: Round up cpus
 using IPI as NMI
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 catalin.marinas@arm.com, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-14 12:12, Sumit Garg wrote:
> arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> leveraged to round up CPUs which are stuck in hard lockup state with
> interrupts disabled that wouldn't be possible with a normal IPI.
> 
> So instead switch to round up CPUs using IPI turned as NMI. And in
> case a particular arm64 platform doesn't supports pseudo NMIs,
> this IPI will act as a normal IPI which maintains existing kgdb
> functionality.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/kgdb.h |  8 ++++++++
>  arch/arm64/kernel/ipi_nmi.c   |  5 ++++-
>  arch/arm64/kernel/kgdb.c      | 21 +++++++++++++++++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kgdb.h 
> b/arch/arm64/include/asm/kgdb.h
> index 21fc85e..6f3d3af 100644
> --- a/arch/arm64/include/asm/kgdb.h
> +++ b/arch/arm64/include/asm/kgdb.h
> @@ -24,6 +24,14 @@ static inline void arch_kgdb_breakpoint(void)
>  extern void kgdb_handle_bus_error(void);
>  extern int kgdb_fault_expected;
> 
> +#ifdef CONFIG_KGDB
> +extern void ipi_kgdb_nmicallback(int cpu, void *regs);
> +#else
> +static inline void ipi_kgdb_nmicallback(int cpu, void *regs)
> +{
> +}
> +#endif
> +
>  #endif /* !__ASSEMBLY__ */
> 
>  /*
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index a959256..e0a9e03 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -8,6 +8,7 @@
> 
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/kgdb.h>
>  #include <linux/smp.h>
> 
>  #include <asm/nmi.h>
> @@ -26,7 +27,9 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t 
> *mask)
> 
>  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>  {
> -	/* nop, NMI handlers for special features can be added here. */
> +	unsigned int cpu = smp_processor_id();
> +
> +	ipi_kgdb_nmicallback(cpu, get_irq_regs());

Please add a return value to ipi_kgdb_nmicallback(), and check it
before returning IRQ_HANDLED.

Thinking a bit more about the whole thing, you should have a way to
avoid requesting the NMI if there is no user for it (there is nothing
worse than an enabled interrupt without handlers...).

> 
>  	return IRQ_HANDLED;
>  }
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 1a157ca3..0991275 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -17,6 +17,7 @@
> 
>  #include <asm/debug-monitors.h>
>  #include <asm/insn.h>
> +#include <asm/nmi.h>
>  #include <asm/traps.h>
> 
>  struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
> @@ -353,3 +354,23 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt 
> *bpt)
>  	return aarch64_insn_write((void *)bpt->bpt_addr,
>  			*(u32 *)bpt->saved_instr);
>  }
> +
> +void ipi_kgdb_nmicallback(int cpu, void *regs)
> +{
> +	if (atomic_read(&kgdb_active) != -1)
> +		kgdb_nmicallback(cpu, regs);
> +}
> +
> +#ifdef CONFIG_SMP

There is no such thing as an arm64 UP kernel.

> +void kgdb_roundup_cpus(void)
> +{
> +	struct cpumask mask;
> +
> +	cpumask_copy(&mask, cpu_online_mask);
> +	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> +	if (cpumask_empty(&mask))
> +		return;
> +
> +	arch_send_call_nmi_func_ipi_mask(&mask);

Surely you can come up with a less convoluted name for this function.
arm64_send_nmi() would be plenty in my opinion.

> +}
> +#endif

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
