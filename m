Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8302EA8E2
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Jan 2021 11:34:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwjfq-0005b9-Mn
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Jan 2021 10:34:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kwjfn-0005aV-VU
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 10:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hyURQvzvZetZ608t5i9qld6B5EdY0xlggkOSPZHFVEs=; b=b1LHW5ZfiQa8wfjO9g5ZL6qWQG
 Eud9HTb1MacmNqV9xvk3g0neM8sSLb3McpvoFnr6tN43uD6YNPDin78B/UwSXLGvjE25YDo+GVGXo
 uaTpxgddumcaZp8h7LJbREQKfhNm6ZQfLDhQIkCWl5lgFp4wqxxWPM8ylUKduDRBS5iE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hyURQvzvZetZ608t5i9qld6B5EdY0xlggkOSPZHFVEs=; b=gLHvYfZbIXpcEv0CHyuvcsJ9pi
 TqAuCNKyXi14R3mrQC2XtZJMBYC7w6Vbr0BlBy0BACssG6SRb9fmAlhJsmG56FebS+RaqhGRhGGDx
 oxUUEfyayGDlkYSqZdHIE5X+54muAkAFao8dxgHEleqa3tOoRl2Qw2QT6ADcmQYx6nt0=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwjfa-00Fezu-G2
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 10:34:43 +0000
Received: by mail-lf1-f52.google.com with SMTP id l11so71510579lfg.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Jan 2021 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hyURQvzvZetZ608t5i9qld6B5EdY0xlggkOSPZHFVEs=;
 b=td+5ke26m8Mcml/SDv+rpe9ME9qv/FA/cvRVpZQqHMQ9+/8YlRAgCJ9soppjt+yAoU
 7nz1aItLhqHiSRJiIkg/jRca65b/GpBazLIvdUvZGCIVq4pcfJIcTZ0NXeyTSBwl8vbG
 wGkRHllV+NqrfeiOvqNqZBwgFRU9fanEDVovxuGxLnyu53vgHcM+ILl+VXx7Sjy58wJ7
 QorLmJkaJWLFs/6IZcbNOJ96+cXMv2gGKKmMs6CujAtkUoFfyxWp6hL2Vgk+T69GuAxN
 MmeYxoLKp0G383dS0xT3vRpQuWU8K1PYAMe7ZiYMhDGcS3bsc2UMrFh+GMMbAv0RmoJw
 ienw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hyURQvzvZetZ608t5i9qld6B5EdY0xlggkOSPZHFVEs=;
 b=b8M+i1nymhMz9AWHQ6PGn01cxiKc+avAbtoFyLhpPbiTuMTiZ4wCwJcxJ3V8ybI2o5
 rxOzbsBGAYLMYY+jryyUhg8mebrEcQcCNH6ipT+uB9WadneN+8Mj10hZfg+KZqcUxpdl
 w/lpH1i4KZNzBy4eNvclsnuo8BTLVbatLvB3J+B0HET17NuHCH7Q1Tnm3Syeone3Bkra
 6/0eUryxGEliNv1QHb/egTtAXGh+5Bk8HlCHMTaLYnOmsBLuh4wIuVnzMadxeg5p3f/W
 gqcjVclY1yA8omgCstQphc+j4BlErp1iGV5Davz/IPnewp9ZElLmp3hw1OrElm7tRwvK
 UOXA==
X-Gm-Message-State: AOAM530uzk71zSlVoRrBB8CyRpdNhbdwWc1w80MdWgrA6YQeoz8+hUX3
 cmYSScAXYVTg+AQdonz46mVpdYRE6EcUh3RMzvU/jQ==
X-Google-Smtp-Source: ABdhPJwVym+WfZRqmu29/ySZV0L/NIcdHIcb8Ah8emCpt+uWeEy0ihCuYvG3UDoS0Sr0AjuX7pPo8cRydU1lrXIrQK8=
X-Received: by 2002:ac2:4244:: with SMTP id m4mr28691783lfl.396.1609842863742; 
 Tue, 05 Jan 2021 02:34:23 -0800 (PST)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 5 Jan 2021 16:04:12 +0530
Message-ID: <CAFA6WYNn0+yxntkebqDVnOoq50gxY4Zvi1wGLAZTJyWGc7VLkw@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwjfa-00Fezu-G2
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
 Daniel Thompson <daniel.thompson@linaro.org>, tsbogend@alpha.franken.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, ito-yuichi@fujitsu.com,
 mpe@ellerman.id.au, x86@kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, mingo@redhat.com, bp@alien8.de,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Marc,

