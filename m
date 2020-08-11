Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE6241C33
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 Aug 2020 16:18:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5V6N-0001CC-Mr
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 Aug 2020 14:18:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k5V6M-0001C5-Il
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 14:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i4nkoFmCJzzL1SkDVNUF5LncMf3gqSptzGPM/hRINOw=; b=XJmMdIUR5gPs22U01KO1hY9N0w
 kZ5pbiG5Vp9nRDtA9p4n952K/Wh7uo/TMBOb4f2EFfSQmxM2l1O/BQ0HZ/OkAiXjEiKDuGMq7Gynl
 eSLRJNI1+Vp5CJpKG/TbSiOqNhY3f1CsW3EKBTWkLWgwlk9Pv88J2Y8pL6e3XUdOuifc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i4nkoFmCJzzL1SkDVNUF5LncMf3gqSptzGPM/hRINOw=; b=cait3fVbXSt959vi6ktByRqf3H
 Vy4zPff56kz/FGGe9XvSAzRtDqrt14+CnA2JZJtA3HNsTHcwszUovVOuDLmENTqavf5Qc/75uTFwm
 G8la7phKJEklqgsNJy5ToDwnLWGVSTYksyUXbI6RVFja5NLHHwY0iumwbUkDsz746Eh0=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5V6H-001BRV-SC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 Aug 2020 14:18:06 +0000
Received: by mail-wr1-f66.google.com with SMTP id f12so11652429wru.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 11 Aug 2020 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4nkoFmCJzzL1SkDVNUF5LncMf3gqSptzGPM/hRINOw=;
 b=F7HWNzuTxoTo7n+A7nt9eRcE7ODxZuX8PPec8qjyEnaLtoJ6mTxyC8TkKoh1/Wc2JZ
 YL9py4gevaJ+/g17NW9EgLePULdGQrxquDHfvpCtkpZZyPZbs9JrB8b5bSwUXciqSc9e
 C9cCs60raxbZLt4fS0V2khQANzLfsQd231OIz3EkdBiD0Cl4G1YGAa9G3Y0o+abKPyqD
 oOH1XDgZDb21rxAT3TbRORsYYwF/wLaQkvTiByNcO+TYJmqNehylDdOuziLD0JX/oEtb
 F/If9/Ia6n+DoU9pO0Bm4nf99MoML1fDjfiS65QKU6qbt0w4QinY0Jmqo8d//1XRWWKu
 iC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4nkoFmCJzzL1SkDVNUF5LncMf3gqSptzGPM/hRINOw=;
 b=cwCNd9ivPJo8LP09uRkJ/6Hq2tkTPlx5GIojxW/pG6mnDFy2KkItqHZhob0oVxbExM
 xy0kVdV2cyQ9g2kSK3VDfXuS8tLpva7RmxrQe3yIXYY7TNIug7Fa5lKTeRqDrC5hlP6N
 /JcFy9enHozMOc6+Cc81aC/WCdE1NjbMsGHkuzpmzQsdccS4HTVCsExMatKpjn/0nBei
 jAELbesmv/lmqV0cI5wY43BhICpv7mYzSRqp1nUI3rtEIIFTniCoRWRZdsnO0SlUSyca
 k5+ptX7PsYLP5tBOI2RywTltT9FHv7W7twkYVyqJiu3yXTQWxFsEqFy9PFRaWpsXlr1G
 PHHw==
X-Gm-Message-State: AOAM533E/Uc5VtnTMBJcBcx5hh56ahn3heQn8brfanYxPKK7xpcSdbIM
 wGerXtNg9vGOf7WeCQ/nH0iILtguaUWF1xwGfMBFeyPQ
X-Google-Smtp-Source: ABdhPJxveGqBC6naFwxbBb/tftPi4ZI9ehibmsHubBYae/7EuAKXoEmf7JSw+kxTu+hUqP/WNud9nUKgzXFLU1zm2sY=
X-Received: by 2002:a05:651c:1293:: with SMTP id
 19mr2935439ljc.427.1597153837662; 
 Tue, 11 Aug 2020 06:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 11 Aug 2020 19:20:26 +0530
