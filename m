Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137425D0E3
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Sep 2020 07:30:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kE4JM-0000g0-WC
	for lists+kgdb-bugreport@lfdr.de; Fri, 04 Sep 2020 05:30:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kE4JK-0000fb-5Q
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Sep 2020 05:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0wsiRp9bi1K3s4KVn3/DmIOjF5/zAHr2ju+az3903zs=; b=Swyg6MSns1l0Tulh8YogI+rHXR
 +tvoj2BT+fB6Gads9WIc9bkEeMJ2Iw3Qjbdksxm6JUN0sqZEhqehdSbSUlzGxorK7IMRlxbappupE
 t7HvXCbeq64tP/8y0QfG9ggVI19Wzir8zbjeK+J/wxWbBICvCAbfz7bpwg06WCDusxcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0wsiRp9bi1K3s4KVn3/DmIOjF5/zAHr2ju+az3903zs=; b=XlTiBpgPnsAPyXT/k4cuGC4tth
 OIYdopTb7XMUoa6FyxWDsZx5dOwzec41VLzpXeXpPf7moM3Z1kdVZGn+69MDpK6e1KEMnAM9LuKeX
 gMBt5iy/vXPYDt5CODFgv8T+bDYKhmg0il1MPQvgVcf/TuUclzZyvUL6tA60L2C+fVDg=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kE4JD-00BUdy-JH
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Sep 2020 05:30:54 +0000
Received: by mail-lj1-f195.google.com with SMTP id r13so6524023ljm.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 03 Sep 2020 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0wsiRp9bi1K3s4KVn3/DmIOjF5/zAHr2ju+az3903zs=;
 b=w0fjOYCZipZfEHhJc0Y5DPKT0RTYpveldC5G2xqoQ4bih4ZPmHo8ixIac1IhY9kt8y
 7+TpxFs7tOgUytAoKVXbLed1w5ykFgWYImg9UAfkMQWYRNhMgEdd3CWiqT4+zqYrkivc
 huLEJtBE5mVged44dR/tpHrKZornIvHnXRQbozVLp9m70p3NfPat03+7nUbo56lw7Dkz
 b18ncRSgHBrinZrkZ735Brvo1tqMQ+rIKTmkqShN/pmXm1WCEyUBht+M3nQpCJI5IDBL
 gem/MIOevTQd2cdfhxxuYk1UqgabbEIppSdoGVayDG051YU5cT2Ur6XnXUSexbouYmt8
 hkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0wsiRp9bi1K3s4KVn3/DmIOjF5/zAHr2ju+az3903zs=;
 b=UgPY/KKIu4DumnlG8jhTvHs1gvAC03+mzMBYZJcpw4H8wjdjHqunIHJqAVZCsiqkaa
 RbODoqpksDhYBxd0YxLmj3sLJu01O/EOz808/axaSigugSOJ2MKI4AzfIp/TDX8pFxY3
 6m5FB4kDHDt0Rx+XZ7aofoiCAR735YXAyAdsqIWoE3tOhhfMItcsbYHiqklhbaUQtfxz
 Mo72ttUHeX9P/uqZtiyYctY8t1q4Od6oCuDB3H9TZeIMjVdsuj3KG6rxiU29byAwAW3d
 FrJWkIUOhImeoYXDskwnkGWQ1zPP5B8sxn2RgIErVv1bo1flawQx/zZJBY4SiIc8e052
 OPgQ==
X-Gm-Message-State: AOAM533nT2ZtlxvbwJ9R9WjFhUYmCBh/9bjFpJpSCj/DELj7jW87lPBn
 PxK4bYX6F3fxpXGbyyn2o1g1/a7P8/u0q3giECnwmw==
X-Google-Smtp-Source: ABdhPJyOrGZp+4ZDzbrU8Nm9uPBQEGqLZYon2HxfACgx8oQrE7Sx+ARY0l92/X1M4b6M4Quee59yWdf9EeFShPxICDA=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr2812710ljg.372.1599197433659; 
 Thu, 03 Sep 2020 22:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
 <1599134712-30923-2-git-send-email-sumit.garg@linaro.org>
 <05a195374cc81008e95e258221fe7d2b@kernel.org>
