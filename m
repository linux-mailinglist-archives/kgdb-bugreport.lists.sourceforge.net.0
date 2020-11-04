Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AC12A64A5
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  4 Nov 2020 13:49:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kaIEE-0004rp-93
	for lists+kgdb-bugreport@lfdr.de; Wed, 04 Nov 2020 12:49:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kaIEC-0004rf-No
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Nov 2020 12:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2Q9j4dO1fhVv8kSZbKiWc5aiYlzjfa6KTzUODZGeUM=; b=WsWCbF4BY8+QRDq+1729WyaS1i
 FHQeCuXAxLBmV4T2lN/TN3XrG7//btfTACC8ZU9B9rMPaqZ3ajLJC0SBmrQxbxWuLJRO7QbEEnaQg
 PIY4W5Vvf/UMtb+d261rqwDop0TKGNhyd49IIrNAuYKzX7s+lsYgAbtrPFPNWq2cznMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w2Q9j4dO1fhVv8kSZbKiWc5aiYlzjfa6KTzUODZGeUM=; b=ePiab9WtMDngpXctmCZ4k/gMRl
 xAEGo5m3FnN8QCX/aVnHgnsK3ENUzFDnaqESN6/ll2pdaVvenaOtUkFR3t/Q+9zH/VnuNX5kWf8Ze
 fcc2HoTkW0H4i/Rg4f1fyLbtRQfO/1hXY8NIihtPsy9YSSdKkCnYDjnPeNJamQJWssOA=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kaIDw-009BM4-Lg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 04 Nov 2020 12:49:25 +0000
Received: by mail-lj1-f194.google.com with SMTP id l10so1829197lji.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 04 Nov 2020 04:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2Q9j4dO1fhVv8kSZbKiWc5aiYlzjfa6KTzUODZGeUM=;
 b=s3dk2/f6Bn+Y56+Xrxfn5AmVpHd6Yke08lmPTwmsmgBcuN6Y0jOH+eeJF/ZJmOsZFo
 32+BUhb1ppR3qMDpuGd7tmN3I1wXP5+p2K1Fc2wLb1YblwYrGltpjUG8C8UAYlxVAmnB
 +1JvSYdP1EUHcnPPzE/rNTKEKUBTAsnJ4LVK4hFLlDnKcuI2MU0JD95MVV28xxfUy6+j
 1+3JoK3T7Wo7to0G+uVdOMJpH28CpgSpk34zZEP44Ngq/UZgLUzHKm5qDX+Zt1XhX3Pe
 wO9O2Vsv47Q0x2GJP8btfmOTBofuns2eZaBPlhzHQGPRCXTLccddb1iAi4T2qvgegOSg
 wRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2Q9j4dO1fhVv8kSZbKiWc5aiYlzjfa6KTzUODZGeUM=;
 b=if4DhAW4gD0qFlJ9tr2KUIshtaxnX7Rnd69m5Dl85tYR4Naqq/53jizgpjz24nIjZV
 ELO+ib49m5FLko+NlUmX8jvP+bq6P+36RcBOc/EcLAKBtNZitM+ly98U2veoxR7FmbM7
 OBYKtR3Dp88zK5jFPE5YwzXAR2ZBx9grbIU6nmFjZAneFf1yvPiMoQZHQoJlZnA3LV+K
 EQQB7lPmyg9mttA6AGCuHIw6NpK1VRtdkHtZunHGOIZDrP68U2X/l2znwkCa2qiYuErD
 QLLpQ3Fko0aVepIM5pNwQmG+V4hqfwGvcqAfA2y30Bh1A21Uzi4RXbd2pzTC8XJRY44S
 DPPA==
X-Gm-Message-State: AOAM532phxh2EOiw4r5jQTV8eo4U3smRYUi46inUaDct+u49oMTGslX5
 qGVFuJgLBra4kDEXI6cHhI47MWu5jg0b5I9SiIHHfA==
X-Google-Smtp-Source: ABdhPJzUr3mwkNbQhVPC+KAtjkwrgUU1V/MZfbwQJg1Fc5DcLVFajd2Q3ARFw7xL8WkF2FN1nerMr9yRteWYA7Fuv64=
X-Received: by 2002:a05:651c:32a:: with SMTP id
 b10mr9600926ljp.256.1604494142894; 
 Wed, 04 Nov 2020 04:49:02 -0800 (PST)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-2-git-send-email-sumit.garg@linaro.org>
 <20201102153349.fay4f5iam76gfapu@gabell>
