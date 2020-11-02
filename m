Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A88132A24F1
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 08:00:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZTpA-0005gc-Et
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 07:00:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZTp8-0005gI-Pg
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 07:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c+XrbFe95lhlmoO1jxJAYeqcLTSX+HLUCIq1p8ctluo=; b=bJG4BkNSrPV7HH3lX2v4TW04OT
 GMZTn/tEzVPpps35bWmAV84dAjcDSHG1bs+5C1puaw5fk1GZbTvEF9Yf7foqM9G7iyl+hBCzsb16z
 32YYn8TI6ASUQdauegrSOXYoGegciyMI4cGfteXIrjxt3meJj0IGM1DxoABd5cxoh8oo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c+XrbFe95lhlmoO1jxJAYeqcLTSX+HLUCIq1p8ctluo=; b=WO08R8srq+/3QkouqhWR1oJH1/
 lkUVlLWI8XbcTq9o+9biUCVdR6sDi4Naeaye4MaccQW5viUbZYWRZpBkaMa4A3NK/4zc2babwinM1
 otFdnO6QOFhf0m2CXHlJZPu7zuQTifcRK3aVCMtHBkgMpv7n7N/JC4P2n2fztd2S+qh0=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZTp0-0063BB-KR
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 07:00:14 +0000
Received: by mail-lf1-f68.google.com with SMTP id i6so16036652lfd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 01 Nov 2020 23:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+XrbFe95lhlmoO1jxJAYeqcLTSX+HLUCIq1p8ctluo=;
 b=LZ71Tgk9nMGd2ZWC7FJqsuBzrWWF68BI6ujrE0QLNc5AlU/uOQYLsyV3xMPMhHACtA
 gMW5w1tQR0MmzGdBljnfcV9ipagBmR/40NFY56dyjOwpp5YR5fChicwVZT9xLvZFd4oL
 uDMgHEPtBvlYN0AHy8k2FBa9pWhtTLW+bbqWvrctqAWyGdHtIBAq6bNrmZiUP0VmSgdu
 WCuNzcVlSUVHcQ9haZN7k8ffHSzCTdO/aWhYmobrso1nKPX59Nhtmr1DoxwXU5OjBk+P
 EiLupArqfmt6Q3M+OVgNbv9I1xPaBP3rjVxRJVsGNddaVD75h+YS/ZVCZZm/ORaeD6Lo
 rD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+XrbFe95lhlmoO1jxJAYeqcLTSX+HLUCIq1p8ctluo=;
 b=Pc5uaUZNfPudV568YaFYQ2fGi5jlAoJDeSe7qSc5KR28cuurmcj+xBlJ6ucIM1IU8x
 up3PbkKOwHS6J552TnYp0p8BI0pRy7I0TR9G8lWWnZeMF4WyQBkdWdBt+ki460SYSnF9
 GjrnCBaOOYaEzU2pv2Ia3nsjxd6XHEsyRbFikAF1TAQVyT9STAalipV3bzD4uaaQxfj6
 /WbqBcoVPOJgC0Oa+84FCg/4+Zp9WrCUXyojBSxk8A2ivLriKp7Gqt17++NEnaOuPmqz
 RjqzHLyaGVcmEWieh5xmunbM+Wozj2KNFiVPH358EgIUsRhyEqA3bUkVQM/nEDfu++/4
 ZmSQ==
X-Gm-Message-State: AOAM533AtUUci/wyl+oRdTiAwBw7N2pTPVm7apC1rzqnBphF1hitCV9c
 q79Y6F65T1uQWqzAHYzwVcHV7P3Idr6Pb798PUsUZA==
X-Google-Smtp-Source: ABdhPJyi9O1vrGK1LsMrHwA72XdsBK2WzU4SSnDVEBWijqQ/tCFtG5WKvsVEWkRzjPNCj3tJCwMX2YvWYeLrchESkQ0=
X-Received: by 2002:ac2:46cc:: with SMTP id p12mr4949695lfo.283.1604300399964; 
 Sun, 01 Nov 2020 22:59:59 -0800 (PST)
MIME-Version: 1.0
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
 <1603983387-8738-8-git-send-email-sumit.garg@linaro.org>
 <20201029162234.a5czyjy4eyto6aa4@holly.lan>
 <20201029163921.dibail374cwwonvo@holly.lan>
In-Reply-To: <20201029163921.dibail374cwwonvo@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 2 Nov 2020 12:29:48 +0530
Message-ID: <CAFA6WYP1VOgNFuh+E0BOB3T5v+Brf3jCQsKf8iVTTMje6Mte9g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
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
X-Headers-End: 1kZTp0-0063BB-KR
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
Cc: Mark Rutland <mark.rutland@arm.com>, tsbogend@alpha.franken.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, ito-yuichi@fujitsu.com,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jason Wessel <jason.wessel@windriver.com>, mingo@redhat.com, bp@alien8.de,
 mpe@ellerman.id.au, Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, julien.thierry.kdev@gmail.com,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 29 Oct 2020 at 22:09, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Oct 29, 2020 at 04:22:34PM +0000, Daniel Thompson wrote:
