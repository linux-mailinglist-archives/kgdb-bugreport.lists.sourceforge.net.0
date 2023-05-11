Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 868986FEDF3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 10:40:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px1qN-00045i-Fu
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 08:40:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px1qL-00044s-S1
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 08:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NXRHuyXM8rpe4qUASDvyNmrhcGnhIuyAUOQ0j7TuG3M=; b=kd58ye8UsjHp0wJevBpK5uqYO8
 orVIN6T2N0XSEalgNQfRAfg4Gx1iG/DDHysABamQ6CMSaAWwn0HQnLYl9Cj6fHf56BzwvvoA8o74X
 pGHF4k/S+2jQhfxb+KS2GOVY3ztrxtD7bn0Ncm1U56xKQljqXpbc+nm3Wrmwbe3I8r+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NXRHuyXM8rpe4qUASDvyNmrhcGnhIuyAUOQ0j7TuG3M=; b=MFnLitBS1tjymqoBvK1uEkiPgT
 z8fm3VWQ9quydRn7KlONXBypYFAcewJBojLBVwnhIbTNvry8rmIrda3yReJulG/diFLNgo8XqB3ef
 JBz/upJ6QxgdjPjJzQTiEa8ofKFFnXKN7Gq4Xuwy3pipBG0hg5d1/y6fruEv8NinxqIs=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px1qI-0036mm-Rh for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 08:40:10 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 373C81F388;
 Thu, 11 May 2023 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683794397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NXRHuyXM8rpe4qUASDvyNmrhcGnhIuyAUOQ0j7TuG3M=;
 b=KRxlm6KuhcYRuut5Ld+57zEuix1UM/lh3QaDTebljqkZebiCmbRUL2VE5j6KhI8NLtUF6g
 uTz4Fqa7EcHubjpJkiY38RTszd30kTaJWb0AFgyM3QYWNyVx3UpSzltfsdsXOZYEOXEXvF
 q3IjA46B7zTin0OxRhwRS2niCS9Bhi4=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B50ED2C141;
 Thu, 11 May 2023 08:39:54 +0000 (UTC)
Date: Thu, 11 May 2023 10:39:53 +0200
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <ZFyp2aCIf8W5w65v@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
 <CSDZYTDN5EHC.1AOZO6QV1UGJR@wheely>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CSDZYTDN5EHC.1AOZO6QV1UGJR@wheely>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-05 12:43:49, Nicholas Piggin wrote: > On Fri
 May 5, 2023 at 8:13 AM AEST,
 Douglas Anderson wrote: > > The real watchdog_update_hrtimer_threshold()
 is defined in > > watchdog_hardlockup_ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1px1qI-0036mm-Rh
Subject: Re: [Kgdb-bugreport] [PATCH v4 01/17] watchdog/perf: Define dummy
 watchdog_update_hrtimer_threshold() on correct config
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-05 12:43:49, Nicholas Piggin wrote:
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > The real watchdog_update_hrtimer_threshold() is defined in
> > watchdog_hardlockup_perf.c. That file is included if
> 
> In kernel/watchdog_hld.c.

With this fixed path:

Reviewed-by: Petr Mladek <pmladek@suse.com>

> > CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
> > file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.
> >
> > The dummy version of the function in "nmi.h" didn't get that quite
> > right. While this doesn't appear to be a huge deal, it's nice to make
> > it consistent.
> 
> It doesn't break builds because CHECK_TIMESTAMP is only defined by
> x86 so others don't get a double definition, and x86 uses perf lockup
> detector, so it gets the out of line version.
> 
> So has no functional change but should be fixed.
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> >
> > Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
