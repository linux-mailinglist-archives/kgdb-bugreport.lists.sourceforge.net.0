Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4B1CEE37
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 May 2020 09:36:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYPSU-0001Nu-Ev
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 May 2020 07:36:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1jYPSS-0001Nc-9m
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 07:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iuxyBRhcTAWti4uvr2GZ9BGzC4ldjBNr8rfTA9yCuOc=; b=Srdhy5aSZKN9YUIOOqklO0ETeS
 l5QHz+pCyBIyrXiBys2Xn2y3BEQTnDNmW7eorLPJI2QAmpcwIuhOrI4XliOy+nebifI5zHmZDOukJ
 NPELWPTrNM+9l9qB7LnSOSa+EVw7Uwr8oCndQcmC3cLnmTa0589t2Y7exVcMj6GxSNsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iuxyBRhcTAWti4uvr2GZ9BGzC4ldjBNr8rfTA9yCuOc=; b=GoWeuUJMXW9XYEsOFsNomNgeE1
 pUUJgk04l1pFQ2uxk1U8jwJeEeZTY1tmReK19VZU4Ks0hBKsidyTE7iDDV8kTwxM13plVeKTnrUzG
 9O9JVz7RqaEd3n0kWKBgzqSSP2h4BdW+pDZKnfAb+GjSXwF285V3iWdjlYjltnyn1KJM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYPSQ-00AfQJ-EH
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 07:36:08 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5F32206B7;
 Tue, 12 May 2020 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589268960;
 bh=mwdUCDRsQcd4tBUSrGY2SY7Tr80S7IIqcEq7gM+QFyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5R7cSJlDsOP/Rq15vISPrYY6nRgt0EcIH9XTuDyRC2GPJ6DWnRnmhKdfTiy4a30Y
 VJDL7O2w+OjJd6KbOlyAT9++Kn8lwIjNjkC+57eIGAzvYLg5+3SymfzalRlvTKRmLj
 Akz/XtkhIvyCU63jhozKZ3BdSOgowTXCmGBDg64I=
Date: Tue, 12 May 2020 08:35:53 +0100
From: Will Deacon <will@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200512073552.GA1538@willie-the-truck>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
 <20200511145908.GA22040@willie-the-truck>
 <CAD=FV=W1F-B7SUwxebhhH2HS+fN4sYv4RHvvKud5a+00J0T=SA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=W1F-B7SUwxebhhH2HS+fN4sYv4RHvvKud5a+00J0T=SA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jYPSQ-00AfQJ-EH
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

On Mon, May 11, 2020 at 03:45:02PM -0700, Doug Anderson wrote:
> On Mon, May 11, 2020 at 7:59 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, Apr 28, 2020 at 02:13:45PM -0700, Douglas Anderson wrote:
> > > diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> > > index 48222a4760c2..59c353dfc8e9 100644
> > > --- a/arch/arm64/kernel/debug-monitors.c
> > > +++ b/arch/arm64/kernel/debug-monitors.c
> > > @@ -297,7 +297,7 @@ void unregister_kernel_break_hook(struct break_hook *hook)
> > >       unregister_debug_hook(&hook->node);
> > >  }
> > >
> > > -static int call_break_hook(struct pt_regs *regs, unsigned int esr)
> > > +int call_break_hook(struct pt_regs *regs, unsigned int esr)
> > >  {
> > >       struct break_hook *hook;
> > >       struct list_head *list;
> > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > index cf402be5c573..a8173f0c1774 100644
> > > --- a/arch/arm64/kernel/traps.c
> > > +++ b/arch/arm64/kernel/traps.c
> > > @@ -1044,6 +1044,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
> > >       if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> > >               return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
> > >  #endif
> > > +     if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
> > > +             return 0;
> >
> > I think this just means we're not running debug_traps_init() early enough,
> > and actually the KASAN early handler is unnecessary too.
> >
> > If we call debug_traps_init() directly from setup_arch() and drop the
> > arch_initcall(), can we then drop early_brk64 entirely?
> 
> It seems to work in my testing.  ...but the worry I have is the
> comment right before trap_init().  It says:
> 
> /* This registration must happen early, before debug_traps_init(). */

I /think/ the reason for this is because debug_traps_init() replaces the
BRK vector, so if that runs before the break hooks have been registered
for e.g. BUG() then BUG() won't work during that window. Hmm, so dropping
early_brk64 is problematic after all. Damn.

Is trap_init() early enough for you? If so, we could call debug_traps_init()
from traps_init() after registering the break hooks.

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