In-Reply-To: <20201102153349.fay4f5iam76gfapu@gabell>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 4 Nov 2020 18:18:51 +0530
Message-ID: <CAFA6WYNP+dSMVcsXw+aTiyzOOT7QY+ksckW4=L9u1rOej2MNNw@mail.gmail.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fujitsu.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kaIDw-009BM4-Lg
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, tsbogend@alpha.franken.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, ito-yuichi@fujitsu.com,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jason Wessel <jason.wessel@windriver.com>, mingo@redhat.com, bp@alien8.de,
 mpe@ellerman.id.au, Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 julien.thierry.kdev@gmail.com, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 2 Nov 2020 at 21:03, Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> On Mon, Nov 02, 2020 at 05:14:41PM +0530, Sumit Garg wrote:
> > Introduce framework to turn an IPI as NMI using pseudo NMIs. The main
> > motivation for this feature is to have an IPI that can be leveraged to
> > invoke NMI functions on other CPUs.
> >
> > And current prospective users are NMI backtrace and KGDB CPUs round-up
> > whose support is added via future patches.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/nmi.h | 17 ++++++++++++
> >  arch/arm64/kernel/Makefile   |  2 +-
> >  arch/arm64/kernel/ipi_nmi.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 83 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/include/asm/nmi.h
> >  create mode 100644 arch/arm64/kernel/ipi_nmi.c
> >
> > diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
> > new file mode 100644
> > index 0000000..4cd14b6
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/nmi.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_NMI_H
> > +#define __ASM_NMI_H
> > +
> > +#ifndef __ASSEMBLER__
> > +
> > +#include <linux/cpumask.h>
> > +
> > +extern bool arm64_supports_nmi(void);
> > +extern void arm64_send_nmi(cpumask_t *mask);
> > +
> > +void set_smp_dynamic_ipi(int ipi);
> > +void dynamic_ipi_setup(int cpu);
> > +void dynamic_ipi_teardown(int cpu);
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
> > index 0000000..a945dcf
> > --- /dev/null
> > +++ b/arch/arm64/kernel/ipi_nmi.c
> > @@ -0,0 +1,65 @@
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
> > +static struct irq_desc *ipi_nmi_desc __read_mostly;
> > +static int ipi_nmi_id __read_mostly;
> > +
> > +bool arm64_supports_nmi(void)
> > +{
> > +     if (ipi_nmi_desc)
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
> > +void arm64_send_nmi(cpumask_t *mask)
> > +{
> > +     if (WARN_ON_ONCE(!ipi_nmi_desc))
> > +             return;
> > +
> > +     __ipi_send_mask(ipi_nmi_desc, mask);
> > +}
> > +
> > +static irqreturn_t ipi_nmi_handler(int irq, void *data)
> > +{
> > +     /* nop, NMI handlers for special features can be added here. */
> > +
> > +     return IRQ_NONE;
> > +}
> > +
>
> > +void dynamic_ipi_setup(int cpu)
>
> cpu isn't used here, so void is better?
>
> void dynamic_ipi_setup(void)
>

Ack.

> > +{
> > +     if (!ipi_nmi_desc)
> > +             return;
> > +
> > +     if (!prepare_percpu_nmi(ipi_nmi_id))
> > +             enable_percpu_nmi(ipi_nmi_id, IRQ_TYPE_NONE);
> > +}
> > +
>
> > +void dynamic_ipi_teardown(int cpu)
>
> Same as here:
> void dynamic_ipi_teardown(void)
>

Ack.

> > +{
> > +     if (!ipi_nmi_desc)
> > +             return;
> > +
> > +     disable_percpu_nmi(ipi_nmi_id);
> > +     teardown_percpu_nmi(ipi_nmi_id);
> > +}
> > +
> > +void __init set_smp_dynamic_ipi(int ipi)
> > +{
> > +     if (!request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number)) {
> > +             ipi_nmi_desc = irq_to_desc(ipi);
> > +             ipi_nmi_id = ipi;
> > +     }
> > +}
> > --
>
> Otherwise, looks good to me. Please feel free to add:
>
>         Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
>

Thanks.

-Sumit

> Thanks,
> Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
