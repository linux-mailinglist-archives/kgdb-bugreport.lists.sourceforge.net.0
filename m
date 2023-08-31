Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA178E8D6
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 10:54:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbdR7-0002TS-Tz
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 08:53:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qbdR5-0002SA-OE
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 08:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yKCGvcAQxsPG6f+q9pyBdI9r7z7PsdP9Cixr3qDnEfg=; b=hxkJ/XC7BCQINOiRSoB8P4QKwe
 m42JlpYfkx8tuAvcudrjQhg01lcHO4x4kVWzrpgzU2mYqzUi7CGv7SxSxD94UaEJxOuC1RHHNGcFb
 iK3r3h4PV0CibcCbmVJu3sc4uYKIZA8MWjw8t56Kai/HqpaoSbKN2DpQDbjVCqKdGmo8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yKCGvcAQxsPG6f+q9pyBdI9r7z7PsdP9Cixr3qDnEfg=; b=fxG54p4PoPFVzbkc8fnRQ22x+6
 uGdLOWROr2PDn4yBEzJvYEZIJHHB/uwSbz0du2DfFJjFsP8W3YpYiiTexOaUxKecy4CRcoZ7yJnrq
 BKiwO8OyqIbJ6n7x6v2ls4O0kOdcqSGQbP7EpOGAqNpAfOV8YxDiUVosih2l213DQzp0=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qbdR5-00067X-8F for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 08:53:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23063C15;
 Thu, 31 Aug 2023 01:54:29 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.3.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A85423F738;
 Thu, 31 Aug 2023 01:53:46 -0700 (PDT)
Date: Thu, 31 Aug 2023 09:53:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZPBVB_z3FTl2nBy0@FVFF77S0Q05N>
References: <20230830191314.1618136-1-dianders@chromium.org>
 <20230830121115.v12.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830121115.v12.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 30, 2023 at 12:11:22PM -0700, Douglas Anderson
 wrote: > As of commit 6abbd6988971 ("irqchip/gic, gic-v3: Make SGIs use >
 handle_percpu_devid_irq()") SGIs are treated the same as PPIs/EPPIs [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qbdR5-00067X-8F
Subject: Re: [Kgdb-bugreport] [PATCH v12 1/7] irqchip/gic-v3: Enable support
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 30, 2023 at 12:11:22PM -0700, Douglas Anderson wrote:
> As of commit 6abbd6988971 ("irqchip/gic, gic-v3: Make SGIs use
> handle_percpu_devid_irq()") SGIs are treated the same as PPIs/EPPIs
> and use handle_percpu_devid_irq() by default. Unfortunately,
> handle_percpu_devid_irq() isn't NMI safe, and so to run in an NMI
> context those should use handle_percpu_devid_fasteoi_nmi().
> 
> In order to accomplish this, we just have to make room for SGIs in the
> array of refcounts that keeps track of which interrupts are set as
> NMI. We also rename the array and create a new indexing scheme that
> accounts for SGIs.
> 
> Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> as IRQs/NMIs happen as part of this routine.
> 
> Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I'll note that this change is a little more black magic to me than
> others in this series. I don't have a massive amounts of familiarity
> with all the moving parts of gic-v3, so I mostly just followed Mark
> Rutland's advice [1]. Please pay extra attention to make sure I didn't
> do anything too terrible.
> 
> Mark's advice wasn't a full patch and I ended up doing a bit of work
> to translate it to reality, so I did not add him as "Co-developed-by"
> here. Mark: if you would like this tag then please provide it and your
> Signed-off-by. I certainly won't object.

That's all reasonable, and I'm perfectly happy without a tag.

I have one trivial nit below, but with or without that fixed up:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> 
> [1] https://lore.kernel.org/r/ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com
> 
> Changes in v12:
> - Added a comment about why we account for 16 SGIs when Linux uses 8.
> 
> Changes in v10:
> - Rewrite as needed for 5.11+ as per Mark Rutland and Sumit.
> 
>  drivers/irqchip/irq-gic-v3.c | 59 +++++++++++++++++++++++++-----------
>  1 file changed, 41 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index eedfa8e9f077..8d20122ba0a8 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -78,6 +78,13 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
>  #define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
>  #define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
>  
> +/*
> + * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
> + * are potentially stolen by the secure side. Some code, especially code dealing
> + * with hwirq IDs, is simplified by accounting for all 16.
> + */
> +#define SGI_NR		16
> +
>  /*
>   * The behaviours of RPR and PMR registers differ depending on the value of
>   * SCR_EL3.FIQ, and the behaviour of non-secure priority registers of the
> @@ -125,8 +132,8 @@ EXPORT_SYMBOL(gic_nonsecure_priorities);
>  		__priority;						\
>  	})
>  
> -/* ppi_nmi_refs[n] == number of cpus having ppi[n + 16] set as NMI */
> -static refcount_t *ppi_nmi_refs;
> +/* rdist_nmi_refs[n] == number of cpus having the rdist interrupt n set as NMI */
> +static refcount_t *rdist_nmi_refs;
>  
>  static struct gic_kvm_info gic_v3_kvm_info __initdata;
>  static DEFINE_PER_CPU(bool, has_rss);
> @@ -519,9 +526,22 @@ static u32 __gic_get_ppi_index(irq_hw_number_t hwirq)
>  	}
>  }
>  
> -static u32 gic_get_ppi_index(struct irq_data *d)
> +static u32 __gic_get_rdist_idx(irq_hw_number_t hwirq)
> +{
> +	switch (__get_intid_range(hwirq)) {
> +	case SGI_RANGE:
> +	case PPI_RANGE:
> +		return hwirq;
> +	case EPPI_RANGE:
> +		return hwirq - EPPI_BASE_INTID + 32;
> +	default:
> +		unreachable();
> +	}
> +}
> +
> +static u32 gic_get_rdist_idx(struct irq_data *d)
>  {
> -	return __gic_get_ppi_index(d->hwirq);
> +	return __gic_get_rdist_idx(d->hwirq);
>  }

