Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FA294BCB
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 21 Oct 2020 13:29:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kVCIs-0006RY-Tt
	for lists+kgdb-bugreport@lfdr.de; Wed, 21 Oct 2020 11:29:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kVCIr-0006RM-VD
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 11:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=knV9gjJnChMkbAAiapGos/nisqISwxGUwQ5ICUY9SUg=; b=LXmeF2jLlMgyl/wtgc3AhAm3Iw
 6f/A9FlxHw5M2Fiqms8s7VYhoQBntJ5WeJIf3SZ8gt/fxBxZT8REAJkH/FSvUjJTGUPwagsZ8lbq8
 mLKdajBHzqaWdfTNqMt2kQv3aaLZV45Y9CXFG7pi7UA/jB+c6xjrzibPkvHybfXtrZrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=knV9gjJnChMkbAAiapGos/nisqISwxGUwQ5ICUY9SUg=; b=MC+OwhzbEDPNLnBVfziot5Nl/x
 QFOWae777e1F+a+3OJ7EZsqXSTsZTjPYkI0ZmPv8K+VQMKTIHU3Dmhb6m9Go/W2ekNFu23bFLun7e
 4H0bxcONyyVAMqwqMReZum8AYSNDNRL+7lu71r8MMqNAsYiJGCLYKCPhNWFig7twyOb8=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVCIg-001FId-M9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 11:29:13 +0000
Received: by mail-lf1-f68.google.com with SMTP id d24so2625846lfa.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 21 Oct 2020 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knV9gjJnChMkbAAiapGos/nisqISwxGUwQ5ICUY9SUg=;
 b=oMwjGu5d2QaBow29jk3uxXPBSRt8XIJ8K6FbgrAPZwob9UZo3Mpw0ulnFdejS93Gg8
 cCd4dH3Mc6Z6EN+d8nXFPrQEptH2oGjL5KkqoMJRpsxsg6ljjPb8xFzLkGEGGbxFO+LY
 dNXHTbYRQbZ8MndYi/CHz9l080sCjAf2OUsdXlXSbAH346wOhwGVGpEsd+OnHjw4fApn
 jB5XYQKrxC31hBKBxiwTv4qMUOYTbOnPJm98bSiZP5nzXOaMLYjencOygWm/CKAB0pya
 HF1jS/vqyWpbykdrfebjbUDh+4A9a337H237d8KTggS55sQgYhv6vC07RYS4WSZWBXg2
 8YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knV9gjJnChMkbAAiapGos/nisqISwxGUwQ5ICUY9SUg=;
 b=IFWHFxiAwMhMHeFGePXF44QcCSLm8aA+LI4wF/KaZmAGAdQ7fyxHVicBKKXQz8g6bz
 +m6TQk0T4vdYBMIgiUmiBqAnKpY7RF1zKaVVI6PKXlYzViRpAt9V5FhcEoXHWkreozKL
 dRwNgw2NcZRAC4cC7HnvrAAzH0R3Fh2Ka/jGQUEFNHxR04fIfCLageIt3MgZFyrZRUVt
 WrGWTslDzwfbImWYw00/sQqway8mbrq91/Uz1QnkIHbbw5yPn87u0PObczBJEfK3HELb
 c4f0FT/e622utwWkPnJtmgZL17tyfJEJNrRZcCjj9IJt13rFlASQWeDuR1GfwVs6woVq
 AT3g==
X-Gm-Message-State: AOAM5300Hk+O5yS9gp8bLqv1/QS2CQj8u/2EzEao2dABAqhbe8GD7nkH
 +XYB96D2L3l+xqpkdkln6ASeYY6bJYEZ8j86paQYxw==
X-Google-Smtp-Source: ABdhPJyuJ7hRS8+AqAbMw+ZkSx/THvGKLhyC9h+4LUxQMRvKxEKbRpYz9J3KZlQPEqYZpRLlvhNRtoVRvH+ZUeLc0CU=
X-Received: by 2002:a19:5cb:: with SMTP id 194mr977000lff.205.1603279735968;
 Wed, 21 Oct 2020 04:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
 <d4a4a37b93f34da79b87519181bffb97@kernel.org>
 <CAFA6WYMe02J6Laa0PWDW4849KGnw8Hu2H5d6UfppeaaE4-Z0vw@mail.gmail.com>
 <ebf30013b05e8d038a63fe189f250b4b@kernel.org>
