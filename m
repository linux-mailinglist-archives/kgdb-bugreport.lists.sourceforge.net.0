Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE2241CCE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Aug 2020 16:58:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5VjR-00033G-VE
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 Aug 2020 14:58:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1k5VjQ-000339-MZ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 14:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pMVMIVZdSsNdrrDyPVGa8T7XqBMG4EGBCA1UO46U3jY=; b=MmGqtqF6BXzp8BuIApsFX1rBiU
 Tx/4xA9ImAcd13lvNIr8iL3+mlr+T/S76xt77+B337x99OknfLnq0IGDZ3X6U57SxOUELJbXw/B/0
 hsSAQBJDsfcMbNMpjORcvdQqd5mdZpbj8LJ9oJAnINsL/QzOyGdxC0D30w5MMT8IpDbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pMVMIVZdSsNdrrDyPVGa8T7XqBMG4EGBCA1UO46U3jY=; b=NJ3MfiGpJQLOKbIbvvoqTHgAsv
 UM6BLPj88a3OidEeq/zYhtOwT6HkFp6MbVjGGMQM/Ra2P1yf2Oi4S+PdaS9govfx1tF7EXepOMTAL
 9uN/DYjXdjfdpitVxFGWB5VylgzoYHkAwyKujlbnnH/V9+XufiW+cilGC40zsJsP8WEo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5VjM-008wik-W6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 14:58:28 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5D872076C;
 Tue, 11 Aug 2020 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597157887;
 bh=rpjJYDNyUBJye/pKJy8+A0p0IjypBh/1eTDNkuQVops=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKhalOQMVaEdBkBATPK3DlaVPy3dsufQphPHD8qF1tXlhOeoUlrWjyw9RvLs3Yqx/
 R8vgpRuviQTFGJZ8KVdnpRtGlNtOIwsirOSFeDfIFXshjHzDVq1nnHrOnpg5FaCE3C
 7jfYOkaLBoTQBGGebtEeUf1liV8Q3b7Ld5r1gPzs=
Date: Tue, 11 Aug 2020 16:58:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200811145816.GA424033@kroah.com>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5VjM-008wik-W6
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

On Tue, Aug 11, 2020 at 07:59:24PM +0530, Sumit Garg wrote:
> Hi Greg,
> 
> Thanks for your comments.
> 
> On Tue, 11 Aug 2020 at 19:27, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 11, 2020 at 07:20:26PM +0530, Sumit Garg wrote:
> > > On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> > > > advent of pseudo NMIs on arm64 it became quite generic to request serial
> > > > device interrupt as an NMI rather than IRQ. And having NMI driven serial
> > > > RX will allow us to trigger magic sysrq as an NMI and hence drop into
> > > > kernel debugger in NMI context.
> > > >
> > > > The major use-case is to add NMI debugging capabilities to the kernel
> > > > in order to debug scenarios such as:
> > > > - Primary CPU is stuck in deadlock with interrupts disabled and hence
> > > >   doesn't honor serial device interrupt. So having magic sysrq triggered
> > > >   as an NMI is helpful for debugging.
> > > > - Always enabled NMI based magic sysrq irrespective of whether the serial
> > > >   TTY port is active or not.
> > > >
> > > > Currently there is an existing kgdb NMI serial driver which provides
> > > > partial implementation in upstream to have a separate ttyNMI0 port but
> > > > that remained in silos with the serial core/drivers which made it a bit
> > > > odd to enable using serial device interrupt and hence remained unused. It
> > > > seems to be clearly intended to avoid almost all custom NMI changes to
> > > > the UART driver.
> > > >
> > > > But this patch-set allows the serial core/drivers to be NMI aware which
> > > > in turn provides NMI debugging capabilities via magic sysrq and hence
> > > > there is no specific reason to keep this special driver. So remove it
> > > > instead.
> > > >
> > > > Approach:
> > > > ---------
> > > >
> > > > The overall idea is to intercept serial RX characters in NMI context, if
> > > > those are specific to magic sysrq then allow corresponding handler to run
> > > > in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> > > > work queue in order to run those in normal interrupt context.
> > > >
> > > > This approach is demonstrated using amba-pl011 driver.
> > > >
> > > > Patch-wise description:
> > > > -----------------------
> > > >
> > > > Patch #1 prepares magic sysrq handler to be NMI aware.
> > > > Patch #2 adds NMI framework to serial core.
> > > > Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> > > > Patch #5 removes kgdb NMI serial driver.
> > > >
> > > > Goal of this RFC:
> > > > -----------------
> > > >
> > > > My main reason for sharing this as an RFC is to help decide whether or
> > > > not to continue with this approach. The next step for me would to port
> > > > the work to a system with an 8250 UART.
> > > >
> > >
> > > A gentle reminder to seek feedback on this series.
> >
> > It's the middle of the merge window, and I can't do anything.
> >
> > Also, I almost never review RFC patches as I have have way too many
> > patches that people think are "right" to review first...
> >
> 
> Okay, I understand and I can definitely wait for your feedback.

My feedback here is this:

> > I suggest you work to flesh this out first and submit something that you
> > feels works properly.

:)

> IIUC, in order to make this approach substantial I need to make it
> work with 8250 UART (major serial driver), correct? As currently it
> works properly for amba-pl011 driver.

Yes, try to do that, or better yet, make it work with all serial drivers
automatically.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
