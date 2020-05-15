Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 193491D55D7
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 18:23:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZd7j-0001eo-U8
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 16:23:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1jZd7i-0001eb-Ol
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKQU5g/myR4cFhRPR5I3RICWDDh/vqRDkAmABLv2+FI=; b=ascEDPZgMUIvtOUvMDmz8FpmoO
 k04iHKAJPote3T6KzCR2ItWUOiZxBlbd5GnwKrHksP8aAM9GvfOuMbI4t21g4TSHgd/ZI+zsrKryx
 By0ljiQdoNVaV3P2ZwRW2P6xc/ZDw1hnJ7U1YYXwNjxKVeY5M5EjI70A6HMdnF3/DUXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xKQU5g/myR4cFhRPR5I3RICWDDh/vqRDkAmABLv2+FI=; b=B9QD/a7b7bKrQJHKG6S3TAMdwQ
 /pJ/Shm1mSMo9+lwZiJQ+prF3nvhksF0gs3DPJ+WlLBX4kUBDio3kAaFqv7CYDMOa8rDW9jFIktKF
 bOLPPjIMZQKAM/04/8gmB3gco6DDTxx3P2EZD9e2u1A44bkq5pcd9a6d6HbW0FWfoxII=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZd7d-008lsF-CF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:23:46 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81D412078C;
 Fri, 15 May 2020 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589559803;
 bh=HbqBHaV+XIZkFuflJY0Eucc7SercKD8lt8QIg3OGxhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wemOiVm650T9QrpdqKpxsDYHLEdSK+CH1Ch20VwgfPR+Wr0MpSbf7XU+dxi/rFHj9
 rG92FNQGEworcfIAggrP2zo+/fwzxkNU6/nvba2DypmY6d9iI3lRyNmlfNrJrLtLDZ
 ZPS2stFk5fi2bPosg1Q7nmOMROrJX53BiKMTbiDk=
Date: Fri, 15 May 2020 17:23:17 +0100
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200515162316.GB23334@willie-the-truck>
References: <20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZd7d-008lsF-CF
Subject: Re: [Kgdb-bugreport] [PATCH] arm64: Call debug_traps_init() from
 trap_init() to help early kgdb
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, kgdb-bugreport@lists.sourceforge.net,
 jinho lim <jordan.lim@samsung.com>, Jason Wessel <jason.wessel@windriver.com>,
 linux-kernel@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, liwei391@huawei.com,
 Dave Martin <Dave.Martin@arm.com>, Allison Randal <allison@lohutok.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 13, 2020 at 04:06:37PM -0700, Douglas Anderson wrote:
> A new kgdb feature will soon land (kgdb_earlycon) that lets us run
> kgdb much earlier.  In order for everything to work properly it's
> important that the break hook is setup by the time we process
> "kgdbwait".
> 
> Right now the break hook is setup in debug_traps_init() and that's
> called from arch_initcall().  That's a bit too late since
> kgdb_earlycon really needs things to be setup by the time the system
> calls dbg_late_init().
> 
> We could fix this by adding call_break_hook() into early_brk64() and
> that works fine.  However, it's a little ugly.  Instead, let's just
> add a call to debug_traps_init() straight from trap_init().  There's
> already a documented dependency between trap_init() and
> debug_traps_init() and this makes the dependency more obvious rather
> than just relying on a comment.
> 
> NOTE: this solution isn't early enough to let us select the
> "ARCH_HAS_EARLY_DEBUG" KConfig option that is introduced by the
> kgdb_earlycon patch series.  That would only be set if we could do
> breakpoints when early params are parsed.  This patch only enables
> "late early" breakpoints, AKA breakpoints when dbg_late_init() is
> called.  It's expected that this should be fine for most people.
> 
> It should also be noted that if you crash you can still end up in kgdb
> earlier than debug_traps_init().  Since you don't need breakpoints to
> debug a crash that's fine.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
> This replaces the patch ("arm64: Add call_break_hook() to
> early_brk64() for early kgdb") in my recent kgdb series [1].  If I end
> up re-posting that series again I'll include this patch as a
> replacement, but I'm sending it separately to avoid spamming a pile of
> people another time with a 12-patch series.
> 
> Note that, because it doesn't select the "ARCH_HAS_EARLY_DEBUG"
> KConfig option it could be landed standalone.  However, it's still
> probably better to land together with that patch series.
> 
> If the kgdb_earlycon patch series lands without this patch then
> kgdbwait + kgdb_earlycon won't work well on arm64, but there would be
> no other bad side effects.
> 
> If this patch lands without the kgdb_earlycon patch series then there
> will be no known problems.
> 
> [1] https://lore.kernel.org/r/20200507130644.v4.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid
> 
>  arch/arm64/include/asm/debug-monitors.h | 2 ++
>  arch/arm64/kernel/debug-monitors.c      | 4 +---
>  arch/arm64/kernel/traps.c               | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

[...]

Acked-by: Will Deacon <will@kernel.org>

I would prefer to take this via arm64, if possible, since we have quite lot
going in for 5.8, although I don't think this conflicts at the moment.

Daniel -- what do you want to do?

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
