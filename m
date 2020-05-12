Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBA1CF924
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 May 2020 17:28:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYWpL-0000Og-0M
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 May 2020 15:28:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jYWpI-0000O5-Np
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 15:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VTYHiGRZeak1+WyqS6xW7NgB9EbujjGNo0rvwUWxcQ4=; b=Eq4wL/tFZAcXfNiPBAerazzTVA
 s+HZNWotJK1aKxP+8UyCItjkcLjAIbA4O03VCKVfE40gUJTQIiYUA6QRqKyGlnoAfPmDqbGAiqDfk
 o+n6bNPltCGulppQ1OSSQXwxpn5HWiDbOVQLsZRDMV804WsA1Blj+cuoN/FjIAsKbZsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VTYHiGRZeak1+WyqS6xW7NgB9EbujjGNo0rvwUWxcQ4=; b=PNt2QPRsTrU7zekrzk1VKIoKAu
 Aye+0CsGHlE0Lpv7mrrEEtXjpuvxry+eBFFkD00wIq/sfMOe8x1b55ZC07St0TCAIgexyfnXkgPxa
 ZniwIjJK63c25DmXqFAmYVawDxup6oAr2IffxGSum0MYaSMW4u4Y/tWHzRoZdcBATyuQ=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYWpH-003JRv-6N
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 15:28:12 +0000
Received: by mail-vs1-f65.google.com with SMTP id b11so44537vsa.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 May 2020 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VTYHiGRZeak1+WyqS6xW7NgB9EbujjGNo0rvwUWxcQ4=;
 b=QAXD0bZtkOdjlOb1PJu/i7RYbt9WYWPctvCLBdkulPtQH3wJBaPYW/7w0oEfl47K/w
 yRfY3GOGYldyK3wwLE1FZ3aFek0UZvt57iOdzsmyjkJwSIt6cGxaaN89gSQkiobMJlFa
 JIDWp52Q3/5fGYYA36Jjsm09dcApVGzzQ8PQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTYHiGRZeak1+WyqS6xW7NgB9EbujjGNo0rvwUWxcQ4=;
 b=lLkLhkcVeGNwq9juy0LAepJ1OtKHf4ql0oobWJwww02dWdgJDZAm2XTvQzLhN4mAph
 S8hNHn5RD0wg4ou77bgcoN8FfPQ9GZc8fO7KvofwG6yO6FHdvd5nHBhM9VznLKORb7+W
 DacaRWAIJzeYIo/+0pdZxta9K8zlNHGEnaUhPc1uqC8CBsDSCL/Wk+FOnXfqjG1hF7UE
 Uwv+ih/ZixPEIup5gA7ZBSV7qfPNE29qD9iPT+3qg6udo2sRZidBggNtgQgUHbOwAT3C
 XV0TpNWUeiLibhcxu7+UTJdV853S93XbLFS+WGNSaC19wzE0dky3bjpJAFUKYexCDwQf
 xMDg==
X-Gm-Message-State: AGi0PuZm9xILVernhezKEXAco2mq3qKxVvuVpppETyt4xiFbIidDKOpW
 X0NkjL5Ht1dnuOfWeEnoxT8QH09C6ww=
X-Google-Smtp-Source: APiQypIwLAyHESfLiD9aTwbitd3Qb1b1UtzNb4GpwWmzYXUpz4a5b8GckwoqbA5OChZd2WtHlSIdFQ==
X-Received: by 2002:a67:e3b9:: with SMTP id j25mr15001928vsm.110.1589297285054; 
 Tue, 12 May 2020 08:28:05 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id v15sm124153vsg.11.2020.05.12.08.28.02
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 08:28:03 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id k13so4519552uap.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 May 2020 08:28:02 -0700 (PDT)
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr16628982uau.8.1589297282220; 
 Tue, 12 May 2020 08:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
 <20200511145908.GA22040@willie-the-truck>
 <CAD=FV=W1F-B7SUwxebhhH2HS+fN4sYv4RHvvKud5a+00J0T=SA@mail.gmail.com>
 <20200512073552.GA1538@willie-the-truck>
