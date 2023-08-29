Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FED78C2E8
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 29 Aug 2023 13:01:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qawTp-0003qi-2z
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 29 Aug 2023 11:01:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1qawTo-0003qc-07
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 11:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hVBkVLH3QC7fHZ/BEssrc+xOo41yz88ko37ylycWuSU=; b=jv+yu6ra5td4tuh+IrkMHFxuv+
 NwiVtuom0wzyke4RO/fwbxY2oUd3bO+dXercbCJc3Q+Cke2PChQviOpJ/ZnYIOUISNsMLQHIfx/jN
 kcUMLB7vfYrTx+IaBRctbWE4ZcuK8heV3KxTkl54IYvtWrad1A6OZjFUiTVbdva5z8Pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hVBkVLH3QC7fHZ/BEssrc+xOo41yz88ko37ylycWuSU=; b=BflVfHTxk9Aq4U3FG0dxdMSZ/7
 G3h0qUriIJSpcR3qW6Cxq2kKYnl6CVDdtjADp3pgEMN2sQRoFOZ9GtbFz/YOx73ZugSHaDzoKMRQP
 dVqouoH0EelQ49urDYfbCWoXiPoTom0/1QATFTDb/E9sUPzL9SAMWyj6g9LWvfM3WjnQ=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qawTk-0006Gw-Uz for kgdb-bugreport@lists.sourceforge.net;
 Tue, 29 Aug 2023 11:01:52 +0000
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d7b79a4899bso244153276.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 29 Aug 2023 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693306903; x=1693911703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hVBkVLH3QC7fHZ/BEssrc+xOo41yz88ko37ylycWuSU=;
 b=z7osrj5YzFrT3+K+bst7V8pIhHk7LS/XqujZ0jNHO9sYnfsw3scPL1/OV1AALKGNLY
 ssyVBkEKUwcM/Sc0XxCcMT7nflKZOhaPYj3rm4v3Uwd7yP9fhvjFWp5lfZjFdJe3ToeN
 Oi0momzH3K46iN5A4h7obeSkiJCzCQlXG7tqlPbLJxr/27YULMA2KAJDnZmWgKdu6Jep
 l20kpupXJFAWz4Hx0eNMdPvmwt0JRkL6fJnRy6RteXoJLZYM9Pz75+UqjpN0kRhuAjcx
 3eKnwXSQPXGsgT24rrILlsT7vb7SskTqVycTyjBHhFJqVnzB7Pkuf01QEKEu8PZDoU2d
 es3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306903; x=1693911703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hVBkVLH3QC7fHZ/BEssrc+xOo41yz88ko37ylycWuSU=;
 b=jrYUJSP2qQ9Q18g6UTMBiQujiwunLxT83G0iZCecZgpyf9SEQyXk8GriZyPm3tNkGY
 +JtBF3+PqPRz4KO+E0VCNZzPSiy3s7uCrlUbxB0fIbB/Q2VR0l0WSdb3Aq+ws2brfZJ2
 II8Uck5pZTBPOxJDFBK/Z3uCfMProKXeW3EsmUYkb0ubDwuDWXsRMLaxAQeL99GdI4mc
 70Y52sI9fb3qI7yjHbSELZ0eSoObOsFlNwhnKZfer17ejfcR6m7rRc4XeC5PIc+tRYTH
 oHukdaFFPUjI8qCbt7iTycWbKLiFNQITUgjlj1xrvKtwfRvw3G2Vg9x17McWn0ScbQlg
 +ShQ==
X-Gm-Message-State: AOJu0YzbW+kU3z5TyoRpA0d7+2tU6+cKz8JUiL/3WCu2bl/HFMq9MR3A
 i1gXiGyz5c3CtHdMWxUJOm1Lh7OP+uqgaycmr6fv2H/1cdr1VyHB
X-Google-Smtp-Source: AGHT+IHrytUJH5I8zDaQ5yGNluZPFNS9cgWFNHOsNNTu4Do+ZfLoGsBEhECaztap0PP4+h41sb3j5k/P8KpBhAaNXrM=
X-Received: by 2002:a05:6102:b09:b0:44f:c528:6252 with SMTP id
 b9-20020a0561020b0900b0044fc5286252mr248799vst.2.1693305401145; Tue, 29 Aug
 2023 03:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
