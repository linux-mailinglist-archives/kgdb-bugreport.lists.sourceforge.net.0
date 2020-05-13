Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CA41D22CD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 01:13:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZ0ZP-0004ay-Gd
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 May 2020 23:13:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jZ0ZJ-0004am-L7
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qrc+zALKhm7UR0okg2VxygijLhPHdyDYt6UnXc1+qEk=; b=Tmovgh0QoaaQPk4jH7PTS7eLjT
 pAqwANyF63ljKQe2tEAV8PckBdOI4TMM2qNrcJ1snLdDKjbB6bVa5koyVvfqbed4YsvtNvvo/97CJ
 YwpMwynWW55FCkTRMRxhLq8T27noK4b2TNgcmo7aBCZLwiwevFkPuaZmQ5Zw/B/kiBSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qrc+zALKhm7UR0okg2VxygijLhPHdyDYt6UnXc1+qEk=; b=HIsbFpzgiZuRfoQQ1EsfrflZLs
 TjsV6iWuIQ8A9VtIGx7NePg1DhtT4NWCpk3SSYIuDbfA7VYQLsVeb+hlkir4b8zEW1z9toS1CLBIz
 GZ1bKoXd02oPGA+18alreqE2/II5CN9dJa1BBxYazGzLNCBm+/jjYqd2zJjth0+eYOtM=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ0ZF-0067rZ-6h
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 23:13:41 +0000
Received: by mail-vs1-f68.google.com with SMTP id l25so866966vso.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qrc+zALKhm7UR0okg2VxygijLhPHdyDYt6UnXc1+qEk=;
 b=Qh7lvFu7Q7FSluMhlA+8KOS62pXg1rxQC1Ogk+ACNtMIaCyE9ShN6VB9f9gGDvteW4
 gypT5Ev3vDl69jha5hOD76TZn8yRrjhUMxAWk1zqNUDl4SXtliMPJmL50nvFC0c/bC3V
 lRIsq85AmTyx2GxwUTqokmeiKV/xXeYZWSBXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qrc+zALKhm7UR0okg2VxygijLhPHdyDYt6UnXc1+qEk=;
 b=WOa7q81BDtz7sOo6lXokAyNaDpxoPH5HFzBmqVKs8+hX5xumDE3C9NhGcLYUcNRbcg
 KEmx3eIovGPiIdn/uQ/sBVBsvXThnIYaQska8GAp/zRa0VwogRWvBzKjiL13fLgqm657
 OfEoE6R6uKjh80yxDVg4wYkld9KIKTw3Hu1oilLLssS7BdGKWqQSsQZiNGN/2fA+x/7c
 IGbA7mtKLo1+iNM9VTV+h/xKSsiXsde7RWKkGArmXuD/+EOAHWsAb0zooYyEPhXnzOIU
 4QjIjrePuU+/zRpQuCP/OxbD74h7K0KQUaf/AH5LaXZ06t2O4YXNfYE0PHFlW6i8m4lf
 M1Cg==
X-Gm-Message-State: AOAM532HDNAAaNLGZnUjp7es9O+wEPZG632TE+oQz86E7TCPoXNigIdo
 6uQV8vCHBX60v36Nq0GmfweGND4OZpY=
X-Google-Smtp-Source: ABdhPJwS57q5cJjhsQx+Wgaaggzyx+w7ZQ+fmr6x2kh4BHVeZ1wm1DVWr6Ia/4T0oPrba0+piyBYtQ==
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr1341424vso.73.1589411611177; 
 Wed, 13 May 2020 16:13:31 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id x81sm268921vkd.15.2020.05.13.16.13.30
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 16:13:31 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id m24so851750vsq.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 16:13:30 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr1422470vkd.75.1589411305040;
 Wed, 13 May 2020 16:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
 <20200511145908.GA22040@willie-the-truck>
 <CAD=FV=W1F-B7SUwxebhhH2HS+fN4sYv4RHvvKud5a+00J0T=SA@mail.gmail.com>
 <20200512073552.GA1538@willie-the-truck>
 <CAD=FV=WuKS7c4WNiLKm+bjRF8Rd7wM1y7THWzJhVhUyExNiiVg@mail.gmail.com>
 <20200513061745.GB17433@willie-the-truck>
