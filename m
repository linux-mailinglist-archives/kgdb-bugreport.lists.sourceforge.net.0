Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B729372A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 10:52:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUnNj-0002DQ-1l
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 08:52:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUnNe-0002DB-2O
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 08:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Un3D4/T6ilGeRpZiqdkM650/Jk7htjxHR9MazqfDiC4=; b=Q9rcD+011IW0afGS/sTi9X2Dt5
 S1TVEwbOikk2bjnE4ehGahFDspZCPsaOkyZWXNjzcbkm4h8oBXtZEO1GH2FjZeHegKimrNMEsykmm
 0vye0ZecE9nv5hluGU2Nupdf7TQKLN3cQSnUa0GdG5m0Bxs8gK2+jqwa3soJ/ByLLPUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Un3D4/T6ilGeRpZiqdkM650/Jk7htjxHR9MazqfDiC4=; b=Mc+t28LTey3ZiuNWnuUxif5JXj
 AW9JtbygWh6yo1CenfURPA8EbsILf6jBml+5KyQv5PCCrpUpGhK0RfjFp6kPdpts/ynEqB0zUfTtq
 Ogshnkn3eG2QdtP4i8evnwUDapyGk8mdhUXzqJ6QiEghmxfj99nju4IHicmwH5KsDTnc=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUnNQ-00H0x7-DX
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 08:52:29 +0000
Received: by mail-lf1-f65.google.com with SMTP id j30so1148890lfp.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Un3D4/T6ilGeRpZiqdkM650/Jk7htjxHR9MazqfDiC4=;
 b=y0mgbxStx7dP1CEylEL0KfYe8ot1qWi3yw6hgBxDWSkjp3KkdzSVVcV6nEVyxLx1E5
 7y8Gy1QhY7NLvt+MPs+vK5JBPtp2rKPaaxllHob1UvkNmOrKTfE27/fwR0d1GF/tZXUq
 ZwovWj7Wr+adDV0FqCyAaYZkoj8NGPnTkQZGHbJ+GTBGHlxUm4Lgc1biVbBZT1S+ASMj
 cs+CQ8kpdQcQF++MnntcADPiAf2yTrg0wAWnaqIoLbmlc7ClsxqD46U/y1XAR8gOO+y6
 DQiyvoe37GUJSmKhYkyGz/OkdI6fWdo2pZJ50PQ8rgPKaiOcBhMyIxCT1iNcHXr+KeRb
 dApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Un3D4/T6ilGeRpZiqdkM650/Jk7htjxHR9MazqfDiC4=;
 b=m6pJowdA0dSSpHJ/LAj3fOh3d+ClxaiZYk0rQX4VjzR37sx9bozDGLnDdavjcytqyR
 OnP4uLvT+FLwpXSkIc5um0nyvlIfVZX9vn/JJsaT25n0LLcWPNaZ19kCgbGoDXJaC4c1
 Y1GVXGxSHFSorQC8Bb82q+y6T1x5/pCl4PE1BGxaZcX5/tmjrNqExpryp9F8JHyKNSBt
 Ocu7XrBi3ueYDtPbc+dq4xNodNouG5FA38Swu6bPbH80bscufYC3Rm5HikG60L9zxsVe
 pnNrNpvkTkTV9h0xkAFldjohAXqD9xfWVnsI4DJ5W7Q4bYE3sIU7UKS27RAXDn9NO51W
 k8sQ==
X-Gm-Message-State: AOAM530Qy3kytCymuuAVu3IKKeYjJWEkL2m2kRwV9rsgbEwcdkTHyDCx
 JsiCELcyB/Lva+MExuSDiaOYiWeVdEG4VIJQJDenZQ==
X-Google-Smtp-Source: ABdhPJzlkzvvJ39eQc8fUTC6Aujw1h4QwmN2302mCuEJjspiHgnRtnMviG1InjkheEfRgPlqWclNNP7HQKFVh/B07L0=
X-Received: by 2002:a05:6512:2029:: with SMTP id
 s9mr556509lfs.273.1603183922516; 
 Tue, 20 Oct 2020 01:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-5-git-send-email-sumit.garg@linaro.org>
 <0899dcad304ac8bf0ea7d5308ec2e263@kernel.org>
In-Reply-To: <0899dcad304ac8bf0ea7d5308ec2e263@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 14:21:51 +0530
Message-ID: <CAFA6WYMNKGYYvuFA1PoLz+CQS3B+7DEkbj6_k4bZ5euA37VXZA@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kUnNQ-00H0x7-DX
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

