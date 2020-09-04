Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44425D763
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Sep 2020 13:32:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kE9xK-0005Pq-00
	for lists+kgdb-bugreport@lfdr.de; Fri, 04 Sep 2020 11:32:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kE9xI-0005Pg-VE
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Sep 2020 11:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3zA99aEMQ+GSN3rlEJk+n2U8t/Kxnc6IxQCFC33HIVA=; b=NEKdKRj7CRNzZ2j3pxWxpFcPus
 dmPhdHmPuh5ihsgVDjVL6dSIRHizeUuRKc9wVG0FKQvBAQrkxY+MScER/tfyLB96psdYSrXpupNrA
 7OFFCBmWZQ+xife1iFfGPauDA5ECBsh9x75rgx7XGP9tSzn/DYQmT4GSwux4u96zc0Vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3zA99aEMQ+GSN3rlEJk+n2U8t/Kxnc6IxQCFC33HIVA=; b=B/GNk7AjI1GiGxFC7myKzxOpDJ
 AlpXK83PdXGhPF3oPpNET4vDqJuX4S4NxVVRXOC5ffZ+bM4LV2g78KLzL+yIgz03GNuyVh3JtcWjV
 AElUZFdXHv6FUoX2KMqX4MAsbYdezf7nTVcjB89I+OB3BnRx6jou/zGTXp8TYFwk5OtA=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kE9x6-00BsHK-CY
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Sep 2020 11:32:32 +0000
Received: by mail-lj1-f194.google.com with SMTP id t23so7555543ljc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 04 Sep 2020 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zA99aEMQ+GSN3rlEJk+n2U8t/Kxnc6IxQCFC33HIVA=;
 b=mSdxz4fgtsgSS2l9njzIYvSmIlX80hvCnTvP/OgE02oJ4nDD6UKwizm4D7pYEV9/oB
 tEbt7dHQNZO90wBDaS9dLTOH3TjgVJK62Qdxp3nj989prYsaxM5XJE20K/8QK3/7SqZW
 Rs4zfFheOchEGYvixvNV8Dl6RNgZp5wwVcRUbWZDg+FvS8e7MMS5G3GTA1pvFe4Sn9IK
 Iw+PG4lHpcmVmI5ZudeQeOLTrfqnwRivA7UeFYXQF7BLJ8gw/QPEIugIuJnobfN3dhDg
 veR63F4DQdtkKOBLjGfzzJqrJW4/JaXH9pA+ARPCeGL0/34Rp9ZXyk+2jLpYybARdMQ9
 q+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zA99aEMQ+GSN3rlEJk+n2U8t/Kxnc6IxQCFC33HIVA=;
 b=nxvNsllLnNVm+d0n9i6eU2NZFqibgSl4LHqcp3kdG+V3CgQiE+lyb7OT/4uWZiOgfs
 xTNfopaeqmEauov0h9WTuThQTqsVh91mvFwsjNQcKZYf75wVBAIH7jX+EC+DpLGTfK6f
 JrFkVegZtfMMRrXkc4/LvIvIObOCZWIPkkbMWHGoi0+nHo0CNa+Fa2/q8JG6OKcNJHcg
 M1SH/1IdUzuzmF1d2x+de6Ya7Gn253QF5YNwMTCaBBDMBBl8qW2bP9VqH7Krrj8JyZaS
 N2BwbE10iZBGpPWdEBEWOWtH6h5WtxgJjjXoDefYxsIFEydpIusiX6KgcXIxp7leKiLE
 gBJQ==
X-Gm-Message-State: AOAM533jyMYnykiXx6xnTIjMOnaG5jSnDhTObLaS2tG/CWb9pnc5vbOy
 VTBOl4mb8T84pXEYjBzqNajkJP7t6OKRTbyKDkv/XA==
X-Google-Smtp-Source: ABdhPJw6mw/bMokIo9Rs/jiLGSH2soJ9lHD4kwKbbHitnqslUJIg+RrmP0RYM6dir4mKgHThQjhIaXEzNK+sM2Hafq4=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr3319272ljj.256.1599219133711; 
 Fri, 04 Sep 2020 04:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
 <1599134712-30923-2-git-send-email-sumit.garg@linaro.org>
 <05a195374cc81008e95e258221fe7d2b@kernel.org>
 <CAFA6WYNYGGsFwOdh35o2zHZb8k7o8YQ3CPDi_A=5c+VBLY9w_w@mail.gmail.com>
 <6125bdeb9ebd0cb51aa85fe36dee841c@kernel.org>