In-Reply-To: <20200513061745.GB17433@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 May 2020 16:08:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+JiK1_Lka1PB9DWTsKOowhL+Q+i1yK7=T-4E+zue36g@mail.gmail.com>
Message-ID: <CAD=FV=U+JiK1_Lka1PB9DWTsKOowhL+Q+i1yK7=T-4E+zue36g@mail.gmail.com>
To: Will Deacon <will@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ0ZF-0067rZ-6h
Subject: Re: [Kgdb-bugreport] [PATCH v3 05/11] arm64: Add call_break_hook()
 to early_brk64() for early kgdb
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 jinho lim <jordan.lim@samsung.com>, Andy Gross <agross@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, May 12, 2020 at 11:17 PM Will Deacon <will@kernel.org> wrote:
>
> Hey Doug,
>
> On Tue, May 12, 2020 at 08:27:50AM -0700, Doug Anderson wrote:
> > On Tue, May 12, 2020 at 12:36 AM Will Deacon <will@kernel.org> wrote:
> > > On Mon, May 11, 2020 at 03:45:02PM -0700, Doug Anderson wrote:
> > > > On Mon, May 11, 2020 at 7:59 AM Will Deacon <will@kernel.org> wrote:
> > > > > On Tue, Apr 28, 2020 at 02:13:45PM -0700, Douglas Anderson wrote:
> > > > > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > > > > index cf402be5c573..a8173f0c1774 100644
> > > > > > --- a/arch/arm64/kernel/traps.c
> > > > > > +++ b/arch/arm64/kernel/traps.c
> > > > > > @@ -1044,6 +1044,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
> > > > > >       if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> > > > > >               return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
> > > > > >  #endif
> > > > > > +     if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
> > > > > > +             return 0;
> > > > >
> > > > > I think this just means we're not running debug_traps_init() early enough,
> > > > > and actually the KASAN early handler is unnecessary too.
> > > > >
> > > > > If we call debug_traps_init() directly from setup_arch() and drop the
> > > > > arch_initcall(), can we then drop early_brk64 entirely?
> > > >
> > > > It seems to work in my testing.  ...but the worry I have is the
> > > > comment right before trap_init().  It says:
> > > >
> > > > /* This registration must happen early, before debug_traps_init(). */
> > >
> > > I /think/ the reason for this is because debug_traps_init() replaces the
> > > BRK vector, so if that runs before the break hooks have been registered
> > > for e.g. BUG() then BUG() won't work during that window. Hmm, so dropping
> > > early_brk64 is problematic after all. Damn.
> > >
> > > Is trap_init() early enough for you? If so, we could call debug_traps_init()
> > > from traps_init() after registering the break hooks.
> >
> > "Early enough" is a subjective term, of course.  The earlier we can
> > init, the earlier we can drop into the debugger.  ...but, of course,
> > everyone thinks their feature is the most important and should be
> > first, so let's see...
> >
> > Certainly if we waited until trap_init() it wouldn't be early enough
> > to set "ARCH_HAS_EARLY_DEBUG".  Setting that means that debugging is
> > ready when early params are parsed and those happen at the start of
> > setup_arch().  The call to trap_init() happens a bit later.
> >
> > If we decide that we just don't care about getting
> > "ARCH_HAS_EARLY_DEBUG" to work then the earliest we'll be able to
> > break into the debugger (via kgdbwait) is dbg_late_init().  That
> > _does_ happen after trap_init() so your solution would work.
> >
> > As a person who spends most of his time in driver land, it wouldn't be
> > the end of the world to wait for dbg_late_init().  That's still much
> > earlier than most code I'd ever debug.  ...and, bonus points is that
> > if we hit a crash any time after earlyparams we _will_ still drop into
> > the debugger.  It's only breakpoints that won't be available until
> > dbg_late_init().
> >
> >
> > tl;dr:
> >
> > * If we care about "kgdbwait" and breakpoints working as early as
> > possible then we need my patch.
> >
> > * If we are OK w/ a slightly later "kgdbwait" then I think we can move
> > debug_traps_init() to trap_init() and get rid of the early version.
> >
> >
> > Please let me know which way you'd like to proceed.
>
> Let's go with the trap_init() approach for now, and we can revisit it later
> if somebody has a compelling reason to initialise things earlier. However,
> I don't think you can remove early_brk64(), as it's needed for BUG() to
> work correctly.

Posted at:

https://lore.kernel.org/r/20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid

I'll also reply to the v4 version of this patch to point at it.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
