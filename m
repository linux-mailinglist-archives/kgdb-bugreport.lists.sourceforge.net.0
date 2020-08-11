Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D6241F04
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Aug 2020 19:16:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5Xsj-0003fT-PY
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 Aug 2020 17:16:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k5Xsi-0003ew-9d
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 17:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GcOJfgPH+kookjeNTFA/a55bCUyOIBtLpH9z1xzQ2Dk=; b=jsPexkUCzWgL7PJuwxS/K5zYoW
 Sza5Ns69Uj0SGbEUWLjNzULE3jG86DstGaL58hjHRQCWbxwqXV0IlvoMM3SZvqC022VMUaH9dSKxR
 5+cElOZp7zD8HB1QS4ugEyHByyYNSYGpc8dMzjhFdB554ptoCFHGM8hv3qmSAM6IPsJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GcOJfgPH+kookjeNTFA/a55bCUyOIBtLpH9z1xzQ2Dk=; b=YommS9ctX68Iu2yN99WdNaf0rO
 GZeOQqy3JqcvQzjiOfVAzhA860cb3eXDiGq0NIiEjqgmBSONi/KxQvThf9TjLr8MYyJON5ROIdcj3
 XErpFo7PS6l7iPgOppLvLxJuIw8yBcEqcxMSJ7Epb+a+xJ0a1+tV1zrkwlbAZ47APGz4=;
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5Xsg-006ZQ1-GE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 17:16:12 +0000
Received: by mail-ua1-f65.google.com with SMTP id q68so3719706uaq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Aug 2020 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GcOJfgPH+kookjeNTFA/a55bCUyOIBtLpH9z1xzQ2Dk=;
 b=klLz6wKUUtyx3zTEv9yLDqYfCzgIBog5o60iZxU1w4FeSRHRE0b71zp3P+GhyIdo5T
 rChF30fNgQprCmJxLbQr1YPJFiBv6guVBUBCqfTSS5M8aXfntO6UJTZ/p6Op2XHdn7TR
 o2TnLXcqhz88ByC7UnvSIlo/qFjwfFZF2Gawg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GcOJfgPH+kookjeNTFA/a55bCUyOIBtLpH9z1xzQ2Dk=;
 b=MLMtFaBvl7cUv8KO7Ir4GLlUcGq5H1yOUA4W7L7JXfJAcF+XGDB26lGJo2DsqVyVXO
 mQdp9lofo2O1V5yyYaEXviPXbyaOQ98oegnPTjnzyk6E2o9S/8wMDLVmkrtY14OmRtT1
 pMgrI4I4uS3rKxrEuwq8AQxVhf3uxiWnxZeppqRLDRXcCWKm7EUzp3IRqyabf8D4asJL
 bdwpbKxNBTfi1WlWkARXedxf2m53YJwFUO0f4Gv0K5pQLw6haXNYVf2OAO0OUFb/NBJE
 2xGIQG7foCTpxf0RZls9U5Xh0Pr5qYtEI6B9ThW6Re8GMPLIHrr4nL52bRdFfOZygRrr
 HkjA==
X-Gm-Message-State: AOAM533UgO8z92SlZFh/6vEO+RiSWbLJl+pbPeNwp1k4UVBbsa+G0KcM
 nLtAAj2qgp3hd66A9XdBMIXK3S0Pbw8=
X-Google-Smtp-Source: ABdhPJxfNw5f2F/+Zb1W6zTxlGFMV5nW0A6erRXK8zSVF7uYB2Zi6dU75pvDrHi9K0nhuXCpQXKEpA==
X-Received: by 2002:ab0:6950:: with SMTP id c16mr23425741uas.71.1597166160849; 
 Tue, 11 Aug 2020 10:16:00 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id 60sm8073223uad.5.2020.08.11.10.15.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 10:16:00 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id s29so1542120uae.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Aug 2020 10:15:59 -0700 (PDT)
X-Received: by 2002:ab0:37d3:: with SMTP id e19mr24271569uav.64.1597166159205; 
 Tue, 11 Aug 2020 10:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
