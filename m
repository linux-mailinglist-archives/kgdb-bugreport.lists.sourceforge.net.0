Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8C29F14A
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 17:22:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kYAhU-0000Ra-VI
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 16:22:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kYAhS-0000RG-S7
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 16:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W/SBTqRwJYQalirxoQ3Q8lAsc2b8iA8Ky9V9/3MAlZY=; b=RHUdKWVB10NxGDCPOpDJhWAg/V
 Xy/D0Aj4y1BMa0rumWMwuax95KJpIToi8Tacu1Ap7DqZ1eiKxvtHdXnVQgGsIxlFdNRdrUYv4Ya+j
 u45nQZ7S4CQ7Cljok/QSOAaZHJDTxkarC5IO2Py0B/uy0AjwrEpjQvnUySTjq44b+s5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W/SBTqRwJYQalirxoQ3Q8lAsc2b8iA8Ky9V9/3MAlZY=; b=UOqGhRKddpRcY0qWZLrfOdVebm
 9R+bausXj2YGsKcOB4Kfjlzdl45OAyKKKlHyWwkN0aQkyzSmANN7RbFH5mVaHSGZZaiIMaaIhQoFG
 I74+Y5/NK4b3zmLKPftGefna1EoV3VHXO2hQJ2vBRNPS1/qyTIYp7HLjBzDc274FEMjM=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kYAhI-00BlmM-Nz
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 16:22:54 +0000
Received: by mail-wm1-f68.google.com with SMTP id h22so439463wmb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W/SBTqRwJYQalirxoQ3Q8lAsc2b8iA8Ky9V9/3MAlZY=;
 b=viAvHpRSyiQfnDRWQeVBwAof3szuxxTKq9hanr3/Az7B4kuyYBr//Jfl0rGgYEE34m
 7BhIH0UFMiXaj7aMzW1qSH1/ogOpD9k03p8iHC7AaQ3r6Zj2LsuNRQbf5OS+L2MVzacB
 dv4mGTv4ZNr607P2BpkhNiJRg9x/YBVras6jA3GdOD7b2dbKlXjbXa8tEpskOh7fhPdw
 B6RV1dKOFfIkn2AafsFU4z+KUstK+3yfOTHPiB/FO07iBlF8B9T+UN46LXZRB/d/Zagt
 zkVlpDNQH7LGLfuUqvKwM4PU3vreHOEbACALpSvrPTszml+/vaG+lWNdNTPr1hyOVDc3
 blSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W/SBTqRwJYQalirxoQ3Q8lAsc2b8iA8Ky9V9/3MAlZY=;
 b=L7F8u8n8tCEVrqBeN5P/ysyCfPqkDvDZvOjjk6HDtRarZjnVprFiuYh1kAteAcEWZC
 HMDXMsmYi2TnB9dt8JzKT4xXNsTV3PhFSt4rY4tigGGBztZ8rpGvvBP+6+sFfxCEMPxX
 bqCCqSfpnUGRrZNgkXKFNNfaXw6opmpDPBh4LaqzQahO0SI0JuMB0AmztACvtNePcxFx
 LRtAjQwxHGtPZL79vKFzRzmHRLHwWZWkuv3eUVPhms4YTvj6cj7Gy9fAea2YLPTWpRnp
 8TgwJNJCwGmoWRMIlPSSlr9gPpr7dZ+Rg1+ySA3FG+tvqYueOuMWm/dda3PI1dW7swAs
 WBsA==
X-Gm-Message-State: AOAM531ZIVABvozmHwuXy3X9cdSsR2QBn7GQ8tdPfiKd37g/bHHVtqUu
 hbAMWlEAldtOVVB68q4RZgf6GQ==
X-Google-Smtp-Source: ABdhPJykydSKM9y0vPn0gIgGIqGjmoJvrLdI5o4R1KK6OqB7XTi1NaYL5U9GKGAc3t4sZg6ZRpVsEw==
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr557634wmj.116.1603988558316; 
 Thu, 29 Oct 2020 09:22:38 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o129sm560563wmb.25.2020.10.29.09.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 09:22:37 -0700 (PDT)
Date: Thu, 29 Oct 2020 16:22:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201029162234.a5czyjy4eyto6aa4@holly.lan>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
 <1603983387-8738-8-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603983387-8738-8-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kYAhI-00BlmM-Nz
