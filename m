Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 222EB1B965E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 07:02:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jSvuR-0008WK-Or
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 05:02:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jSvuP-0008Vr-Mi
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 05:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLhiyNXw2c6Bh3+KsgO2YOgoBrKeaIdCbQ6AiJEyQKg=; b=IIEw1RR6wpzPYM4ulYN4/oM6DX
 ajgtUcx6ZQpWVtJ+djujvtnU2V5qWyL/izbEc9zgOXidG8kwhdZaJZv8gHVXCxOjrO7SGRehzCxAl
 ZXZj8wvqI1kNOZ/uNXvE1SAjnoeB+W2XgC43Y1eg3tt1SqSwpv3IJGCOyS/deng9d6WQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uLhiyNXw2c6Bh3+KsgO2YOgoBrKeaIdCbQ6AiJEyQKg=; b=RlYV2R0lrQZ4r94AurJRP06mBe
 PhufmDwwUYVsljSvEcI+cEAfvrA5VheGGondnX8rSXl1FsWm31OTDOCx8tQG+wkKf2FGlUTuLdK5W
 kUom1aRe9lZCh6HP+8zGoBD8tUUaSAqWl5xv1o717IdzQFj1QhVOJBszPTvPutIKblOs=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jSvuJ-00G22C-CX
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 05:02:21 +0000
Received: by mail-lj1-f193.google.com with SMTP id a21so13242409ljj.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 26 Apr 2020 22:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uLhiyNXw2c6Bh3+KsgO2YOgoBrKeaIdCbQ6AiJEyQKg=;
 b=dH4og7eAlOMMU9zjR7c8eKMWiq0zQDIlb2GK5JUi+qJAjaTf4YedK6qxVckF97ctx5
 bGBaeyT7ehGjDXEaCX92gHWiYMqnAUubFrHu0hoz3WspncTOpvQ4F7/X3w5wOVsoI7go
 OXVjRax5ecUCoM0aBlzesbwzg4KmPUA0ipv5jUruDQmbXTeukXf5y7WBtTNsWuktbExN
 /XjN09lzj1e0TaiFh00i48xhlkOurl0X8i6puThAwyi/YGCIm4Y0H4kAQYEoaAOxFWGL
 YCwosYJ1JgRriI9ryOukPusUIT40A/IGr0vxzU+K66172GMXmNKHyBsgNbhzUNW8XhYh
 kObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLhiyNXw2c6Bh3+KsgO2YOgoBrKeaIdCbQ6AiJEyQKg=;
 b=AfUpobbwP48iklUzQCksL7pIumnfQ+bSgiJlqBkJmprsMLQ+rRpm8AlxOjoj3khaeU
 Wj/Jn5j2k1RRY55wN+j9yjxymNYPNs6rMk/u9WuQUK765ksmqMWMCpJsOOPIA1eU3ssq
 tx4Ne0J0LBa2YUrLNLCTUvtqloU8PRe3tS3jTPJcHGldh81NroaNi+6ZMcSMdaKSwz7e
 JxEZBcWxvNx9pwZ7MCq73h1DKAk3I+Hu/AtaBNCfkx+0oM5zhiLlDUURR32W1sf1J8rk
 qtF42TpMdUdtjzJ7WOI2vx11fpBzZhbH0zxhp09VfrI7K7jf/ZyBE0vB7aBuGRT8Xmdx
 OpWQ==
X-Gm-Message-State: AGi0PuaPKnyZVZ1bvN9HxPJHiGLee7kNfmcSXRRQUWUxvj6pEw4VI0+E
 RPFIVFI+jU+/ggxfQXM54GHPMaMLqbUp7kTEihSzo8Vq
X-Google-Smtp-Source: APiQypLz3rHzGtlDr1/6paHraXe63+Mx5MbGFXQ94F/6yIUtpJZ84R5fG+aGZyp75Dsp1Qm7jipKQPY0eZUsNTZQuc0=
X-Received: by 2002:ac2:5f63:: with SMTP id c3mr14190318lfc.15.1587963277244; 
 Sun, 26 Apr 2020 21:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=W5FujyJMoH-TdQXxAYBvBO=rhjNo1EAv7xJ=R8eeaXZQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W5FujyJMoH-TdQXxAYBvBO=rhjNo1EAv7xJ=R8eeaXZQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 27 Apr 2020 10:24:25 +0530