On Mon, 19 Oct 2020 at 17:45, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-14 12:12, Sumit Garg wrote:
> > arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> > leveraged to round up CPUs which are stuck in hard lockup state with
> > interrupts disabled that wouldn't be possible with a normal IPI.
> >
> > So instead switch to round up CPUs using IPI turned as NMI. And in
> > case a particular arm64 platform doesn't supports pseudo NMIs,
> > this IPI will act as a normal IPI which maintains existing kgdb
> > functionality.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/kgdb.h |  8 ++++++++
> >  arch/arm64/kernel/ipi_nmi.c   |  5 ++++-
> >  arch/arm64/kernel/kgdb.c      | 21 +++++++++++++++++++++
> >  3 files changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/kgdb.h
> > b/arch/arm64/include/asm/kgdb.h
> > index 21fc85e..6f3d3af 100644
> > --- a/arch/arm64/include/asm/kgdb.h
> > +++ b/arch/arm64/include/asm/kgdb.h
> > @@ -24,6 +24,14 @@ static inline void arch_kgdb_breakpoint(void)
> >  extern void kgdb_handle_bus_error(void);
> >  extern int kgdb_fault_expected;
> >
> > +#ifdef CONFIG_KGDB
> > +extern void ipi_kgdb_nmicallback(int cpu, void *regs);
> > +#else
> > +static inline void ipi_kgdb_nmicallback(int cpu, void *regs)
> > +{
> > +}
> > +#endif
> > +
> >  #endif /* !__ASSEMBLY__ */
> >
> >  /*
> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> > index a959256..e0a9e03 100644
> > --- a/arch/arm64/kernel/ipi_nmi.c
> > +++ b/arch/arm64/kernel/ipi_nmi.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> > +#include <linux/kgdb.h>
> >  #include <linux/smp.h>
> >
> >  #include <asm/nmi.h>
> > @@ -26,7 +27,9 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t
> > *mask)
> >
> >  static irqreturn_t ipi_nmi_handler(int irq, void *data)
> >  {
> > -     /* nop, NMI handlers for special features can be added here. */
> > +     unsigned int cpu = smp_processor_id();
> > +
> > +     ipi_kgdb_nmicallback(cpu, get_irq_regs());
>
> Please add a return value to ipi_kgdb_nmicallback(), and check it
> before returning IRQ_HANDLED.

Okay.

>
> Thinking a bit more about the whole thing, you should have a way to
> avoid requesting the NMI if there is no user for it (there is nothing
> worse than an enabled interrupt without handlers...).

I think IPIs or SGIs (for arm64) are different from normal interrupts
in this aspect as if there is no handler then we can be sure that
corresponding SGI won't be invoked as their invocation is controlled
via software.

This is the similar case with other IPIs as well whose handlers are
optionally enabled, see:
- IPI_CPU_CRASH_STOP
- IPI_TIMER
- IPI_IRQ_WORK
- IPI_WAKEUP

>
> >
> >       return IRQ_HANDLED;
> >  }
> > diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> > index 1a157ca3..0991275 100644
> > --- a/arch/arm64/kernel/kgdb.c
> > +++ b/arch/arm64/kernel/kgdb.c
> > @@ -17,6 +17,7 @@
> >
> >  #include <asm/debug-monitors.h>
> >  #include <asm/insn.h>
> > +#include <asm/nmi.h>
> >  #include <asm/traps.h>
> >
> >  struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
> > @@ -353,3 +354,23 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt
> > *bpt)
> >       return aarch64_insn_write((void *)bpt->bpt_addr,
> >                       *(u32 *)bpt->saved_instr);
> >  }
> > +
> > +void ipi_kgdb_nmicallback(int cpu, void *regs)
> > +{
> > +     if (atomic_read(&kgdb_active) != -1)
> > +             kgdb_nmicallback(cpu, regs);
> > +}
> > +
> > +#ifdef CONFIG_SMP
>
> There is no such thing as an arm64 UP kernel.
>

Okay, will remove this #ifdef.

> > +void kgdb_roundup_cpus(void)
> > +{
> > +     struct cpumask mask;
> > +
> > +     cpumask_copy(&mask, cpu_online_mask);
> > +     cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> > +     if (cpumask_empty(&mask))
> > +             return;
> > +
> > +     arch_send_call_nmi_func_ipi_mask(&mask);
>
> Surely you can come up with a less convoluted name for this function.
> arm64_send_nmi() would be plenty in my opinion.

Okay, will use it instead.

-Sumit

>
> > +}
> > +#endif
>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
