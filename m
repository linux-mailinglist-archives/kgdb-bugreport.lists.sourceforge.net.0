Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BD70069B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 12 May 2023 13:22:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pxQqe-0002fE-NI
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 12 May 2023 11:22:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pxQqP-0002f8-Pe
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 11:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Mll1DAMbLGCFXSubtx4QEn03KKOCJspxVpDzXoQOQ4=; b=Vta5E0JhAnGdeQqB9a/HmldUIy
 PJIcaGUXEH6O00XvevVr7/i7CJzdiTQQa+F3Tlp9djzhjwaaXISn7JTHfvgIhy8phzMYPrblqlRzS
 KqjnahKaERC2sRSTNddosgwobrdZzNGO22T5tbYcdlnJX5ElUrRscQ8CFiBMpv5vLuZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Mll1DAMbLGCFXSubtx4QEn03KKOCJspxVpDzXoQOQ4=; b=gqoSQ6k1c39jkLwIs2H/6Ja/Yi
 L21RTH9juIleh87PuDQwIB+RGfeBrmTjfMrzMnyoPOGAMRpn6tIxSaYqw/CDN6ZS5QOnAEyN3Eroi
 IK3DOIJwCumzpnwQNeh2vdtfDoZs9gktewS0/KSKgMgP7adybBd9cQ1vTsnrZf/PaXIU=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pxQqJ-0006nx-WC for kgdb-bugreport@lists.sourceforge.net;
 Fri, 12 May 2023 11:21:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AA27E228E0;
 Fri, 12 May 2023 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683890501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Mll1DAMbLGCFXSubtx4QEn03KKOCJspxVpDzXoQOQ4=;
 b=KpIW+Hu8ySVymSB28TiB64CYpeKVwXlVWvacchzaLtI9q7FObkmBCPO2LZ7HOgvYh0awWb
 Vu/XmXFI2k4C5E7HKbYqv+kv7F2CMc4cHuQv9iabvQkMtDDbD2aVX1La9fkct2gRNR0/Iu
 dWM7bdtfBmqRCNU9EtJIGZIfqdvJIxc=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A80022C152;
 Fri, 12 May 2023 11:21:37 +0000 (UTC)
Date: Fri, 12 May 2023 13:21:34 +0200
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <ZF4hPiEjvr4_ditV@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
 <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-05 13:06:41, Nicholas Piggin wrote: > On Fri
 May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: > > Do a search and
 replace of: > > - NMI_WATCHDOG_ENABLED => HARD_WATCHDOG_ENABLED > > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pxQqJ-0006nx-WC
Subject: Re: [Kgdb-bugreport] [PATCH v4 11/17] watchdog/hardlockup: Rename
 some "NMI watchdog" constants/function
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

On Fri 2023-05-05 13:06:41, Nicholas Piggin wrote:
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > Do a search and replace of:
> > - NMI_WATCHDOG_ENABLED => HARD_WATCHDOG_ENABLED
> > - watchdog_nmi_ => watchdog_hardlockup_
> 
> These are just making prefixes inconsistent again.

Yeah, HARD_WATCHDOG_ENABLED does not fit in. I would personally
rename:

  - NMI_WATCHDOG_ENABLED => WATCHDOG_HARDLOCKUP_ENABLED
  - SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED

to follow the new name space.

> If you really want to do a prefix, I would call it hardlockup which

I wish, we found a good short prefix. My problem with hardlockup_
is that for example "hardlockup_enable() looks ugly.

Also some stuff is common for both softlockup and hardlockup
detectors. And some stuff will be common for both perf and
buddy hardlockup detectors.

Possible alternatives:

   a) watchdog_, watchdog_sl_ and watchdog_hl_, watchdog_hl_buddy_
   b) wd_, wd_hardlockup_, wd_softlockup_, wd_hardlockup_buddy_
   c) wd_, wd_hl_, wd_sl_, wd_hl_buddy_
   d_ wd_, wdhl_, wdsl_, wdhl_buddy_

If you want something shorter then c) looks the best to me.

The wd_ prefix seems to be already used in:

   + arch/powerpc/kernel/watchdog.c
   + kernel/time/clocksource.c

, but it is not used in the core watchdog code at all so it
would require renaming almost everything.


> probably best matches existing code and sysctl / boot stuff, and
> concentrate on non-static symbols.

Yeah, we could hardly change the sysctl interface visible to
userspace. But we could change at least the internal code.

And if we are changing the API anyway because of the
nmi/perf/buddy/hardlockup/hard mess then lets choose
something that will help to distinguish the common watchdog
vs. softlockup/hardlockup/buddy/perf-specific watchdog code.

And I would change it to the watchdog_hardlockup_ as it is
done in this patchset:

   + the names were mostly long even before
   + the code mostly stayed within the 80-chars per-line limit
   + the patches are ready


> No problem with minor things like this that touch arch/powerpc
> going through Andrew's tree though. I'm sure sparc maintainers
> wouldn't mind either.

Good to know.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
