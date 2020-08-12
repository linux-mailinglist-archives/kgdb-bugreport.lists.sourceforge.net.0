Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8E242BBE
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 12 Aug 2020 17:00:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5sEa-000897-JD
	for lists+kgdb-bugreport@lfdr.de; Wed, 12 Aug 2020 15:00:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k5sEZ-000890-6k
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 15:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0h4prE1/dfEQyJnaFNa6jomqbA4bO8a3Wzee/NAw3o=; b=Q30afIaofL0wnKaelyQhwxduy7
 9Pg1BHePwpVlipY01oMx5kE563Hpop/7NTHHHPSvFbItlyzH8e1Kz6rPdTNr5B3Nvf6F6B71LiDUX
 XeJ65lzDv/4BV45+vlmfZK2wKkVJI7CDGex6cLNhFU4Dt+puG2jqc/yVNQsxXDyDXP6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X0h4prE1/dfEQyJnaFNa6jomqbA4bO8a3Wzee/NAw3o=; b=GgsFiiPgctK/65dR1IggoA9ekf
 iSY5/VP5Elu0uQ+yV6ZWkM0fHwReH0iTYo9BzjRIRsxK6wZGlrYJxJssjxE3myitpJV4aDFxzfvkI
 8O0Xlw2K6gPl2cGSX+8byVMbpUSf4SCWecpn1foAzUC/v3UPCeWSbxJSyp47uJacO0/w=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5sEM-00AmtX-M5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 15:00:06 +0000
Received: by mail-wr1-f66.google.com with SMTP id l2so2327699wrc.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0h4prE1/dfEQyJnaFNa6jomqbA4bO8a3Wzee/NAw3o=;
 b=oWIcmh+JROkwUVsZgF/Sf2LlA9vlbm92Q9bjnITSSsniz3pZAeEhWOPOUOaOi2gERj
 A8+Y8xPgMCj2ldO1CCD/jQJPKUC4drpl2473TRdXRs0iMiu4r5Sb//miP5vDJakH5/sS
 qbsl3pgvPNq7BeZXOfdBgDu/DHLrevAha2IsLRdsj8L8b2/I+dNwjt97YfjuR+Tww3uw
 PlnnbrNCq062e9sx53T0atE9Q9sgxPUDg8QjIescOAyqwGGJxEWnNG2tNEh0RsuLUMLb
 4Rv5dqrT4YeGPx0pi76aT8GLxzAeorslmjoAldtCGhl/f4Tmo9nNVMSFDTQ9dfo4D+Fe
 pU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0h4prE1/dfEQyJnaFNa6jomqbA4bO8a3Wzee/NAw3o=;
 b=mjdtMAh/BxKpQotmcXkoKF3cNLYJKehYcjJTZOjTS7bkdG1B5BUmDhsdS0olyKomp8
 nN6FSZo+BPFwgHRyHO29PiiZaT0xI00GsZz/ECDmFHjkFAvgERDcSmXq3FtKrgylMy5P
 7Haa9rcyub7JW7N8FB3t3lFKNT3S1dwBTrLxt6vVZRLQMtpfiqKoERA1dsJhSzsR/Rsw
 L2Co7mN1apyNaI2Xd+W9sVFAwTugg+1VjmQY6g1kCCS0uQIw9RLULybBz7t/hrnE2gNt
 6TLC+z2WnyH5T3Cm3v9gdstPvQd14xAKt9XIz/2MC2IYusdVwa86yKGY15JElIZBbQGT
 n0xw==
X-Gm-Message-State: AOAM532Wshb/77fJdOhUYnCb4c8aR9PesBsDtP7/hl/CmwLbQ9S675jG
 xqUzLQO27TukcrGljI2vHthme5Z4gib2nZzk95IVPbD9EMc=
X-Google-Smtp-Source: ABdhPJxQ0ICsn187Frur7vnkvV+tpxPzwHk5zySW8LwRKRELMDl+2K1/RYHzai3dt9sc5rlAu57i6WN7RCDsEZ0Cz6U=
X-Received: by 2002:a19:86c3:: with SMTP id i186mr6008228lfd.59.1597243974916; 
 Wed, 12 Aug 2020 07:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
In-Reply-To: <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 12 Aug 2020 20:22:42 +0530
Message-ID: <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5sEM-00AmtX-M5
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

Hi Doug,

