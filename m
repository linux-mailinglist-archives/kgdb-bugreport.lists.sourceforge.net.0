Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 119EA28B47E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Oct 2020 14:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kRwnd-0006WA-MS
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Oct 2020 12:19:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kRwnc-0006W4-TH
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Oct 2020 12:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hz9+UR8vgWlEErBmlAks6gwBc4rojM0m/9wND5ml4Pg=; b=PyNHFJaC42hpBsMdtGHtoIatco
 Ok5fLu8/sS+ZV8No4fkkiK4AlVPoOxjAplPme7KLG5MnOwsQknYB0CuXIFFHQX+ds3/DmXG18/uNZ
 8sMlqEWN4Tz8bpwC4Nwu75ZNHRX9gr96IOvfQmSMG5ZATtkAqQDyYaOKyzKw5H9CBr58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hz9+UR8vgWlEErBmlAks6gwBc4rojM0m/9wND5ml4Pg=; b=UZHckn/M3ezcVMfjKMLnw+0zYN
 9VC2OOcjfwrAH9/IRg403tfXe113Dpo3U8WhcR6pXj1xsvbGTq2+tZFIGZ1o+bt00WOe9jRA5bZFr
 a1AbFm5TeAIH8JAbdmqxIzzVbXKVFRtUlwTmx6bN68y+nrJ0a5tZkkFYHc3Qwo8/0shk=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kRwnZ-00C59a-Dw
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Oct 2020 12:19:32 +0000
Received: by mail-lf1-f65.google.com with SMTP id c141so11531452lfg.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Oct 2020 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hz9+UR8vgWlEErBmlAks6gwBc4rojM0m/9wND5ml4Pg=;
 b=Zk/N3bevPcHY95+DG8fWGjXgh1wRF/zeFkgCONGKHBNvd7ietWrSYV2JKRkGBtUmMw
 51CrCf6+HZo7rASqOASaGwDPpd1kzfDVin6DCbxhHVRO+JUmegHgflpViH5LRNYtR5+w
 fFJ09AImL7q+YsmxQS59buiXFw7dp5hG6WR9JAXzhMKXXendeBs2+voPppL1s3d+ydaq
 Xd2DT83eepfpJHwS1SL1ipYyLjA3FM0/4JwMHbkff50ZzCzMv3jLkTpypvP7iJ5t6pwi
 3RhwTY6s253WbEOgGllIpl+FtHNlzh4AOdZTz9Eho63pE+2fEu7aCLpkhdCoxuWrVJt2
 lLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hz9+UR8vgWlEErBmlAks6gwBc4rojM0m/9wND5ml4Pg=;
 b=O8Y1VTgPY2cppr8Zqtsc7sNLuLjAB+gzyvVpBGu1j1w0eNqM5xwJQgDmKGz7ywcaVd
 3oXDC1fU2yvcJ4whUg16s8FxXpKTwhLSGw3wV5pXd0yHwJHVyrwH6OGL2GVZAo968mZV
 JH/LfUC3Kvc+1iyxdMtMqpAg9jGcTaodX5CgWntrZjWXk+Fl8FD324rC9G9LXr8NjX7R
 6aRCtLOp+11hdwNBvkwBAkDidfjKQ7zGOFWQzXpnfEay8lsusUswSKe7VQYqJ5s0wmcC
 wM13fkPVWuutpMPxBV6WHn1YhmWIYJ4OIaSCLejKbnk9fQehvZ5GR9Le1zFhUzy75Lm5
 49AQ==
X-Gm-Message-State: AOAM532+AiV6kb8mqpbPKJHArtnZc5ysTn7i6RAXkie4/gwYPlo8Men8
 O9i80rqE8/6yLL/D5YIkkjB5uTdujI7EzcnrAG0Ufg==
X-Google-Smtp-Source: ABdhPJyd8IVmtPN6WxlmD3goe4qadYT73jlhbM3RYsE5ppkYNOi1GGukFXDDoXi88fsIfBkcuj4tPGFJu6XoFvhuKBQ=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr3577970lfg.435.1602505161755; 
 Mon, 12 Oct 2020 05:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
 <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
 <20201010015855.vksetnj4luft5enc@gabell>
 <877drypgqb.wl-maz@kernel.org> <20201010151307.vq74if4mndjn4nhm@gabell>
In-Reply-To: <20201010151307.vq74if4mndjn4nhm@gabell>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 12 Oct 2020 17:49:09 +0530
Message-ID: <CAFA6WYOHs+yYvdR-6eQR3ZJPK8nF3sN0fbd8XsQ8pwGL63cdCQ@mail.gmail.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kRwnZ-00C59a-Dw
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

Hi Masa,

On Sat, 10 Oct 2020 at 20:43, Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> On Sat, Oct 10, 2020 at 10:34:04AM +0100, Marc Zyngier wrote:
> > On Sat, 10 Oct 2020 02:58:55 +0100,
> > Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
> >
> > [...]
> >
> > > > +void ipi_nmi_setup(int cpu)
> > > > +{
> > > > + if (!ipi_desc)
> > > > +         return;
> > >
> > > ipi_nmi_setup() may be called twice for CPU0:
> > >
> > >   set_smp_ipi_range => set_smp_ipi_nmi => ipi_nmi_setup
> > >                     => ipi_setup => ipi_nmi_setup
> > >
> > > Actually, I got the following error message via the second ipi_nmi_setup():
> > >
> > >   GICv3: Pseudo-NMIs enabled using relaxed ICC_PMR_EL1 synchronisation
> > >   GICv3: Cannot set NMI property of enabled IRQ 8
> > >   genirq: Failed to setup NMI delivery: irq 8
> > >

Ah, thanks for catching this which I missed during my testing.

> > > Why don't we have a check to prevent that? Like as:
> > >
> > >        if (cpumask_test_cpu(cpu, ipi_desc->percpu_enabled))
> > >                return;
> >
> > That's definitely the wrong thing to do. prepare_nmi_setup() shouldn't
> > be called twice, and papering over it isn't acceptable.
>
> Got it. How about moving ipi_nmi_setup() from ipi_setup() to
> secondary_start_kernel() ? so that CPU0 can call ipi_nmi_setup() only
> from set_smp_ipi_nmi().
>
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -245,6 +245,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>         notify_cpu_starting(cpu);
>
>         ipi_setup(cpu);
> +       ipi_nmi_setup(cpu);
>
>         store_cpu_topology(cpu);
>         numa_add_cpu(cpu);
> @@ -966,8 +967,6 @@ static void ipi_setup(int cpu)
>
>         for (i = 0; i < nr_ipi; i++)
>                 enable_percpu_irq(ipi_irq_base + i, 0);
> -
> -       ipi_nmi_setup(cpu);
>  }
>
>  #ifdef CONFIG_HOTPLUG_CPU
>

IMO, it would be more consistent to keep invocation of ipi_nmi_setup()
from ipi_setup(). So let me remove other invocation from
set_smp_ipi_nmi():

diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index d3aa430..000e457 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -87,7 +87,4 @@ void __init set_smp_ipi_nmi(int ipi)
        ipi_desc = irq_to_desc(ipi);
        irq_set_status_flags(ipi, IRQ_HIDDEN);
        ipi_id = ipi;
-
-       /* Setup the boot CPU immediately */
-       ipi_nmi_setup(smp_processor_id());
 }

Do let me know if this works for you?

-Sumit

> Thanks,
> Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
