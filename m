Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E50DE2926FC
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Oct 2020 14:08:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUTxP-0006Bt-MO
	for lists+kgdb-bugreport@lfdr.de; Mon, 19 Oct 2020 12:08:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUTxN-0006Bl-Dt
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 12:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vE9GwtCaEAv7xHKMa8aVfk5PcwIMwco5+K0npPhI9I=; b=QU/aYtzI08pVMyTQMIeUGtnq0A
 7B4SgTSb3YqKbwxGmCvms/MU9idGudGntwYkQLOiRKUOQcE75hK1A0ea8p2HLPy7OwTLu2fMTRcZe
 8fJ2DsNlMLkYvuMlf0o+/8MQ+h3YAVbwQ1VYOZjeHF7PRk0L7VJxtYwfJgk71haZB0T4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vE9GwtCaEAv7xHKMa8aVfk5PcwIMwco5+K0npPhI9I=; b=PYjyodBrgj12YceKkS60mDBfq6
 45ONJ31IpuMGZUBoXij5bahcIhQEoM9wnx6QuzJQUyfEVSAKYY3uDUXpH20KsjZ7QSpCus2V8ylA7
 qza39sekOY6lGqdUO7g2YwQoknC8Mp8BpAiuGLBmqfAOFnFi2QXOVcFqmPqiuFViSlxY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUTxI-00FdIx-Us
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 12:08:04 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FD8022268;
 Mon, 19 Oct 2020 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603109275;
 bh=3noPGpjp762hGnSUK70UPaaIzFQ7lKiB2FH5eZtTlDA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M5/YtPqHbtKAUgR3DwCSgfAQrTvVxmEmF1S2YqDLubx0IY5tVxtoFsssvrSZACO+a
 beI8MXzHo4/ZVTJTiOsBExKnM9w5CnxFSTovxPz1GuV0u0NjeCFzhvs5uE96RIvHD+
 ZCItI/8nzgIoheRq36gteJpuqNH6LkVi86aleRZ8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUTxB-002PXG-Bu; Mon, 19 Oct 2020 13:07:53 +0100
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 13:07:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <1602673931-28782-3-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-3-git-send-email-sumit.garg@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <294754db12f4cd8a8ec9329a44e1cf02@kernel.org>
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
X-Headers-End: 1kUTxI-00FdIx-Us
Subject: Re: [Kgdb-bugreport] [PATCH v5 2/5] irqchip/gic-v3: Enable support
 for SGIs to act as NMIs
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
> Add support to handle SGIs as regular NMIs. As SGIs or IPIs defaults to 
> a

There is nothing "regular" about NMIs. Drop "or IPIs". 
s/defaults/default/

> special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
> handler update in case of SGIs.
> 
> Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> as IRQs/NMIs happen as part of this routine.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/irqchip/irq-gic-v3.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c 
> b/drivers/irqchip/irq-gic-v3.c
> index 16fecc0..5efc865 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -477,6 +477,11 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  	if (WARN_ON(gic_irq(d) >= 8192))
>  		return -EINVAL;
> 
> +	if (get_intid_range(d) == SGI_RANGE) {
> +		gic_irq_set_prio(d, GICD_INT_NMI_PRI);
> +		return 0;
> +	}
> +

Please follow the existing control flow, or rework it to be organised by 
range.

>  	/* desc lock should already be held */
>  	if (gic_irq_in_rdist(d)) {
>  		u32 idx = gic_get_ppi_index(d);
> @@ -514,6 +519,11 @@ static void gic_irq_nmi_teardown(struct irq_data 
> *d)
>  	if (WARN_ON(gic_irq(d) >= 8192))
>  		return;
> 
> +	if (get_intid_range(d) == SGI_RANGE) {
> +		gic_irq_set_prio(d, GICD_INT_DEF_PRI);
> +		return;
> +	}

Same here.

> +
>  	/* desc lock should already be held */
>  	if (gic_irq_in_rdist(d)) {
>  		u32 idx = gic_get_ppi_index(d);
> @@ -1708,6 +1718,7 @@ static int __init gic_init_bases(void __iomem 
> *dist_base,
> 
>  	gic_dist_init();
>  	gic_cpu_init();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
> 
> @@ -1719,8 +1730,6 @@ static int __init gic_init_bases(void __iomem 
> *dist_base,
>  			gicv2m_init(handle, gic_data.domain);
>  	}
> 
> -	gic_enable_nmi_support();
> -
>  	return 0;
> 
>  out_free:

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
