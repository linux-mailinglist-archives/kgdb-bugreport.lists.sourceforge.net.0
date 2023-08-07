Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173877223F
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 13:30:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSyRn-0004YV-Cw
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 11:30:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1qSyRl-0004YP-R2
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iMLr1Gc880uh/ZHXumz1rEhP4HlyB4PKNyXqL+18D8M=; b=FbzuFKONs7OkFlqZr5Btd+ahdt
 ZsIHgs4AdGydbYcNP+GwpItwLJ6j0O8rfOnhwZbMr2qiq31AN7iXzU7vKw/HPLKQPxHDLIjOMFNFe
 +eDje0mT1xUerL3sIFkgqqiiF2c7DKg1ORs3R2qXVfkO/M36mpHiM7eI2IKUy0Nj/sBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iMLr1Gc880uh/ZHXumz1rEhP4HlyB4PKNyXqL+18D8M=; b=LmTMVNTX7Uz+iGDtJ2jTUm11tH
 dUpJtkl2rbhhJvBuvdU7IaILMoUKq+KgL9wl9K0pzSOmQhvZ6SXMh2TuAo9yrPpiPsiTkTiF17AJh
 Fu/aCmOmVDDM5hRwDwDGmI6wKkV8iQQAibWapmK+liF+gfH8ypzQsWzsTYgJ/eDmHqE0=;
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSyRi-00009R-1X for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:30:50 +0000
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3a412653352so3026011b6e.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691407840; x=1692012640;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iMLr1Gc880uh/ZHXumz1rEhP4HlyB4PKNyXqL+18D8M=;
 b=DazH9UPbQJWcJfpgFcT4CnlS46LOMEAzd64K5u//CfnrvbwvaU36xtdGEA/+qcBKyd
 e1jPQkRtKCVh7BraF6EjXQDuBxQJNFIcbeU3xsvb/mToyOzR3LXJAMNkDM+ovKMo3LJT
 6X1Wpor9xko8meLGC8kDdwKKENO942RfFAbjbVGjS+0/UJ44OB2Xok4XAIuQRf8hpE9I
 wY3vEsaPpv9QVpNbxOUGWVTnwK6ASyLshDJEbX+cDtpU1uRyimBCivYkNOQypf+SgEE0
 tP4EPUvOr6GyzEDENCLLAesCKK+NcpH9Q+Sllw015/lb7H3wezI8Jv6jLx2W6+mS+J7G
 YbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691407840; x=1692012640;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMLr1Gc880uh/ZHXumz1rEhP4HlyB4PKNyXqL+18D8M=;
 b=EZ6jFIZCsaUIsacQDV+dK04xY5AbJLBlLL2DhZXFb9oo9LFBZii8qYtSZ8XqNXy/e7
 wxdsa0eti4IzUJ86R9xdPpaWYmoKHsO3pfILBBXDWo3SLi3txsBJ5k6LqwJpd1YDxwd4
 1CfG//RnrZnAmPPfCTFTciu0w/yudl+jQfz4flgnBAW7k0IeKV1C8lY/rhEWapXGAApw
 optCYPQRaA1HmqfcWTmRYUdTHmvddXtLYSIJeku+06hNRF/ZyRx9hq0RYnvyjcaTSa9c
 hidgS0LSy/zD84JtxxCRiF7M8lbmH74FDfbApigEIiP72dshFIqdyQgxc2zAVp8HeEcu
 tZAw==
X-Gm-Message-State: AOJu0YwysRl8dYHDDWprLpnIl6Dpo368hNcSsj7E9oTwYbPIKXw0rIcn
 mxPp6tfNZ6y2Ez05yDuQjpkoyaHj2khD3a2ukvDD4sRhXmEQpvQnY28=
X-Google-Smtp-Source: AGHT+IEj+i5FlUU3khAH/NnmUUvb6VWoy0zsekkbZJPac2ghU15i5jblnPnt8dkmw1sS5evkaKc3+45FPGj4U8a4MY8=
X-Received: by 2002:a05:6102:150:b0:437:e5ce:7e8f with SMTP id
 a16-20020a056102015000b00437e5ce7e8fmr4526221vsr.4.1691407371300; Mon, 07 Aug
 2023 04:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
 <ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 7 Aug 2023 16:52:40 +0530
