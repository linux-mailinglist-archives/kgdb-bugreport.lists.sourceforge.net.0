Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD2242C2D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 12 Aug 2020 17:27:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5sf9-0003Xy-E4
	for lists+kgdb-bugreport@lfdr.de; Wed, 12 Aug 2020 15:27:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k5sf7-0003Xc-PQ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 15:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jr6fmB1bCqolizwxBYidbm0DK7lilrbAIzTvtSAUPwc=; b=PbKdnbCHbBl9FfN6XlAH94kLk3
 VYVcXGxD/uParxg/3qD95qKglu2pFIrOiahF9knvGt4JVWwRQtSWgxJ9XrkYRDRZciLMwdTuPt0sO
 i3qPt7HA0UcHyjv1uMny4SdsLZhnBnlF7JqlqzB/ONZw7TWmB73JmwbazrAaR0pKINSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jr6fmB1bCqolizwxBYidbm0DK7lilrbAIzTvtSAUPwc=; b=eeK9xmsJf0soMZ85lBq5rdlZeg
 Q6078QiqTMfPFOKPE/IgUSm7hXylXZTKnsgxxtqm8p6U6byFUGE1LAAjcqJP0XDFzW9M46il7uUMO
 0u2Ie1wQcYpnx+S+8cXgsiIoXtCr+8Ozss1gWsxR0kKhfjM9guWGNdi014UvDqlv2y0c=;
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5sf6-003LQB-4c
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 15:27:33 +0000
Received: by mail-ua1-f68.google.com with SMTP id g20so719293uan.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jr6fmB1bCqolizwxBYidbm0DK7lilrbAIzTvtSAUPwc=;
 b=OD+PPyXQihFrcz74PmOCztCBdly6lDfViBfUJ8bCYSihAf+NTeDjNlW27957oiYU2y
 vaECRi/hoMtqa6dmNzCM0lUUK9dKf9YF1RJK40M+BIu3PCmhMkCgJp4KkehnGF4pFDDc
 FtsT8LlG/wJQeKainLa9Xcab8pOVK4bYOAb1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jr6fmB1bCqolizwxBYidbm0DK7lilrbAIzTvtSAUPwc=;
 b=LwZBW8l3sLegOdevRaFyyy+oRqLN9+05q86X/D3vOl9r0yYOwUj1Te0Yp1Qs4smanp
 RafH6eWcGh1twHOvA3fVAA/xWzoR2bTmdbZGMe7sbRohm4V1MIfsviV3LVJtVecubUwi
 FwjZdfGphyH4UspRvOrHIvkA4VM1vsKZIw4qDeLdWsy1qyNfGfgGVTDl4b8l0R6kZn4m
 P7gHYf0d9en7kP8jX94H3gD+rixQaaez8qx0PxcExEftJwAsbBXm9ZnZbb+viV8OW8+q
 wPEnLcW0fDj0u2t9N9aM0cAZYpya1i3l/cmhdIy0YEIKZqtuZP0hlvk2YscOg7CtcJAC
 xvZw==
X-Gm-Message-State: AOAM530OtFmLPheZSU0ybGXB5F6JSKcq/sePR14waFMe0fxZkpjw2OR3
 HCzjugI/7PICJ3nKF4XSejkcWLl1YK8=
X-Google-Smtp-Source: ABdhPJzyP3sivo5AIWL3NQG7Qtz6UxS98+XBdCk2pjbIIGaXIjH5gTZyVtopVlhiObJxW5MA7sCjUQ==
X-Received: by 2002:ab0:2eaa:: with SMTP id y10mr27740410uay.57.1597246037687; 
 Wed, 12 Aug 2020 08:27:17 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id c193sm349550vke.11.2020.08.12.08.27.16
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 08:27:16 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id x17so716516uao.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 08:27:16 -0700 (PDT)
X-Received: by 2002:ab0:623:: with SMTP id f32mr12995280uaf.121.1597246036006; 
 Wed, 12 Aug 2020 08:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