On Tue, 11 Aug 2020 at 22:46, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Aug 11, 2020 at 7:58 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 11, 2020 at 07:59:24PM +0530, Sumit Garg wrote:
> > > Hi Greg,
> > >
> > > Thanks for your comments.
> > >
> > > On Tue, 11 Aug 2020 at 19:27, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Aug 11, 2020 at 07:20:26PM +0530, Sumit Garg wrote:
> > > > > On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > > >
> > > > > > Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> > > > > > advent of pseudo NMIs on arm64 it became quite generic to request serial
> > > > > > device interrupt as an NMI rather than IRQ. And having NMI driven serial
> > > > > > RX will allow us to trigger magic sysrq as an NMI and hence drop into
> > > > > > kernel debugger in NMI context.
> > > > > >
> > > > > > The major use-case is to add NMI debugging capabilities to the kernel
> > > > > > in order to debug scenarios such as:
> > > > > > - Primary CPU is stuck in deadlock with interrupts disabled and hence
> > > > > >   doesn't honor serial device interrupt. So having magic sysrq triggered
> > > > > >   as an NMI is helpful for debugging.
> > > > > > - Always enabled NMI based magic sysrq irrespective of whether the serial
> > > > > >   TTY port is active or not.
> > > > > >
> > > > > > Currently there is an existing kgdb NMI serial driver which provides
> > > > > > partial implementation in upstream to have a separate ttyNMI0 port but
> > > > > > that remained in silos with the serial core/drivers which made it a bit
> > > > > > odd to enable using serial device interrupt and hence remained unused. It
> > > > > > seems to be clearly intended to avoid almost all custom NMI changes to
> > > > > > the UART driver.
> > > > > >
> > > > > > But this patch-set allows the serial core/drivers to be NMI aware which
> > > > > > in turn provides NMI debugging capabilities via magic sysrq and hence
> > > > > > there is no specific reason to keep this special driver. So remove it
> > > > > > instead.
> > > > > >
> > > > > > Approach:
> > > > > > ---------
> > > > > >
> > > > > > The overall idea is to intercept serial RX characters in NMI context, if
> > > > > > those are specific to magic sysrq then allow corresponding handler to run
> > > > > > in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> > > > > > work queue in order to run those in normal interrupt context.
> > > > > >
> > > > > > This approach is demonstrated using amba-pl011 driver.
> > > > > >
> > > > > > Patch-wise description:
> > > > > > -----------------------
> > > > > >
> > > > > > Patch #1 prepares magic sysrq handler to be NMI aware.
> > > > > > Patch #2 adds NMI framework to serial core.
> > > > > > Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> > > > > > Patch #5 removes kgdb NMI serial driver.
> > > > > >
> > > > > > Goal of this RFC:
> > > > > > -----------------
> > > > > >
> > > > > > My main reason for sharing this as an RFC is to help decide whether or
> > > > > > not to continue with this approach. The next step for me would to port
> > > > > > the work to a system with an 8250 UART.
> > > > > >
> > > > >
> > > > > A gentle reminder to seek feedback on this series.
>
> It's been on my list for a while.  I started it Friday but ran out of
> time.  This week hasn't been going as smoothly as I hoped but I'll
> prioritize this since it's been too long.
>

No worries and thanks for your feedback.

>
> > > > It's the middle of the merge window, and I can't do anything.
> > > >
> > > > Also, I almost never review RFC patches as I have have way too many
> > > > patches that people think are "right" to review first...
> > > >
> > >
> > > Okay, I understand and I can definitely wait for your feedback.
> >
> > My feedback here is this:
> >
> > > > I suggest you work to flesh this out first and submit something that you
> > > > feels works properly.
> >
> > :)
> >
> > > IIUC, in order to make this approach substantial I need to make it
> > > work with 8250 UART (major serial driver), correct? As currently it
> > > works properly for amba-pl011 driver.
> >
> > Yes, try to do that, or better yet, make it work with all serial drivers
> > automatically.
>
> A bit of early feedback...
>
> Although I'm not sure we can do Greg's "make it work everywhere
> automatically", it's possible you could get half of your patch done
> automatically.  Specifically, your patch really does two things:
>
> a) It leaves the serial port "active" all the time to look for sysrq.
> In other words even if there is no serial client it's always reading
> the port looking for characters.  IMO this concept should be separated
> out from the NMI concept and _could_ automatically work for all serial
> drivers.  You'd just need something in the serial core that acted like
> a default client if nobody else opened the serial port.  The nice
> thing here is that we go through all the normal code paths and don't
> need special cases in the driver.

Okay, will try to explore this option to have default serial port
client. Would this client be active in normal serial operation or only
active when we have kgdb active? One drawback I see for normal
operation could be power management as if user is not using serial
port and would like to disable corresponding clock in order to reduce
power consumption.

>
> b) It enables NMI for your particular serial driver.  This seems like
> it'd be hard to do automatically because you can't do the same things
> at NMI that you could do in a normal interrupt handler.

Agree.

>
> NOTE: to me, a) is more important than b) (though it'd be nice to have
> both).  This would be especially true the earlier you could make a)
> work since the main time when an "agetty" isn't running on my serial
> port to read characters is during bootup.
>
> Why is b) less important to me? Sure, it would let you drop into the
> debugger in the case where the CPU handling serial port interrupts is
> hung with IRQs disabled, but it _woudln't_ let you drop into the
> debugger in the case where a different CPU is hung with IRQs disabled.
> To get that we need NMI roundup (which, I know, you are also working
> on for arm64).  ...and, if we've got NMI roundup, presumably we can
> find our way into the debugger by either moving the serial interrupt
> to a different CPU ahead of time or using some type of lockup detector
> (which I know you are also working on for arm64).
>

Thanks for sharing your preferences. I will try to get a) sorted out first.

Overall I agree with your approaches to debug hard-lockup scenarios
but they might not be so trivial for kernel engineers who doesn't
posses kernel debugging experience as you do. :)

And I still think NMI aware magic sysrq is useful for scenarios such as:
- Try to get system information during hard-lockup rather than just
panic via hard-lockup detection.
- Do normal start/stop debugger activity on a core which was stuck in
hard-lockup.
- Random boot freezes which are not easily reproducible.

>
> One last bit of feedback is that I noticed that you didn't try to
> implement the old "knock" functionality of the old NMI driver that's
> being deleted.  That is: your new patches don't provide an alternate
> way to drop into the debugger for systems where BREAK isn't hooked up.
> That's not a hard requirement, but I was kinda hoping for it since I
> have some systems that haven't routed BREAK properly.  ;-)
>

Yeah, this is on my TODO list to have a kgdb "knock" functionality to
be implemented via a common hook in serial core.

>
> I'll try to get some more detailed feedback in the next few days.

Thanks. I do look forward to your feedback.

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
