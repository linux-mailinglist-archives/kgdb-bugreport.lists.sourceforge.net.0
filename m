Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84228B1DF
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Oct 2020 11:59:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kRucP-0003x3-25
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Oct 2020 09:59:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kR4AF-0000v4-FD
 for kgdb-bugreport@lists.sourceforge.net; Sat, 10 Oct 2020 01:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0puSsum/qABpfyTdyTDsS4fG67aid0BMWid+flFv+eg=; b=FNK8shyYPo/SS6KljWXixJ/WSm
 qWRT1S4u6C0BSDgAnCk86oq1YoS0bJmnw1DyOsYuHq9GDvsdbmyR9K9vAl2zLMH9sjBudqzuuRryQ
 s4RHQB7Ugon0cECboYc2rt9DZusU0WUcis6BcdbDTCI5+QqvOygT4M11eizaNHYF/ftY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0puSsum/qABpfyTdyTDsS4fG67aid0BMWid+flFv+eg=; b=bciuzCH6crfvoTEGu+9cb/joNJ
 SLwmwIO4v23l03KDuRlp5D2uE7cBZHqQyi+sa7FHrWZJsAS66IXBOPimP8cBUN7GC8nqd0M23oO6p
 eafs4uLhI50hBZwURnq68eymqeQwTMI6zRgTGjgw5hwHi7eQTCSvJQcZ5vR0DtlIaNPc=;
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kR4AA-0098jj-Rj
 for kgdb-bugreport@lists.sourceforge.net; Sat, 10 Oct 2020 01:59:15 +0000
Received: by mail-qt1-f195.google.com with SMTP id d1so9584181qtr.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Oct 2020 18:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0puSsum/qABpfyTdyTDsS4fG67aid0BMWid+flFv+eg=;
 b=fQXTg+XZLmgQxJVK3nn/P82NsmMwZYM36l9N6OoupGMOPze7IhVxYtM1f3QLhDG9B5
 t/lcRTJ47AQ363Pd2VYfqn6HrqkfEf9Kpd5BTrrq6bW7Fo7RotcV2FhYzvJZf+XfN0p9
 8FVInVcA6pCh1RV49gm5qonfv3zNOLuWfUTri/W9ahqVey20l5mfLM7g4XMvKkPljvL4
 JnaGLWOnf33Lnvxdy8wM1YriPx3Cf6NM/MT6aVrnKan1UaOASdh0VeBrJ06l+ibdBSDZ
 JVnbNm1Tir+cu/3mf3EUsfivWdpy2x36wbIZv7554ELrAk1zB2zSPamc15h37ZzvT5af
 0xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0puSsum/qABpfyTdyTDsS4fG67aid0BMWid+flFv+eg=;
 b=c+eQUPlCJNPAkP0gPvoyswELSWX9Fwc7C5CSUvqxt8wJGOFdCnCgpld4dqN4JEUv/1
 TJuTdO6Tdpy7qtmuMM7Ik5Nj6Z6aMY0zh07Fv9jb7qd/ywpd2hY129em4VPbnf8uJcW4
 jcNmxl/X+inzbrv/zx+Vy1lV+DpGHaPAGWltA9tPX9URTxK308fOdUYJKPank14caPT5
 cDWqYs0BCNd8VX3PSZfLYtJI7sibbP6l3IAtWVV9/L9rCDcMBeUjKOccwMyxew3K5WHD
 YTU+SapwDmDhjTieuCrPp9y0zXkhac3JxR2LfHhqcMZjk8D/5Jbk69Go/dFK8GHdciQN
 lTxA==
X-Gm-Message-State: AOAM531DWovZ+kTKTk8Rmysybfmn5AriSFtefu+2KRhL22N7KZkxZYdw
 1kpuO4Hip4DEtLTtO31YhQ==
X-Google-Smtp-Source: ABdhPJyOvRKWaRUpU8gTeLnfa2A+iOKvO661uUQJENQDBBEpn4QmSbzmaKlZ/d2GsF6VpyT/QDM78w==
X-Received: by 2002:ac8:295c:: with SMTP id z28mr846071qtz.37.1602295137887;
 Fri, 09 Oct 2020 18:58:57 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id o4sm7532382qkk.75.2020.10.09.18.58.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Oct 2020 18:58:57 -0700 (PDT)
Date: Fri, 9 Oct 2020 21:58:55 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201010015855.vksetnj4luft5enc@gabell>
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
 <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kR4AA-0098jj-Rj
X-Mailman-Approved-At: Mon, 12 Oct 2020 09:59:48 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/5] arm64: Add framework to turn
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 maz@kernel.org, jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 julien.thierry.kdev@gmail.com, catalin.marinas@arm.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sumit,

