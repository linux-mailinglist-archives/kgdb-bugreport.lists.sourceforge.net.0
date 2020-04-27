Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88E1B965B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 07:00:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jSvsu-0003Ep-FU
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 05:00:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jSvst-0003Eh-8e
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 05:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NGlQ3C/ta2HjZVUKvLN7ukTHTpTh1FEmhkChtwgd5SI=; b=f0oO1dpM7IAQ8WVSCPdqO5WA6+
 dVZSBw82XDKYxKqwxCA/AC0cPOQBKPw+ffYxj+/+9gTnGu6PcewlGuoxV2ol+MP7uCGlKdgw67d6h
 D6tWoP7hr48LM0V51xhgrX8RV6jl219O4oOQp1ipo99Q98FG5+7uobwup5Il7y35+EWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NGlQ3C/ta2HjZVUKvLN7ukTHTpTh1FEmhkChtwgd5SI=; b=HxAV7c7hfVX7X0KVudfEsafAcT
 FHd/DcihkaFUXQGpBgYa654oyY2KIU93zzIUyuTGvpqvrdMjsF4yEbo0/XKUoePNUKvfPvx/Da/gr
 FcYAZdXPPINhFmUD3Sq0yEH3ScOUETRH/kgNMMY5Jh4pk2H/hDMEQP8uOqnOEJY2LEtc=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jSvso-00CO97-LS
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 05:00:47 +0000
Received: by mail-lj1-f194.google.com with SMTP id u6so16105841ljl.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 26 Apr 2020 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGlQ3C/ta2HjZVUKvLN7ukTHTpTh1FEmhkChtwgd5SI=;
 b=LKgiTjLngAySEuoE9XHfXTgHz6iHW3ahOb8J8NmYd/0AqtJfXne0KE+T1ULRGm0T6A
 7wXzsx5KnkLnsEuU/t/jjfcyBG5qBC14vfdpjlDLl7AXiM8p6O4rMzB5igE8EG7WOK60
 Z9tEvH7eFp5fIIc/l/UAQioBOvDEBkkK4TGGEPHxgr0ky3A+DYWplKGvzSI+kk8sfFJO
 Mfw0V18m6WHtzi2ZMbeZdoJ0minU2g7qgqCEeoNR0zTqnqCWYv6mmQyRjJK1VC4GX94I
 hV6VuXpMIqzyYLbN+ZHtHHMr4riWxXJRfHdCeUn92hAbPIMiOSXtHXqyWLDZl2FVl1Er
 Oujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGlQ3C/ta2HjZVUKvLN7ukTHTpTh1FEmhkChtwgd5SI=;
 b=TICmYLmI6wMi5992ufUtH3AnDnyR//WPwosYMhoh6Dp/ohUvpq5cBTRqXld1drn1jf
 LBr1m7VCfcliGsHgf82KyiyvhiQl9luK9CONFGTcjQNMja4yEFkhO45bCOd6gI0UefIW
 bI8rpvvKBx71dqiGmePIiGDZHglge3GY5v+WZpIXd+0S4Rg0Y5F4kxh12Hzhf0/zDaBs
 xhsjaz1vRpI36YIB8S34UwxhTmtKyszY1g3OsAG3tAzb4zzj7ZihnP41tbEF6eeHptpN
 uPQrLBHXSXEDfohhlTNWo4G6QKXcWeGUDLVdDLvbbQFdT6WFpZ/Do4VVPcFpxWWRa4Uc
 aaLA==
X-Gm-Message-State: AGi0PubcM/C0leetLXsiWw7tGwrcn+qogSoV/pkAvexFALUIY2ifKmXL
 sFxM6iG+PZpX6l6Zaa+YCUnDZ/sCcLHu5VwFzMfs0pIfVSI=
X-Google-Smtp-Source: APiQypIuLFyeIjy0XquNOeWfBKjhZKT0//ZD6fmYmQYd5pRUYS8wyZTeZbOZ9uQgZYeIJPlGUFwKXFxMwDLfBmwsCx0=
X-Received: by 2002:ac2:5544:: with SMTP id l4mr13589303lfk.122.1587963164995; 
 Sun, 26 Apr 2020 21:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-5-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=VSrVnx_R=Y38tQ=bw_o22zxWmm=+M+AaqmEMAtK66b-Q@mail.gmail.com>
In-Reply-To: <CAD=FV=VSrVnx_R=Y38tQ=bw_o22zxWmm=+M+AaqmEMAtK66b-Q@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 27 Apr 2020 10:22:33 +0530
Message-ID: <CAFA6WYOorX8iRHhpOq26QCE8T1dKmXFUXVTxoWOP0OZErqJqBQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jSvso-00CO97-LS
Subject: Re: [Kgdb-bugreport] [RFC Patch v1 4/4] arm64: kgdb: Round up cpus
 using IPI_CALL_NMI_FUNC
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

Thanks for your comments.