In-Reply-To: <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Aug 2020 08:27:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
Message-ID: <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5sf6-003LQB-4c
Subject: Re: [Kgdb-bugreport] [RFC 0/5] Introduce NMI aware serial drivers
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Aug 12, 2020 at 7:53 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Doug,
>
> On Tue, 11 Aug 2020 at 22:46, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Aug 11, 2020 at 7:58 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Aug 11, 2020 at 07:59:24PM +0530, Sumit Garg wrote:
> > > > Hi Greg,
> > > >
> > > > Thanks for your comments.
> > > >
> > > > On Tue, 11 Aug 2020 at 19:27, Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, Aug 11, 2020 at 07:20:26PM +0530, Sumit Garg wrote:
> > > > > > On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > > > >
> > > > > > > Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> > > > > > > advent of pseudo NMIs on arm64 it became quite generic to request serial
> > > > > > > device interrupt as an NMI rather than IRQ. And having NMI driven serial
> > > > > > > RX will allow us to trigger magic sysrq as an NMI and hence drop into
> > > > > > > kernel debugger in NMI context.
> > > > > > >
> > > > > > > The major use-case is to add NMI debugging capabilities to the kernel
> > > > > > > in order to debug scenarios such as:
> > > > > > > - Primary CPU is stuck in deadlock with interrupts disabled and hence
> > > > > > >   doesn't honor serial device interrupt. So having magic sysrq triggered
> > > > > > >   as an NMI is helpful for debugging.
> > > > > > > - Always enabled NMI based magic sysrq irrespective of whether the serial
> > > > > > >   TTY port is active or not.
> > > > > > >
> > > > > > > Currently there is an existing kgdb NMI serial driver which provides
> > > > > > > partial implementation in upstream to have a separate ttyNMI0 port but
> > > > > > > that remained in silos with the serial core/drivers which made it a bit
> > > > > > > odd to enable using serial device interrupt and hence remained unused. It
> > > > > > > seems to be clearly intended to avoid almost all custom NMI changes to
> > > > > > > the UART driver.
> > > > > > >
> > > > > > > But this patch-set allows the serial core/drivers to be NMI aware which
> > > > > > > in turn provides NMI debugging capabilities via magic sysrq and hence
> > > > > > > there is no specific reason to keep this special driver. So remove it
> > > > > > > instead.
> > > > > > >
> > > > > > > Approach:
> > > > > > > ---------
> > > > > > >
> > > > > > > The overall idea is to intercept serial RX characters in NMI context, if
> > > > > > > those are specific to magic sysrq then allow corresponding handler to run
> > > > > > > in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> > > > > > > work queue in order to run those in normal interrupt context.
> > > > > > >
> > > > > > > This approach is demonstrated using amba-pl011 driver.
> > > > > > >
> > > > > > > Patch-wise description:
> > > > > > > -----------------------
> > > > > > >
> > > > > > > Patch #1 prepares magic sysrq handler to be NMI aware.
> > > > > > > Patch #2 adds NMI framework to serial core.
> > > > > > > Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> > > > > > > Patch #5 removes kgdb NMI serial driver.
> > > > > > >
> > > > > > > Goal of this RFC:
> > > > > > > -----------------
> > > > > > >
> > > > > > > My main reason for sharing this as an RFC is to help decide whether or
> > > > > > > not to continue with this approach. The next step for me would to port
> > > > > > > the work to a system with an 8250 UART.
> > > > > > >
> > > > > >
> > > > > > A gentle reminder to seek feedback on this series.
> >
> > It's been on my list for a while.  I started it Friday but ran out of
> > time.  This week hasn't been going as smoothly as I hoped but I'll
> > prioritize this since it's been too long.
> >
>
> No worries and thanks for your feedback.
>
> >
> > > > > It's the middle of the merge window, and I can't do anything.
> > > > >
> > > > > Also, I almost never review RFC patches as I have have way too many
> > > > > patches that people think are "right" to review first...
> > > > >
> > > >
> > > > Okay, I understand and I can definitely wait for your feedback.
> > >
> > > My feedback here is this:
> > >
> > > > > I suggest you work to flesh this out first and submit something that you
> > > > > feels works properly.
> > >
> > > :)
> > >
> > > > IIUC, in order to make this approach substantial I need to make it
> > > > work with 8250 UART (major serial driver), correct? As currently it
> > > > works properly for amba-pl011 driver.
> > >
> > > Yes, try to do that, or better yet, make it work with all serial drivers
> > > automatically.
> >
> > A bit of early feedback...
> >
> > Although I'm not sure we can do Greg's "make it work everywhere
> > automatically", it's possible you could get half of your patch done
> > automatically.  Specifically, your patch really does two things:
> >
> > a) It leaves the serial port "active" all the time to look for sysrq.
> > In other words even if there is no serial client it's always reading
> > the port looking for characters.  IMO this concept should be separated
> > out from the NMI concept and _could_ automatically work for all serial
> > drivers.  You'd just need something in the serial core that acted like
> > a default client if nobody else opened the serial port.  The nice
> > thing here is that we go through all the normal code paths and don't
> > need special cases in the driver.
>
> Okay, will try to explore this option to have default serial port
> client. Would this client be active in normal serial operation or only
> active when we have kgdb active? One drawback I see for normal
> operation could be power management as if user is not using serial
> port and would like to disable corresponding clock in order to reduce
> power consumption.

