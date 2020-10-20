Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BFD2935BF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 09:30:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUm6B-0006bi-ER
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 07:30:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUm69-0006bZ-7U
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oqfbzt/qDzJfLfhorr1LgGLqTXS/OCrC1Rjql2HHPMM=; b=IIqWtgoRxZcJ/wOBC8moXjfC1F
 kJ9VFduTaE3Ea1adKOw1sHRlgDht7lvJKBKs+/01LrG3RMvcJZSYv1MbSzpUgajrdDLaQzCphgAFu
 7W4DBIpG0t1RTchE49GEElnpRnnk+1LH8RXMpbVJHiblBCtDTBZFPH/ieN+n0uMERymg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oqfbzt/qDzJfLfhorr1LgGLqTXS/OCrC1Rjql2HHPMM=; b=NtCgrH6dprfq8blfwF/Os1UY/r
 hpiU1x56WNuuU6QnWHqilfXZKEXzYq/YzhoXnaTGYnzmQHHfJMhg/bItx8sZT3BX5sC23NKrE+GFg
 yO0hnzjg1b8cXn0CEe9KbDQVgy2zK7jaJt+63TH8HV1T2fyriX1n0PLhArngWYsPgUu8=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUm61-0055lI-Ei
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:30:19 +0000
Received: by mail-lf1-f67.google.com with SMTP id d24so871441lfa.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oqfbzt/qDzJfLfhorr1LgGLqTXS/OCrC1Rjql2HHPMM=;
 b=pixOfe/LlMMXGSm5PFqV3GzwGaKRnNcGMQ53dh3WqtVVHs0AD14SBQ+hAFp9Q2lVRx
 yiXswGWtZ/4iFHOPdQjxW6wcevek2jcW50T8J7cTP5ToK6xYthpqI4rrxp81Xkp33Q5/
 xV5GIvIS3aX0bkgfKjQhX3RRMnD82YVvIIW54i+i5Idjd3GF+C5VQi2jwc9tcuOj/p0W
 gQJmjen7UIpB64+r0H5CUmYRCQuAiJwOfWrAplFfZk46xxPudigz2StWhTrUWMzVr4Dj
 xqy9cdhyLRFT0RQ4RR8ZaiokWwu4rhmu0KfGjpUXYcgn1/LDhMitUbw43wYvCkSunBjs
 ZXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqfbzt/qDzJfLfhorr1LgGLqTXS/OCrC1Rjql2HHPMM=;
 b=m6Hekrq1VzkgjEPy5LlHWgjbQBMnceDK3DDDGD2OPprRFNC1JBWdz7TFhN8hRkc/92
 FjHS1M0+HbuEJeu/KdHqWuWpd6jwqLmrPZ7tKnzwsHOHkolEKoALR+pSUGNncGYYGEcQ
 Chvwv1qPBmefd2USI6Z+4j2l4demG82gGU9qdjjVGM/IBoZG/R6BWYR9poqtPzKw2r6J
 NdJSnaWgTCGOTm9nHOI+reHJnipAF4jiftR1WlShpBXj2HFKpU4af00+k/SnJUtCafMn
 R/di5dONJxuCAJ2qL7jFtrPu0zcOUMlBm0qkcEn7D2VhXXkn7oUxllsuL7LMma5FXh1t
 Y8DQ==
X-Gm-Message-State: AOAM531wwMREU4nvxzXkbx4DFTHZJBLp0OrJs2oS+eX/G6Mi+GAaTuZV
 xJEme3RlonuRT5I+B9ENjlnjcwTxkzAyIO0/pUwDsasw76c=
X-Google-Smtp-Source: ABdhPJyljvU8t34fPXWrkGHEmjcTnmj0A7FHynrsuw2TPqALkHhNoboqAWhvd41VpIUiw+zC9Vv/rdO+co9ft5k0ZCk=
X-Received: by 2002:a05:6512:2029:: with SMTP id
 s9mr445264lfs.273.1603178222429; 
 Tue, 20 Oct 2020 00:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-4-git-send-email-sumit.garg@linaro.org>
 <1c68b74251dc72b0cd74706280ea96f7@kernel.org>
In-Reply-To: <1c68b74251dc72b0cd74706280ea96f7@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 12:46:51 +0530
Message-ID: <CAFA6WYODXzOoH=NiurikiK6wepsdfmnmUd4BzEJnguaSGzW7GQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
X-Headers-End: 1kUm61-0055lI-Ei
Subject: Re: [Kgdb-bugreport] [PATCH v5 3/5] arm64: smp: Allocate and setup
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

On Mon, 19 Oct 2020 at 17:29, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-14 12:12, Sumit Garg wrote:
> > Allocate an unused IPI that can be turned as NMI using ipi_nmi
> > framework.
>
> This doesn't do any allocation, as far as I can see. It relies on
> the initial grant from the interrupt controller to be larger than
> what the kernel currently uses.
>

Okay, will update the commit message as s/Allocate/Assign/.

-Sumit

> > Also, invoke corresponding NMI setup/teardown APIs.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/kernel/smp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 82e75fc..129ebfb 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -43,6 +43,7 @@
> >  #include <asm/daifflags.h>
> >  #include <asm/kvm_mmu.h>
> >  #include <asm/mmu_context.h>
> > +#include <asm/nmi.h>
> >  #include <asm/numa.h>
> >  #include <asm/processor.h>
> >  #include <asm/smp_plat.h>
> > @@ -962,6 +963,8 @@ static void ipi_setup(int cpu)
> >
> >       for (i = 0; i < nr_ipi; i++)
> >               enable_percpu_irq(ipi_irq_base + i, 0);
> > +
> > +     ipi_nmi_setup(cpu);
> >  }
> >
> >  #ifdef CONFIG_HOTPLUG_CPU
> > @@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
> >
> >       for (i = 0; i < nr_ipi; i++)
> >               disable_percpu_irq(ipi_irq_base + i);
> > +
> > +     ipi_nmi_teardown(cpu);
> >  }
> >  #endif
> >
> > @@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
> >               irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
> >       }
> >
> > +     if (n > nr_ipi)
> > +             set_smp_ipi_nmi(ipi_base + nr_ipi);
> > +
> >       ipi_irq_base = ipi_base;
> >
> >       /* Setup the boot CPU immediately */
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