Message-ID: <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5V6H-001BRV-SC
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 21 Jul 2020 at 17:40, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Make it possible for UARTs to trigger magic sysrq from an NMI. With the
> advent of pseudo NMIs on arm64 it became quite generic to request serial
> device interrupt as an NMI rather than IRQ. And having NMI driven serial
> RX will allow us to trigger magic sysrq as an NMI and hence drop into
> kernel debugger in NMI context.
>
> The major use-case is to add NMI debugging capabilities to the kernel
> in order to debug scenarios such as:
> - Primary CPU is stuck in deadlock with interrupts disabled and hence
>   doesn't honor serial device interrupt. So having magic sysrq triggered
>   as an NMI is helpful for debugging.
> - Always enabled NMI based magic sysrq irrespective of whether the serial
>   TTY port is active or not.
>
> Currently there is an existing kgdb NMI serial driver which provides
> partial implementation in upstream to have a separate ttyNMI0 port but
> that remained in silos with the serial core/drivers which made it a bit
> odd to enable using serial device interrupt and hence remained unused. It
> seems to be clearly intended to avoid almost all custom NMI changes to
> the UART driver.
>
> But this patch-set allows the serial core/drivers to be NMI aware which
> in turn provides NMI debugging capabilities via magic sysrq and hence
> there is no specific reason to keep this special driver. So remove it
> instead.
>
> Approach:
> ---------
>
> The overall idea is to intercept serial RX characters in NMI context, if
> those are specific to magic sysrq then allow corresponding handler to run
> in NMI context. Otherwise, defer all other RX and TX operations onto IRQ
> work queue in order to run those in normal interrupt context.
>
> This approach is demonstrated using amba-pl011 driver.
>
> Patch-wise description:
> -----------------------
>
> Patch #1 prepares magic sysrq handler to be NMI aware.
> Patch #2 adds NMI framework to serial core.
> Patch #3 and #4 demonstrates NMI aware uart port using amba-pl011 driver.
> Patch #5 removes kgdb NMI serial driver.
>
> Goal of this RFC:
> -----------------
>
> My main reason for sharing this as an RFC is to help decide whether or
> not to continue with this approach. The next step for me would to port
> the work to a system with an 8250 UART.
>

A gentle reminder to seek feedback on this series.

-Sumit

> Usage:
> ------
>
> This RFC has been developed on top of 5.8-rc3 and if anyone is interested
> to give this a try on QEMU, just enable following config options
> additional to arm64 defconfig:
>
> CONFIG_KGDB=y
> CONFIG_KGDB_KDB=y
> CONFIG_ARM64_PSEUDO_NMI=y
>
> Qemu command line to test:
>
> $ qemu-system-aarch64 -nographic -machine virt,gic-version=3 -cpu cortex-a57 \
>   -smp 2 -kernel arch/arm64/boot/Image -append 'console=ttyAMA0,38400 \
>   keep_bootcon root=/dev/vda2 irqchip.gicv3_pseudo_nmi=1 kgdboc=ttyAMA0' \
>   -initrd rootfs-arm64.cpio.gz
>
> NMI entry into kgdb via sysrq:
> - Ctrl a + b + g
>
> Reference:
> ----------
>
> For more details about NMI/FIQ debugger, refer to this blog post [1].
>
> [1] https://www.linaro.org/blog/debugging-arm-kernels-using-nmifiq/
>
> I do look forward to your comments and feedback.
>
> Sumit Garg (5):
>   tty/sysrq: Make sysrq handler NMI aware
>   serial: core: Add framework to allow NMI aware serial drivers
>   serial: amba-pl011: Re-order APIs definition
>   serial: amba-pl011: Enable NMI aware uart port
>   serial: Remove KGDB NMI serial driver
>
>  drivers/tty/serial/Kconfig       |  19 --
>  drivers/tty/serial/Makefile      |   1 -
>  drivers/tty/serial/amba-pl011.c  | 232 +++++++++++++++++-------
>  drivers/tty/serial/kgdb_nmi.c    | 383 ---------------------------------------
>  drivers/tty/serial/kgdboc.c      |   8 -
>  drivers/tty/serial/serial_core.c | 120 +++++++++++-
>  drivers/tty/sysrq.c              |  33 +++-
>  include/linux/kgdb.h             |  10 -
>  include/linux/serial_core.h      |  67 +++++++
>  include/linux/sysrq.h            |   1 +
>  kernel/debug/debug_core.c        |   1 +
>  11 files changed, 386 insertions(+), 489 deletions(-)
>  delete mode 100644 drivers/tty/serial/kgdb_nmi.c
>
> --
> 2.7.4
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
