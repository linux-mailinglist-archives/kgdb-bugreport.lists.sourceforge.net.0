Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC91D63FB
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 16 May 2020 22:29:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ja3RJ-0005gt-5R
	for lists+kgdb-bugreport@lfdr.de; Sat, 16 May 2020 20:29:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1ja3RH-0005gf-LF
 for kgdb-bugreport@lists.sourceforge.net; Sat, 16 May 2020 20:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HT2TVJMFayGUD83EGAbk8hf3i1gxi7dkBOjvsWeu/kI=; b=HaSIwPF8lhfnTA4gwiOVoGs9Q+
 2VFaJFwRhobtjntak1JRgPSzTAUJNdT1iuNQoSFjGu3JGQW2aFhv27tXbMf4TRAjtYAkkQV27vclC
 QvRBeMeG0v1W/HT8RcF4g+nok9eVsEPsArAChdoDIoG2a67N5RUx/qpTLV1vWSp71VAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HT2TVJMFayGUD83EGAbk8hf3i1gxi7dkBOjvsWeu/kI=; b=YPvFPVmM7DnuE/8/qrA6RuYgF3
 qQ7OwA+MpH1ejdOp1+uSPpvGhb1wTuVatEgqajK43QwKrnETj7MXXgqTwLoX7qRsRxD6vPUeaaUk9
 ix7ELjCklUjFeQ5kA+jFcGDK67PDCE89cNS9XdhLpcUvM9da0+PTNrqcq2wcSIQQanEY=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ja3R7-002HOA-F6
 for kgdb-bugreport@lists.sourceforge.net; Sat, 16 May 2020 20:29:43 +0000
Received: by mail-wr1-f66.google.com with SMTP id l11so7411238wru.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 16 May 2020 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HT2TVJMFayGUD83EGAbk8hf3i1gxi7dkBOjvsWeu/kI=;
 b=jHGOapOXAI3oRxVWb3QmEM35rLrSSZyxRRMdKTuSibl7WIRZ4f68YCTl/fhYXIxl/t
 2pKXBNuVkvs8JDQukmlYEyeksSKj2VTRq/Gt6VMMchY6XN5LQJcTN+VndCWP0/Geu87q
 eSAn2J5FK7TqiOy2s3qgR3n3nsm/8kUFWpUWw341x6mHVvCGT8JxIiVDEhQu47n3ysvN
 bymsBeFi/Sw9FHw2Jp4V0/4Cy/Fkqs8i9kiPKD3BexyiEQGjZktsD5nwpXibKctwPARs
 65r07ygWDf2zc4tAt7/tFRN3Wx8pLmtH5tayuqfjNXvbZvxjv7Hwt9bi8UXLUHL9K4xP
 fKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HT2TVJMFayGUD83EGAbk8hf3i1gxi7dkBOjvsWeu/kI=;
 b=pSmHq74itdzzFxBlNpcyWsDckYT+ddjmJOr85kLS36WY/rTsNBxNeHJkaYix3izVDw
 8BzyYCmAfHf1jDImjvfo6tFmi9vQX5/G6x4vyAOtQ9wHBgMUr5dnjvgecqlSuht9oBdB
 Bpolq+eobwOkNyU4gY8CNhHUuJFG46xNgOpK+eKq0OyMDmPHgYCd9WDlo1EDQ6nuqkTS
 TXrkP6mUFmTCADZqwVAmpu9Dcd2UV4x+aiXfx0z2HiaZStPEr95g4Tl1x3rudadHLB4A
 WQXcy87chHzOMEa3o8Xc6KsUuyOOL+2PfBEMtJ7TcY+We+uiYCJfG6xzP6FMQ4/FGRMx
 v/UQ==
X-Gm-Message-State: AOAM531dudbmi+ur7ojHH/OGIJ/NhOEC+smgIQolU1ttJ2lprb5HGlLY
 0izS1YcQDDhHHNgRjeZSyQnhHf6wy6A=
X-Google-Smtp-Source: ABdhPJxD56c80RnLiAXEYv73ZxwFHD3aDDC2eWQq4okfk+viJypD6EhiHd4j2iC0mCNxdB97WtsohQ==
X-Received: by 2002:adf:dd50:: with SMTP id u16mr11815583wrm.58.1589660967004; 
 Sat, 16 May 2020 13:29:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o15sm7985249wrw.65.2020.05.16.13.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 13:29:26 -0700 (PDT)
Date: Sat, 16 May 2020 21:29:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Will Deacon <will@kernel.org>
Message-ID: <20200516202922.j7t2kocavj3ppwjk@holly.lan>
References: <20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid>
 <20200515162316.GB23334@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515162316.GB23334@willie-the-truck>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ja3R7-002HOA-F6
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
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

On Fri, May 15, 2020 at 05:23:17PM +0100, Will Deacon wrote:
> On Wed, May 13, 2020 at 04:06:37PM -0700, Douglas Anderson wrote:
> > A new kgdb feature will soon land (kgdb_earlycon) that lets us run
> > kgdb much earlier.  In order for everything to work properly it's
> > important that the break hook is setup by the time we process
> > "kgdbwait".
> > 
> > Right now the break hook is setup in debug_traps_init() and that's
> > called from arch_initcall().  That's a bit too late since
> > kgdb_earlycon really needs things to be setup by the time the system
> > calls dbg_late_init().
> > 
> > We could fix this by adding call_break_hook() into early_brk64() and
> > that works fine.  However, it's a little ugly.  Instead, let's just
> > add a call to debug_traps_init() straight from trap_init().  There's
> > already a documented dependency between trap_init() and
> > debug_traps_init() and this makes the dependency more obvious rather
> > than just relying on a comment.
> > 
> > NOTE: this solution isn't early enough to let us select the
> > "ARCH_HAS_EARLY_DEBUG" KConfig option that is introduced by the
> > kgdb_earlycon patch series.  That would only be set if we could do
> > breakpoints when early params are parsed.  This patch only enables
> > "late early" breakpoints, AKA breakpoints when dbg_late_init() is
> > called.  It's expected that this should be fine for most people.
> > 
> > It should also be noted that if you crash you can still end up in kgdb
> > earlier than debug_traps_init().  Since you don't need breakpoints to
> > debug a crash that's fine.
> > 
> > Suggested-by: Will Deacon <will@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> > This replaces the patch ("arm64: Add call_break_hook() to
> > early_brk64() for early kgdb") in my recent kgdb series [1].  If I end
> > up re-posting that series again I'll include this patch as a
> > replacement, but I'm sending it separately to avoid spamming a pile of
> > people another time with a 12-patch series.
> > 
> > Note that, because it doesn't select the "ARCH_HAS_EARLY_DEBUG"
> > KConfig option it could be landed standalone.  However, it's still
> > probably better to land together with that patch series.
> > 
> > If the kgdb_earlycon patch series lands without this patch then
> > kgdbwait + kgdb_earlycon won't work well on arm64, but there would be
> > no other bad side effects.
> > 
> > If this patch lands without the kgdb_earlycon patch series then there
> > will be no known problems.
> > 
> > [1] https://lore.kernel.org/r/20200507130644.v4.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid
> > 
> >  arch/arm64/include/asm/debug-monitors.h | 2 ++
> >  arch/arm64/kernel/debug-monitors.c      | 4 +---
> >  arch/arm64/kernel/traps.c               | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> [...]
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> I would prefer to take this via arm64, if possible, since we have quite lot
> going in for 5.8, although I don't think this conflicts at the moment.
> 
> Daniel -- what do you want to do?

I'm very happy for you to take it!

On my side I hope to get the rest of the patchset into linux-next early
next week.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
