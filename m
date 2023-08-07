Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7E771D7C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 11:50:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSwsp-0006S6-4T
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 09:50:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSwsn-0006S0-Iq
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 09:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73dP15BuS0YyohjzvuTaNa9POKGz6VfB6MV1dNoawWM=; b=O4VX5xEQJ99O2qicEpttQ1Wg7V
 4Y27hohIG9RadMZE3J5AMCTiJ8mysN6tajrnlT/g/TpoZ34Xl6MplbYc+K8ESOy4YvihdiCWYRuWo
 3XWyaci6rnNZPN+geXkuNwj5HNkZlPQubmB3QJBS3URrdLMm7pk9uBPdPNDwJxqc9dAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=73dP15BuS0YyohjzvuTaNa9POKGz6VfB6MV1dNoawWM=; b=KQRMpb8XHFnKUdfeI349FuAeFe
 fJknOYQuEvcZbE9PZyPo+ikNEQ1+FXz409EY5JOloyVz+PeuiZFzhlOa22GGKql7s0Hjfv2DIktVV
 CdD6921goM2DyFOD3O+XNy+E48WlSKs1h/B3NNH+6vBG739o9Tkjy/fuhplEDDZEcIck=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSwsn-0004U7-2W for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 09:50:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 990C31FB;
 Mon,  7 Aug 2023 02:51:13 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE1003F59C;
 Mon,  7 Aug 2023 02:50:27 -0700 (PDT)
Date: Mon, 7 Aug 2023 10:50:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>
Message-ID: <ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601143109.v9.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Doug, On Thu, Jun 01, 2023 at 02:31:45PM -0700, Douglas
 Anderson wrote: > From: Sumit Garg <sumit.garg@linaro.org> > > Add support
 to handle SGIs as pseudo NMIs. As SGIs or IPIs default to a > special flow
 [...] Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qSwsn-0004U7-2W
Subject: Re: [Kgdb-bugreport] [PATCH v9 1/7] irqchip/gic-v3: Enable support
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On Thu, Jun 01, 2023 at 02:31:45PM -0700, Douglas Anderson wrote:
> From: Sumit Garg <sumit.garg@linaro.org>
> 
> Add support to handle SGIs as pseudo NMIs. As SGIs or IPIs default to a
> special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
> handler update in case of SGIs.

I couldn't find handle_percpu_devid_fasteoi_ipi() in mainline, and when
researching I found that we changed that in commit:

  6abbd6988971aaa6 ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()")

... which was in v5.11, so it looks like this is stale?

Since that commit, SGIs are treated the same as PPIs/EPPIs, and use
handle_percpu_devid_irq() by default.

IIUC handle_percpu_devid_irq() isn't NMI safe, and so to run in an NMI context
those should use handle_percpu_devid_fasteoi_nmi().

Marc, does that sound right to you? i.e. SGI NMIs should be handled exactly the
same as PPI NMIs, and use handle_percpu_devid_fasteoi_nmi()?

I have some comments below assuming that SGI NMIs should use
handle_percpu_devid_fasteoi_nmi().

> Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> as IRQs/NMIs happen as part of this routine.

This bit looks fine to me.

> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> Tested-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/irqchip/irq-gic-v3.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 0c6c1af9a5b7..ed37e02d4c5f 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -525,6 +525,7 @@ static u32 gic_get_ppi_index(struct irq_data *d)
>  static int gic_irq_nmi_setup(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
> +	u32 idx;
>  
>  	if (!gic_supports_nmi())
>  		return -EINVAL;
> @@ -542,16 +543,22 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  		return -EINVAL;
>  
>  	/* desc lock should already be held */
> -	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +	switch (get_intid_range(d)) {
> +	case SGI_RANGE:
> +		break;
> +	case PPI_RANGE:
> +	case EPPI_RANGE:
> +		idx = gic_get_ppi_index(d);
>  
>  		/* Setting up PPI as NMI, only switch handler for first NMI */
>  		if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
>  			refcount_set(&ppi_nmi_refs[idx], 1);
>  			desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
>  		}
> -	} else {
> +		break;
> +	default:
>  		desc->handle_irq = handle_fasteoi_nmi;
> +		break;
>  	}

As above, I reckon this isn't right, and we should treat all rdist interrupts
(which are all percpu) the same.

I reckon what we should be doing here is make ppi_nmi_refs cover all of the
rdist interrupts (e.g. make that rdist_nmi_refs, add a gic_get_rdist_idx()
helper), and then here have something like:

	if (gic_irq_in_rdist(d)) {
		u32 idx = gic_get_rdist_idx(d);

		/* 
		 * Setting up a percpu interrupt as NMI, only switch handler
		 * for first NMI
		 */
		if (!refcount_inc_not_zero(&rdist_nmi_refs[idx])) {
			refcount_set(&ppi_nmi_refs[idx], 1);
			desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
		}
	}

... as an aside, it'd be nicer if we could switch the handler at request time,
as then we wouldn't need the refcount at all, but I couldn't see a good irqchip
hook to hang that off, so I don't think that needs to change as a prerequisite.

>  
>  	gic_irq_set_prio(d, GICD_INT_NMI_PRI);
> @@ -562,6 +569,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  static void gic_irq_nmi_teardown(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
> +	u32 idx;
>  
>  	if (WARN_ON(!gic_supports_nmi()))
>  		return;
> @@ -579,14 +587,20 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  		return;
>  
>  	/* desc lock should already be held */
> -	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +	switch (get_intid_range(d)) {
> +	case SGI_RANGE:
> +		break;
> +	case PPI_RANGE:
> +	case EPPI_RANGE:
> +		idx = gic_get_ppi_index(d);
>  
>  		/* Tearing down NMI, only switch handler for last NMI */
>  		if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
>  			desc->handle_irq = handle_percpu_devid_irq;
> -	} else {
> +		break;
> +	default:
>  		desc->handle_irq = handle_fasteoi_irq;
> +		break;
>  	}

Same comments as for gic_irq_nmi_setup() here.

>  
>  	gic_irq_set_prio(d, GICD_INT_DEF_PRI);
> @@ -2001,6 +2015,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  
>  	gic_dist_init();
>  	gic_cpu_init();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
>  
> @@ -2013,8 +2028,6 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  			gicv2m_init(handle, gic_data.domain);
>  	}
>  
> -	gic_enable_nmi_support();
> -

This bit looks fine to me.

Thanks,
Mark.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