In-Reply-To: <20200512073552.GA1538@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 May 2020 08:27:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuKS7c4WNiLKm+bjRF8Rd7wM1y7THWzJhVhUyExNiiVg@mail.gmail.com>
Message-ID: <CAD=FV=WuKS7c4WNiLKm+bjRF8Rd7wM1y7THWzJhVhUyExNiiVg@mail.gmail.com>
To: Will Deacon <will@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYWpH-003JRv-6N
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

On Tue, May 12, 2020 at 12:36 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, May 11, 2020 at 03:45:02PM -0700, Doug Anderson wrote:
> > On Mon, May 11, 2020 at 7:59 AM Will Deacon <will@kernel.org> wrote:
> > > On Tue, Apr 28, 2020 at 02:13:45PM -0700, Douglas Anderson wrote:
> > > > diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> > > > index 48222a4760c2..59c353dfc8e9 100644
> > > > --- a/arch/arm64/kernel/debug-monitors.c
> > > > +++ b/arch/arm64/kernel/debug-monitors.c
> > > > @@ -297,7 +297,7 @@ void unregister_kernel_break_hook(struct break_hook *hook)
> > > >       unregister_debug_hook(&hook->node);
> > > >  }
> > > >
> > > > -static int call_break_hook(struct pt_regs *regs, unsigned int esr)
> > > > +int call_break_hook(struct pt_regs *regs, unsigned int esr)
> > > >  {
> > > >       struct break_hook *hook;
> > > >       struct list_head *list;
> > > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > > index cf402be5c573..a8173f0c1774 100644
> > > > --- a/arch/arm64/kernel/traps.c
> > > > +++ b/arch/arm64/kernel/traps.c
> > > > @@ -1044,6 +1044,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
> > > >       if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> > > >               return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
> > > >  #endif
> > > > +     if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
> > > > +             return 0;
> > >
> > > I think this just means we're not running debug_traps_init() early enough,
> > > and actually the KASAN early handler is unnecessary too.
> > >
> > > If we call debug_traps_init() directly from setup_arch() and drop the
> > > arch_initcall(), can we then drop early_brk64 entirely?
> >
> > It seems to work in my testing.  ...but the worry I have is the
> > comment right before trap_init().  It says:
> >
> > /* This registration must happen early, before debug_traps_init(). */
>
> I /think/ the reason for this is because debug_traps_init() replaces the
> BRK vector, so if that runs before the break hooks have been registered
> for e.g. BUG() then BUG() won't work during that window. Hmm, so dropping
> early_brk64 is problematic after all. Damn.
>
> Is trap_init() early enough for you? If so, we could call debug_traps_init()
> from traps_init() after registering the break hooks.

"Early enough" is a subjective term, of course.  The earlier we can
init, the earlier we can drop into the debugger.  ...but, of course,
everyone thinks their feature is the most important and should be
first, so let's see...

Certainly if we waited until trap_init() it wouldn't be early enough
to set "ARCH_HAS_EARLY_DEBUG".  Setting that means that debugging is
ready when early params are parsed and those happen at the start of
setup_arch().  The call to trap_init() happens a bit later.

If we decide that we just don't care about getting
"ARCH_HAS_EARLY_DEBUG" to work then the earliest we'll be able to
break into the debugger (via kgdbwait) is dbg_late_init().  That
_does_ happen after trap_init() so your solution would work.

As a person who spends most of his time in driver land, it wouldn't be
the end of the world to wait for dbg_late_init().  That's still much
earlier than most code I'd ever debug.  ...and, bonus points is that
if we hit a crash any time after earlyparams we _will_ still drop into
the debugger.  It's only breakpoints that won't be available until
dbg_late_init().


tl;dr:

* If we care about "kgdbwait" and breakpoints working as early as
possible then we need my patch.

* If we are OK w/ a slightly later "kgdbwait" then I think we can move
debug_traps_init() to trap_init() and get rid of the early version.


Please let me know which way you'd like to proceed.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
