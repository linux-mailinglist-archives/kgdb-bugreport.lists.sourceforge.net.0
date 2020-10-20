Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45902293873
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 11:48:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUoFZ-0006H0-2b
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 09:48:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUoFV-0006Gl-8B
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 09:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1XILf1TitNgPwZdU8rNRrEBNDtKYyonEO028htn0pzI=; b=X/lIQe3s8IBJeeifqj2c4gbZ+h
 oBEPnjlt6T8MaeCW6bAx/2H0sCewqHzgWj1eGUbWABcvTnBv+4+6ES5gAqs804/GnTBFSdIHOpLIV
 fsPcyCNlL2CUtpCopkRcZIAPch2/Qp0zHWmzkMdT0tRiOA2EgTjLkyKBu0Adj8sB6/l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1XILf1TitNgPwZdU8rNRrEBNDtKYyonEO028htn0pzI=; b=Jbgp/KlaBFZ2geZf+nDF7+CKPa
 P3tifyOje4RCFO/eiwu+weeK3HEYATrh43ZGDRA9INLCIKL+hrc3JHqkPpV1BB9j8y50yGPXwW/xR
 LMaYB8szlQ9CLZ+If+LJ7su3rlLSNnqWi06eqjvh8StiRqMUAhJDQReuYYXQBD8c2kXY=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUoFD-00H6Iu-2l
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 09:48:08 +0000
Received: by mail-lf1-f68.google.com with SMTP id d24so1324476lfa.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XILf1TitNgPwZdU8rNRrEBNDtKYyonEO028htn0pzI=;
 b=nB2l+1HXl3dOaS2PZrVTIcr3p5/9SMKS8f12EVEk7KK23Q+s0Xc9TgNw3iFzlgyVUq
 Znoapr+g0WvqnuBYbdFI1pM0Q2X6tN3NVfT0Po1XlaJqlwdKkFrPglO8vupj8OxQCSIe
 RuGDF6Awfnk5mBBfiDmPUMsPJnE4bQTgqzYguiozr6cLJ7AUxqHgeDPJ3FEieaubUptE
 KxEHOGIrcTsktonxP6s7JNZnMJ86c4NSpDGVjHeWLp8jX69PFHLMOyLzWpWlv9IYnItt
 EPdpKOIielY7CU8G/xn3Sh2zNfmPWK2E1He8hcxekBTXBCzYgChe7WcISBFSUsBtVRJN
 bPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XILf1TitNgPwZdU8rNRrEBNDtKYyonEO028htn0pzI=;
 b=iHIM7Elj4RbqdFG/sGI/X92oCumvCXBWvYv0s6SFkq5W0hxFHYCkV87xBrQcYjyyw9
 NuRA3/8Oo9QKDGN8saLKPxF0Hg436PuqFEsYhl21i3QEpsCsVKvQcd5Nbx7SyfxPln7N
 /VpYtmK8dcVt0CjywBk0XwNOYIECCWOXZoFwRNyqfHAQ2hF3ank6sND7RPRPlg/DrrOG
 xzTuYvjFMw3wGisuvibU99d+QKqPh1w9mzcJIDmbToBh0ZzkXpkmSyHiA0eNMuW7ZegV
 qoPbqid1ZVSpvtyZFbNjM3NhgHgTxhcnnUJJVqaJUa0UN6sP3W45IO4J55YyA1+fJ/By
 +2fw==
X-Gm-Message-State: AOAM532BGjwzw8oDmRf6GuFrb2a7T7UQ7AYMPxSGYHjhBoB1Vi8Y+RfI
 wcvi9J6XlFGtbAKtx6d3yU3LlKABeHQMnh104cbcVG93Pl+Q6w==
X-Google-Smtp-Source: ABdhPJwqIdRN9gUyRMuuZtvq5jmDOe1lXpoqg4zoq+txYg23wb/Fm+E3mLWSHk4kXm2XfRq0c7Icy4j5w+05FLzl6IE=
X-Received: by 2002:a2e:a41b:: with SMTP id p27mr835731ljn.30.1603185246494;
 Tue, 20 Oct 2020 02:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
 <d4a4a37b93f34da79b87519181bffb97@kernel.org>
In-Reply-To: <d4a4a37b93f34da79b87519181bffb97@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 14:43:54 +0530
Message-ID: <CAFA6WYMe02J6Laa0PWDW4849KGnw8Hu2H5d6UfppeaaE4-Z0vw@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kUoFD-00H6Iu-2l
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

On Mon, 19 Oct 2020 at 17:50, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-14 12:12, Sumit Garg wrote:
> > Enable NMI backtrace support on arm64 using IPI turned as an NMI
> > leveraging pseudo NMIs support. It is now possible for users to get a
> > backtrace of a CPU stuck in hard-lockup using magic SYSRQ.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/irq.h |  6 ++++++
> >  arch/arm64/kernel/ipi_nmi.c  | 12 +++++++++++-
> >  2 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/irq.h
> > b/arch/arm64/include/asm/irq.h
> > index b2b0c64..e840bf1 100644
> > --- a/arch/arm64/include/asm/irq.h
> > +++ b/arch/arm64/include/asm/irq.h
> > @@ -6,6 +6,12 @@
> >
> >  #include <asm-generic/irq.h>
> >
> > +#ifdef CONFIG_SMP
> > +extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> > +                                        bool exclude_self);
> > +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> > +#endif
> > +
> >  struct pt_regs;
> >
> >  static inline int nr_legacy_irqs(void)
> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> > index e0a9e03..e1dc19d 100644
> > --- a/arch/arm64/kernel/ipi_nmi.c
> > +++ b/arch/arm64/kernel/ipi_nmi.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> >  #include <linux/kgdb.h>
> > +#include <linux/nmi.h>
> >  #include <linux/smp.h>
> >
> >  #include <asm/nmi.h>
> > @@ -25,12 +26,21 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t
> > *mask)
> >       __ipi_send_mask(ipi_desc, mask);
> >  }
> >
> > +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool
> > exclude_self)
> > +{
> > +     nmi_trigger_cpumask_backtrace(mask, exclude_self,
> > +                                   arch_send_call_nmi_func_ipi_mask);
> > +}
> > +
> >  static irqreturn_t ipi_nmi_handler(int irq, void *data)
> >  {
> >       unsigned int cpu = smp_processor_id();
> >
> > -     ipi_kgdb_nmicallback(cpu, get_irq_regs());
> > +     if (nmi_cpu_backtrace(get_irq_regs()))
> > +             goto out;
> >
> > +     ipi_kgdb_nmicallback(cpu, get_irq_regs());
> > +out:
> >       return IRQ_HANDLED;
> >  }
>
> Can't you have *both* a request for a backtrace and a KGDB call?
> It really shouldn't be either/or. It also outlines how well shared
> interrupts work with edge triggered signalling...

Unfortunately, NMIs doesn't seem to support shared mode [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/manage.c#n1480

-Sumit

>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
