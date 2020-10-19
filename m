Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE812292679
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Oct 2020 13:38:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUTUW-0004uM-LZ
	for lists+kgdb-bugreport@lfdr.de; Mon, 19 Oct 2020 11:38:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUTUV-0004uD-Pl
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 11:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fypM5A4YpJ0QrqEK2gGA2OHLO7YdfMtEwrtz6OEwr3o=; b=HtgUVKMBKi+CCspwdJnNF7w4kX
 jiw3J3oq8eVPM0syNl+ApHSisobJrWk8gPalCxJbNUDjR6Zj7SJ0Yq7hxTUVwcwdrwVDA7afxmKhI
 g0RyJb7QyZJPc37Ek3fdkn3Je5Gn5z1D/jazBlJWMWnlAclB6lZDrCdR2mfiYGUXXP5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fypM5A4YpJ0QrqEK2gGA2OHLO7YdfMtEwrtz6OEwr3o=; b=Jn06KtssM4rmJBQUQPh/1J5idb
 T8P/PJR0nKTAqep9xvFrOdyuq4Vhn3H8sGtaWenkbOFfW3rBfQTrJoK0nw+ZqnXxHch2kZgv+f1kC
 pnt0oYxihtgxht6xJTf/sfTim+6rtVnoaoSAfRyikEGuej/t5vSP93E1hlwWLquf9xQY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUTUO-00FbaQ-Op
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 11:38:15 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4239422257;
 Mon, 19 Oct 2020 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603107470;
 bh=TVDVQ/Ab2sgzUQG1yJ1WTN+r2/BeNfiNgFN8blwtyWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=unQBLWkRwp58+Po18TOtPJ98+Tqudrwp+KOXRX7uvksFnDv6nEf1V2Yd9ZIjjOISl
 frQMfhKZFBXGWUru+IMPbU5q9mdds04/0JenPN87nynjRZ78fdWG9ZRZGXEfWpgLL6
 sbSa/i3c05iDy9bG3vYaC4+49Cr9yiM7h0osGswQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUTU3-002P16-H1; Mon, 19 Oct 2020 12:37:48 +0100
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 12:37:47 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kUTUO-00FbaQ-Op
Subject: Re: [Kgdb-bugreport] [PATCH v5 1/5] arm64: Add framework to turn
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
 catalin.marinas@arm.com, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-14 12:12, Sumit Garg wrote:
> Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
> particular platform doesn't support pseudo NMIs, then request IPI as a
> regular IRQ.
> 
> The main motivation for this feature is to have an IPI that can be
> leveraged to invoke NMI functions on other CPUs. And current 
> prospective
> users are NMI backtrace and KGDB CPUs round-up whose support is added
> via future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/nmi.h | 16 +++++++++
>  arch/arm64/kernel/Makefile   |  2 +-
>  arch/arm64/kernel/ipi_nmi.c  | 77 
> ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 94 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/nmi.h
>  create mode 100644 arch/arm64/kernel/ipi_nmi.c
> 
> diff --git a/arch/arm64/include/asm/nmi.h 
> b/arch/arm64/include/asm/nmi.h
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
> index bbaf0bc..525a1e0 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -17,7 +17,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
>  			   return_address.o cpuinfo.o cpu_errata.o		\
>  			   cpufeature.o alternative.o cacheinfo.o		\
>  			   smp.o smp_spin_table.o topology.o smccc-call.o	\
> -			   syscall.o proton-pack.o
> +			   syscall.o proton-pack.o ipi_nmi.o
> 
>  targets			+= efi-entry.o
> 
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> new file mode 100644
> index 0000000..a959256
> --- /dev/null
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -0,0 +1,77 @@
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

This definitely is the *wrong* default. If nothing is explicitly
handling the interrupt, it should be reported as such to the core
code to be disabled if this happens too often.

> +}
> +
> +void ipi_nmi_setup(int cpu)

The naming is awful. "ipi" is nowhere specific enough (we already have
another 7 of them), and this doesn't necessarily uses pseudo-NMIs, since
you are requesting IRQs.

> +{
> +	if (!ipi_desc)
> +		return;
> +
> +	if (is_nmi) {
> +		if (!prepare_percpu_nmi(ipi_id))
> +			enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
> +	} else {
> +		enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);

I'm not keen on this. Normal IRQs can't reliably work, so why do you
even bother with this?

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

Updating global state without checking for errors doesn't seem
like a great move.

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
