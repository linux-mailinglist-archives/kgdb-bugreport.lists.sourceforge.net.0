Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E7294B49
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 21 Oct 2020 12:32:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kVBPt-0004je-R4
	for lists+kgdb-bugreport@lfdr.de; Wed, 21 Oct 2020 10:32:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kVBPs-0004jT-Dg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 10:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVuXXgbabUAPU81Xio0cnk2/9ybHly4ToP4DcuRllNY=; b=jvilqGzjT/3b6g0jYziJBJYqws
 P3KFaR+9VKCpMv7pPaOVR6a5MrvdhClz0Ud1n2ZWgELTD4V1k6mshnQrrAJzEw9w9VXq+/7PMmg3M
 w07ZM734hLrIxXjO9p9yao3UgPaBbY7nLP+SMj9NcVh5jFgXoW3vmF5L0jRZj9F2I3vQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVuXXgbabUAPU81Xio0cnk2/9ybHly4ToP4DcuRllNY=; b=k4S1v4ZRcgehK2/S5NfMvgCzqQ
 vdL/BwwiEws6DGa4PZ4g5sbSLam9jVw5EBRGq9PWB2WT04D1/+uCPXfvc2Z5dV1iJb0rDYas2ihQg
 0t9KFde0+5yiibste9cW+2b9y2Tk+p+gm02FKovhqGBWTP9IQtLk/LmHUha0FamDp2C8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kVBPb-00740e-Va
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 10:32:24 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B63A20795;
 Wed, 21 Oct 2020 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603276322;
 bh=9Wkyv/mfzZbVcmFZ4zwkkvY68hTmKXqXKL+Hf18lX7o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ylezudmmKvIWzxnb+PQBmEHg54FcjvN5ArabT/9KI66kgjrw41HyXlGpEc91a8H33
 uXALLRx4iq8qkzB9LZc9tX2wAHSA6zn9JopEYfC+cDXMvDUavFUCwjeqCUr8Z7AVt+
 peAVp4v840PnF4XQV122yQjW8Iy0cJd+dIQr/HQ0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kVBPU-0030kr-8c; Wed, 21 Oct 2020 11:32:00 +0100
MIME-Version: 1.0
Date: Wed, 21 Oct 2020 11:32:00 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <CAFA6WYMe02J6Laa0PWDW4849KGnw8Hu2H5d6UfppeaaE4-Z0vw@mail.gmail.com>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
 <d4a4a37b93f34da79b87519181bffb97@kernel.org>
 <CAFA6WYMe02J6Laa0PWDW4849KGnw8Hu2H5d6UfppeaaE4-Z0vw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <ebf30013b05e8d038a63fe189f250b4b@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 jason@lakedaemon.net, mark.rutland@arm.com, julien.thierry.kdev@gmail.com,
 dianders@chromium.org, daniel.thompson@linaro.org, jason.wessel@windriver.com,
 msys.mizuma@gmail.com, ito-yuichi@fujitsu.com,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kVBPb-00740e-Va
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-20 10:13, Sumit Garg wrote:
> On Mon, 19 Oct 2020 at 17:50, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-10-14 12:12, Sumit Garg wrote:
>> > Enable NMI backtrace support on arm64 using IPI turned as an NMI
>> > leveraging pseudo NMIs support. It is now possible for users to get a
>> > backtrace of a CPU stuck in hard-lockup using magic SYSRQ.
>> >
>> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>> > ---
>> >  arch/arm64/include/asm/irq.h |  6 ++++++
>> >  arch/arm64/kernel/ipi_nmi.c  | 12 +++++++++++-
>> >  2 files changed, 17 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm64/include/asm/irq.h
>> > b/arch/arm64/include/asm/irq.h
>> > index b2b0c64..e840bf1 100644
>> > --- a/arch/arm64/include/asm/irq.h
>> > +++ b/arch/arm64/include/asm/irq.h
>> > @@ -6,6 +6,12 @@
>> >
>> >  #include <asm-generic/irq.h>
>> >
>> > +#ifdef CONFIG_SMP
>> > +extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
>> > +                                        bool exclude_self);
>> > +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>> > +#endif
>> > +
>> >  struct pt_regs;
>> >
>> >  static inline int nr_legacy_irqs(void)
>> > diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
>> > index e0a9e03..e1dc19d 100644
>> > --- a/arch/arm64/kernel/ipi_nmi.c
>> > +++ b/arch/arm64/kernel/ipi_nmi.c
>> > @@ -9,6 +9,7 @@
>> >  #include <linux/interrupt.h>
>> >  #include <linux/irq.h>
>> >  #include <linux/kgdb.h>
>> > +#include <linux/nmi.h>
>> >  #include <linux/smp.h>
>> >
>> >  #include <asm/nmi.h>
>> > @@ -25,12 +26,21 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t
>> > *mask)
>> >       __ipi_send_mask(ipi_desc, mask);
>> >  }
>> >
>> > +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool
>> > exclude_self)
>> > +{
>> > +     nmi_trigger_cpumask_backtrace(mask, exclude_self,
>> > +                                   arch_send_call_nmi_func_ipi_mask);
>> > +}
>> > +
>> >  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>> >  {
>> >       unsigned int cpu = smp_processor_id();
>> >
>> > -     ipi_kgdb_nmicallback(cpu, get_irq_regs());
>> > +     if (nmi_cpu_backtrace(get_irq_regs()))
>> > +             goto out;
>> >
>> > +     ipi_kgdb_nmicallback(cpu, get_irq_regs());
>> > +out:
>> >       return IRQ_HANDLED;
>> >  }
>> 
>> Can't you have *both* a request for a backtrace and a KGDB call?
>> It really shouldn't be either/or. It also outlines how well shared
>> interrupts work with edge triggered signalling...
> 
> Unfortunately, NMIs doesn't seem to support shared mode [1].

You are totally missing the point: shared interrupts *cannot* work
reliably with edge signalling. What I am saying here is that you need
implement the sharing yourself in this function.

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