On Fri, Sep 11, 2020 at 06:58:40PM +0530, Sumit Garg wrote:
> Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
> particular platform doesn't support pseudo NMIs, then request IPI as a
> regular IRQ.
> 
> The main motivation for this feature is to have an IPI that can be
> leveraged to invoke NMI functions on other CPUs. And current prospective
> users are NMI backtrace and KGDB CPUs round-up whose support is added
> via future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/nmi.h | 16 +++++++++
>  arch/arm64/kernel/Makefile   |  2 +-
>  arch/arm64/kernel/ipi_nmi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/nmi.h
>  create mode 100644 arch/arm64/kernel/ipi_nmi.c
> 
> diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
> new file mode 100644
> index 0000000..3433c55
> --- /dev/null
> +++ b/arch/arm64/include/asm/nmi.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_NMI_H
> +#define __ASM_NMI_H
> +
> +#ifndef __ASSEMBLER__
> +
> +#include <linux/cpumask.h>
> +
> +extern void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask);
> +
> +void set_smp_ipi_nmi(int ipi);
> +void ipi_nmi_setup(int cpu);
> +void ipi_nmi_teardown(int cpu);
> +
> +#endif /* !__ASSEMBLER__ */
> +#endif
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index a561cbb..022c26b 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -19,7 +19,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
>  			   return_address.o cpuinfo.o cpu_errata.o		\
>  			   cpufeature.o alternative.o cacheinfo.o		\
>  			   smp.o smp_spin_table.o topology.o smccc-call.o	\
> -			   syscall.o
> +			   syscall.o ipi_nmi.o
>  
>  targets			+= efi-entry.o
>  
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> new file mode 100644
> index 0000000..355ef92
> --- /dev/null
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * NMI support for IPIs
> + *
> + * Copyright (C) 2020 Linaro Limited
> + * Author: Sumit Garg <sumit.garg@linaro.org>
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/smp.h>
> +
> +#include <asm/nmi.h>
> +
> +static struct irq_desc *ipi_desc __read_mostly;
> +static int ipi_id __read_mostly;
> +static bool is_nmi __read_mostly;
> +
> +void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask)
> +{
> +	if (WARN_ON_ONCE(!ipi_desc))
> +		return;
> +
> +	__ipi_send_mask(ipi_desc, mask);
> +}
> +
> +static irqreturn_t ipi_nmi_handler(int irq, void *data)
> +{
> +	/* nop, NMI handlers for special features can be added here. */
> +
> +	return IRQ_HANDLED;
> +}
> +
> +void ipi_nmi_setup(int cpu)
> +{
> +	if (!ipi_desc)
> +		return;

ipi_nmi_setup() may be called twice for CPU0:

  set_smp_ipi_range => set_smp_ipi_nmi => ipi_nmi_setup
                    => ipi_setup => ipi_nmi_setup

Actually, I got the following error message via the second ipi_nmi_setup():

  GICv3: Pseudo-NMIs enabled using relaxed ICC_PMR_EL1 synchronisation
  GICv3: Cannot set NMI property of enabled IRQ 8
  genirq: Failed to setup NMI delivery: irq 8

Why don't we have a check to prevent that? Like as:

       if (cpumask_test_cpu(cpu, ipi_desc->percpu_enabled))
               return;

> +
> +	if (is_nmi) {
> +		if (!prepare_percpu_nmi(ipi_id))
> +			enable_percpu_nmi(ipi_id, 0);

It would be better to use IRQ_TYPE_NONE instead of 0.

			enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);

> +	} else {
> +		enable_percpu_irq(ipi_id, 0);

Same as here:
		enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);

Thanks,
Masa

> +	}
> +}
> +
> +void ipi_nmi_teardown(int cpu)
> +{
> +	if (!ipi_desc)
> +		return;
> +
> +	if (is_nmi) {
> +		disable_percpu_nmi(ipi_id);
> +		teardown_percpu_nmi(ipi_id);
> +	} else {
> +		disable_percpu_irq(ipi_id);
> +	}
> +}
> +
> +void __init set_smp_ipi_nmi(int ipi)
> +{
> +	int err;
> +
> +	err = request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number);
> +	if (err) {
> +		err = request_percpu_irq(ipi, ipi_nmi_handler, "IPI",
> +					 &cpu_number);
> +		WARN_ON(err);
> +		is_nmi = false;
> +	} else {
> +		is_nmi = true;
> +	}
> +
> +	ipi_desc = irq_to_desc(ipi);
> +	irq_set_status_flags(ipi, IRQ_HIDDEN);
> +	ipi_id = ipi;
> +
> +	/* Setup the boot CPU immediately */
> +	ipi_nmi_setup(smp_processor_id());
> +}
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
