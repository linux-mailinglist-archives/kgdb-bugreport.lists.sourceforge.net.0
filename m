Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CB1B8119
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 22:50:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jS5Gz-0002qD-5g
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 20:50:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jS5Gy-0002q6-Jb
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 20:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oJeS5rPd5QBiW9yuQQoiyZe9LracJA5NUhevSqY2SM4=; b=hBR3U+xBwNYf3OkmMC5ZietZ5B
 jiWsvIyngM/w8fI3X8ekfdpuQh2DdHQAuyPGZGOmglPjuGmXLwX9kWIJcmiCxFJJOLI1ge/sCxejJ
 AuLygikWwwyMV344oO0Tz2KC553I7KR80xZz5UsW864dDVHDkcKp4C78dB10VMAglN+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oJeS5rPd5QBiW9yuQQoiyZe9LracJA5NUhevSqY2SM4=; b=XNnQDNDiuJZF0xPQYyRxW6jLLN
 YjlA/TO4jcMFuvZDqUyRwtGyIjZSFw7phCZqD6Fzzq2Y/jEcU2Tvl4sRINxkiV79mXdVy4MH++45+
 BgE65vVrEc7zH3g+DCrutFqBah1m601bb/qlu2sPm7XZ4KHxznMiY7bUEHP0t+YegG3M=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jS5Gx-009dAY-B6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 20:50:08 +0000
Received: by mail-ua1-f66.google.com with SMTP id a10so10897820uad.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 13:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oJeS5rPd5QBiW9yuQQoiyZe9LracJA5NUhevSqY2SM4=;
 b=bsc5d75VyY0RYx5b5HGauIU4/ycK/2kiMjAD0CfoKTcN53ZTdIJVwDYW3H4JgdAJdr
 z/35tht2bxPjxQCt1nVihs4TKy55nGR0COH1TpoOsnywIkxeRouKXN+OuGbl845D/ja2
 KdzPQW05FIvprL4bQUqxchFYnmRXLSndHvAzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJeS5rPd5QBiW9yuQQoiyZe9LracJA5NUhevSqY2SM4=;
 b=luzz8X8uqSuzqGnxrQTL9EORM7dVVk+HjITvYNbKpkl+uskHuwdyttL3dE8gE8XHLL
 0Jllfocja/x0KHBI/+wC93NCBldpT8zE4zTMKJnqHBPnuy1fKVmaIn8ev8W1YifSOpqr
 2hy9foWPrb1Gu1Am4NvY59VB/S3/AVh8LlaV37w/24rPIKEGRwT5shUr5V2UOCGEgyPA
 mlOYNXdCbXs+IPzpfjIszzdsVPzXz8kQAuhqqWEI4zTCMvJMve2U5u8OwTbZ3phisydD
 C8dKec3SSIF0Win+080xfE8VEJ3FQgO9ZfzpatPjxn++aWqPzllRO8vyWsQgHyM6qZqZ
 8w/w==
X-Gm-Message-State: AGi0PuahoUHi8A57BoApZsJU6HllHK80tudX8RjJmHbh+5wFJp8XKhvK
 7HPbBancm2Pnc+Ah0nfjg8rIczxSjJQ=
X-Google-Smtp-Source: APiQypISDiDytOw8PtSLMld36io1zJTe+SVOsmE9w/wekhPDvHNiyOY3FlK8jf5ngEKzeEaC37djUA==
X-Received: by 2002:ab0:24d3:: with SMTP id k19mr10772769uan.36.1587761400930; 
 Fri, 24 Apr 2020 13:50:00 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id l11sm1900483vkm.20.2020.04.24.13.49.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 13:50:00 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id y10so10913679uao.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 13:49:59 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr9739534vsp.198.1587761399251; 
 Fri, 24 Apr 2020 13:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Apr 2020 13:49:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5FujyJMoH-TdQXxAYBvBO=rhjNo1EAv7xJ=R8eeaXZQ@mail.gmail.com>
