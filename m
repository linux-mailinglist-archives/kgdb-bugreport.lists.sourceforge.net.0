Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 336BC2A29F1
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:51:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYNF-0005QX-0U
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:51:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYND-0005QF-Qs
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CXfnLST4fM5ZVassPKOEziHyE9DUsQsTwKanTMvrSOA=; b=YXQ4wwu0Ne5E+748sO0VTPZXnK
 Lo+DzLAy1h0ZSn5MBMgSk9vJFojTELothdGeBXk+Rw6cI31f/4sJWtxZ5YrcbCmgIM50VEfVVM+Qu
 B3ItUqprWZ8eXMr6pXPip40S6kLn/3xGYqnK0OicSWr+O71O6h7UoLzcMkeJdVu46QtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CXfnLST4fM5ZVassPKOEziHyE9DUsQsTwKanTMvrSOA=; b=ZWyaWeAUmVxzSoJdWVzvIKvKr5
 WWO4os1roR6L1N+6N6i8jHZf4kmz5+iCu1aPz9L8Xfj84FOwgZuotX6ml/E8jg3eUtVdSPxQGLN52
 Jg+NwuxyaxZHPmFxDCy3D6+b+17QZyAYvfhB6TWytXcm4U0BbI/arI5kA0JlWcTu/P6E=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYN7-006KHg-Gk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:51:43 +0000
Received: by mail-pg1-f196.google.com with SMTP id 62so3294562pgg.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=CXfnLST4fM5ZVassPKOEziHyE9DUsQsTwKanTMvrSOA=;
 b=V6YDheUZvAJT5SXaydOURWWVilMmvIEOZeGDWdHgaGrpCka0su/x3CHfo+n9tygcUW
 ipXD+Sc1GQWGbbtPMjW9vZvQd2zdK6bw88csrYaQm1282pssEMJ7goYSflv5swJZARgs
 AfpioCaLeTNzOK//wq0sspJxl3pSX66TG/qkpwWQ5eCFLGk+s82KhutopV3n3QwMYc1h
 mBVZRo0PoKnvcBXategaMaCAjfcmad2oNIlWhjQv2zI3DPnE2SBvrN5Gg9VbWHsqsZrp
 Yyf2pDgiyk1Rc6bn8FBA0Q5loP2bbcppw+JL+2g+w6o2wg+eNKzM4DYyaCTzgkq2FGc4
 3bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CXfnLST4fM5ZVassPKOEziHyE9DUsQsTwKanTMvrSOA=;
 b=GKtLBgXD2VNSSW9JvReQ6gG/DWqUBbF9HTFTaYx2LqJP8EXLjyCzsPmCPLsD8nnnUY
 syXuMzRcFuFaGQ2ii6vClL91G9I071qsrQX3Zn25Lu0Xeg1I2FIcYNwQVD4RANYF1zfU
 3w5IjZRaPgLetNVKP210cfipwg6ijuwk3kqGB4POxy2hz0d4b82cet+M6Bz3asEKbw26
 OYkNLyZg78UR5RlRk1v6dZis2+6aOd+McTqIPiKjNIaqyAl6k5YDrQVcN4dYp/woZUMw
 xVMKyXYbwnYES6hg24SsSY2sthexmqb+kDFlU4JPlTLNegFzcQZBbPTXdqHrrHZdmQRQ
 cYsA==
X-Gm-Message-State: AOAM530zi9b4qnAzJCMw0hBAxQIYUm6pqbe3wcVPxzlmSeSZT1gcdjje
 aa0kSmsU1an7yFpHp0QM115HGxARDMfwmw==
X-Google-Smtp-Source: ABdhPJyXVVEQtyy5dvpaAReoFwovaQvZ2ghDG9Ldjx0Dp5/oLLe8CFn9jXktyti7g51O7uBwz4n9dA==
X-Received: by 2002:a63:4141:: with SMTP id o62mr12957127pga.363.1604317541633; 
 Mon, 02 Nov 2020 03:45:41 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.45.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:45:40 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:40 +0530
