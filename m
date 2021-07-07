Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FB3BE2E6
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jul 2021 08:00:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m10bK-0006OJ-Qs
	for lists+kgdb-bugreport@lfdr.de; Wed, 07 Jul 2021 06:00:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m10bH-0006Nt-Qk
 for kgdb-bugreport@lists.sourceforge.net; Wed, 07 Jul 2021 06:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qPhMxp+kFdSbmCeG6NWmdgXs8rWtWtWdOyFY4K/YSO0=; b=iYjYdCQoTO9eErtlxCldfSQ0Ux
 sEwNUTkdimwbe1PYmCXZtpEWpmRDPIS0jCzgWkwsvS3BHrvFSnHy6x6TQxkG3ivA1XDgpKBDwgHSE
 ZHvb1GcI2LejlLe+abTv+O0bD7SK5LDtNLn0nmMBYLJQxEbEXX1YRJAM7aH2sKZEqp8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qPhMxp+kFdSbmCeG6NWmdgXs8rWtWtWdOyFY4K/YSO0=; b=jzwBp13Qks/Er4LZSAxuL+AaGM
 XCkJ05vMESNIHeQJ6SgMrCw3r2fv0T+/ovaRPL3EpF1/wCDe+TZvs6N1LjzDZdhTvVoABYIT39ldC
 ys+TVb7RqM0W7fWt5l/SGpzgRT/VLfa7aJnRIJSgWuAsiUscLQ5zt40vTkbq17/2LtgI=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m10b6-00DWtj-0b
 for kgdb-bugreport@lists.sourceforge.net; Wed, 07 Jul 2021 05:59:59 +0000
Received: by mail-lf1-f44.google.com with SMTP id p1so1971164lfr.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 06 Jul 2021 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPhMxp+kFdSbmCeG6NWmdgXs8rWtWtWdOyFY4K/YSO0=;
 b=MjHfBsUDJqeOrEjIEj6IYxLLnYuNjfkN2hgc1SigJGy2jUfsVo8XfWmuVMPB2IAdtn
 OH16ZZ2hh6qFSC5Uu19GhdWJG7DiChCvKSZOQYJRrRCWVm2MUCABiMPpGndR5ZjV34rU
 +wxTb4jp5vjVQT8Io3RBEWKYPjI5LRxmYqv33/1Jnwe215l0zBTGi2+Uuzh+9FhQ3hoF
 fTU3wTVZR9LCyb9IOwr2+PUUz3J1tGeiWo8qS6EgT2m4/x4hZ1VmF/zyCuYJuYlw5MQA
 VMvvdx8y/ABWuH3NhIC0f4LNNM3WKyZ0PM5VJMcmvWQ6KL2f4SGKHOsZfqKcJU3pS09O
 IczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPhMxp+kFdSbmCeG6NWmdgXs8rWtWtWdOyFY4K/YSO0=;
 b=jH2EWrEsulCbt72ntGSJCQ3DUqvN/1q7wUN46RFNm4Y4m65hHTvZf9w37TiKaesNGB
 DZyDlsrNXUwjS5DYQbHgM0oiBkSySawdYNAWTCiLEoavbaB1yytI6RAn++XUKk4/VwJr
 MLtumuLFsliH6yVok6Gr67d5b6Bwbc1GiQSXkjG175vjhXzHIoolxJ2bQJJio0ZlZVOa
 NjhqKfeGpsCPLV6dwZnJm66Rg8dEC0460ZxMtc06gPUUvzglj40AavbdvhBSyLw22Pl8
 aYd3Y99SjULIIxRjkkML2Z1mY2S5OP+zjhSq8eF1ccNJ/KpiNPOUxpTgfFfzwO1nQ9nx
 hf0w==
X-Gm-Message-State: AOAM5334UUbnZ4PBjzSnuFsmNHPxP5TuaJnH56aVLHmzeJhwJ3uu5jiG
 uugeaqyxS+pdHgd40VtTnCarIY9lESTjpHiAeVaAog==
X-Google-Smtp-Source: ABdhPJzwjDpQ0+0Qgxw0Q5+mcRryh8fHlAJ3bnUycQuGNXKo3P2CgPPJkWUKQ1LXN7hB38oSmP4XG+0bgplMzVlVz5o=
X-Received: by 2002:a19:f11a:: with SMTP id p26mr18203411lfh.113.1625637581310; 
 Tue, 06 Jul 2021 22:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <CAGb2v66mVoWiCibjq25d3Z8OvbWNO9p+vMo761RJLiD-BqVbqw@mail.gmail.com>