On Mon, 2 Nov 2020 at 17:15, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> With pseudo NMIs support available its possible to configure SGIs to be
> triggered as pseudo NMIs running in NMI context. And kernel features
> such as:
> - NMI backtrace can leverage IPI turned as NMI to get a backtrace of CPU
>   stuck in hard lockup using magic SYSRQ.
> - kgdb relies on NMI support to round up CPUs which are stuck in hard
>   lockup state with interrupts disabled.
>
> This patch-set adds framework to turn an IPI as NMI which can be triggered
> as a pseudo NMI which in turn invokes registered NMI handlers.
>
> After this patch-set we should be able to get a backtrace for a CPU
> stuck in HARDLOCKUP. Have a look at an examples below from a hard lockup
> testcase run on Developerbox:
>
> $ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
>
> NMI backtrace:
> ==============
>
> # Issue Magic SysRq to dump backtrace
>
> [  376.894502] NMI backtrace for cpu 8
> [  376.894506] CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
> [  376.894510] Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> [  376.894514] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
> [  376.894517] pc : lkdtm_HARDLOCKUP+0x8/0x18
> [  376.894520] lr : lkdtm_do_action+0x24/0x30
> [  376.894524] sp : ffff800012cebd20
> [  376.894527] pmr_save: 00000060
> [  376.894530] x29: ffff800012cebd20 x28: ffff000875ae8000
> [  376.894540] x27: 0000000000000000 x26: 0000000000000000
> [  376.894550] x25: 000000000000001a x24: ffff800012cebe40
> [  376.894560] x23: 000000000000000b x22: ffff800010fc5040
> [  376.894569] x21: ffff000878b61000 x20: ffff8000113b2870
> [  376.894579] x19: 000000000000001b x18: 0000000000000010
> [  376.894588] x17: 0000000000000000 x16: 0000000000000000
> [  376.894598] x15: ffff000875ae8470 x14: 00000000000002ad
> [  376.894613] x13: 0000000000000000 x12: 0000000000000000
> [  376.894622] x11: 0000000000000007 x10: 00000000000009c0
> [  376.894631] x9 : ffff800012ceba80 x8 : ffff000875ae8a20
> [  376.894641] x7 : ffff00087f6b3280 x6 : ffff00087f6b3200
> [  376.894651] x5 : 0000000000000000 x4 : ffff00087f6a91f8
> [  376.894660] x3 : ffff00087f6b0120 x2 : 1aa310cec69eb500
> [  376.894670] x1 : 0000000000000000 x0 : 0000000000000060
> [  376.894679] Call trace:
> [  376.894683]  lkdtm_HARDLOCKUP+0x8/0x18
> [  376.894686]  direct_entry+0x124/0x1c0
> [  376.894689]  full_proxy_write+0x60/0xb0
> [  376.894693]  vfs_write+0xf0/0x230
> [  376.894696]  ksys_write+0x6c/0xf8
> [  376.894699]  __arm64_sys_write+0x1c/0x28
> [  376.894703]  el0_svc_common.constprop.0+0x74/0x1f0
> [  376.894707]  do_el0_svc+0x24/0x90
> [  376.894710]  el0_sync_handler+0x180/0x2f8
> [  376.894713]  el0_sync+0x158/0x180
>
> KGDB:
> =====
>
> # Enter kdb via Magic SysRq
>
> [6]kdb> btc
> btc: cpu status: Currently on cpu 6
> Available cpus: 0-5(I), 6, 7(I), 8, 9-23(I)
> <snip>
> Stack traceback for pid 555
> 0xffff000875ae8000      555      554  1    8   R  0xffff000875ae89c0  bash
> CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
> Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
> Call trace:
>  dump_backtrace+0x0/0x1a0
>  show_stack+0x18/0x28
>  dump_stack+0xc0/0x11c
>  kgdb_cpu_enter+0x648/0x660
>  kgdb_nmicallback+0xa0/0xa8
>  ipi_kgdb_nmicallback+0x24/0x30
>  ipi_nmi_handler+0x48/0x60
>  handle_percpu_devid_fasteoi_ipi+0x74/0x88
>  generic_handle_irq+0x30/0x48
>  handle_domain_nmi+0x48/0x80
>  gic_handle_irq+0x18c/0x34c
>  el1_irq+0xcc/0x180
>  lkdtm_HARDLOCKUP+0x8/0x18
>  direct_entry+0x124/0x1c0
>  full_proxy_write+0x60/0xb0
>  vfs_write+0xf0/0x230
>  ksys_write+0x6c/0xf8
>  __arm64_sys_write+0x1c/0x28
>  el0_svc_common.constprop.0+0x74/0x1f0
>  do_el0_svc+0x24/0x90
>  el0_sync_handler+0x180/0x2f8
>  el0_sync+0x158/0x180
> <snip>
>
> Changes in v7:
> - Add a new library function: kgdb_smp_call_nmi_hook() to expose fallback
>   mechanism to arch specific code.
> - Addressed other misc comments from Daniel.
>
> Changes in v6:
> - Two new patches: #4 and #6 which adds runtime fallback framework for
>   sysrq backtrace and kgdb roundup features.
> - Reversed order of NMI backtrace and kgdb roundup feaure patches.
> - Addressed other misc. comments from Marc.
> - I haven't picked any tags from v5 since I think there is major rework
>   involved. Masayoshi, could you please confirm if these features still
>   work for you?
>
> Changes in v5:
> - Rebased to head of upstream master.
> - Remove redundant invocation of ipi_nmi_setup().
> - Addressed misc. comments.
>
> Changes in v4:
> - Move IPI NMI framework to a separate file.
> - Get rid of hard-coded IPI_CALL_NMI_FUNC allocation.
> - Add NMI backtrace support leveraged via magic SYSRQ.
>
> Changes in v3:
> - Rebased to Marc's latest IPIs patch-set [1].
>
> [1] https://lkml.org/lkml/2020/9/1/603
>
> Changes since RFC version [1]:
> - Switch to use generic interrupt framework to turn an IPI as NMI.
> - Dependent on Marc's patch-set [2] which turns IPIs into normal
>   interrupts.
> - Addressed misc. comments from Doug on patch #4.
> - Posted kgdb NMI printk() fixup separately which has evolved since
>   to be solved using different approach via changing kgdb interception
>   of printk() in common printk() code (see patch [3]).
>
> [1] https://lkml.org/lkml/2020/4/24/328
> [2] https://lkml.org/lkml/2020/5/19/710
> [3] https://lkml.org/lkml/2020/5/20/418
>
> Sumit Garg (7):
>   arm64: Add framework to turn IPI as NMI
>   irqchip/gic-v3: Enable support for SGIs to act as NMIs
>   arm64: smp: Assign and setup an IPI as NMI
>   nmi: backtrace: Allow runtime arch specific override
>   arm64: ipi_nmi: Add support for NMI backtrace
>   kgdb: Expose default CPUs roundup fallback mechanism
>   arm64: kgdb: Roundup cpus using IPI as NMI
>

