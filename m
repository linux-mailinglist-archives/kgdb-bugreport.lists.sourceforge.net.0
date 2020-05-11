Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4131F1CE866
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 May 2020 00:45:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYHAu-0003Nx-2x
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 22:45:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jYHAs-0003Nl-Vu
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 22:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6oQAHkHCTjdXQutqjFpnQFKkQXPKWu36loMHxr/U/Bw=; b=eyA6K5qKb4ksjdgz291UCVDuKm
 RX8XS/8cwC7SC2gKIvX1qE6tgeM12DO9f23mtmC6EmdHJMHN42Z9zI9OwjwPI4SlMGIST13BSNCA3
 tkzSn1G8qT4TqTc38JQsBXPZB9l7O4rZDxYAt0sjyw92pqmZCdlZjkFKv8zvAZyNu0zs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6oQAHkHCTjdXQutqjFpnQFKkQXPKWu36loMHxr/U/Bw=; b=Exc8I3ds1eIfl3ziWb1/BGnL8p
 TWuoif1vQtWIxVvTfXcHZkhXsWPTCkXmYk7oSQgk21m5kWJpS7+70cN4TczSCqo8NghPzhY7Wiqtz
 0oCEK7k0GCLmEvI+9wbs+2RKC6TY1kQmP3rQkXApE00vJ8ZseI+csPligaWH5ubyRZgQ=;
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYHAp-009vfz-DE
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 22:45:26 +0000
Received: by mail-vs1-f67.google.com with SMTP id x6so6713690vso.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 May 2020 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oQAHkHCTjdXQutqjFpnQFKkQXPKWu36loMHxr/U/Bw=;
 b=ABJ9An36QqvDTKUmlo81w3VPI+NywC5sRr3Udf1h5mkJQruw2r+/d0TK5KCxAvQnkM
 AnX6dF0ESk/0FMYf94bsuWf7TyAgd59x096hAtrjjgg+oqFcAzxb3dsZhEMl1OgQwajx
 UeNlEyLzrUVksn8Oh25g81dOCnaTLldN7BPyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oQAHkHCTjdXQutqjFpnQFKkQXPKWu36loMHxr/U/Bw=;
 b=nealT6GH7cGTD4r6M1/6t8lzlRc+YKW48sqhT7bAJ/2Cx9qn6dC3g5w0M9bHKeXr7A
 LQzYLVY8L6EDvFsHR1EuRL+PYIy+iFaKoDr2pT0BFFQ87iZa2zdXTFF4PM3KQDU7g70a
 wD0t2Ax3DG1j0TqWBksudhP263J5FDVUvFDNSN7w5zUnhPPZPfI/2Cs0rRRZd+hOjbbA
 P4/p47lbQrE9lgZOmY2MQqPzxTeJAoC/FEorxmPDOYP22qxSsHwsU0mou3EGPPXt4GRd
 NtKfYlHRJaRlZyUWtNIq8X6ggPyOta2oiNlcDgS/vOs3DQmSOJGowjcbnZUMSu73NlF6
 ZiPQ==
X-Gm-Message-State: AGi0PuZaU1fJ76XTWTc+Kh5nKgcplyso5NE52QTHxH57ycS68KHCIwL1
 dHj0voPjyOVxOTRyBnj0rrR7hA8xhkc=
X-Google-Smtp-Source: APiQypIXmTSpr0rxsKAqlFnWnHPfXa0serbunH/XagG+gLqzbwE0XMg5qTa6Y402GvWlUrZewr7Zwg==
X-Received: by 2002:a67:7709:: with SMTP id s9mr14988014vsc.61.1589237116874; 
 Mon, 11 May 2020 15:45:16 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id i199sm8769740vke.20.2020.05.11.15.45.14
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 15:45:15 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id s11so6703183vsm.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 May 2020 15:45:14 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr13653102vsk.106.1589237114125; 
 Mon, 11 May 2020 15:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
 <20200511145908.GA22040@willie-the-truck>
In-Reply-To: <20200511145908.GA22040@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 May 2020 15:45:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W1F-B7SUwxebhhH2HS+fN4sYv4RHvvKud5a+00J0T=SA@mail.gmail.com>
Message-ID: <CAD=FV=W1F-B7SUwxebhhH2HS+fN4sYv4RHvvKud5a+00J0T=SA@mail.gmail.com>
To: Will Deacon <will@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: crrev.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jYHAp-009vfz-DE
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

On Mon, May 11, 2020 at 7:59 AM Will Deacon <will@kernel.org> wrote:
>
> Hi Doug,
>
> On Tue, Apr 28, 2020 at 02:13:45PM -0700, Douglas Anderson wrote:
> > diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> > index 48222a4760c2..59c353dfc8e9 100644
> > --- a/arch/arm64/kernel/debug-monitors.c
> > +++ b/arch/arm64/kernel/debug-monitors.c
> > @@ -297,7 +297,7 @@ void unregister_kernel_break_hook(struct break_hook *hook)
> >       unregister_debug_hook(&hook->node);
> >  }
> >
> > -static int call_break_hook(struct pt_regs *regs, unsigned int esr)
> > +int call_break_hook(struct pt_regs *regs, unsigned int esr)
> >  {
> >       struct break_hook *hook;
> >       struct list_head *list;
> > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > index cf402be5c573..a8173f0c1774 100644
> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -1044,6 +1044,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
> >       if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
> >               return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
> >  #endif
> > +     if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
> > +             return 0;
>
> I think this just means we're not running debug_traps_init() early enough,
> and actually the KASAN early handler is unnecessary too.
>
> If we call debug_traps_init() directly from setup_arch() and drop the
> arch_initcall(), can we then drop early_brk64 entirely?

It seems to work in my testing.  ...but the worry I have is the
comment right before trap_init().  It says:

/* This registration must happen early, before debug_traps_init(). */

By moving debug_traps_init() early we're violating that comment.  Do I
just remove that comment, or was there a good reason for it?  ...or am
I reading it wrong and I should have read it as if it said:

/* NOTE: this registration happens early, before debug_traps_init(). */

...then removing it is fine.  Maybe that's right?

I coded this up and put it on the Chrome OS gerrit at
<https://crrev.com/c/2195061>.  I'm happy to post this on the list as
a loner patch to replace this one or spin the whole series depending
on what people want.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
