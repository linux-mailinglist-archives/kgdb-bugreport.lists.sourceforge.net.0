Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5A2926DF
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Oct 2020 14:00:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUTpX-0002m7-I6
	for lists+kgdb-bugreport@lfdr.de; Mon, 19 Oct 2020 11:59:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUTpV-0002le-Oc
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 11:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fy1ZhG7h7X0uthqt8OWHjkauXBZ+lSzxlXbRpKWBm88=; b=bMRHoCFfRjY8tqk5DT+2F9OM0B
 5FZ/zNZhe4xEnC+ExWL1OhRflNNqxn9Ol3d3GfeMlBFtj+qoRIXLTlXFTKp40GZi3g7lceN40bT3x
 12E9F/QldEStx0dp7lkQAf3e1nBsi6CbLhZtqS6LjGjJbMPPEF80K/xluvmGOhH3kdv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fy1ZhG7h7X0uthqt8OWHjkauXBZ+lSzxlXbRpKWBm88=; b=ctYYBOmvoWP0xnpSLIQZ1I8S5G
 aivWixe//ES4QxwQ/1GbNnAapRrXkxwe03UCfO1kCNAHk0FS22RqQhF8YGvx99ch0ULg2h0tNLTFw
 MIFny9jgiDkqySeqG4vonaVWppdXFEffCXqgbYFLXqFCy3BpF7Adht9aMLm4FR2yqrdw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUTpO-00Fci2-P8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 11:59:57 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDD8322268;
 Mon, 19 Oct 2020 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603108785;
 bh=xXDbAKNUCfLYB41p8lNKI+uLH9Q6GhC1oI5JuyCZbq0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MBdvLMQwLD8e4lGKoUJzoW64XIc/c33jJ34K8Irt502/bAAsXzmonvcLzSvkJcw4g
 xfZsagWWyCuPTIfjqzkUvgH1mV8iUZ96yHr0OQjcxEEv4wIX/a+Pps5gv6VnjMzhfN
 DuUCq2T7Vn+sAH9HkuXnwmv7yakAUsh1j3oVOQgc=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUTpH-002PRY-0I; Mon, 19 Oct 2020 12:59:43 +0100
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 12:59:42 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <1602673931-28782-4-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-4-git-send-email-sumit.garg@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1c68b74251dc72b0cd74706280ea96f7@kernel.org>
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
X-Headers-End: 1kUTpO-00Fci2-P8
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 catalin.marinas@arm.com, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-14 12:12, Sumit Garg wrote:
> Allocate an unused IPI that can be turned as NMI using ipi_nmi 
> framework.

This doesn't do any allocation, as far as I can see. It relies on
the initial grant from the interrupt controller to be larger than
what the kernel currently uses.

> Also, invoke corresponding NMI setup/teardown APIs.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/kernel/smp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 82e75fc..129ebfb 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -43,6 +43,7 @@
>  #include <asm/daifflags.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/mmu_context.h>
> +#include <asm/nmi.h>
>  #include <asm/numa.h>
>  #include <asm/processor.h>
>  #include <asm/smp_plat.h>
> @@ -962,6 +963,8 @@ static void ipi_setup(int cpu)
> 
>  	for (i = 0; i < nr_ipi; i++)
>  		enable_percpu_irq(ipi_irq_base + i, 0);
> +
> +	ipi_nmi_setup(cpu);
>  }
> 
>  #ifdef CONFIG_HOTPLUG_CPU
> @@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
> 
>  	for (i = 0; i < nr_ipi; i++)
>  		disable_percpu_irq(ipi_irq_base + i);
> +
> +	ipi_nmi_teardown(cpu);
>  }
>  #endif
> 
> @@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>  		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
>  	}
> 
> +	if (n > nr_ipi)
> +		set_smp_ipi_nmi(ipi_base + nr_ipi);
> +
>  	ipi_irq_base = ipi_base;
> 
>  	/* Setup the boot CPU immediately */

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
