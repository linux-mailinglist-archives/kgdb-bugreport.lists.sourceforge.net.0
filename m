Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA8F772A0F
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 18:04:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qT2id-0002sw-Vd
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 16:04:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qT2ic-0002sq-PK
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 16:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z/CM6FCXRhH5iHX/+Nv88JlkpzyxFvVP/rwlSbXs638=; b=CldLNphfDh8gw1IVhblFqSy+Ua
 mTVP6cuoBgRRIkR36Vlhof3DOvdLcwehJNbVO9yNPgdyOkxCH8neZZxnVB2+8N7XZr34uJeA6GuQV
 Rqfrvb3wV/u7KzjFerdIN1cd3pqpxEphdVmZutbBn8NP1gtDobKGGYi4zjRoXesluUns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z/CM6FCXRhH5iHX/+Nv88JlkpzyxFvVP/rwlSbXs638=; b=JH/BgikW+6whygK11p12Q6CTNP
 LIdpwLhX8g7wVcP6UuXKXleWSxcDmApo0s8Y93PZO343BAkJsfSDOhKnzZWSN7M0Rw3TC0jLP2UWm
 k5pQ0m6Aja65Xx76hTf9B/nn5NETu7yu+5bvUWAAn1lzQ4+xB7KM+8pg2BIxqmbiWRoQ=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qT2iY-00GFDd-09 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 16:04:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E2191FB;
 Mon,  7 Aug 2023 09:05:03 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1FF83F59C;
 Mon,  7 Aug 2023 09:04:17 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:04:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <ZNEV_mz4VU1HyBc9@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
 <20230807152444.GA375529@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807152444.GA375529@aspen.lan>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 04:24:44PM +0100, Daniel Thompson
 wrote: > On Mon, Aug 07, 2023 at 11:28:52AM +0100, Mark Rutland wrote: > >
 On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote: > [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qT2iY-00GFDd-09
Subject: Re: [Kgdb-bugreport] [PATCH v9 7/7] arm64: kgdb: Roundup cpus using
 the debug IPI
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Wei Li <liwei391@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 04:24:44PM +0100, Daniel Thompson wrote:
> On Mon, Aug 07, 2023 at 11:28:52AM +0100, Mark Rutland wrote:
> > On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
> > > From: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
> > > IPI is backed by an NMI (or pseudo NMI) then this will let us debug
> > > even hard locked CPUs. When the debug IPI isn't backed by an NMI then
> > > this won't really have any huge benefit but it will still work.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v9:
> > > - Remove fallback for when debug IPI isn't available.
> > > - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> > >
> > >  arch/arm64/kernel/ipi_debug.c |  5 +++++
> > >  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
> > >  2 files changed, 19 insertions(+)
> >
> > This looks fine to me, but I'd feel a bit happier if we had separate SGIs for
> > the backtrace and the KGDB callback as they're logically unrelated.
> 
> I've no objections to seperate SGIs (if one can be found) but I'm curious
> what benefit emerges from giving them seperate IPIs.

Mostly an "I'd feel happier"; they're logically unrelated and having them
separate avoids the risk of them unintentionally getting in the way of the
other.

> Both interfaces are already designed to share and NMI-like IPI nicely
> (and IIUC they must share one on x86), neither is performance
> critical[1] and the content of /proc/interrupts for the IPI is seldom
> going to be of much interest.

Sure; I understand that. The flip side of "neither is performance critical" is
that they're seldom tested in terms of interaction with one another, and hence
for robustness I'd prefer they're separate.

I agree it's not strictly necessary, but given we can easily free up an SGI
slot, I think it'd be worthwhile. We can always decide to fold them together in
future if we have to.

I realise a similar argument could be applied to IPI_WAKEUP and IPI_RESCHEDULE,
but given that IPI_RESCHEDULE happens *all the time* and the wakeup handler
does literally nothing, I think the risk there is substantially lower.

Thanks,
Mark.

> As mentioned it is perfectly OK to separate them if there is space in
> the SGI allocations. However if any two functions are good candidates to
> share a scarce resource such as an SGI then it is these!
> 
> 
> Daniel.
> 
> 
> [1] In both cases their results are only required at human-scale
>     and the work of the both handlers is hugely more expensive than
>     either up front quick-check.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