Message-Id: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZYN7-006KHg-Gk
Subject: [Kgdb-bugreport] [PATCH v7 0/7] arm64: Add framework to turn an IPI
 as NMI
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
Cc: mark.rutland@arm.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 mpe@ellerman.id.au, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 bp@alien8.de, julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

With pseudo NMIs support available its possible to configure SGIs to be
triggered as pseudo NMIs running in NMI context. And kernel features
such as:
- NMI backtrace can leverage IPI turned as NMI to get a backtrace of CPU
  stuck in hard lockup using magic SYSRQ.
- kgdb relies on NMI support to round up CPUs which are stuck in hard
  lockup state with interrupts disabled.

This patch-set adds framework to turn an IPI as NMI which can be triggered
as a pseudo NMI which in turn invokes registered NMI handlers.

After this patch-set we should be able to get a backtrace for a CPU
stuck in HARDLOCKUP. Have a look at an examples below from a hard lockup
testcase run on Developerbox:

$ echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT

NMI backtrace:
==============

# Issue Magic SysRq to dump backtrace

[  376.894502] NMI backtrace for cpu 8
[  376.894506] CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
[  376.894510] Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
[  376.894514] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=--)
[  376.894517] pc : lkdtm_HARDLOCKUP+0x8/0x18
[  376.894520] lr : lkdtm_do_action+0x24/0x30
[  376.894524] sp : ffff800012cebd20
[  376.894527] pmr_save: 00000060
[  376.894530] x29: ffff800012cebd20 x28: ffff000875ae8000
[  376.894540] x27: 0000000000000000 x26: 0000000000000000
[  376.894550] x25: 000000000000001a x24: ffff800012cebe40
[  376.894560] x23: 000000000000000b x22: ffff800010fc5040
[  376.894569] x21: ffff000878b61000 x20: ffff8000113b2870
[  376.894579] x19: 000000000000001b x18: 0000000000000010
[  376.894588] x17: 0000000000000000 x16: 0000000000000000
[  376.894598] x15: ffff000875ae8470 x14: 00000000000002ad
[  376.894613] x13: 0000000000000000 x12: 0000000000000000
[  376.894622] x11: 0000000000000007 x10: 00000000000009c0
[  376.894631] x9 : ffff800012ceba80 x8 : ffff000875ae8a20
[  376.894641] x7 : ffff00087f6b3280 x6 : ffff00087f6b3200
[  376.894651] x5 : 0000000000000000 x4 : ffff00087f6a91f8
[  376.894660] x3 : ffff00087f6b0120 x2 : 1aa310cec69eb500
[  376.894670] x1 : 0000000000000000 x0 : 0000000000000060
[  376.894679] Call trace:
[  376.894683]  lkdtm_HARDLOCKUP+0x8/0x18
[  376.894686]  direct_entry+0x124/0x1c0
[  376.894689]  full_proxy_write+0x60/0xb0
[  376.894693]  vfs_write+0xf0/0x230
[  376.894696]  ksys_write+0x6c/0xf8
[  376.894699]  __arm64_sys_write+0x1c/0x28
[  376.894703]  el0_svc_common.constprop.0+0x74/0x1f0
[  376.894707]  do_el0_svc+0x24/0x90
[  376.894710]  el0_sync_handler+0x180/0x2f8
[  376.894713]  el0_sync+0x158/0x180

KGDB:
=====

# Enter kdb via Magic SysRq

[6]kdb> btc
btc: cpu status: Currently on cpu 6
Available cpus: 0-5(I), 6, 7(I), 8, 9-23(I)
<snip>
Stack traceback for pid 555
0xffff000875ae8000      555      554  1    8   R  0xffff000875ae89c0  bash
CPU: 8 PID: 555 Comm: bash Not tainted 5.9.0-rc3-00740-g06ff047-dirty #242
Hardware name: Socionext SynQuacer E-series DeveloperBox, BIOS build #73 Apr  6 2020
Call trace:
 dump_backtrace+0x0/0x1a0
 show_stack+0x18/0x28
 dump_stack+0xc0/0x11c
 kgdb_cpu_enter+0x648/0x660
 kgdb_nmicallback+0xa0/0xa8
 ipi_kgdb_nmicallback+0x24/0x30
 ipi_nmi_handler+0x48/0x60
 handle_percpu_devid_fasteoi_ipi+0x74/0x88
 generic_handle_irq+0x30/0x48
 handle_domain_nmi+0x48/0x80
 gic_handle_irq+0x18c/0x34c
 el1_irq+0xcc/0x180 
 lkdtm_HARDLOCKUP+0x8/0x18
 direct_entry+0x124/0x1c0
 full_proxy_write+0x60/0xb0
 vfs_write+0xf0/0x230
 ksys_write+0x6c/0xf8
 __arm64_sys_write+0x1c/0x28
 el0_svc_common.constprop.0+0x74/0x1f0
 do_el0_svc+0x24/0x90
 el0_sync_handler+0x180/0x2f8
 el0_sync+0x158/0x180