Subject: Re: [Kgdb-bugreport] [PATCH v6 7/7] arm64: kgdb: Roundup cpus using
 IPI as NMI
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
Cc: mark.rutland@arm.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 maz@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de, mpe@ellerman.id.au,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 msys.mizuma@gmail.com, tglx@linutronix.de, julien.thierry.kdev@gmail.com,
 will@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Oct 29, 2020 at 08:26:27PM +0530, Sumit Garg wrote:
> arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> leveraged to roundup CPUs which are stuck in hard lockup state with
> interrupts disabled that wouldn't be possible with a normal IPI.
> 
> So instead switch to roundup CPUs using IPI turned as NMI. And in
> case a particular arm64 platform doesn't supports pseudo NMIs,
> it will switch back to default kgdb CPUs roundup mechanism.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/kgdb.h |  9 +++++++++
>  arch/arm64/kernel/ipi_nmi.c   |  5 +++++
>  arch/arm64/kernel/kgdb.c      | 35 +++++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
> index 21fc85e..c3d2425 100644
> --- a/arch/arm64/include/asm/kgdb.h
> +++ b/arch/arm64/include/asm/kgdb.h
> @@ -24,6 +24,15 @@ static inline void arch_kgdb_breakpoint(void)
>  extern void kgdb_handle_bus_error(void);
>  extern int kgdb_fault_expected;
>  
> +#ifdef CONFIG_KGDB
> +extern bool kgdb_ipi_nmicallback(int cpu, void *regs);
> +#else
> +static inline bool kgdb_ipi_nmicallback(int cpu, void *regs)
> +{
> +	return false;
> +}
> +#endif
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  /*
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index 597dcf7..6ace182 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/kgdb.h>
>  #include <linux/nmi.h>
>  #include <linux/smp.h>
>  
> @@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
>  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>  {
>  	irqreturn_t ret = IRQ_NONE;
> +	unsigned int cpu = smp_processor_id();
>  
>  	if (nmi_cpu_backtrace(get_irq_regs()))
>  		ret = IRQ_HANDLED;
>  
> +	if (kgdb_ipi_nmicallback(cpu, get_irq_regs()))
> +		ret = IRQ_HANDLED;
> +
>  	return ret;

It would be better to declare existing return value for
kgdb_nmicallback() to be dangerously stupid and fix it so it returns an
irqreturn_t (that's easy since most callers do not need to check the
return value).

Then this code simply becomes:

	return kgdb_nmicallback(cpu, get_irq_regs());


>  }
>  
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 1a157ca3..c26e710 100644
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
> @@ -353,3 +354,37 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>  	return aarch64_insn_write((void *)bpt->bpt_addr,
>  			*(u32 *)bpt->saved_instr);
>  }
> +
> +bool kgdb_ipi_nmicallback(int cpu, void *regs)
> +{
> +	if (atomic_read(&kgdb_active) != -1) {
> +		kgdb_nmicallback(cpu, regs);
> +		return true;
> +	}
> +
> +	return false;
> +}

I *really* don't like this function.

If the return code of kgdb_nmicallback() is broken then fix it, don't
just wrap it and invent a new criteria for the return code.

To be honest I don't actually think the logic in kgdb_nmicallback() is
broken. As mentioned above the return value has a weird definition (0
for "handled it OK" and 1 for "nothing for me to do") but the logic to
calculate the return code looks OK.


> +
> +static void kgdb_smp_callback(void *data)
> +{
> +	unsigned int cpu = smp_processor_id();
> +
> +	if (atomic_read(&kgdb_active) != -1)
> +		kgdb_nmicallback(cpu, get_irq_regs());
> +}

This is Unused. I presume it is litter from a previous revision of the
code and can be deleted?


> +
> +bool kgdb_arch_roundup_cpus(void)
> +{
> +	struct cpumask mask;
> +
> +	if (!arm64_supports_nmi())
> +		return false;
> +
> +	cpumask_copy(&mask, cpu_online_mask);
> +	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> +	if (cpumask_empty(&mask))
> +		return false;

Why do we need to fallback if there is no work to do? There will still
be no work to do when we call the fallback.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