In-Reply-To: <ebf30013b05e8d038a63fe189f250b4b@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 21 Oct 2020 16:58:44 +0530
Message-ID: <CAFA6WYN1LgKt8vjh=y1SVrHbK795GyuEKeW8j63YDWDC5AZt6Q@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kVCIg-001FId-M9
Subject: Re: [Kgdb-bugreport] [PATCH v5 5/5] arm64: ipi_nmi: Add support for
 NMI backtrace
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

On Wed, 21 Oct 2020 at 16:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-20 10:13, Sumit Garg wrote:
> > On Mon, 19 Oct 2020 at 17:50, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-10-14 12:12, Sumit Garg wrote:
> >> > Enable NMI backtrace support on arm64 using IPI turned as an NMI
> >> > leveraging pseudo NMIs support. It is now possible for users to get a
> >> > backtrace of a CPU stuck in hard-lockup using magic SYSRQ.
> >> >
> >> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >> > ---
> >> >  arch/arm64/include/asm/irq.h |  6 ++++++
> >> >  arch/arm64/kernel/ipi_nmi.c  | 12 +++++++++++-
> >> >  2 files changed, 17 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/arch/arm64/include/asm/irq.h
> >> > b/arch/arm64/include/asm/irq.h
> >> > index b2b0c64..e840bf1 100644
> >> > --- a/arch/arm64/include/asm/irq.h
> >> > +++ b/arch/arm64/include/asm/irq.h
> >> > @@ -6,6 +6,12 @@
> >> >
> >> >  #include <asm-generic/irq.h>
> >> >
> >> > +#ifdef CONFIG_SMP
> >> > +extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> >> > +                                        bool exclude_self);
> >> > +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> >> > +#endif
> >> > +
> >> >  struct pt_regs;
> >> >
> >> >  static inline int nr_legacy_irqs(void)
> >> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> >> > index e0a9e03..e1dc19d 100644
> >> > --- a/arch/arm64/kernel/ipi_nmi.c
> >> > +++ b/arch/arm64/kernel/ipi_nmi.c
> >> > @@ -9,6 +9,7 @@
> >> >  #include <linux/interrupt.h>
> >> >  #include <linux/irq.h>
> >> >  #include <linux/kgdb.h>
> >> > +#include <linux/nmi.h>
> >> >  #include <linux/smp.h>
> >> >
> >> >  #include <asm/nmi.h>
> >> > @@ -25,12 +26,21 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t
> >> > *mask)
> >> >       __ipi_send_mask(ipi_desc, mask);
> >> >  }
> >> >
> >> > +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool
> >> > exclude_self)
> >> > +{
> >> > +     nmi_trigger_cpumask_backtrace(mask, exclude_self,
> >> > +                                   arch_send_call_nmi_func_ipi_mask);
> >> > +}
> >> > +
> >> >  static irqreturn_t ipi_nmi_handler(int irq, void *data)
> >> >  {
> >> >       unsigned int cpu = smp_processor_id();
> >> >
> >> > -     ipi_kgdb_nmicallback(cpu, get_irq_regs());
> >> > +     if (nmi_cpu_backtrace(get_irq_regs()))
> >> > +             goto out;
> >> >
> >> > +     ipi_kgdb_nmicallback(cpu, get_irq_regs());
> >> > +out:
> >> >       return IRQ_HANDLED;
> >> >  }
> >>
> >> Can't you have *both* a request for a backtrace and a KGDB call?
> >> It really shouldn't be either/or. It also outlines how well shared
> >> interrupts work with edge triggered signalling...
> >
> > Unfortunately, NMIs doesn't seem to support shared mode [1].
>
> You are totally missing the point: shared interrupts *cannot* work
> reliably with edge signalling. What I am saying here is that you need
> implement the sharing yourself in this function.

Ah, I see your point now. Will instead share this IPI among both handlers.

-Sumit

>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