In-Reply-To: <CAGb2v66mVoWiCibjq25d3Z8OvbWNO9p+vMo761RJLiD-BqVbqw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 7 Jul 2021 11:29:29 +0530
Message-ID: <CAFA6WYN-wpQ86ik5FeAhimCcCoRAs9_g3BGL8CiSUmHxfeCSbg@mail.gmail.com>
To: wens@kernel.org
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m10b6-00DWtj-0b
Subject: Re: [Kgdb-bugreport] [PATCH v7 0/7] arm64: Add framework to turn an
 IPI as NMI
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, mpe@ellerman.id.au,
 Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 julien.thierry.kdev@gmail.com, Jason Cooper <jason@lakedaemon.net>,
 bp@alien8.de, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 tsbogend@alpha.franken.de, ito-yuichi@fujitsu.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 25 Jun 2021 at 20:26, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> On Mon, Nov 2, 2020 at 7:46 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > With pseudo NMIs support available its possible to configure SGIs to be
> > triggered as pseudo NMIs running in NMI context. And kernel features
> > such as:
> > - NMI backtrace can leverage IPI turned as NMI to get a backtrace of CPU
> >   stuck in hard lockup using magic SYSRQ.
> > - kgdb relies on NMI support to round up CPUs which are stuck in hard
> >   lockup state with interrupts disabled.
> >
> > This patch-set adds framework to turn an IPI as NMI which can be triggered
> > as a pseudo NMI which in turn invokes registered NMI handlers.
> >
> > After this patch-set we should be able to get a backtrace for a CPU
> > stuck in HARDLOCKUP. Have a look at an examples below from a hard lockup
> > testcase run on Developerbox:
> >
> > $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> >
> > NMI backtrace:
> > ==============
> >
> > # Issue Magic SysRq to dump backtrace
> >
> > [  376.894502] NMI backtrace for cpu 8
> > [  376.894506] CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
> > [  376.894510] Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> > [  376.894514] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
> > [  376.894517] pc : lkdtm_HARDLOCKUP+0x8/0x18
> > [  376.894520] lr : lkdtm_do_action+0x24/0x30
> > [  376.894524] sp : ffff800012cebd20
> > [  376.894527] pmr_save: 00000060
> > [  376.894530] x29: ffff800012cebd20 x28: ffff000875ae8000
> > [  376.894540] x27: 0000000000000000 x26: 0000000000000000
> > [  376.894550] x25: 000000000000001a x24: ffff800012cebe40
> > [  376.894560] x23: 000000000000000b x22: ffff800010fc5040
> > [  376.894569] x21: ffff000878b61000 x20: ffff8000113b2870
> > [  376.894579] x19: 000000000000001b x18: 0000000000000010
> > [  376.894588] x17: 0000000000000000 x16: 0000000000000000
> > [  376.894598] x15: ffff000875ae8470 x14: 00000000000002ad
> > [  376.894613] x13: 0000000000000000 x12: 0000000000000000
> > [  376.894622] x11: 0000000000000007 x10: 00000000000009c0
> > [  376.894631] x9 : ffff800012ceba80 x8 : ffff000875ae8a20
> > [  376.894641] x7 : ffff00087f6b3280 x6 : ffff00087f6b3200
> > [  376.894651] x5 : 0000000000000000 x4 : ffff00087f6a91f8
> > [  376.894660] x3 : ffff00087f6b0120 x2 : 1aa310cec69eb500
> > [  376.894670] x1 : 0000000000000000 x0 : 0000000000000060
> > [  376.894679] Call trace:
> > [  376.894683]  lkdtm_HARDLOCKUP+0x8/0x18
> > [  376.894686]  direct_entry+0x124/0x1c0
> > [  376.894689]  full_proxy_write+0x60/0xb0
> > [  376.894693]  vfs_write+0xf0/0x230
> > [  376.894696]  ksys_write+0x6c/0xf8
> > [  376.894699]  __arm64_sys_write+0x1c/0x28
> > [  376.894703]  el0_svc_common.constprop.0+0x74/0x1f0
> > [  376.894707]  do_el0_svc+0x24/0x90
> > [  376.894710]  el0_sync_handler+0x180/0x2f8
> > [  376.894713]  el0_sync+0x158/0x180
> >
> > KGDB:
> > =====
> >
> > # Enter kdb via Magic SysRq
> >
> > [6]kdb> btc
> > btc: cpu status: Currently on cpu 6
> > Available cpus: 0-5(I), 6, 7(I), 8, 9-23(I)
> > <snip>
> > Stack traceback for pid 555
> > 0xffff000875ae8000      555      554  1    8   R  0xffff000875ae89c0  bash
> > CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
> > Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> > Call trace:
> >  dump_backtrace+0x0/0x1a0
> >  show_stack+0x18/0x28
> >  dump_stack+0xc0/0x11c
> >  kgdb_cpu_enter+0x648/0x660
> >  kgdb_nmicallback+0xa0/0xa8
> >  ipi_kgdb_nmicallback+0x24/0x30
> >  ipi_nmi_handler+0x48/0x60
> >  handle_percpu_devid_fasteoi_ipi+0x74/0x88
> >  generic_handle_irq+0x30/0x48
> >  handle_domain_nmi+0x48/0x80
> >  gic_handle_irq+0x18c/0x34c
> >  el1_irq+0xcc/0x180
> >  lkdtm_HARDLOCKUP+0x8/0x18
> >  direct_entry+0x124/0x1c0
> >  full_proxy_write+0x60/0xb0
> >  vfs_write+0xf0/0x230
> >  ksys_write+0x6c/0xf8
> >  __arm64_sys_write+0x1c/0x28
> >  el0_svc_common.constprop.0+0x74/0x1f0
> >  do_el0_svc+0x24/0x90
> >  el0_sync_handler+0x180/0x2f8
> >  el0_sync+0x158/0x180
> > <snip>
> >
> > Changes in v7:
> > - Add a new library function: kgdb_smp_call_nmi_hook() to expose fallback
> >   mechanism to arch specific code.
> > - Addressed other misc comments from Daniel.
> >
> > Changes in v6:
> > - Two new patches: #4 and #6 which adds runtime fallback framework for
> >   sysrq backtrace and kgdb roundup features.
> > - Reversed order of NMI backtrace and kgdb roundup feaure patches.
> > - Addressed other misc. comments from Marc.
> > - I haven't picked any tags from v5 since I think there is major rework
> >   involved. Masayoshi, could you please confirm if these features still
> >   work for you?
> >
> > Changes in v5:
> > - Rebased to head of upstream master.
> > - Remove redundant invocation of ipi_nmi_setup().
> > - Addressed misc. comments.
> >
> > Changes in v4:
> > - Move IPI NMI framework to a separate file.
> > - Get rid of hard-coded IPI_CALL_NMI_FUNC allocation.
> > - Add NMI backtrace support leveraged via magic SYSRQ.
> >
> > Changes in v3:
> > - Rebased to Marc's latest IPIs patch-set [1].
> >
> > [1] https://lkml.org/lkml/2020/9/1/603
> >
> > Changes since RFC version [1]:
> > - Switch to use generic interrupt framework to turn an IPI as NMI.
> > - Dependent on Marc's patch-set [2] which turns IPIs into normal
> >   interrupts.
> > - Addressed misc. comments from Doug on patch #4.
> > - Posted kgdb NMI printk() fixup separately which has evolved since
> >   to be solved using different approach via changing kgdb interception
> >   of printk() in common printk() code (see patch [3]).
> >
> > [1] https://lkml.org/lkml/2020/4/24/328
> > [2] https://lkml.org/lkml/2020/5/19/710
> > [3] https://lkml.org/lkml/2020/5/20/418
> >
> > Sumit Garg (7):
> >   arm64: Add framework to turn IPI as NMI
> >   irqchip/gic-v3: Enable support for SGIs to act as NMIs
> >   arm64: smp: Assign and setup an IPI as NMI
> >   nmi: backtrace: Allow runtime arch specific override
> >   arm64: ipi_nmi: Add support for NMI backtrace
> >   kgdb: Expose default CPUs roundup fallback mechanism
> >   arm64: kgdb: Roundup cpus using IPI as NMI
>
> Tested-by: Chen-Yu Tsai <wens@csie.org>
>
> on an ROC-RK3399-PC.

Thanks for testing this feature.

-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