Message-ID: <CAD=FV=W5FujyJMoH-TdQXxAYBvBO=rhjNo1EAv7xJ=R8eeaXZQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jS5Gx-009dAY-B6
Subject: Re: [Kgdb-bugreport] [RFC Patch v1 0/4] arm64: Introduce new IPI as
 IPI_CALL_NMI_FUNC
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
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Apr 24, 2020 at 4:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> With pseudo NMIs support available its possible to configure SGIs to be
> triggered as pseudo NMIs running in NMI context. And kernel features
> such as kgdb relies on NMI support to round up CPUs which are stuck in
> hard lockup state with interrupts disabled.
>
> This patch-set adds support for IPI_CALL_NMI_FUNC which can be triggered
> as a pseudo NMI which in turn is leveraged via kgdb to round up CPUs.
>
> After this patch-set we should be able to get a backtrace for a CPU
> stuck in HARDLOCKUP. Have a look at an example below from a testcase run
> on Developerbox:
>
> $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
>
> # Enter kdb via Magic SysRq
>
> [11]kdb> btc
> btc: cpu status: Currently on cpu 11
> Available cpus: 0-10(I), 11, 12(I), 13, 14-23(I)
> <snip>
> Stack traceback for pid 623
> 0xffff00086a644600      623      622  1   13   R  0xffff00086a644fc0  bash
> CPU: 13 PID: 623 Comm: bash Not tainted 5.7.0-rc2 #27
> Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> Call trace:
>  dump_backtrace+0x0/0x198
>  show_stack+0x18/0x28
>  dump_stack+0xb8/0x100
>  kgdb_cpu_enter+0x5c0/0x5f8
>  kgdb_nmicallback+0xa0/0xa8
>  handle_IPI+0x190/0x200
>  gic_handle_irq+0x2b8/0x2d8
>  el1_irq+0xcc/0x180
>  lkdtm_HARDLOCKUP+0x8/0x18
>  direct_entry+0x124/0x1c0
>  full_proxy_write+0x60/0xb0
>  __vfs_write+0x1c/0x48
>  vfs_write+0xe4/0x1d0
>  ksys_write+0x6c/0xf8
>  __arm64_sys_write+0x1c/0x28
>  el0_svc_common.constprop.0+0x74/0x1f0
>  do_el0_svc+0x24/0x90
>  el0_sync_handler+0x178/0x2b8
>  el0_sync+0x158/0x180
> <snip>
>
> Looking forward to your comments/feedback.
>
> Sumit Garg (4):
>   arm64: smp: Introduce a new IPI as IPI_CALL_NMI_FUNC
>   irqchip/gic-v3: Add support to handle SGI as pseudo NMI
>   irqchip/gic-v3: Enable arch specific IPI as pseudo NMI
>   arm64: kgdb: Round up cpus using IPI_CALL_NMI_FUNC
>
>  arch/arm64/include/asm/hardirq.h |  2 +-
>  arch/arm64/include/asm/smp.h     |  1 +
>  arch/arm64/kernel/kgdb.c         | 15 +++++++++++++++
>  arch/arm64/kernel/smp.c          | 36 +++++++++++++++++++++++++++++++++++-
>  drivers/irqchip/irq-gic-v3.c     | 36 +++++++++++++++++++++++++++++++-----
>  5 files changed, 83 insertions(+), 7 deletions(-)

This is amazing!

* picked your patches back to my current 5.4 tree
* turned on "CONFIG_ARM64_PSEUDO_NMI"
* set the "irqchip.gicv3_pseudo_nmi=1" command line

...and bam I can trace on the locked up CPU instead of being left in the dark.

I'm not sure I'm going to be too much use in actually doing the review
of the code since I'm not really an expert at how SGIs work (it took
me a while to realize that it must stand for software generated
interrupts) nor the bowels of the GIC.  I tried to do what little
review I could.

In any case, I'll keep this in my local patch stack for now and keep
testing it to make sure I don't notice any weird problems.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
