Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B424251A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 12 Aug 2020 07:48:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5jd7-0002Ui-S5
	for lists+kgdb-bugreport@lfdr.de; Wed, 12 Aug 2020 05:48:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k5jd7-0002Ub-1w
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 05:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0zEyjemzrW6tuSgaZxYukJPqD4TDeOcf1QxIdZ2ERWE=; b=Jub+dKkc6DoqbYKxhfEUItyA5D
 ip2jLfTlLWEjLp/YJj3komQ5S2cvkXdi33G8UMIBHaubAdy5+CTCpV4yHhZdRaFmuYyYmFHNzIDeJ
 18eU4H9dsiggpqAzHzeNiuWvp/Ktx3BojbooPpxH0MBkj84dRG1QsYjb4QHMa+K7Jygo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0zEyjemzrW6tuSgaZxYukJPqD4TDeOcf1QxIdZ2ERWE=; b=Xo0K684rTf8QUNQ4eYLPFG5HtZ
 C2oiTVcRQwFI6vImLdOvIg0jVgxOa+4NKOHk2UZ7+8AM9R1aEpcdHkJLhYYwLqhnkg2KmncyvoTmc
 fQVL1y37FQINHH+c5pQvUneIJkSfBE35pv/xvuL6bIU4PYu9jFp7oybzgWXCr7fMA12A=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5jd3-002ujE-4s
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 05:48:53 +0000
Received: by mail-lj1-f194.google.com with SMTP id v4so907733ljd.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Aug 2020 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zEyjemzrW6tuSgaZxYukJPqD4TDeOcf1QxIdZ2ERWE=;
 b=t3V+ZjoHihxGen/+fgcb+Sl03t+g32bqWe2dXV0gZ0ay5zDsCBaKQXzaAsXiaWlX4M
 bWnc6EU04acKEt4FPPmZIbGLNgPs5+7PI/M1HLrVIKJCwsyAKf+T8wh9dUqU4Pm5eEev
 QUX8yIytpIJ9M++9s670b38UU7MBDjMJ4ZRy9uV2/p5zLmLTIsvfYdAMe2lx0r/pv2tr
 WvI8EyZ0wO9Zz4TYPOT1Ghp3FeHCTh2o4yCQqqN9NuHTgSKAPHEKK4Bi2Dmh9Jk+L/hi
 mvKVcbex+IDJGph6gi02H2S+N8Qrj6V6jMbx+9fo9F3b6pUnSyZXdf2kOTqQmoqT1mt/
 xBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zEyjemzrW6tuSgaZxYukJPqD4TDeOcf1QxIdZ2ERWE=;
 b=D7uAR5CNV61oY75nmcKXqEKGOvJhFKiTchKclS6f1q3k3t0W+0X9JrzeoJTBxDscN/
 xZqV/xsNHMPd/tdOKqL3cfm/s+J+Y3HlZRGOOu7wxxTWw07t1yU13dLUgojZMzjGGbi4
 N4jWIpSyS4rFl02BBOhTQP7uXBce+/n+3iruSVufOEAdPyr/ZIAw4VOEoA2F3dMedQ8B
 Zveu9mZVfoCPa6O0/KZqMX92az0faD7S2s4u5cwwMu0CZWEBWPQvC9kzhL6LbJiws/0I
 J1MhkG4sIkGCquR6PM9iBGOsA3Z2dPlP7vOp8r2wL6IURsfckD4RxAyVTWS8KSqd0T2Z
 MpwQ==
X-Gm-Message-State: AOAM5336FdJVPwRdStf7V6G3IjklobgdW5opwhE0gQF65ZNhPHhYOP2I
 gbyIFjIBXIjc3nSrW6wOZqL5C++x3kukjfeKM0mXIQ==
X-Google-Smtp-Source: ABdhPJwHYv2n245El0sBHY3SXi/OZuUM7Hs+PCZPO5C3+U+GeaumrLCmLEKIDi60P/Ex2ud9bVj2jZmm4c++3mhnB+c=
X-Received: by 2002:a05:651c:1293:: with SMTP id
 19mr4299748ljc.427.1597211315219; 
 Tue, 11 Aug 2020 22:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
In-Reply-To: <20200811145816.GA424033@kroah.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 12 Aug 2020 11:18:23 +0530
Message-ID: <CAFA6WYNzP5kUtcUrrUthxUGh7T+S+V1bqsRD6i=HfhBcncQqPg@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5jd3-002ujE-4s
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

On Tue, 11 Aug 2020 at 20:28, Greg Kroah-Hartman
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
> > >
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

I would like to make serial drivers work automatically but
unfortunately the interrupt request/ handling code is pretty specific
to the corresponding serial driver.

BTW, I will look for ways how we can make it much easier for serial
drivers to adapt.

-Sumit

>
> thanks,
>
> greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
