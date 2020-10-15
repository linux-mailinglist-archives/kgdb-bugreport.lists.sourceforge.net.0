Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF528E9AA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Oct 2020 03:15:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSrrd-0001it-T2
	for lists+kgdb-bugreport@lfdr.de; Thu, 15 Oct 2020 01:15:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kSrrc-0001ik-Es
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V2cA815NsTarbXE0So8lMwyw3woqxWcfe6evJUcU51k=; b=UlRdQ9E5MooMT0HMWtKe5okImv
 oZhIPQVXB05hduiI+/4nBNB8Nke0Qw69vqwW8Me3mP+jTrfb1D+3FOPHimcCM48KZHmHHytWY3PEH
 LbRvzkMnEnZMDJcphVqNIfbw4wdZxeqeakXiwHbCczl26xBPFvq8dvnhYsEepfP3rlt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V2cA815NsTarbXE0So8lMwyw3woqxWcfe6evJUcU51k=; b=Wv2V/K5rzlIDZJqggaEqXOCt5k
 iVsbhf/z9mWPb1g3Qp9kq+KLijAbi/hi5p2uvKCCs2U8RefoojyNfA33wy4xcffgg9qfyH9IqzgM5
 Rt+SMfVPSUgERsVQJc14KKChDvB9zbUdZBdZkzpZqI27CBaYZsKh+Xa0CvqRYPMqTsh8=;
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSrrZ-00AyQk-3l
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:15:28 +0000
Received: by mail-il1-f196.google.com with SMTP id j8so2268973ilk.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V2cA815NsTarbXE0So8lMwyw3woqxWcfe6evJUcU51k=;
 b=TVE03/vu6ub7sYfPR008WACjyftKWZ/1pnircAiw+rK83dl7rUxoiSGJ00r16y5oW4
 bJNXaJNzpGcUVxT3/SmJeC9tH2pnuSrtr+wm5IGGmalnCjVTnhUliixx2dw6N39012Ii
 zgbs9BAc8u8rognBxRl4/rd680qo+toXPfMGsTBiwgaIlnQiJ2MlCl2DlQCQ/0bOCaZX
 WiypgQkBgG5tRbONn7akFMFy7C4KvgDBXdKGCi5JoxeK23nQ9dQPaJ+tSg7lq1PmyyJC
 E1Rz7EHRfmuadtmdrJLwdd2vDE7fvcegGsmKmt9mp4bT4mEwlr82MRyLIHuq6dU2Zlep
 Cqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V2cA815NsTarbXE0So8lMwyw3woqxWcfe6evJUcU51k=;
 b=MrK93CJSIYCV8Bui3X2x2pxTDqLO94Qq6agtk/liKln9ZwrxaHWzXC4XBIkwmNfG7G
 hOrg4unFjcEPheEdn0vnma3bvtOsxI30MNnQkcIurnz0ac1XvVJzxB4i5v/waSk0uRd5
 GBucvbsL5fOY6kv3NC4FDfyNNtOimAwUKTM/Ghpu2na7MwcSXp/2uKBHHRyXqYPxNyzq
 qcBbVnpVuU3jTI4YPAaT8DfPxsvTLJl9SH6ZFuDA0jIvjD4tkCjzwlCahSdo7MFH3J9J
 TstqQf2P7kPYhNCEKsEmbQYKIaT8PcYOJeaGAOWrLijyzIyzU4wnEDDdgVJflzwpta/g
 mRGg==
X-Gm-Message-State: AOAM533cHq8tNAejGYxNVNExy4Qocon0jnYwsJ2V3ZAVN+wJRtSeg8/k
 2G3N9RhmT6yhKDvavMUzWw==
X-Google-Smtp-Source: ABdhPJwuuLHuywYV+PzlX1kFDLVRVogDrB9cucCfEEzDFBWRNjOWrUKc+3G244zounjp075lUDJewg==
X-Received: by 2002:a92:cd05:: with SMTP id z5mr1300524iln.15.1602724519540;
 Wed, 14 Oct 2020 18:15:19 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id r5sm1107496ioj.51.2020.10.14.18.15.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Oct 2020 18:15:18 -0700 (PDT)
Date: Wed, 14 Oct 2020 21:15:15 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201015011515.dhwgxki5eyewcgyv@gabell>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fujitsu.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kSrrZ-00AyQk-3l
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, ito-yuichi@fujitsu.com,
 jason@lakedaemon.net, maz@kernel.org, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, julien.thierry.kdev@gmail.com,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 14, 2020 at 04:42:07PM +0530, Sumit Garg wrote:
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
>  arch/arm64/kernel/ipi_nmi.c  | 77 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 94 insertions(+), 1 deletion(-)
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
> +}
> +
> +void ipi_nmi_setup(int cpu)
> +{
> +	if (!ipi_desc)
> +		return;
> +
> +	if (is_nmi) {
> +		if (!prepare_percpu_nmi(ipi_id))
> +			enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
> +	} else {
> +		enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
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
> +}
> -- 

Looks good to me. Please feel free to add:

	Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks!
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