On Sat, 25 Apr 2020 at 02:17, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Apr 24, 2020 at 4:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > arm64 platforms with GICv3 or later supports pseudo NMIs which can be
> > leveraged to round up CPUs which are stuck in hard lockup state with
> > interrupts disabled that wouldn't be possible with a normal IPI.
> >
> > So instead switch to round up CPUs using IPI_CALL_NMI_FUNC. And in
> > case a particular arm64 platform doesn't supports pseudo NMIs,
> > IPI_CALL_NMI_FUNC will act as a normal IPI which maintains existing
> > kgdb functionality.
> >
> > Also, one thing to note here is that with CPUs running in NMI context,
> > kernel has special handling for printk() which involves CPU specific
> > buffers and defering printk() until exit from NMI context. But with kgdb
> > we don't want to defer printk() especially backtrace on corresponding
> > CPUs. So switch to normal printk() context instead prior to entering
> > kgdb context.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/kernel/kgdb.c | 15 +++++++++++++++
> >  arch/arm64/kernel/smp.c  | 17 ++++++++++++++---
> >  2 files changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> > index 4311992..0851ead 100644
> > --- a/arch/arm64/kernel/kgdb.c
> > +++ b/arch/arm64/kernel/kgdb.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/kgdb.h>
> >  #include <linux/kprobes.h>
> >  #include <linux/sched/task_stack.h>
> > +#include <linux/smp.h>
> >
> >  #include <asm/debug-monitors.h>
> >  #include <asm/insn.h>
> > @@ -353,3 +354,17 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
> >         return aarch64_insn_write((void *)bpt->bpt_addr,
> >                         *(u32 *)bpt->saved_instr);
> >  }
> > +
> > +#ifdef CONFIG_SMP
> > +void kgdb_roundup_cpus(void)
> > +{
> > +       struct cpumask mask;
> > +
> > +       cpumask_copy(&mask, cpu_online_mask);
> > +       cpumask_clear_cpu(raw_smp_processor_id(), &mask);
> > +       if (cpumask_empty(&mask))
> > +               return;
> > +
> > +       arch_send_call_nmi_func_ipi_mask(&mask);
> > +}
> > +#endif
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 27c8ee1..c7158f6e8 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/of.h>
> >  #include <linux/irq_work.h>
> >  #include <linux/kexec.h>
> > +#include <linux/kgdb.h>
> >  #include <linux/kvm_host.h>
> >
> >  #include <asm/alternative.h>
> > @@ -976,9 +977,19 @@ void handle_IPI(int ipinr, struct pt_regs *regs)
> >                 /* Handle it as a normal interrupt if not in NMI context */
> >                 if (!in_nmi())
> >                         irq_enter();
> > -
> > -               /* nop, IPI handlers for special features can be added here. */
> > -
> > +#ifdef CONFIG_KGDB
>
> My vote would be to keep "ifdef"s out of the middle of functions.  Can
> you put your code in "arch/arm64/kernel/kgdb.c" and then have a dummpy
> no-op function if "CONFIG_KGDB" isn't defined?
>

Sure.

>
> > +               if (atomic_read(&kgdb_active) != -1) {
> > +                       /*
> > +                        * For kgdb to work properly, we need printk to operate
> > +                        * in normal context.
> > +                        */
> > +                       if (in_nmi())
> > +                               printk_nmi_exit();
>
> It feels like all the printk management belongs in kgdb_nmicallback().
> ...or is there some reason that this isn't a problem for other
> platforms using NMI?  Maybe it's just that nobody has noticed it yet?
>

Initially I was skeptical of moving this printk handling in the common
kgdb framework but after exploring other platforms like x86 (probably
unnoticed bug), I agree with you that it belongs to
kgdb_nmicallback(). So I will move it there.

>
> > +                       kgdb_nmicallback(raw_smp_processor_id(), regs);
>
> Why do you need to call raw_smp_processor_id()?  Are you expecting a
> different value than the local variable "cpu"?

Ah, no. Will use the local variable "cpu" instead.

>
>
> > +                       if (in_nmi())
> > +                               printk_nmi_enter();
> > +               }
> > +#endif
> >                 if (!in_nmi())
> >                         irq_exit();
> >                 break;
>
> Not that I really know what I'm talking about since I really don't
> know arm64 at this level very well, but I'll ask anyway and probably
> look like a fool...  I had a note that said:
>
> * Will Deacon says:
> *
> * the whole roundup code is sketchy and it's the only place in the kernel
> * which tries to perform I-cache maintenance with irqs disabled, leading
> * to this nasty hack in the arch code:
> *
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/include/asm/cacheflush.h#n74
>
> I presume that, if nothing else, the comment needs to be updated.
> ...but is the situation any better (or worse?) with your new solution?

I think the situation remains the same with new solution as well. As
either we use IPI being a pseudo NMI or a normal IRQ to roundup CPUs,
kgdb still does I-cache maintenance with irqs disabled which could
lead to a deadlock trying to IPI the secondary CPUs without this nasty
hack in the arch code.

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
