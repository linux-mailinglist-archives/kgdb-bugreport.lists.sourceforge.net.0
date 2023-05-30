Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7D71645A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:38:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40UK-0007Xv-R6
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:38:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40UJ-0007Xh-Cq
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EEWDz7JwGiqY+ip6MkjEhTCueHSdAyErkZJwkzbYyE4=; b=Wwp+v/04qd6aQPZxbS5xwtqvXS
 Qw6d+sBz/N0Mm6OIWx1ftPYtxLQeUCnQPBv1GTcvhmshbB59+PfitNByVJGRP+5TODUCcCyJl1QXD
 RVfD2/Kq2kXQhPSZwNhbw0dt/p1qqVwqYPVbkeXLLC5y23/gk/ySWSTs/hC5VFVksR8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EEWDz7JwGiqY+ip6MkjEhTCueHSdAyErkZJwkzbYyE4=; b=huDXbcagvX29QAQuScFcqEueB4
 Ujx4C3U7RmdC8zf/RhKGqYZfMHUMYb0pYztg9HIGfCMbYLMgZ6b91pypiUwJpD3XH6QSo6d4brxhK
 fOi8wMoqzI/a9wngVGu/ofCAcAnHsBdf3wxkjmlv4R3zuBVF5LQPtsm4dkV6NqE+mez0=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40UD-0001kq-Vf for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:38:15 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B68D31FDBD;
 Tue, 30 May 2023 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685457483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEWDz7JwGiqY+ip6MkjEhTCueHSdAyErkZJwkzbYyE4=;
 b=H9+gDrhDk7P6aYZALA8W3gBxOfmADodBMBnKpnh9CR1bOZrBKtUPxNNU0Fxz9HL7TjURP9
 0QlCDBA6daGwBCzSQ8b8m1IXqGxF0MwzIX889H27PzrH4M5Gqse83WRsSFSCTrF2ec44jL
 t8a6iKbactbBCYzF384qgrhrrBTKxKs=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4A9252C142;
 Tue, 30 May 2023 14:38:03 +0000 (UTC)
Date: Tue, 30 May 2023 16:38:02 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYKSnLBU82fM1O2@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.2.Ic6ebbf307ca0efe91f08ce2c1eb4a037ba6b0700@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.2.Ic6ebbf307ca0efe91f08ce2c1eb4a037ba6b0700@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:32, Douglas Anderson wrote: > Right
 now there is one arch (sparc64) that selects HAVE_NMI_WATCHDOG > without
 selecting HAVE_HARDLOCKUP_DETECTOR_ARCH. Because of that one > arch [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q40UD-0001kq-Vf
Subject: Re: [Kgdb-bugreport] [PATCH 02/10] watchdog/hardlockup:
 HAVE_NMI_WATCHDOG must implement watchdog_hardlockup_probe()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-26 18:41:32, Douglas Anderson wrote:
> Right now there is one arch (sparc64) that selects HAVE_NMI_WATCHDOG
> without selecting HAVE_HARDLOCKUP_DETECTOR_ARCH. Because of that one
> architecture, we have some special case code in the watchdog core to
> handle the fact that watchdog_hardlockup_probe() isn't implemented.
> 
> Let's implement watchdog_hardlockup_probe() for sparc64 and get rid of
> the special case.
> 
> As a side effect of doing this, code inspection tells us that we could
> fix a minor bug where the system won't properly realize that NMI
> watchdogs are disabled. Specifically, on powerpc if
> CONFIG_PPC_WATCHDOG is turned off the arch might still select
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH which selects
> CONFIG_HAVE_NMI_WATCHDOG. Since CONFIG_PPC_WATCHDOG was off then
> nothing will override the "weak" watchdog_hardlockup_probe() and we'll
> fallback to looking at CONFIG_HAVE_NMI_WATCHDOG.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

> ---
> Though this does fix a minor bug, I didn't mark this as "Fixes"
> because it's super minor. One could also argue that this wasn't a bug
> at all but simply was never an implemented feature. The code that
> added some amount of dynamicness here was commit a994a3147e4c
> ("watchdog/hardlockup/perf: Implement init time detection of perf")
> which, as per the title, was only intending to make "perf"
> dynamic. The old NMI watchdog presumably has never been handled
> dynamically.

I agree that it is a minor bug and Fixes tag is not needed.

Another motivation is that all the dependencies are quite
complicated. IMHO, it is not worth spending time on
reviewing potential backports.

That said, I am afraid that the artificial intelligence will nominate
this patch for stable backports even without the Fixes tag.
You know, there are the words "fix" and "bug" in the commit message ;-)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