In-Reply-To: <6125bdeb9ebd0cb51aa85fe36dee841c@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 4 Sep 2020 17:02:02 +0530
Message-ID: <CAFA6WYNe_x7oCvN6uysXJ0sFBDzLk49-p5uxUydzdUv5zimwsQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kE9x6-00BsHK-CY
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/4] arm64: smp: Introduce a new IPI
 as IPI_CALL_NMI_FUNC
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 4 Sep 2020 at 13:30, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-09-04 06:30, Sumit Garg wrote:
> > On Thu, 3 Sep 2020 at 22:06, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-09-03 13:05, Sumit Garg wrote:
> >> > Introduce a new inter processor interrupt as IPI_CALL_NMI_FUNC that
> >> > can be invoked to run special handlers in NMI context. One such handler
> >> > example is kgdb_nmicallback() which is invoked in order to round up
> >> > CPUs
> >> > to enter kgdb context.
> >> >
> >> > As currently pseudo NMIs are supported on specific arm64 platforms
> >> > which
> >> > incorporates GICv3 or later version of interrupt controller. In case a
> >> > particular platform doesn't support pseudo NMIs, IPI_CALL_NMI_FUNC will
> >> > act as a normal IPI which can still be used to invoke special handlers.
> >> >
> >> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >> > ---
> >> >  arch/arm64/include/asm/smp.h |  1 +
> >> >  arch/arm64/kernel/smp.c      | 11 +++++++++++
> >> >  2 files changed, 12 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/include/asm/smp.h
> >> > b/arch/arm64/include/asm/smp.h
> >> > index 2e7f529..e85f5d5 100644
> >> > --- a/arch/arm64/include/asm/smp.h
> >> > +++ b/arch/arm64/include/asm/smp.h
> >> > @@ -89,6 +89,7 @@ extern void secondary_entry(void);
> >> >
> >> >  extern void arch_send_call_function_single_ipi(int cpu);
> >> >  extern void arch_send_call_function_ipi_mask(const struct cpumask
> >> > *mask);
> >> > +extern void arch_send_call_nmi_func_ipi_mask(const struct cpumask
> >> > *mask);
> >> >
> >> >  #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> >> >  extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
> >> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> >> > index b6bde26..1b4c07c 100644
> >> > --- a/arch/arm64/kernel/smp.c
> >> > +++ b/arch/arm64/kernel/smp.c
> >> > @@ -74,6 +74,7 @@ enum ipi_msg_type {
> >> >       IPI_TIMER,
> >> >       IPI_IRQ_WORK,
> >> >       IPI_WAKEUP,
> >> > +     IPI_CALL_NMI_FUNC,
> >> >       NR_IPI
> >> >  };
> >> >
> >> > @@ -793,6 +794,7 @@ static const char *ipi_types[NR_IPI]
> >> > __tracepoint_string = {
> >> >       S(IPI_TIMER, "Timer broadcast interrupts"),
> >> >       S(IPI_IRQ_WORK, "IRQ work interrupts"),
> >> >       S(IPI_WAKEUP, "CPU wake-up interrupts"),
> >> > +     S(IPI_CALL_NMI_FUNC, "NMI function call interrupts"),
> >> >  };
> >> >
> >> >  static void smp_cross_call(const struct cpumask *target, unsigned int
> >> > ipinr);
> >> > @@ -840,6 +842,11 @@ void arch_irq_work_raise(void)
> >> >  }
> >> >  #endif
> >> >
> >> > +void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask)
> >> > +{
> >> > +     smp_cross_call(mask, IPI_CALL_NMI_FUNC);
> >> > +}
> >> > +
> >> >  static void local_cpu_stop(void)
> >> >  {
> >> >       set_cpu_online(smp_processor_id(), false);
> >> > @@ -932,6 +939,10 @@ static void do_handle_IPI(int ipinr)
> >> >               break;
> >> >  #endif
> >> >
> >> > +     case IPI_CALL_NMI_FUNC:
> >> > +             /* nop, IPI handlers for special features can be added here. */
> >> > +             break;
> >> > +
> >> >       default:
> >> >               pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
> >> >               break;
> >>
> >> I'm really not keen on adding more IPIs to the SMP code. One of the
> >> main reasons for using these SGIs as normal IRQs was to make them
> >> "requestable" from non-arch code as if they were standard percpu
> >> interrupts.
> >>
> >> What prevents you from moving that all the way to the kgdb code?
> >>
> >
> > Since we only have one SGI left (SGI7) which this patch reserves for
> > NMI purposes, I am not sure what value add do you see to make it
> > requestable from non-arch code.
>
> We have one *guaranteed* SGI left. Potentially another 8 which we
> could dynamically discover (reading the priority registers should
> be enough to weed out the secure SGIs). And I'd like to keep that
> last interrupt "just in case" we'd need it to workaround something.
>
> > Also, allocating SGI7 entirely to kgdb would not allow us to leverage
> > it for NMI backtrace support via magic sysrq. But with current
> > implementation we should be able to achieve that.
>
> I'd argue that there is no need for this interrupt to be a "well known
> number". Maybe putting this code in the kgdb code is one step too far,
> but keeping out of the arm64 SMP code is IMO the right thing to do.

IIUC, you would prefer to only allocate SGI7 (only one left) if there
is a corresponding user. And I agree that kgdb isn't commonly active
for most users. But I think magic sysrq is enabled for most users and
supporting NMI backtrace would be quite useful while debugging systems
in the field as well.

So if you like, I can create a separate file like
"arch/arm64/kernel/ipi_nmi.c" for this implementation.

> And if NMI backtracing is a thing, then we should probably implement
> that first.

Have a look at IPI_CPU_BACKTRACE implementation for arm [1]. Similar
implementation would be required for arm64 but now with IPI turned as
a pseudo NMI. So I will try to add corresponding support.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/kernel/smp.c#n72

>
> > Moreover, irq ids for normal interrupts are assigned via DT/ACPI, how
> > do you envision this for SGIs?
>
> Nothing could be further from the truth. How do you think MSIs work?
> We'd just bolt an allocator for non-arch IPIs.
>

Okay.

-Sumit

>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