If I could pick the ideal, I'd say we'd do it any time the console is
configured for that port and magic sysrq is enabled.  Presumably if
they're already choosing to output kernel log messages to the serial
port and they've enabled magic sysrq they're in a state where they'd
be OK with the extra power of also listening for characters?


> > b) It enables NMI for your particular serial driver.  This seems like
> > it'd be hard to do automatically because you can't do the same things
> > at NMI that you could do in a normal interrupt handler.
>
> Agree.
>
> >
> > NOTE: to me, a) is more important than b) (though it'd be nice to have
> > both).  This would be especially true the earlier you could make a)
> > work since the main time when an "agetty" isn't running on my serial
> > port to read characters is during bootup.
> >
> > Why is b) less important to me? Sure, it would let you drop into the
> > debugger in the case where the CPU handling serial port interrupts is
> > hung with IRQs disabled, but it _woudln't_ let you drop into the
> > debugger in the case where a different CPU is hung with IRQs disabled.
> > To get that we need NMI roundup (which, I know, you are also working
> > on for arm64).  ...and, if we've got NMI roundup, presumably we can
> > find our way into the debugger by either moving the serial interrupt
> > to a different CPU ahead of time or using some type of lockup detector
> > (which I know you are also working on for arm64).
> >
>
> Thanks for sharing your preferences. I will try to get a) sorted out first.
>
> Overall I agree with your approaches to debug hard-lockup scenarios
> but they might not be so trivial for kernel engineers who doesn't
> posses kernel debugging experience as you do. :)
>
> And I still think NMI aware magic sysrq is useful for scenarios such as:
> - Try to get system information during hard-lockup rather than just
> panic via hard-lockup detection.
> - Do normal start/stop debugger activity on a core which was stuck in
> hard-lockup.
> - Random boot freezes which are not easily reproducible.

Don't get me wrong.  Having sysrq from NMI seems like a good feature
to me.  That being said, it will require non-trivial changes to each
serial driver to support it and that means that not all serial drivers
will support it.  It also starts requiring knowledge of how NMIs work
(what's allowed in NMI mode / not allowed / how to avoid races) for
authors of serial drivers.  I have a bit of a worry that the benefit
won't outweigh the extra complexity, but I guess time will tell.  One
last worry is that I assume that most people testing (and even
automated testing labs) will either always enable NMI or won't enable
NMI.  That means that everyone will be only testing one codepath or
the other and (given the complexity) the non-tested codepath will
break.

Hrm.  Along the lines of the above, though: almost no modern systems
are uniprocessor.  That means that even if one CPU is stuck with IRQs
off it's fairly likely that some other CPU is OK.  Presumably you'd
get almost as much benefit as your patch but with more done
automatically if you could figure out how to detect that the serial
interrupt isn't being serviced and re-route it to a different CPU.
...or possibly you could use some variant of the hard lockup detector
and move all interrupts off a locked up CPU?  You could make this an
option that's "default Y" when kgdb is turned on or something?


> > One last bit of feedback is that I noticed that you didn't try to
> > implement the old "knock" functionality of the old NMI driver that's
> > being deleted.  That is: your new patches don't provide an alternate
> > way to drop into the debugger for systems where BREAK isn't hooked up.
> > That's not a hard requirement, but I was kinda hoping for it since I
> > have some systems that haven't routed BREAK properly.  ;-)
> >
>
> Yeah, this is on my TODO list to have a kgdb "knock" functionality to
> be implemented via a common hook in serial core.
>
> >
> > I'll try to get some more detailed feedback in the next few days.
>
> Thanks. I do look forward to your feedback.
>
> -Sumit
>
> >
> > -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