In-Reply-To: <20230824083012.v11.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 29 Aug 2023 16:06:30 +0530
Message-ID: <CAFA6WYO7u5WTS8dfzqPUcLpHWTH+3sMNVL-9ob0stHE_nJw24Q@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 24 Aug 2023 at 21:03,
 Douglas Anderson <dianders@chromium.org>
 wrote: > > As of commit 6abbd6988971 ("irqchip/gic, gic-v3: Make SGIs use
 > handle_percpu_devid_irq()") SGIs are treated the same [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qawTk-0006Gw-Uz
Subject: Re: [Kgdb-bugreport] [PATCH v11 1/6] irqchip/gic-v3: Enable support
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 24 Aug 2023 at 21:03, Douglas Anderson <dianders@chromium.org> wrote:
>
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
> In v10 I removed the previous Reviewed-by and Tested-by tags since the
> patch contents changed pretty drastically.
>
> I'll also note that this change is a little more black magic to me
> than others in this series. I don't have a massive amounts of
> familiarity with all the moving parts of gic-v3, so I mostly just
> followed Mark Rutland's advice [1]. Please pay extra attention to make
> sure I didn't do anything too terrible.

The changes look good to me. I am not sure if my review tag will be
valuable here since I am a co-developer here.

-Sumit

>
> Mark's advice wasn't a full patch and I ended up doing a bit of work
> to translate it to reality, so I did not add him as "Co-developed-by"
> here. Mark: if you would like this tag then please provide it and your
> Signed-off-by. I certainly won't object.
>
> [1] https://lore.kernel.org/r/ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com
>
> (no changes since v10)
>
> Changes in v10:
> - Rewrite as needed for 5.11+ as per Mark Rutland and Sumit.
>
>  drivers/irqchip/irq-gic-v3.c | 54 ++++++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index eedfa8e9f077..49d18cf3f636 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -78,6 +78,8 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
>  #define GIC_LINE_NR    min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
>  #define GIC_ESPI_NR    GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
>
> +#define SGI_NR         16
> +
>  /*
>   * The behaviours of RPR and PMR registers differ depending on the value of
>   * SCR_EL3.FIQ, and the behaviour of non-secure priority registers of the
> @@ -125,8 +127,8 @@ EXPORT_SYMBOL(gic_nonsecure_priorities);
>                 __priority;                                             \
>         })
>
> -/* ppi_nmi_refs[n] == number of cpus having ppi[n + 16] set as NMI */
> -static refcount_t *ppi_nmi_refs;
> +/* rdist_nmi_refs[n] == number of cpus having the rdist interrupt n set as NMI */
> +static refcount_t *rdist_nmi_refs;
>
>  static struct gic_kvm_info gic_v3_kvm_info __initdata;
>  static DEFINE_PER_CPU(bool, has_rss);
> @@ -519,9 +521,22 @@ static u32 __gic_get_ppi_index(irq_hw_number_t hwirq)
>         }
>  }
>
> -static u32 gic_get_ppi_index(struct irq_data *d)
> +static u32 __gic_get_rdist_idx(irq_hw_number_t hwirq)
> +{
> +       switch (__get_intid_range(hwirq)) {
> +       case SGI_RANGE:
> +       case PPI_RANGE:
> +               return hwirq;
> +       case EPPI_RANGE:
> +               return hwirq - EPPI_BASE_INTID + 32;
> +       default:
> +               unreachable();
> +       }
> +}
> +
> +static u32 gic_get_rdist_idx(struct irq_data *d)
>  {
> -       return __gic_get_ppi_index(d->hwirq);
> +       return __gic_get_rdist_idx(d->hwirq);
>  }
>
>  static int gic_irq_nmi_setup(struct irq_data *d)
> @@ -545,11 +560,14 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>
>         /* desc lock should already be held */
>         if (gic_irq_in_rdist(d)) {
> -               u32 idx = gic_get_ppi_index(d);
> +               u32 idx = gic_get_rdist_idx(d);
>
> -               /* Setting up PPI as NMI, only switch handler for first NMI */
> -               if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
> -                       refcount_set(&ppi_nmi_refs[idx], 1);
> +               /*
> +                * Setting up a percpu interrupt as NMI, only switch handler
> +                * for first NMI
> +                */
> +               if (!refcount_inc_not_zero(&rdist_nmi_refs[idx])) {
> +                       refcount_set(&rdist_nmi_refs[idx], 1);
>                         desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
>                 }
>         } else {
> @@ -582,10 +600,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>
>         /* desc lock should already be held */
>         if (gic_irq_in_rdist(d)) {
> -               u32 idx = gic_get_ppi_index(d);
> +               u32 idx = gic_get_rdist_idx(d);
>
>                 /* Tearing down NMI, only switch handler for last NMI */
> -               if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
> +               if (refcount_dec_and_test(&rdist_nmi_refs[idx]))
>                         desc->handle_irq = handle_percpu_devid_irq;
>         } else {
>                 desc->handle_irq = handle_fasteoi_irq;
> @@ -1279,10 +1297,10 @@ static void gic_cpu_init(void)
>         rbase = gic_data_rdist_sgi_base();
>
>         /* Configure SGIs/PPIs as non-secure Group-1 */
> -       for (i = 0; i < gic_data.ppi_nr + 16; i += 32)
> +       for (i = 0; i < gic_data.ppi_nr + SGI_NR; i += 32)
>                 writel_relaxed(~0, rbase + GICR_IGROUPR0 + i / 8);
>
> -       gic_cpu_config(rbase, gic_data.ppi_nr + 16, gic_redist_wait_for_rwp);
> +       gic_cpu_config(rbase, gic_data.ppi_nr + SGI_NR, gic_redist_wait_for_rwp);
>
>         /* initialise system registers */
>         gic_cpu_sys_reg_init();
> @@ -1939,12 +1957,13 @@ static void gic_enable_nmi_support(void)
>                 return;
>         }
>
> -       ppi_nmi_refs = kcalloc(gic_data.ppi_nr, sizeof(*ppi_nmi_refs), GFP_KERNEL);
> -       if (!ppi_nmi_refs)
> +       rdist_nmi_refs = kcalloc(gic_data.ppi_nr + SGI_NR,
> +                                sizeof(*rdist_nmi_refs), GFP_KERNEL);
> +       if (!rdist_nmi_refs)
>                 return;
>
> -       for (i = 0; i < gic_data.ppi_nr; i++)
> -               refcount_set(&ppi_nmi_refs[i], 0);
> +       for (i = 0; i < gic_data.ppi_nr + SGI_NR; i++)
> +               refcount_set(&rdist_nmi_refs[i], 0);
>
>         pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
>                 gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
> @@ -2061,6 +2080,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>
>         gic_dist_init();
>         gic_cpu_init();
> +       gic_enable_nmi_support();
>         gic_smp_init();
>         gic_cpu_pm_init();
>
> @@ -2073,8 +2093,6 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
>                         gicv2m_init(handle, gic_data.domain);
>         }
>
> -       gic_enable_nmi_support();
> -
>         return 0;
>
>  out_free:
> --
> 2.42.0.rc1.204.g551eb34607-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
