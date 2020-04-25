Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F001B9F45
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 11:02:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jSzfB-0006tt-HX
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 09:02:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1jSI4V-0002kf-Ao
 for kgdb-bugreport@lists.sourceforge.net; Sat, 25 Apr 2020 10:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EqV/MWAT91296bnKO1DJAWHE0DBdvVQwaNf4ygkEito=; b=Sgq3dkdq4UiYY6/EvoOm2WdwoN
 L1bCWsjkqrC1R3ETOJjipDRp809+j/mAUg7aM/CS1x0+cNhfZsCVI7u6D0Wl3vEOMUQddfirsyTrz
 O8TSYRUYoNi0rgC8IS+uXF2QrsyLxnIlss4/LEf92stYfl4uAOW4Hv1noCysL6HXAm4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EqV/MWAT91296bnKO1DJAWHE0DBdvVQwaNf4ygkEito=; b=LdaM5WhI3ZatdRum26Ly8rpZI/
 UG69WjCq/iqzDUGoh+EejVJRVHqmuq19pEtZmCP//c/DIMuAtM246xKqS7VRPWfzER4C2HWsd+ISi
 KMj27+Cmdf8V4tvPpSXdFNjSV3YSn1WY6kTl746L3N9veVYnbQ5+ysUKeFvVTaG91KdA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jSI4T-00AQ05-34
 for kgdb-bugreport@lists.sourceforge.net; Sat, 25 Apr 2020 10:30:07 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E0D4206ED;
 Sat, 25 Apr 2020 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587810593;
 bh=OnIlYiQte8vLjVIxAMAdY+TpiPpcVzuY5O1fmTyq7+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bv0ALoEnQatFldA7tqW0d52kgR5KLG0rtNDWuoE/MoLoUmFYrh7hOVz0gO+WAxuvI
 256JDSv6GV/cKQUauCGL5kLz252R3HMn063bNpPBw0CE0vDVASgTpDGJXbnpULI9jS
 MyTz8uzhhm6IeMdtJcKZ25Y0nhhCasKapE3X8KP8=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jSI4F-006HcM-RZ; Sat, 25 Apr 2020 11:29:51 +0100
Date: Sat, 25 Apr 2020 11:29:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200425112950.3a4815b6@why>
In-Reply-To: <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 jason@lakedaemon.net, julien.thierry.kdev@gmail.com, dianders@chromium.org,
 daniel.thompson@linaro.org, jason.wessel@windriver.com,
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jSI4T-00AQ05-34
X-Mailman-Approved-At: Mon, 27 Apr 2020 09:02:51 +0000
Subject: Re: [Kgdb-bugreport] [RFC Patch v1 2/4] irqchip/gic-v3: Add support
 to handle SGI as pseudo NMI
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 24 Apr 2020 16:39:12 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

Hi Sumit,

> With pseudo NMIs enabled, interrupt controller can be configured to
> deliver SGI as a pseudo NMI. So add corresponding handling for SGIs.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/irqchip/irq-gic-v3.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index d7006ef..be361bf 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -609,17 +609,29 @@ static inline void gic_handle_nmi(u32 irqnr, struct pt_regs *regs)
>  	if (irqs_enabled)
>  		nmi_enter();
>  
> -	if (static_branch_likely(&supports_deactivate_key))
> -		gic_write_eoir(irqnr);
>  	/*
>  	 * Leave the PSR.I bit set to prevent other NMIs to be
>  	 * received while handling this one.
>  	 * PSR.I will be restored when we ERET to the
>  	 * interrupted context.
>  	 */
> -	err = handle_domain_nmi(gic_data.domain, irqnr, regs);
> -	if (err)
> -		gic_deactivate_unhandled(irqnr);
> +	if (likely(irqnr > 15)) {
> +		if (static_branch_likely(&supports_deactivate_key))
> +			gic_write_eoir(irqnr);
> +
> +		err = handle_domain_nmi(gic_data.domain, irqnr, regs);
> +		if (err)
> +			gic_deactivate_unhandled(irqnr);
> +	} else {
> +		gic_write_eoir(irqnr);
> +		if (static_branch_likely(&supports_deactivate_key))
> +			gic_write_dir(irqnr);
> +#ifdef CONFIG_SMP
> +		handle_IPI(irqnr, regs);
> +#else
> +		WARN_ONCE(true, "Unexpected SGI received!\n");
> +#endif
> +	}
>  
>  	if (irqs_enabled)
>  		nmi_exit();

If there is one thing I would like to avoid, it is to add more ugly
hacks to the way we handle SGIs. There is very little reason why SGIs
should be handled differently from all other interrupts. They have the
same properties, and it is only because of the 32bit legacy that we deal
with them in such a cumbersome way. Nothing that we cannot fix though.

What I would really like to see is first a conversion of the SGIs to
normal, full fat interrupts. These interrupts can then be configured as
NMI using the normal API.

I think Julien had something along these lines (or was that limited to
the PMU?). Otherwise, I'll happily help you with that.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
