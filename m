Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9F241C5F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Aug 2020 16:29:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5VHe-0008GR-Iy
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 Aug 2020 14:29:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k5VHc-0008G9-Bc
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 14:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KkzFrtv0c+qoPAhI6jwpG+PydA17UzEovGlcuGw1Sps=; b=Tkq32ANtIqcacmdjY1oYAS3XKn
 /6vr89PyP6+Uj2qysHO+9tnIg1kowCv8CSb1pfsHXGtYv/DKqd01UMkDeyYvNZ+MKcuvEDc5aV1Xe
 2dRkumarDGbZe0nalu8qUscFu8HGML6Q3bKSHB7Yl1x+vyW4GgyaWwTu8inKTlSqj29Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KkzFrtv0c+qoPAhI6jwpG+PydA17UzEovGlcuGw1Sps=; b=MBCPjcBBFinCmqkYfc8f9KFpc9
 h2Xcr4BGxETcrhmuNHy26lD1huA8AgAHAt+LVsj9ncPLUTGmS/e9K3u1+MZqFXYQa5STn+vSt+gWz
 cP61KqXIN15Nbr4CSisTSZlDaxXM6SPMG1b05ut+TAOb1FbzEj3UIjdwKyAWN1GqOFhU=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5VHa-001EJ2-QL
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 14:29:44 +0000
Received: by mail-lj1-f193.google.com with SMTP id v4so13761524ljd.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Aug 2020 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkzFrtv0c+qoPAhI6jwpG+PydA17UzEovGlcuGw1Sps=;
 b=Cm1Tcc1QCdLhQB+oaKcHVbnlYt9sGsmFejuHFLKrI9QqSNl/Fse5iGu3VtFfWFDsVL
 LaJZoICnAbnedb4SGXu5bdSED6k8LU8weTlxSQm2ZytW13SCmEDyW1aF2vQhRchu2b4X
 QBa3FW9LTHR+lUp5HrNWKHC/u0rBwDQ1P24vRBZ79SRIMNPtOH6SnBB2JRla7wM1kFwM
 M+2EfwC0j1xm+UOwmmQnQGMEwen81gnf482PeXuBfVRq0EmYU/uVd3M+ZShUxlhp5I//
 Ctly+qbkrF0UN6hELmWq3OJKqAtfI2KN8HJTPxm8okIeDGWmXQ24pfW0E/JePUuaRLFW
 Mi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkzFrtv0c+qoPAhI6jwpG+PydA17UzEovGlcuGw1Sps=;
 b=cbCTcbUtAoMel1bxVovW10caESW0CVWVeIGj/xdmpKwxQzR5MkT0oYCxy13HlEvYJo
 0AlEVhP/6rBO5OueOuR6+TVhWOHQmb/kCKAthfLeZNEY45xpFJBqLurqVs9vNAxp6yib
 IgVowg+I7wxUf46l9bmqKESDFA4woqKx/0d7Y8YzJNR5SA/OB8vs7WlgFyl1UoTOjfmm
 M36cwDmH8LdqmhzPBPpUr13HV39KcxZuL36qMjEzW8WBfuHYmrDTSe601XVaCteZZT5h
 vu52/H/p5s1q4jEMs11EpaNfEWduhTdXUBa3UBleye8vhN2ectpkqcMJv6CH/BFQiyPk
 SFCw==
X-Gm-Message-State: AOAM530m89VcXHihEKkyxiVPj5+p4+9BWchLU7PbyepiC/6AM6k7/W59
 oqDPhmTWxMrSLOqzo57sLvAkLOy/+tR9q7vA+wiBhxvw
X-Google-Smtp-Source: ABdhPJyJ1wnqNF5YPIO4kRwCd++xZfKyweClk+mQLcH6eO5yxlF+xzvevF4oQwGopn5tNZ3LQcm2T7AN3pLnJ1s2+Hs=
X-Received: by 2002:a05:651c:1293:: with SMTP id
 19mr3003077ljc.427.1597156176182; 
 Tue, 11 Aug 2020 07:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
In-Reply-To: <20200811135801.GA416071@kroah.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 11 Aug 2020 19:59:24 +0530
Message-ID: <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5VHa-001EJ2-QL
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

Hi Greg,

Thanks for your comments.

On Tue, 11 Aug 2020 at 19:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 11, 2020 at 07:20:26PM +0530, Sumit Garg wrote:
> > On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> > > advent of pseudo NMIs on arm64 it became quite generic to request serial
> > > device interrupt as an NMI rather than IRQ. And having NMI driven serial
> > > RX will allow us to trigger magic sysrq as an NMI and hence drop into
> > > kernel debugger in NMI context.
> > >
> > > The major use-case is to add NMI debugging capabilities to the kernel
> > > in order to debug scenarios such as:
> > > - Primary CPU is stuck in deadlock with interrupts disabled and hence
> > >   doesn't honor serial device interrupt. So having magic sysrq triggered
> > >   as an NMI is helpful for debugging.
> > > - Always enabled NMI based magic sysrq irrespective of whether the serial
> > >   TTY port is active or not.
> > >
> > > Currently there is an existing kgdb NMI serial driver which provides
> > > partial implementation in upstream to have a separate ttyNMI0 port but
> > > that remained in silos with the serial core/drivers which made it a bit
> > > odd to enable using serial device interrupt and hence remained unused. It
> > > seems to be clearly intended to avoid almost all custom NMI changes to
> > > the UART driver.
> > >
> > > But this patch-set allows the serial core/drivers to be NMI aware which
> > > in turn provides NMI debugging capabilities via magic sysrq and hence
> > > there is no specific reason to keep this special driver. So remove it
> > > instead.
> > >
> > > Approach:
> > > ---------
> > >
> > > The overall idea is to intercept serial RX characters in NMI context, if
> > > those are specific to magic sysrq then allow corresponding handler to run
> > > in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> > > work queue in order to run those in normal interrupt context.
> > >
> > > This approach is demonstrated using amba-pl011 driver.
> > >
> > > Patch-wise description:
> > > -----------------------
> > >
> > > Patch #1 prepares magic sysrq handler to be NMI aware.
> > > Patch #2 adds NMI framework to serial core.
> > > Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> > > Patch #5 removes kgdb NMI serial driver.
> > >
> > > Goal of this RFC:
> > > -----------------
> > >
> > > My main reason for sharing this as an RFC is to help decide whether or
> > > not to continue with this approach. The next step for me would to port
> > > the work to a system with an 8250 UART.
> > >
> >
> > A gentle reminder to seek feedback on this series.
>
> It's the middle of the merge window, and I can't do anything.
>
> Also, I almost never review RFC patches as I have have way too many
> patches that people think are "right" to review first...
>

Okay, I understand and I can definitely wait for your feedback.

> I suggest you work to flesh this out first and submit something that you
> feels works properly.
>

IIUC, in order to make this approach substantial I need to make it
work with 8250 UART (major serial driver), correct? As currently it
works properly for amba-pl011 driver.

> good luck!
>

Thanks.

-Sumit

> greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
