Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF82A2E65
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 16:34:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZbqZ-0003Rf-2s
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 15:34:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kZbqX-0003RU-Vu
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 15:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jkd5WRUAKaIIbJUIfCjcR2xQVAOUb4rIGq3LFrUWxsE=; b=eUn4++cVSJh/GN002hgFCxLvSS
 OgDkJt7cymS1uFfxfR+RKDRbnpqOspLh2qiEvmGYB2aMddI+7Ylz3mrD0gGz26frRc4xNtJU3eqBE
 03ktYADp09o+nl6BhXkNtdgFfXhMiWJqmkKhrH/dNb0e9kPRvuB0F77Ql0K6sB5BBzzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jkd5WRUAKaIIbJUIfCjcR2xQVAOUb4rIGq3LFrUWxsE=; b=Ww7UG0DbxJq/QtekMDCGfyJPbs
 mXj1CoXNfwxYYxZdN8wAlBKsk9DXQz0vXOsbI1fN2yoYImIPpBcX7zogNNN5WvAbXTFf1IQMXqKaI
 rX6WaGsIynhUqZr0z+DuEbuwdJME/UP04ciq+Gfc0rQG2WK+duYqrpf5/7HpeK0BsWak=;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZbqR-00GSY9-AD
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 15:34:13 +0000
Received: by mail-qk1-f194.google.com with SMTP id b18so11774114qkc.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 07:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Jkd5WRUAKaIIbJUIfCjcR2xQVAOUb4rIGq3LFrUWxsE=;
 b=BZ0SsxESF8rSskfH+stShhCnOd6JGOyfEi8XtbgOg8OATjoZrTZ7s45AsVU0BC82xz
 ddLpAsGN9vZxHp6av72FDoi/Wrhyj/Kui0p71PX6TrCN2aQIVnlraNYCpd5TQ+3F6sdN
 86KHo45OCukF/pRhU4Vk/I7J2Ek1KUauw4cm/KVDK0TVgFlp8BYZwQfR+PL1GlGB2Qh5
 7TOR252d9wf/hQY1aa2GtEKgXWWg2tFSQTH7mXi0P3hgg73QciG8eqTk8aINdog0jBfD
 KD54aS7LUXZ6cML9vt4HGOjSuXDxve0E98pCurySYOto0Iza9iq/jVDun/BoycL0suWA
 pDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jkd5WRUAKaIIbJUIfCjcR2xQVAOUb4rIGq3LFrUWxsE=;
 b=pa0jr7I7IoX6EuPTjKU0daLocgYO4ulzNjLXCal9AhMBLd5gsN9Pz+XesEA3RePrv0
 gX09kHm5KKFlT7cgU8erUFxWH8ahJSyM65CFHFKjS7sZim8mZ2mcNB+Ft1rBz9O0SLdq
 OlW4NTrjRATrQ8ZeyvnKlQlS5NJ0GMi412vSIK94ZsqIItaIRNS3q9QF3UEKVBXuYfPd
 J9UFi+GhsyjMbHbuCj7KkN2YPzPdjfJOl7iaczDU70x1z2IXNQ6h00g9dq+0flxA6OKs
 LVX2HTVuI1TmJFsEvRDId5/kVZKIt8Woa3zRnxTvWyv/BVON/z3HftWF5c8dBmjSXyN5
 7a7A==
X-Gm-Message-State: AOAM533D5Ml5pZUEdk9rEioTimBxqpNLcc3Bgki7Hjsdn7TcmaPtyKmZ
 J9Y72pQWR0iVpUkbhD/3BA==
X-Google-Smtp-Source: ABdhPJxxfArhbX9SYy8Rmm26gib6WG8GrpJLzA/QMpD5c6xMFrlMZ2qveL6OMlPTG8NeDaTBLSSq4A==
X-Received: by 2002:a37:8cc1:: with SMTP id
 o184mr15679047qkd.205.1604331234080; 
 Mon, 02 Nov 2020 07:33:54 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id y82sm7507470qkb.129.2020.11.02.07.33.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Nov 2020 07:33:52 -0800 (PST)
Date: Mon, 2 Nov 2020 10:33:49 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201102153349.fay4f5iam76gfapu@gabell>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604317487-14543-2-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZbqR-00GSY9-AD
Subject: Re: [Kgdb-bugreport] [PATCH v7 1/7] arm64: Add framework to turn
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 maz@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de, mpe@ellerman.id.au,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com, will@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 02, 2020 at 05:14:41PM +0530, Sumit Garg wrote:
> Introduce framework to turn an IPI as NMI using pseudo NMIs. The main
> motivation for this feature is to have an IPI that can be leveraged to
> invoke NMI functions on other CPUs.
> 
> And current prospective users are NMI backtrace and KGDB CPUs round-up
> whose support is added via future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/nmi.h | 17 ++++++++++++
>  arch/arm64/kernel/Makefile   |  2 +-
>  arch/arm64/kernel/ipi_nmi.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/nmi.h
>  create mode 100644 arch/arm64/kernel/ipi_nmi.c
> 
> diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
> new file mode 100644
> index 0000000..4cd14b6
> --- /dev/null
> +++ b/arch/arm64/include/asm/nmi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_NMI_H
> +#define __ASM_NMI_H
> +
> +#ifndef __ASSEMBLER__
> +
> +#include <linux/cpumask.h>
> +
> +extern bool arm64_supports_nmi(void);
> +extern void arm64_send_nmi(cpumask_t *mask);
> +
> +void set_smp_dynamic_ipi(int ipi);
> +void dynamic_ipi_setup(int cpu);
> +void dynamic_ipi_teardown(int cpu);
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
> index 0000000..a945dcf
> --- /dev/null
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -0,0 +1,65 @@
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
> +static struct irq_desc *ipi_nmi_desc __read_mostly;
> +static int ipi_nmi_id __read_mostly;
> +
> +bool arm64_supports_nmi(void)
> +{
> +	if (ipi_nmi_desc)
> +		return true;
> +
> +	return false;
> +}
> +
> +void arm64_send_nmi(cpumask_t *mask)
> +{
> +	if (WARN_ON_ONCE(!ipi_nmi_desc))
> +		return;
> +
> +	__ipi_send_mask(ipi_nmi_desc, mask);
> +}
> +
> +static irqreturn_t ipi_nmi_handler(int irq, void *data)
> +{
> +	/* nop, NMI handlers for special features can be added here. */
> +
> +	return IRQ_NONE;
> +}
> +

> +void dynamic_ipi_setup(int cpu)

cpu isn't used here, so void is better?

void dynamic_ipi_setup(void)

> +{
> +	if (!ipi_nmi_desc)
> +		return;
> +
> +	if (!prepare_percpu_nmi(ipi_nmi_id))
> +		enable_percpu_nmi(ipi_nmi_id, IRQ_TYPE_NONE);
> +}
> +

> +void dynamic_ipi_teardown(int cpu)

Same as here:
void dynamic_ipi_teardown(void)

> +{
> +	if (!ipi_nmi_desc)
> +		return;
> +
> +	disable_percpu_nmi(ipi_nmi_id);
> +	teardown_percpu_nmi(ipi_nmi_id);
> +}
> +
> +void __init set_smp_dynamic_ipi(int ipi)
> +{
> +	if (!request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number)) {
> +		ipi_nmi_desc = irq_to_desc(ipi);
> +		ipi_nmi_id = ipi;
> +	}
> +}
> -- 

Otherwise, looks good to me. Please feel free to add:

	Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks,
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