Do you have any further feedback on this patch-set?

-Sumit

>  arch/arm/include/asm/irq.h       |  2 +-
>  arch/arm/kernel/smp.c            |  3 +-
>  arch/arm64/include/asm/irq.h     |  6 +++
>  arch/arm64/include/asm/nmi.h     | 17 ++++++++
>  arch/arm64/kernel/Makefile       |  2 +-
>  arch/arm64/kernel/ipi_nmi.c      | 84 ++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/kernel/kgdb.c         | 18 +++++++++
>  arch/arm64/kernel/smp.c          |  8 ++++
>  arch/mips/include/asm/irq.h      |  2 +-
>  arch/mips/kernel/process.c       |  3 +-
>  arch/powerpc/include/asm/nmi.h   |  2 +-
>  arch/powerpc/kernel/stacktrace.c |  3 +-
>  arch/sparc/include/asm/irq_64.h  |  2 +-
>  arch/sparc/kernel/process_64.c   |  4 +-
>  arch/x86/include/asm/irq.h       |  2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |  3 +-
>  drivers/irqchip/irq-gic-v3.c     | 29 ++++++++++----
>  include/linux/kgdb.h             | 12 ++++++
>  include/linux/nmi.h              | 12 ++----
>  kernel/debug/debug_core.c        |  8 +++-
>  20 files changed, 194 insertions(+), 28 deletions(-)
>  create mode 100644 arch/arm64/include/asm/nmi.h
>  create mode 100644 arch/arm64/kernel/ipi_nmi.c
>
> --
> 2.7.4
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
