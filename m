Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B628B48C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Oct 2020 14:22:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kRwqM-0002l5-KC
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Oct 2020 12:22:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kRwqL-0002kQ-4i
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Oct 2020 12:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/5uQKNQALLpgdlcTiZCyohg/vJ9Vde3kITcCMI00DlQ=; b=kznAvrAY1g2rKFiKi71BMnZNZj
 cqQB5Z7mTEQBiL7iHNvPM1Q2qIC2xP4onedfNmOv1w8AiUdGYEJ0UmOtlKB5sZsrERoOiF3aAdLAT
 ApdR4hPmfjGedtRnXIInZP25oijGsFypiPfzsXAtB0wj4nulEAApySrJuVRkeOGnt+S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/5uQKNQALLpgdlcTiZCyohg/vJ9Vde3kITcCMI00DlQ=; b=mDOBuXInxlF9VNndkvQFhnXBDp
 VqFxECswNJ7kez463a1s+qosYN/7I+cbZl/ursF84Tn9mq09Mk2LvBmt5wqZHXNcUX4ZfattqpHne
 LAUeZlBaQfXgLOoVCWijXQ1lonZwN8g9RTr/1MtecmzjIUQNszgKgfZRQ5EPETnNAbRc=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kRwq7-007P3H-0e
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Oct 2020 12:22:21 +0000
Received: by mail-lf1-f68.google.com with SMTP id r127so18127331lff.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Oct 2020 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5uQKNQALLpgdlcTiZCyohg/vJ9Vde3kITcCMI00DlQ=;
 b=fH1zJ8HNuzgC60t5ViAk9wobk5pi7MSyH6EQtPWXeKAkvU1+wFJwnDKDCH+5OXyLuD
 i0pUDSAybOWvKqXkDBqeUHASMki1bAWBTU6h0D24P2LGwXUg6fxYa6F1gjUoVkGOxCxJ
 pwAWe8wtsAXiWGmn7HpaYLfM0q0oB5LIE534+F9HXYpYzGGBUfc5Ult49JHJbUPZDvld
 41oB/DyCB6Euh9i0HARmgGQpH4g8jeuRT2GBq16P66xwlH9KbFcCj0PpMCB2QTBKlNKf
 cefMeLc5VWEDV3JUfUeIvdlgkYGNt3DeUOuk0a1nvlJI/s084FpiiF8bXxV3XmQ2EatQ
 2KxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5uQKNQALLpgdlcTiZCyohg/vJ9Vde3kITcCMI00DlQ=;
 b=HsimkaVFd9TNp2xY5F34ws2DSMSqodLlpel9axSgpP+BrHbkvDofO+8GN7VRvLQJkL
 Bo74pa9uja1UDyA+I7DP7ks6heTWHfh5+s3NOkf098MGp/codPZ+Oub2uhMlY0Y3o2KG
 LvTBRDZDITIbILp7iYhOCvMFv2+84mJ5OJQs42MIo6rhGxXq2PpFo22KNIn4OHpwjzR0
 crX3VsajZ3K+ywpSyu8ksA8zY/Tfa0sooz/YJ35BQm/9oLChkuaDBjLx56RXiDV5+9qy
 5dvGsjYmX2fBNJDqGUk6IRMhVnYBUjhs5mw/hCDBFEoT6UEp29gVZBj6Uq1+FqKPQg2a
 Rapg==
X-Gm-Message-State: AOAM532qCZWgMtZPLuvAe7KXi+BjDgX6cb1C3cZvF1Lvto8i6NxGJlmC
 3FV4yld5LQqhQEWAedewJA0V5aESvzYIbAr3wg8kBA==
X-Google-Smtp-Source: ABdhPJxbxACdsPa8z7j3x1/jLOi3qgxjqlWljUhX9hvtHIj3G232T1dQ5fDBy5Aqdasp98jFz6v+6WJI0jlW2ywbYEs=
X-Received: by 2002:a19:c88c:: with SMTP id y134mr7465078lff.283.1602505320370; 
 Mon, 12 Oct 2020 05:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
 <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
 <20201010015855.vksetnj4luft5enc@gabell>