In-Reply-To: <05a195374cc81008e95e258221fe7d2b@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 4 Sep 2020 11:00:22 +0530
Message-ID: <CAFA6WYNYGGsFwOdh35o2zHZb8k7o8YQ3CPDi_A=5c+VBLY9w_w@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kE4JD-00BUdy-JH
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

On Thu, 3 Sep 2020 at 22:06, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-09-03 13:05, Sumit Garg wrote:
> > Introduce a new inter processor interrupt as IPI_CALL_NMI_FUNC that
> > can be invoked to run special handlers in NMI context. One such handler
> > example is kgdb_nmicallback() which is invoked in order to round up
> > CPUs
> > to enter kgdb context.
> >
> > As currently pseudo NMIs are supported on specific arm64 platforms
> > which
> > incorporates GICv3 or later version of interrupt controller. In case a
> > particular platform doesn't support pseudo NMIs, IPI_CALL_NMI_FUNC will
> > act as a normal IPI which can still be used to invoke special handlers.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/smp.h |  1 +
> >  arch/arm64/kernel/smp.c      | 11 +++++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/smp.h
> > b/arch/arm64/include/asm/smp.h
> > index 2e7f529..e85f5d5 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -89,6 +89,7 @@ extern void secondary_entry(void);
> >
> >  extern void arch_send_call_function_single_ipi(int cpu);
> >  extern void arch_send_call_function_ipi_mask(const struct cpumask
> > *mask);
> > +extern void arch_send_call_nmi_func_ipi_mask(const struct cpumask
> > *mask);
> >
> >  #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
> >  extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index b6bde26..1b4c07c 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -74,6 +74,7 @@ enum ipi_msg_type {
> >       IPI_TIMER,
> >       IPI_IRQ_WORK,
> >       IPI_WAKEUP,
> > +     IPI_CALL_NMI_FUNC,
> >       NR_IPI
> >  };
> >
> > @@ -793,6 +794,7 @@ static const char *ipi_types[NR_IPI]
> > __tracepoint_string = {
> >       S(IPI_TIMER, "Timer broadcast interrupts"),
> >       S(IPI_IRQ_WORK, "IRQ work interrupts"),
> >       S(IPI_WAKEUP, "CPU wake-up interrupts"),
> > +     S(IPI_CALL_NMI_FUNC, "NMI function call interrupts"),
> >  };
> >
> >  static void smp_cross_call(const struct cpumask *target, unsigned int
> > ipinr);
> > @@ -840,6 +842,11 @@ void arch_irq_work_raise(void)
> >  }
> >  #endif
> >
> > +void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask)
> > +{
> > +     smp_cross_call(mask, IPI_CALL_NMI_FUNC);
> > +}
> > +
> >  static void local_cpu_stop(void)
> >  {
> >       set_cpu_online(smp_processor_id(), false);
> > @@ -932,6 +939,10 @@ static void do_handle_IPI(int ipinr)
> >               break;
> >  #endif
> >
> > +     case IPI_CALL_NMI_FUNC:
> > +             /* nop, IPI handlers for special features can be added here. */
> > +             break;
> > +
> >       default:
> >               pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
> >               break;
>
> I'm really not keen on adding more IPIs to the SMP code. One of the
> main reasons for using these SGIs as normal IRQs was to make them
> "requestable" from non-arch code as if they were standard percpu
> interrupts.
>
> What prevents you from moving that all the way to the kgdb code?
>

Since we only have one SGI left (SGI7) which this patch reserves for
NMI purposes, I am not sure what value add do you see to make it
requestable from non-arch code.

Also, allocating SGI7 entirely to kgdb would not allow us to leverage
it for NMI backtrace support via magic sysrq. But with current
implementation we should be able to achieve that.

Moreover, irq ids for normal interrupts are assigned via DT/ACPI, how
do you envision this for SGIs?

-Sumit

>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