<snip>

Changes in v7:
- Add a new library function: kgdb_smp_call_nmi_hook() to expose fallback
  mechanism to arch specific code.
- Addressed other misc comments from Daniel.

Changes in v6:
- Two new patches: #4 and #6 which adds runtime fallback framework for
  sysrq backtrace and kgdb roundup features.
- Reversed order of NMI backtrace and kgdb roundup feaure patches.
- Addressed other misc. comments from Marc.
- I haven't picked any tags from v5 since I think there is major rework
  involved. Masayoshi, could you please confirm if these features still
  work for you?

Changes in v5:
- Rebased to head of upstream master.
- Remove redundant invocation of ipi_nmi_setup().
- Addressed misc. comments.

Changes in v4:
- Move IPI NMI framework to a separate file.
- Get rid of hard-coded IPI_CALL_NMI_FUNC allocation.
- Add NMI backtrace support leveraged via magic SYSRQ.

Changes in v3:
- Rebased to Marc's latest IPIs patch-set [1].

[1] https://lkml.org/lkml/2020/9/1/603

Changes since RFC version [1]:
- Switch to use generic interrupt framework to turn an IPI as NMI.
- Dependent on Marc's patch-set [2] which turns IPIs into normal
  interrupts.
- Addressed misc. comments from Doug on patch #4.
- Posted kgdb NMI printk() fixup separately which has evolved since
  to be solved using different approach via changing kgdb interception
  of printk() in common printk() code (see patch [3]).

[1] https://lkml.org/lkml/2020/4/24/328
[2] https://lkml.org/lkml/2020/5/19/710
[3] https://lkml.org/lkml/2020/5/20/418

Sumit Garg (7):
  arm64: Add framework to turn IPI as NMI
  irqchip/gic-v3: Enable support for SGIs to act as NMIs
  arm64: smp: Assign and setup an IPI as NMI
  nmi: backtrace: Allow runtime arch specific override
  arm64: ipi_nmi: Add support for NMI backtrace
  kgdb: Expose default CPUs roundup fallback mechanism
  arm64: kgdb: Roundup cpus using IPI as NMI

 arch/arm/include/asm/irq.h       |  2 +-
 arch/arm/kernel/smp.c            |  3 +-
 arch/arm64/include/asm/irq.h     |  6 +++
 arch/arm64/include/asm/nmi.h     | 17 ++++++++
 arch/arm64/kernel/Makefile       |  2 +-
 arch/arm64/kernel/ipi_nmi.c      | 84 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/kgdb.c         | 18 +++++++++
 arch/arm64/kernel/smp.c          |  8 ++++
 arch/mips/include/asm/irq.h      |  2 +-
 arch/mips/kernel/process.c       |  3 +-
 arch/powerpc/include/asm/nmi.h   |  2 +-
 arch/powerpc/kernel/stacktrace.c |  3 +-
 arch/sparc/include/asm/irq_64.h  |  2 +-
 arch/sparc/kernel/process_64.c   |  4 +-
 arch/x86/include/asm/irq.h       |  2 +-
 arch/x86/kernel/apic/hw_nmi.c    |  3 +-
 drivers/irqchip/irq-gic-v3.c     | 29 ++++++++++----
 include/linux/kgdb.h             | 12 ++++++
 include/linux/nmi.h              | 12 ++----
 kernel/debug/debug_core.c        |  8 +++-
 20 files changed, 194 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
