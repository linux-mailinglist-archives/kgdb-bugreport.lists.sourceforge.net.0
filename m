Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C21293598
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 09:17:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUltK-0007sk-EB
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 07:17:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUltJ-0007sb-2s
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fKisSdPFhHMNCtICMhbcUEw2QFiANpq0wtVTr5Ou8mA=; b=cOMxfag/YzUh2jb15eZM2jlQW5
 i/kZ3pNBcy6rOkMXsA4mSQwPZC2AaJGgRkBGAOgPr91oIWFoyQVIPOXhR4zBAsxaPjPuTdIUS/jN4
 ku3o/3Dc2soEeXgd3b13WjW9SKrDYIYh5yrGilkbnFy+d8Jn3BayUcycv9OpTs+I7jOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fKisSdPFhHMNCtICMhbcUEw2QFiANpq0wtVTr5Ou8mA=; b=cLh4P3moHtUUQ6Cc63JvJRmTUa
 ps3dV8y9mrj9eniLJPQERCqnAIUPDWv9EDS0XEv6KoH8k1Z1+HSHnqsG+vUA0/mXIgHmy5VcG2mH4
 FDbRwR+7/vuIPN/JJDSxQwx75VKHP8dazQZzv+9XifPpd1l1yBetabf1g3nCJUQzSCpc=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUlt9-0054Vp-SD
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:17:05 +0000
Received: by mail-lf1-f65.google.com with SMTP id l28so818242lfp.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 00:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKisSdPFhHMNCtICMhbcUEw2QFiANpq0wtVTr5Ou8mA=;
 b=pczU+Uf/yI647JWhv0sya2r4YrL9tI4JWCh6LvA9chOvYy2GPBsRbEcTC20uK+3d6E
 rFY5Ijutq6Aqt+btCji2ciQ/aMCrRRuCVyN+bB1C1tcjLN2RIReFjomdZiLY3Oohp2iQ
 BxsAJXNfO1swTyvUzivQOWeLDKMvhwkQplSJzMdJcBLE+savmOmxCZ73APJpj+grPYpf
 XHtE2s326Yq/nWId6foQABkSQosJ7jRCMezMiLuI01YXOmKjtCkI/EV9g7REp2aNOGxa
 d1heWwjBQ0zzxTSYWoumVf/sNlmsF9n+ZTsApPCHtloEtp4oAigfLkoNNFzE0sQ/9sB8
 VTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKisSdPFhHMNCtICMhbcUEw2QFiANpq0wtVTr5Ou8mA=;
 b=lug4rntqLraMg3rXjdTcv1RJxAfsXYC6tVj0UVwBS9d1jlneOWHgN7jBgnnLQWo/ox
 OwjqFUXgFC8oTm+TSCFGBMszxIK/hM1GgGFlRamFBrEO3unj1ppQyKvuUDNU/Q+HZsab
 XZPRen0oLdEMSrOQrZeakjJ9Cv0V1dlhNmhFWR7rTK3RH/BIiGm4+CCfdAL58VyrOdAb
 wfUsL9JgoMH+zUQJVcJfIOmXrR0XoVGNnDa4mr1XyrXlcnhNlJniwZhPHHSHFhXhofM6
 NbKFh/P3E6XXqcmg1VOf+fLgCLWIDec+txGuwmuB0GwriE9WOdC4tYa05tTrdV399z86
 ne6w==
X-Gm-Message-State: AOAM532zWfN8G6N1Ji4ZVmXIiPVC1LEYBhf3gtwJ/aBbhEbWiR4S8bne
 FyiZkYnIPlYq1LJA/fcWdByYBsmiyZXOJvPaiEKiOcM5KFPawQ==
X-Google-Smtp-Source: ABdhPJxCfdB+h+Yd0esHC1CUz+lgNJ2ChJECAocPjHWHYswWINkY1Vts8K7Hv2oG2TJTut9zB+s4+DYfxlB6AcqL55g=
X-Received: by 2002:a05:6512:2029:: with SMTP id
 s9mr405613lfs.273.1603176249396; 
 Mon, 19 Oct 2020 23:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
In-Reply-To: <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 12:13:57 +0530
Message-ID: <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kUlt9-0054Vp-SD
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 ito-yuichi@fujitsu.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 19 Oct 2020 at 17:07, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-14 12:12, Sumit Garg wrote:
> > Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
> > particular platform doesn't support pseudo NMIs, then request IPI as a
> > regular IRQ.
> >
> > The main motivation for this feature is to have an IPI that can be
> > leveraged to invoke NMI functions on other CPUs. And current
> > prospective
> > users are NMI backtrace and KGDB CPUs round-up whose support is added
> > via future patches.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/nmi.h | 16 +++++++++
> >  arch/arm64/kernel/Makefile   |  2 +-
> >  arch/arm64/kernel/ipi_nmi.c  | 77
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 94 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/include/asm/nmi.h
> >  create mode 100644 arch/arm64/kernel/ipi_nmi.c
> >
> > diff --git a/arch/arm64/include/asm/nmi.h
> > b/arch/arm64/include/asm/nmi.h
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
> > index bbaf0bc..525a1e0 100644
> > --- a/arch/arm64/kernel/Makefile
> > +++ b/arch/arm64/kernel/Makefile
> > @@ -17,7 +17,7 @@ obj-y                       := debug-monitors.o entry.o irq.o fpsimd.o              \
> >                          return_address.o cpuinfo.o cpu_errata.o              \
> >                          cpufeature.o alternative.o cacheinfo.o               \
> >                          smp.o smp_spin_table.o topology.o smccc-call.o       \
> > -                        syscall.o proton-pack.o
> > +                        syscall.o proton-pack.o ipi_nmi.o
> >
> >  targets                      += efi-entry.o
> >
> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> > new file mode 100644
> > index 0000000..a959256
> > --- /dev/null
> > +++ b/arch/arm64/kernel/ipi_nmi.c
> > @@ -0,0 +1,77 @@
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
>
> This definitely is the *wrong* default. If nothing is explicitly
> handling the interrupt, it should be reported as such to the core
> code to be disabled if this happens too often.

Okay will fix default as "IRQ_NONE".

>
> > +}
> > +
> > +void ipi_nmi_setup(int cpu)
>
> The naming is awful. "ipi" is nowhere specific enough (we already have
> another 7 of them), and this doesn't necessarily uses pseudo-NMIs, since
> you are requesting IRQs.

How about following naming conventions?

- dynamic_ipi_setup()
- dynamic_ipi_teardown()
- set_smp_dynamic_ipi()

>
> > +{
> > +     if (!ipi_desc)
> > +             return;
> > +
> > +     if (is_nmi) {
> > +             if (!prepare_percpu_nmi(ipi_id))
> > +                     enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
> > +     } else {
> > +             enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
>
> I'm not keen on this. Normal IRQs can't reliably work, so why do you
> even bother with this?

Yeah I agree but we need to support existing functionality for kgdb
roundup and sysrq backtrace using normal IRQs as well.

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
>
> Updating global state without checking for errors doesn't seem
> like a great move.

Are you worried about failure from request_percpu_irq()? If yes, there
is an explicit warning for that and if you like I can add an
additional check while updating the global state.

BTW, this is written on an existing pattern as for other 7 IPIs requests [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/smp.c#n988

-Sumit

>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