In-Reply-To: <20201010015855.vksetnj4luft5enc@gabell>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Oct 2020 17:51:49 +0530
Message-ID: <CAFA6WYMkLq_TuP+98y15FJT--hK24WHeVnDWc46DMmNE08WP3A@mail.gmail.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kRwq7-007P3H-0e
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, 10 Oct 2020 at 07:28, Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> Hi Sumit,
>
> On Fri, Sep 11, 2020 at 06:58:40PM +0530, Sumit Garg wrote:
> > Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
> > particular platform doesn't support pseudo NMIs, then request IPI as a
> > regular IRQ.
> >
> > The main motivation for this feature is to have an IPI that can be
> > leveraged to invoke NMI functions on other CPUs. And current prospective
> > users are NMI backtrace and KGDB CPUs round-up whose support is added
> > via future patches.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/nmi.h | 16 +++++++++
> >  arch/arm64/kernel/Makefile   |  2 +-
> >  arch/arm64/kernel/ipi_nmi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 97 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/include/asm/nmi.h
> >  create mode 100644 arch/arm64/kernel/ipi_nmi.c
> >
> > diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
> > new file mode 100644
> > index 0000000..3433c55
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/nmi.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_NMI_H
> > +#define __ASM_NMI_H
> > +
> > +#ifndef __ASSEMBLER__
> > +
> > +#include <linux/cpumask.h>
> > +
> > +extern void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask);
> > +
> > +void set_smp_ipi_nmi(int ipi);
> > +void ipi_nmi_setup(int cpu);
> > +void ipi_nmi_teardown(int cpu);
> > +
> > +#endif /* !__ASSEMBLER__ */
> > +#endif
> > diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> > index a561cbb..022c26b 100644
> > --- a/arch/arm64/kernel/Makefile
> > +++ b/arch/arm64/kernel/Makefile
> > @@ -19,7 +19,7 @@ obj-y                       := debug-monitors.o entry.o irq.o fpsimd.o              \
> >                          return_address.o cpuinfo.o cpu_errata.o              \
> >                          cpufeature.o alternative.o cacheinfo.o               \
> >                          smp.o smp_spin_table.o topology.o smccc-call.o       \
> > -                        syscall.o
> > +                        syscall.o ipi_nmi.o
> >
> >  targets                      += efi-entry.o
> >
> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> > new file mode 100644
> > index 0000000..355ef92
> > --- /dev/null
> > +++ b/arch/arm64/kernel/ipi_nmi.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * NMI support for IPIs
> > + *
> > + * Copyright (C) 2020 Linaro Limited
> > + * Author: Sumit Garg <sumit.garg@linaro.org>
> > + */
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/smp.h>
> > +
> > +#include <asm/nmi.h>
> > +
> > +static struct irq_desc *ipi_desc __read_mostly;
> > +static int ipi_id __read_mostly;
> > +static bool is_nmi __read_mostly;
> > +
> > +void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask)
> > +{
> > +     if (WARN_ON_ONCE(!ipi_desc))
> > +             return;
> > +
> > +     __ipi_send_mask(ipi_desc, mask);
> > +}
> > +
> > +static irqreturn_t ipi_nmi_handler(int irq, void *data)
> > +{
> > +     /* nop, NMI handlers for special features can be added here. */
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +void ipi_nmi_setup(int cpu)
> > +{
> > +     if (!ipi_desc)
> > +             return;
>
> ipi_nmi_setup() may be called twice for CPU0:
>
>   set_smp_ipi_range => set_smp_ipi_nmi => ipi_nmi_setup
>                     => ipi_setup => ipi_nmi_setup
>
> Actually, I got the following error message via the second ipi_nmi_setup():
>
>   GICv3: Pseudo-NMIs enabled using relaxed ICC_PMR_EL1 synchronisation
>   GICv3: Cannot set NMI property of enabled IRQ 8
>   genirq: Failed to setup NMI delivery: irq 8
>
> Why don't we have a check to prevent that? Like as:
>
>        if (cpumask_test_cpu(cpu, ipi_desc->percpu_enabled))
>                return;
>

See my reply in the other thread.

> > +
> > +     if (is_nmi) {
> > +             if (!prepare_percpu_nmi(ipi_id))
> > +                     enable_percpu_nmi(ipi_id, 0);
>
> It would be better to use IRQ_TYPE_NONE instead of 0.
>
>                         enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
>

Ack.

> > +     } else {
> > +             enable_percpu_irq(ipi_id, 0);
>
> Same as here:
>                 enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
>

Ack.

-Sumit

> Thanks,
> Masa
>
> > +     }
> > +}
> > +
> > +void ipi_nmi_teardown(int cpu)
> > +{
> > +     if (!ipi_desc)
> > +             return;
> > +
> > +     if (is_nmi) {
> > +             disable_percpu_nmi(ipi_id);
> > +             teardown_percpu_nmi(ipi_id);
> > +     } else {
> > +             disable_percpu_irq(ipi_id);
> > +     }
> > +}
> > +
> > +void __init set_smp_ipi_nmi(int ipi)
> > +{
> > +     int err;
> > +
> > +     err = request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number);
> > +     if (err) {
> > +             err = request_percpu_irq(ipi, ipi_nmi_handler, "IPI",
> > +                                      &cpu_number);
> > +             WARN_ON(err);
> > +             is_nmi = false;
> > +     } else {
> > +             is_nmi = true;
> > +     }
> > +
> > +     ipi_desc = irq_to_desc(ipi);
> > +     irq_set_status_flags(ipi, IRQ_HIDDEN);
> > +     ipi_id = ipi;
> > +
> > +     /* Setup the boot CPU immediately */
> > +     ipi_nmi_setup(smp_processor_id());
> > +}
> > --
> > 2.7.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