Message-ID: <CAFA6WYNgmnX7BJ2nTpSNUpmFm2wcpp3v_Psy2EoPccJBhk4WYg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
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
X-Headers-End: 1jSvuJ-00G22C-CX
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

On Sat, 25 Apr 2020 at 02:20, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Apr 24, 2020 at 4:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > With pseudo NMIs support available its possible to configure SGIs to be
> > triggered as pseudo NMIs running in NMI context. And kernel features
> > such as kgdb relies on NMI support to round up CPUs which are stuck in
> > hard lockup state with interrupts disabled.
> >
> > This patch-set adds support for IPI_CALL_NMI_FUNC which can be triggered
> > as a pseudo NMI which in turn is leveraged via kgdb to round up CPUs.
> >
> > After this patch-set we should be able to get a backtrace for a CPU
> > stuck in HARDLOCKUP. Have a look at an example below from a testcase run
> > on Developerbox:
> >
> > $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> >
> > # Enter kdb via Magic SysRq
> >
> > [11]kdb> btc
> > btc: cpu status: Currently on cpu 11
> > Available cpus: 0-10(I), 11, 12(I), 13, 14-23(I)
> > <snip>
> > Stack traceback for pid 623
> > 0xffff00086a644600      623      622  1   13   R  0xffff00086a644fc0  bash
> > CPU: 13 PID: 623 Comm: bash Not tainted 5.7.0-rc2 #27
> > Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> > Call trace:
> >  dump_backtrace+0x0/0x198
> >  show_stack+0x18/0x28
> >  dump_stack+0xb8/0x100
> >  kgdb_cpu_enter+0x5c0/0x5f8
> >  kgdb_nmicallback+0xa0/0xa8
> >  handle_IPI+0x190/0x200
> >  gic_handle_irq+0x2b8/0x2d8
> >  el1_irq+0xcc/0x180
> >  lkdtm_HARDLOCKUP+0x8/0x18
> >  direct_entry+0x124/0x1c0
> >  full_proxy_write+0x60/0xb0
> >  __vfs_write+0x1c/0x48
> >  vfs_write+0xe4/0x1d0
> >  ksys_write+0x6c/0xf8
> >  __arm64_sys_write+0x1c/0x28
> >  el0_svc_common.constprop.0+0x74/0x1f0
> >  do_el0_svc+0x24/0x90
> >  el0_sync_handler+0x178/0x2b8
> >  el0_sync+0x158/0x180
> > <snip>
> >
> > Looking forward to your comments/feedback.
> >
> > Sumit Garg (4):
> >   arm64: smp: Introduce a new IPI as IPI_CALL_NMI_FUNC
> >   irqchip/gic-v3: Add support to handle SGI as pseudo NMI
> >   irqchip/gic-v3: Enable arch specific IPI as pseudo NMI
> >   arm64: kgdb: Round up cpus using IPI_CALL_NMI_FUNC
> >
> >  arch/arm64/include/asm/hardirq.h |  2 +-
> >  arch/arm64/include/asm/smp.h     |  1 +
> >  arch/arm64/kernel/kgdb.c         | 15 +++++++++++++++
> >  arch/arm64/kernel/smp.c          | 36 +++++++++++++++++++++++++++++++++++-
> >  drivers/irqchip/irq-gic-v3.c     | 36 +++++++++++++++++++++++++++++++-----
> >  5 files changed, 83 insertions(+), 7 deletions(-)
>
> This is amazing!
>
> * picked your patches back to my current 5.4 tree
> * turned on "CONFIG_ARM64_PSEUDO_NMI"
> * set the "irqchip.gicv3_pseudo_nmi=1" command line
>
> ...and bam I can trace on the locked up CPU instead of being left in the dark.
>
> I'm not sure I'm going to be too much use in actually doing the review
> of the code since I'm not really an expert at how SGIs work (it took
> me a while to realize that it must stand for software generated
> interrupts) nor the bowels of the GIC.  I tried to do what little
> review I could.
>
> In any case, I'll keep this in my local patch stack for now and keep
> testing it to make sure I don't notice any weird problems.

Thanks for your review and testing.

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
