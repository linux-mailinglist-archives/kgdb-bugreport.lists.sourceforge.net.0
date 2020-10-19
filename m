Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AF29271F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Oct 2020 14:20:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUU9m-0006eq-Aw
	for lists+kgdb-bugreport@lfdr.de; Mon, 19 Oct 2020 12:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUU9l-0006ef-KR
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 12:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vErLy8qHMxxAWPHggeNEKbw3AMwddoo8pBuXJ+iMiWY=; b=GkPq5yQ0ZWjBc7NzViU9AEyxsW
 sgFSPAjerXe4IBHuJlj4K1v85TLN8rmPn5R8AQBuF4EoVBuUy4QR+G3M2ghLQd1Kl0OPgFqeGyyoN
 +ayV2f0/XhOmK96HI2+KhxwavfLSsFzdaZ73lrqSq83bbxktuTPunHMeKKO2yiIfADl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vErLy8qHMxxAWPHggeNEKbw3AMwddoo8pBuXJ+iMiWY=; b=XT5ebaRk8bmkVPawpGWdhcgYrI
 ynH/FdBRVHejrAndMPfw97ixZl5ljd64YLz2QzI9hWx0GxMhkQxk4/cToaUXSOssE/sv4IHseehKQ
 6pKEJmHWBVSYQs2Qt2e/NcKzDPEbQV1aV3RKltWZc5NLbEX4T0jjYIvyhIe+/62Sm2Do=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUU9h-003k2M-Fo
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 12:20:53 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B826522268;
 Mon, 19 Oct 2020 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603110043;
 bh=KudzWihYn7TsHFILrc3bbZ/Ot13PpKP3HdWaA7pXYFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UdOZNQz6NTdrIOdjekI0yw+JYVbCpVdC6VkLuZWQnl4Kt+aZXZN4cWYEe4GOPUHG/
 dvb9NauKrTxyxEZNPwV9uHlvXgYVVxNk59AyjXRIIlOhLBK2M9oP8RoD6VGTH9rrYM
 C9oG6OEUesu5t0D3oI+sQ4ZDEE1NnNfetHm34Nlk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUU9Z-002PiH-Gw; Mon, 19 Oct 2020 13:20:41 +0100
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 13:20:41 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d4a4a37b93f34da79b87519181bffb97@kernel.org>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kUU9h-003k2M-Fo
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 catalin.marinas@arm.com, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-14 12:12, Sumit Garg wrote:
> Enable NMI backtrace support on arm64 using IPI turned as an NMI
> leveraging pseudo NMIs support. It is now possible for users to get a
> backtrace of a CPU stuck in hard-lockup using magic SYSRQ.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/irq.h |  6 ++++++
>  arch/arm64/kernel/ipi_nmi.c  | 12 +++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/irq.h 
> b/arch/arm64/include/asm/irq.h
> index b2b0c64..e840bf1 100644
> --- a/arch/arm64/include/asm/irq.h
> +++ b/arch/arm64/include/asm/irq.h
> @@ -6,6 +6,12 @@
> 
>  #include <asm-generic/irq.h>
> 
> +#ifdef CONFIG_SMP
> +extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> +					   bool exclude_self);
> +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> +#endif
> +
>  struct pt_regs;
> 
>  static inline int nr_legacy_irqs(void)
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index e0a9e03..e1dc19d 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/kgdb.h>
> +#include <linux/nmi.h>
>  #include <linux/smp.h>
> 
>  #include <asm/nmi.h>
> @@ -25,12 +26,21 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t 
> *mask)
>  	__ipi_send_mask(ipi_desc, mask);
>  }
> 
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool 
> exclude_self)
> +{
> +	nmi_trigger_cpumask_backtrace(mask, exclude_self,
> +				      arch_send_call_nmi_func_ipi_mask);
> +}
> +
>  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>  {
>  	unsigned int cpu = smp_processor_id();
> 
> -	ipi_kgdb_nmicallback(cpu, get_irq_regs());
> +	if (nmi_cpu_backtrace(get_irq_regs()))
> +		goto out;
> 
> +	ipi_kgdb_nmicallback(cpu, get_irq_regs());
> +out:
>  	return IRQ_HANDLED;
>  }

Can't you have *both* a request for a backtrace and a KGDB call?
It really shouldn't be either/or. It also outlines how well shared
interrupts work with edge triggered signalling...

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
