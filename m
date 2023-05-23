Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B23770D932
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 May 2023 11:35:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1OQO-0004yM-6X
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 May 2023 09:35:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1OQN-0004yG-E0
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 09:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IAYq7YJVS2Hlnl42uVu2goasTRVPRgZ4NqjKSyNxGrQ=; b=dSSmIxEmw+08Z/6MNyDZ8Q8AlF
 0uWD2gA27wQxlKOKeXWB5sVkvU5+MIKqukm9iFsljSLoc0yjS4ZTOWLWLx6JmtQRPeEqM6GSMCePI
 jraLv4jJ6XO07b56CuxXYjyJzCiaeIF6aiJOvCtpsHfGNY0cg7dQzkbXQE4oxFSQGDrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IAYq7YJVS2Hlnl42uVu2goasTRVPRgZ4NqjKSyNxGrQ=; b=QAkbjhnuDloEod7GGRvWDWsjbp
 Za6pnFncFJS53DcpUZSCLXsDXeRe1cZUWQCoGBf61LJ0aBGHAg3BKjydBJB3BGnxULlxCLxQJxeDD
 hMdnArMNcOmk8u+sKMhM84vaGeMk0m+4vOQ5oCGiZVnBwmOSIrmvRpChcvxkfP9qZxNU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1OQJ-000KyD-Ub for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 09:35:23 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B6BD41FF45;
 Tue, 23 May 2023 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684834512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IAYq7YJVS2Hlnl42uVu2goasTRVPRgZ4NqjKSyNxGrQ=;
 b=KU08sltoiXCpoxueN/xTm1Dj8XgBHSTDWuL90uW147a2/O/Mr6ZoeLyNLFpVJWdIVW5kxX
 qqA4ifcAtaWSIWN6bnayexKSUglQmxet+EFMnoKUKq4Izsg5nga9Xy+G/qI4h+1EzPAbdY
 lsmjo1AyUZ4F7lDFhMIZqs6iohgJ0mY=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 46EBC2C141;
 Tue, 23 May 2023 09:35:07 +0000 (UTC)
Date: Tue, 23 May 2023 11:35:02 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZGyIxvKhVjr-L8-I@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.2.I843b0d1de3e096ba111a179f3adb16d576bef5c7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.2.I843b0d1de3e096ba111a179f3adb16d576bef5c7@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:26,
 Douglas Anderson wrote: > Currently, 
 in the watchdog_overflow_callback() we first check to see > if the watchdog
 had been touched and _then_ we handle the workaround > for [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1OQJ-000KyD-Ub
Subject: Re: [Kgdb-bugreport] [PATCH v5 02/18] watchdog/perf: More properly
 prevent false positives with turbo modes
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
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-19 10:18:26, Douglas Anderson wrote:
> Currently, in the watchdog_overflow_callback() we first check to see
> if the watchdog had been touched and _then_ we handle the workaround
> for turbo mode. This order should be reversed.
> 
> Specifically, "touching" the hardlockup detector's watchdog should
> avoid lockups being detected for one period that should be roughly the
> same regardless of whether we're running turbo or not. That means that
> we should do the extra accounting for turbo _before_ we look at (and
> clear) the global indicating that we've been touched.

The ideal solution would be to reset the turbo-mode-related
variables when the watchdog is touched. And keep checking
watchdog_nmi_touch first.

But this ordering change should be good enough. It causes that
we always check watchdog_nmi_touch when the turbo-more-related
variables are already reset.

> NOTE: this fix is made based on code inspection. I am not aware of any
> reports where the old code would have generated false positives. That
> being said, this order seems more correct and also makes it easier
> down the line to share code with the "buddy" hardlockup detector.
> 
> Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