Message-ID: <CAFA6WYN7SH83mnTPqBj9=hCakM=KJkor7fMQasdeBe6Ue5JXRg@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Mark, On Mon, 7 Aug 2023 at 15:20,
 Mark Rutland <mark.rutland@arm.com>
 wrote: > > Hi Doug, > > On Thu, Jun 01, 2023 at 02:31:45PM -0700, Douglas
 Anderson wrote: > > From: Sumit Garg <sumit.garg@linaro.org> [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qSyRi-00009R-1X
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
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Mark,

On Mon, 7 Aug 2023 at 15:20, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Doug,
>
> On Thu, Jun 01, 2023 at 02:31:45PM -0700, Douglas Anderson wrote:
> > From: Sumit Garg <sumit.garg@linaro.org>
> >
> > Add support to handle SGIs as pseudo NMIs. As SGIs or IPIs default to a
> > special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
> > handler update in case of SGIs.
>
> I couldn't find handle_percpu_devid_fasteoi_ipi() in mainline, and when
> researching I found that we changed that in commit:
>
>   6abbd6988971aaa6 ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()")
>
> ... which was in v5.11, so it looks like this is stale?

The last time I tested this patchset (v7 [1]) was with kernel
v5.9.0-rc3. So I agree with you that later
handle_percpu_devid_fasteoi_ipi() was removed and the SGI handling
flow almost became identical to PPI.

[1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-email-sumit.garg@linaro.org/

>
> Since that commit, SGIs are treated the same as PPIs/EPPIs, and use
> handle_percpu_devid_irq() by default.
>
> IIUC handle_percpu_devid_irq() isn't NMI safe, and so to run in an NMI context
> those should use handle_percpu_devid_fasteoi_nmi().

True.

>
> Marc, does that sound right to you? i.e. SGI NMIs should be handled exactly the
> same as PPI NMIs, and use handle_percpu_devid_fasteoi_nmi()?
>
> I have some comments below assuming that SGI NMIs should use
> handle_percpu_devid_fasteoi_nmi().
>

This sounds fine to me.

> > Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> > as IRQs/NMIs happen as part of this routine.
>
> This bit looks fine to me.
>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > Tested-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/irqchip/irq-gic-v3.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index 0c6c1af9a5b7..ed37e02d4c5f 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -525,6 +525,7 @@ static u32 gic_get_ppi_index(struct irq_data *d)
> >  static int gic_irq_nmi_setup(struct irq_data *d)
> >  {
> >       struct irq_desc *desc = irq_to_desc(d->irq);
> > +     u32 idx;
> >
> >       if (!gic_supports_nmi())
> >               return -EINVAL;
> > @@ -542,16 +543,22 @@ static int gic_irq_nmi_setup(struct irq_data *d)
> >               return -EINVAL;
> >
> >       /* desc lock should already be held */
> > -     if (gic_irq_in_rdist(d)) {
> > -             u32 idx = gic_get_ppi_index(d);
> > +     switch (get_intid_range(d)) {
> > +     case SGI_RANGE:
> > +             break;
> > +     case PPI_RANGE:
> > +     case EPPI_RANGE:
> > +             idx = gic_get_ppi_index(d);
> >
> >               /* Setting up PPI as NMI, only switch handler for first NMI */
> >               if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
> >                       refcount_set(&ppi_nmi_refs[idx], 1);
> >                       desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
> >               }
> > -     } else {
> > +             break;
> > +     default:
> >               desc->handle_irq = handle_fasteoi_nmi;
> > +             break;
> >       }
>
> As above, I reckon this isn't right, and we should treat all rdist interrupts
> (which are all percpu) the same.
>
> I reckon what we should be doing here is make ppi_nmi_refs cover all of the
> rdist interrupts (e.g. make that rdist_nmi_refs, add a gic_get_rdist_idx()
> helper), and then here have something like:
>
>         if (gic_irq_in_rdist(d)) {
>                 u32 idx = gic_get_rdist_idx(d);
>
>                 /*
>                  * Setting up a percpu interrupt as NMI, only switch handler
>                  * for first NMI
>                  */
>                 if (!refcount_inc_not_zero(&rdist_nmi_refs[idx])) {
>                         refcount_set(&ppi_nmi_refs[idx], 1);
>                         desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
>                 }
>         }

It looks like you missed the else part here as follows for all other
interrupt types:

         } else {
                 desc->handle_irq = handle_fasteoi_nmi;
         }

Apart from that, your logic sounds good to me.

-Sumit

>
> ... as an aside, it'd be nicer if we could switch the handler at request time,
> as then we wouldn't need the refcount at all, but I couldn't see a good irqchip
> hook to hang that off, so I don't think that needs to change as a prerequisite.
>
> >
> >       gic_irq_set_prio(d, GICD_INT_NMI_PRI);
> > @@ -562,6 +569,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
> >  static void gic_irq_nmi_teardown(struct irq_data *d)
> >  {
> >       struct irq_desc *desc = irq_to_desc(d->irq);
> > +     u32 idx;
> >
> >       if (WARN_ON(!gic_supports_nmi()))
> >               return;
> > @@ -579,14 +587,20 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
> >               return;
> >
> >       /* desc lock should already be held */
> > -     if (gic_irq_in_rdist(d)) {
> > -             u32 idx = gic_get_ppi_index(d);
> > +     switch (get_intid_range(d)) {
> > +     case SGI_RANGE:
> > +             break;
> > +     case PPI_RANGE:
> > +     case EPPI_RANGE:
> > +             idx = gic_get_ppi_index(d);
> >
> >               /* Tearing down NMI, only switch handler for last NMI */
> >               if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
> >                       desc->handle_irq = handle_percpu_devid_irq;
> > -     } else {
> > +             break;
> > +     default:
> >               desc->handle_irq = handle_fasteoi_irq;
> > +             break;
> >       }
>
> Same comments as for gic_irq_nmi_setup() here.
>
> >
> >       gic_irq_set_prio(d, GICD_INT_DEF_PRI);
> > @@ -2001,6 +2015,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
> >
> >       gic_dist_init();
> >       gic_cpu_init();
> > +     gic_enable_nmi_support();
> >       gic_smp_init();
> >       gic_cpu_pm_init();
> >
> > @@ -2013,8 +2028,6 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
> >                       gicv2m_init(handle, gic_data.domain);
> >       }
> >
> > -     gic_enable_nmi_support();
> > -
>
> This bit looks fine to me.
>
> Thanks,
> Mark.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
