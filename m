Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0E241BE3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Aug 2020 15:58:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5Un5-0000N6-3f
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 Aug 2020 13:58:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1k5Un1-0000Mi-V8
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 13:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bYCBotQ6C8GRtdB1IAutTNEeMKmbim+4ZYKW9nly3nY=; b=RVz0YIIWvpy7i5bEzqqgJDEs5g
 6cDQ19WKpKgAevut92ZAYiOKb4JRRSdejinUCC7Viuqg+Uli+h0gOF1bEi0GiBcagMLZZc2QfZazt
 XiAxH55uf3DzoTMn4H8DZ+AhABHACDN8NlI7nbiAubfTaSPXylaY/YngtbnWc//5qPik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bYCBotQ6C8GRtdB1IAutTNEeMKmbim+4ZYKW9nly3nY=; b=Yv1V/wnYeFwt7+p0zNqM3ZT5/F
 QSVlNPBCQRPLToajlxvyGW9a4fAEDV+CkQYdMq4BsjYLixAl27NAny2A5GMb/bzS1ICfPnR4Zf/JK
 gqOamXByPr/7541E+apUkSHjGGKhgxIRph9n2X8ywDL3UhF06dvLEP8Sx24xkjioWVvs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5Umv-008j8i-PN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 13:58:06 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E83D7204FD;
 Tue, 11 Aug 2020 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597154271;
 bh=AUalpQ/F4oVEJNL3cwT0Yq/xqScgJYySpJZPuhXviZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DjRy9cO/5e51Iv5u6EkzB0z5aEXggl0QXsYm602JCdsbHrWvMoezhNPKejp8T6hua
 z9gMtdDiOv1b60+J0o+xxaWQ4GI2j3wBB3wKP5g6njQr3BhCAffEweqP2jzGM9M1B7
 Lv9ZA07am5i8gsR1M9xvSTjV8uQKmk44NmK0fG+4=
Date: Tue, 11 Aug 2020 15:58:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200811135801.GA416071@kroah.com>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5Umv-008j8i-PN
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
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Aug 11, 2020 at 07:20:26PM +0530, Sumit Garg wrote:
> On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> > advent of pseudo NMIs on arm64 it became quite generic to request serial
> > device interrupt as an NMI rather than IRQ. And having NMI driven serial
> > RX will allow us to trigger magic sysrq as an NMI and hence drop into
> > kernel debugger in NMI context.
> >
> > The major use-case is to add NMI debugging capabilities to the kernel
> > in order to debug scenarios such as:
> > - Primary CPU is stuck in deadlock with interrupts disabled and hence
> >   doesn't honor serial device interrupt. So having magic sysrq triggered
> >   as an NMI is helpful for debugging.
> > - Always enabled NMI based magic sysrq irrespective of whether the serial
> >   TTY port is active or not.
> >
> > Currently there is an existing kgdb NMI serial driver which provides
> > partial implementation in upstream to have a separate ttyNMI0 port but
> > that remained in silos with the serial core/drivers which made it a bit
> > odd to enable using serial device interrupt and hence remained unused. It
> > seems to be clearly intended to avoid almost all custom NMI changes to
> > the UART driver.
> >
> > But this patch-set allows the serial core/drivers to be NMI aware which
> > in turn provides NMI debugging capabilities via magic sysrq and hence
> > there is no specific reason to keep this special driver. So remove it
> > instead.
> >
> > Approach:
> > ---------
> >
> > The overall idea is to intercept serial RX characters in NMI context, if
> > those are specific to magic sysrq then allow corresponding handler to run
> > in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> > work queue in order to run those in normal interrupt context.
> >
> > This approach is demonstrated using amba-pl011 driver.
> >
> > Patch-wise description:
> > -----------------------
> >
> > Patch #1 prepares magic sysrq handler to be NMI aware.
> > Patch #2 adds NMI framework to serial core.
> > Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> > Patch #5 removes kgdb NMI serial driver.
> >
> > Goal of this RFC:
> > -----------------
> >
> > My main reason for sharing this as an RFC is to help decide whether or
> > not to continue with this approach. The next step for me would to port
> > the work to a system with an 8250 UART.
> >
> 
> A gentle reminder to seek feedback on this series.

It's the middle of the merge window, and I can't do anything.

Also, I almost never review RFC patches as I have have way too many
patches that people think are "right" to review first...

I suggest you work to flesh this out first and submit something that you
feels works properly.

good luck!

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
