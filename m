Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 379D1772599
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 15:25:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qT0Eo-0006uU-0F
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 13:25:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qT0Ej-0006uN-NQ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 13:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/mGQgjhca/xKLeSQiw9OVvU8Wo8112Jti4DVXY1H5bA=; b=ZY5btEOML+QI5P0XJD5PwmWxXM
 CmUf/3t++/4i206O5LisqyvTgeouNEi0HGU/1nBHfZuVwnL8F/bfmd/Mrxl3TXt12zG3jV7Z81Uze
 tkBk1zg4Ex14lEFJOc8/OuoB5KBi3VdDaup9rJPZdkLNMMsZC2NsRDgCI50OM/CEXeA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/mGQgjhca/xKLeSQiw9OVvU8Wo8112Jti4DVXY1H5bA=; b=WVE4/eOxMi1+uH/UomaSl+E9bR
 TO1knj9CxxILczP0MgN7CuCVxMtffYeA/3ikSg1Sw2vgEbyzjEgThMSjABSwErT/3MD86XV7eefR5
 64hJ3cvM4qD8WwL+OtwPvG3591mCgkhhzwPI3udZuuTEEaM1YAHsgk5Nq/oy3TKePL8I=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qT0Ef-00G2bz-W1 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 13:25:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F3781FB;
 Mon,  7 Aug 2023 06:26:03 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 777963F64C;
 Mon,  7 Aug 2023 06:25:17 -0700 (PDT)
Date: Mon, 7 Aug 2023 14:25:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <ZNDwtMJmhk9pP3Nq@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
 <ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com>
 <CAFA6WYN7SH83mnTPqBj9=hCakM=KJkor7fMQasdeBe6Ue5JXRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYN7SH83mnTPqBj9=hCakM=KJkor7fMQasdeBe6Ue5JXRg@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 04:52:40PM +0530, Sumit Garg wrote:
 > On Mon, 7 Aug 2023 at 15:20, Mark Rutland <mark.rutland@arm.com> wrote:
 > > On Thu, Jun 01, 2023 at 02:31:45PM -0700, Douglas Anderson wro [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qT0Ef-00G2bz-W1
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

On Mon, Aug 07, 2023 at 04:52:40PM +0530, Sumit Garg wrote:
> On Mon, 7 Aug 2023 at 15:20, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Thu, Jun 01, 2023 at 02:31:45PM -0700, Douglas Anderson wrote:
> > > @@ -542,16 +543,22 @@ static int gic_irq_nmi_setup(struct irq_data *d)
> > >               return -EINVAL;
> > >
> > >       /* desc lock should already be held */
> > > -     if (gic_irq_in_rdist(d)) {
> > > -             u32 idx = gic_get_ppi_index(d);
> > > +     switch (get_intid_range(d)) {
> > > +     case SGI_RANGE:
> > > +             break;
> > > +     case PPI_RANGE:
> > > +     case EPPI_RANGE:
> > > +             idx = gic_get_ppi_index(d);
> > >
> > >               /* Setting up PPI as NMI, only switch handler for first NMI */
> > >               if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
> > >                       refcount_set(&ppi_nmi_refs[idx], 1);
> > >                       desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
> > >               }
> > > -     } else {
> > > +             break;
> > > +     default:
> > >               desc->handle_irq = handle_fasteoi_nmi;
> > > +             break;
> > >       }
> >
> > As above, I reckon this isn't right, and we should treat all rdist interrupts
> > (which are all percpu) the same.
> >
> > I reckon what we should be doing here is make ppi_nmi_refs cover all of the
> > rdist interrupts (e.g. make that rdist_nmi_refs, add a gic_get_rdist_idx()
> > helper), and then here have something like:
> >
> >         if (gic_irq_in_rdist(d)) {
> >                 u32 idx = gic_get_rdist_idx(d);
> >
> >                 /*
> >                  * Setting up a percpu interrupt as NMI, only switch handler
> >                  * for first NMI
> >                  */
> >                 if (!refcount_inc_not_zero(&rdist_nmi_refs[idx])) {
> >                         refcount_set(&ppi_nmi_refs[idx], 1);
> >                         desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
> >                 }
> >         }
> 
> It looks like you missed the else part here as follows for all other
> interrupt types:
> 
>          } else {
>                  desc->handle_irq = handle_fasteoi_nmi;
>          }

Yes, sorry; I had meant for that to be included, i.e.

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
	} else {
		desc->handle_irq = handle_fasteoi_nmi;
	}

> Apart from that, your logic sounds good to me.

Great!

Thanks,
Mark.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