Nit: It would be nicer to call this gic_get_rdist_index() to match
gic_get_ppi_index(); likewise with __gic_get_rdist_index().

That's my fault given I suggested the gic_get_rdist_idx() name in:

  https://lore.kernel.org/linux-arm-kernel/ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com/

... so sorry about that!

Mark.

>  
>  static int gic_irq_nmi_setup(struct irq_data *d)
> @@ -545,11 +565,14 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  
>  	/* desc lock should already be held */
>  	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +		u32 idx = gic_get_rdist_idx(d);
>  
> -		/* Setting up PPI as NMI, only switch handler for first NMI */
> -		if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
> -			refcount_set(&ppi_nmi_refs[idx], 1);
> +		/*
> +		 * Setting up a percpu interrupt as NMI, only switch handler
> +		 * for first NMI
> +		 */
> +		if (!refcount_inc_not_zero(&rdist_nmi_refs[idx])) {
> +			refcount_set(&rdist_nmi_refs[idx], 1);
>  			desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
>  		}
>  	} else {
> @@ -582,10 +605,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  
>  	/* desc lock should already be held */
>  	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +		u32 idx = gic_get_rdist_idx(d);
>  
>  		/* Tearing down NMI, only switch handler for last NMI */
> -		if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
> +		if (refcount_dec_and_test(&rdist_nmi_refs[idx]))
>  			desc->handle_irq = handle_percpu_devid_irq;
>  	} else {
>  		desc->handle_irq = handle_fasteoi_irq;
> @@ -1279,10 +1302,10 @@ static void gic_cpu_init(void)
>  	rbase = gic_data_rdist_sgi_base();
>  
>  	/* Configure SGIs/PPIs as non-secure Group-1 */
> -	for (i = 0; i < gic_data.ppi_nr + 16; i += 32)
> +	for (i = 0; i < gic_data.ppi_nr + SGI_NR; i += 32)
>  		writel_relaxed(~0, rbase + GICR_IGROUPR0 + i / 8);
>  
> -	gic_cpu_config(rbase, gic_data.ppi_nr + 16, gic_redist_wait_for_rwp);
> +	gic_cpu_config(rbase, gic_data.ppi_nr + SGI_NR, gic_redist_wait_for_rwp);
>  
>  	/* initialise system registers */
>  	gic_cpu_sys_reg_init();
> @@ -1939,12 +1962,13 @@ static void gic_enable_nmi_support(void)
>  		return;
>  	}
>  
> -	ppi_nmi_refs = kcalloc(gic_data.ppi_nr, sizeof(*ppi_nmi_refs), GFP_KERNEL);
> -	if (!ppi_nmi_refs)
> +	rdist_nmi_refs = kcalloc(gic_data.ppi_nr + SGI_NR,
> +				 sizeof(*rdist_nmi_refs), GFP_KERNEL);
> +	if (!rdist_nmi_refs)
>  		return;
>  
> -	for (i = 0; i < gic_data.ppi_nr; i++)
> -		refcount_set(&ppi_nmi_refs[i], 0);
> +	for (i = 0; i < gic_data.ppi_nr + SGI_NR; i++)
> +		refcount_set(&rdist_nmi_refs[i], 0);
>  
>  	pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
>  		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
> @@ -2061,6 +2085,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  
>  	gic_dist_init();
>  	gic_cpu_init();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
>  
> @@ -2073,8 +2098,6 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>  			gicv2m_init(handle, gic_data.domain);
>  	}
>  
> -	gic_enable_nmi_support();
> -
>  	return 0;
>  
>  out_free:
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