> > On Thu, Oct 29, 2020 at 08:26:27PM +0530, Sumit Garg wrote:
> > > arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> > > leveraged to roundup CPUs which are stuck in hard lockup state with
> > > interrupts disabled that wouldn't be possible with a normal IPI.
> > >
> > > So instead switch to roundup CPUs using IPI turned as NMI. And in
> > > case a particular arm64 platform doesn't supports pseudo NMIs,
> > > it will switch back to default kgdb CPUs roundup mechanism.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  arch/arm64/include/asm/kgdb.h |  9 +++++++++
> > >  arch/arm64/kernel/ipi_nmi.c   |  5 +++++
> > >  arch/arm64/kernel/kgdb.c      | 35 +++++++++++++++++++++++++++++++++++
> > >  3 files changed, 49 insertions(+)
> > >
> > > diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
> > > index 21fc85e..c3d2425 100644
> > > --- a/arch/arm64/include/asm/kgdb.h
> > > +++ b/arch/arm64/include/asm/kgdb.h
> > > @@ -24,6 +24,15 @@ static inline void arch_kgdb_breakpoint(void)
> > >  extern void kgdb_handle_bus_error(void);
> > >  extern int kgdb_fault_expected;
> > >
> > > +#ifdef CONFIG_KGDB
> > > +extern bool kgdb_ipi_nmicallback(int cpu, void *regs);
> > > +#else
> > > +static inline bool kgdb_ipi_nmicallback(int cpu, void *regs)
> > > +{
> > > +   return false;
> > > +}
> > > +#endif
> > > +
> > >  #endif /* !__ASSEMBLY__ */
> > >
> > >  /*
> > > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> > > index 597dcf7..6ace182 100644
> > > --- a/arch/arm64/kernel/ipi_nmi.c
> > > +++ b/arch/arm64/kernel/ipi_nmi.c
> > > @@ -8,6 +8,7 @@
> > >
> > >  #include <linux/interrupt.h>
> > >  #include <linux/irq.h>
> > > +#include <linux/kgdb.h>
> > >  #include <linux/nmi.h>
> > >  #include <linux/smp.h>
> > >
> > > @@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> > >  static irqreturn_t ipi_nmi_handler(int irq, void *data)
> > >  {
> > >     irqreturn_t ret = IRQ_NONE;
> > > +   unsigned int cpu = smp_processor_id();
> > >
> > >     if (nmi_cpu_backtrace(get_irq_regs()))
> > >             ret = IRQ_HANDLED;
> > >
> > > +   if (kgdb_ipi_nmicallback(cpu, get_irq_regs()))
> > > +           ret = IRQ_HANDLED;
> > > +
> > >     return ret;
> >
> > It would be better to declare existing return value for
> > kgdb_nmicallback() to be dangerously stupid and fix it so it returns an
> > irqreturn_t (that's easy since most callers do not need to check the
> > return value).
> >
> > Then this code simply becomes:
> >
> >       return kgdb_nmicallback(cpu, get_irq_regs());
>
> Actually, reflecting on this maybe it is better to keep kgdb_nmicallin()
> and kgdb_nmicallback() aligned w.r.t. return codes (even if they are a
> little unusual).
>
> I'm still not sure why we'd keep kgdb_ipi_nmicallback() though.
> kgdb_nmicallback() is intended to be called from arch code...
>

I added kgdb_ipi_nmicallback() just to add a check for "kgdb_active"
prior to entry into kgdb as here we are sharing NMI among backtrace
and kgdb.

But after your comments, I looked carefully into kgdb_nmicallback()
and I see the "raw_spin_is_locked(&dbg_master_lock)" check as well. So
it looked sufficient to me for calling kgdb_nmicallback() directly
from the arch code and hence I will remove kgdb_ipi_nmicallback() in
the next version.

>
> Daniel.
>
>
> >
> >
> > >  }
> > >
> > > diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> > > index 1a157ca3..c26e710 100644
> > > --- a/arch/arm64/kernel/kgdb.c
> > > +++ b/arch/arm64/kernel/kgdb.c
> > > @@ -17,6 +17,7 @@
> > >
> > >  #include <asm/debug-monitors.h>
> > >  #include <asm/insn.h>
> > > +#include <asm/nmi.h>
> > >  #include <asm/traps.h>
> > >
> > >  struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
> > > @@ -353,3 +354,37 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
> > >     return aarch64_insn_write((void *)bpt->bpt_addr,
> > >                     *(u32 *)bpt->saved_instr);
> > >  }
> > > +
> > > +bool kgdb_ipi_nmicallback(int cpu, void *regs)
> > > +{
> > > +   if (atomic_read(&kgdb_active) != -1) {
> > > +           kgdb_nmicallback(cpu, regs);
> > > +           return true;
> > > +   }
> > > +
> > > +   return false;
> > > +}
> >
> > I *really* don't like this function.
> >
> > If the return code of kgdb_nmicallback() is broken then fix it, don't
> > just wrap it and invent a new criteria for the return code.
> >
> > To be honest I don't actually think the logic in kgdb_nmicallback() is
> > broken. As mentioned above the return value has a weird definition (0
> > for "handled it OK" and 1 for "nothing for me to do") but the logic to
> > calculate the return code looks OK.
> >

Makes sense, will remove it instead.

> >
> > > +
> > > +static void kgdb_smp_callback(void *data)
> > > +{
> > > +   unsigned int cpu = smp_processor_id();
> > > +
> > > +   if (atomic_read(&kgdb_active) != -1)
> > > +           kgdb_nmicallback(cpu, get_irq_regs());
> > > +}
> >
> > This is Unused. I presume it is litter from a previous revision of the
> > code and can be deleted?
> >

Yeah.

> >
> > > +
> > > +bool kgdb_arch_roundup_cpus(void)
> > > +{
> > > +   struct cpumask mask;
> > > +
> > > +   if (!arm64_supports_nmi())
> > > +           return false;
> > > +
> > > +   cpumask_copy(&mask, cpu_online_mask);
> > > +   cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> > > +   if (cpumask_empty(&mask))
> > > +           return false;
> >
> > Why do we need to fallback if there is no work to do? There will still
> > be no work to do when we call the fallback.

Okay, won't switch back to fallback mode here.

-Sumit

> >
> >
> > Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