In-Reply-To: <20200811145816.GA424033@kroah.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Aug 2020 10:15:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
Message-ID: <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5Xsg-006ZQ1-GE
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Aug 11, 2020 at 7:58 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 11, 2020 at 07:59:24PM +0530, Sumit Garg wrote:
> > Hi Greg,
> >
> > Thanks for your comments.
> >
> > On Tue, 11 Aug 2020 at 19:27, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Aug 11, 2020 at 07:20:26PM +0530, Sumit Garg wrote:
> > > > On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > >
> > > > > Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> > > > > advent of pseudo NMIs on arm64 it became quite generic to request serial
> > > > > device interrupt as an NMI rather than IRQ. And having NMI driven serial
> > > > > RX will allow us to trigger magic sysrq as an NMI and hence drop into
> > > > > kernel debugger in NMI context.
> > > > >
> > > > > The major use-case is to add NMI debugging capabilities to the kernel
> > > > > in order to debug scenarios such as:
> > > > > - Primary CPU is stuck in deadlock with interrupts disabled and hence
> > > > >   doesn't honor serial device interrupt. So having magic sysrq triggered
> > > > >   as an NMI is helpful for debugging.
> > > > > - Always enabled NMI based magic sysrq irrespective of whether the serial
> > > > >   TTY port is active or not.
> > > > >
> > > > > Currently there is an existing kgdb NMI serial driver which provides
> > > > > partial implementation in upstream to have a separate ttyNMI0 port but
> > > > > that remained in silos with the serial core/drivers which made it a bit
> > > > > odd to enable using serial device interrupt and hence remained unused. It
> > > > > seems to be clearly intended to avoid almost all custom NMI changes to
> > > > > the UART driver.
> > > > >
> > > > > But this patch-set allows the serial core/drivers to be NMI aware which
> > > > > in turn provides NMI debugging capabilities via magic sysrq and hence
> > > > > there is no specific reason to keep this special driver. So remove it
> > > > > instead.
> > > > >
> > > > > Approach:
> > > > > ---------
> > > > >
> > > > > The overall idea is to intercept serial RX characters in NMI context, if
> > > > > those are specific to magic sysrq then allow corresponding handler to run
> > > > > in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> > > > > work queue in order to run those in normal interrupt context.
> > > > >
> > > > > This approach is demonstrated using amba-pl011 driver.
> > > > >
> > > > > Patch-wise description:
> > > > > -----------------------
> > > > >
> > > > > Patch #1 prepares magic sysrq handler to be NMI aware.
> > > > > Patch #2 adds NMI framework to serial core.
> > > > > Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> > > > > Patch #5 removes kgdb NMI serial driver.
> > > > >
> > > > > Goal of this RFC:
> > > > > -----------------
> > > > >
> > > > > My main reason for sharing this as an RFC is to help decide whether or
> > > > > not to continue with this approach. The next step for me would to port
> > > > > the work to a system with an 8250 UART.
> > > > >
> > > >
> > > > A gentle reminder to seek feedback on this series.

It's been on my list for a while.  I started it Friday but ran out of
time.  This week hasn't been going as smoothly as I hoped but I'll
prioritize this since it's been too long.


> > > It's the middle of the merge window, and I can't do anything.
> > >
> > > Also, I almost never review RFC patches as I have have way too many
> > > patches that people think are "right" to review first...
> > >
> >
> > Okay, I understand and I can definitely wait for your feedback.
>
> My feedback here is this:
>
> > > I suggest you work to flesh this out first and submit something that you
> > > feels works properly.
>
> :)
>
> > IIUC, in order to make this approach substantial I need to make it
> > work with 8250 UART (major serial driver), correct? As currently it
> > works properly for amba-pl011 driver.
>
> Yes, try to do that, or better yet, make it work with all serial drivers
> automatically.

A bit of early feedback...

Although I'm not sure we can do Greg's "make it work everywhere
automatically", it's possible you could get half of your patch done
automatically.  Specifically, your patch really does two things:

a) It leaves the serial port "active" all the time to look for sysrq.
In other words even if there is no serial client it's always reading
the port looking for characters.  IMO this concept should be separated
out from the NMI concept and _could_ automatically work for all serial
drivers.  You'd just need something in the serial core that acted like
a default client if nobody else opened the serial port.  The nice
thing here is that we go through all the normal code paths and don't
need special cases in the driver.

b) It enables NMI for your particular serial driver.  This seems like
it'd be hard to do automatically because you can't do the same things
at NMI that you could do in a normal interrupt handler.

NOTE: to me, a) is more important than b) (though it'd be nice to have
both).  This would be especially true the earlier you could make a)
work since the main time when an "agetty" isn't running on my serial
port to read characters is during bootup.

Why is b) less important to me? Sure, it would let you drop into the
debugger in the case where the CPU handling serial port interrupts is
hung with IRQs disabled, but it _woudln't_ let you drop into the
debugger in the case where a different CPU is hung with IRQs disabled.
To get that we need NMI roundup (which, I know, you are also working
on for arm64).  ...and, if we've got NMI roundup, presumably we can
find our way into the debugger by either moving the serial interrupt
to a different CPU ahead of time or using some type of lockup detector
(which I know you are also working on for arm64).


One last bit of feedback is that I noticed that you didn't try to
implement the old "knock" functionality of the old NMI driver that's
being deleted.  That is: your new patches don't provide an alternate
way to drop into the debugger for systems where BREAK isn't hooked up.
That's not a hard requirement, but I was kinda hoping for it since I
have some systems that haven't routed BREAK properly.  ;-)


I'll try to get some more detailed feedback in the next few days.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
