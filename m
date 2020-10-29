Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0F29EEF5
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 15:58:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9Nz-00084a-Cf
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 14:58:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9No-00081P-34
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 14:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7BTLMCS1Mi2dNvYdv+3ijnHMkkYPGW7U6ROomwXAV8k=; b=kf0JS5DfZP3Jy9VzO2F4gne814
 mx/nuJqjUtfJ3jghHa3Sa7+iJTO71Ckfrb+4xDkXPsufm9PunOEMjgW7UVMFdmrl854gRHqKgYmzG
 EAKBuqRJ67QE0x5ElTBhaqGKixmRkLwXc8y+lXmjNCMhExA1dkoap/+cvWFhkbDgDpVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7BTLMCS1Mi2dNvYdv+3ijnHMkkYPGW7U6ROomwXAV8k=; b=Q8yCTmCV9jvWJvoLJ44RpF5JJt
 KNym6RWr2drjR0f5JJnWwtyFzW385c9Q6H/pV9KeK1G+eUFCmIUM/ubk3/UtCGB1ZRn3UjjMRoLdG
 KiWJ21Yesi/aGbWdn8BLjyTFtVwn477pzZx8K8urMKvzG/Rm1goLfzrSp8dgbzeDlqlg=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9NR-0018mM-DM
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 14:58:30 +0000
Received: by mail-pg1-f196.google.com with SMTP id x13so2541012pgp.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=7BTLMCS1Mi2dNvYdv+3ijnHMkkYPGW7U6ROomwXAV8k=;
 b=zNsgjw2r/wKNWLFQYMhrGpY7x/Wm2aAYJQiEhvnyarEflsdJoAVRO2ZzQqQKFFj05c
 JNWCJTZipselwjPxxAwvqelhvkrSTwStg2sexwFmQohgKg3DX9o1vJW25jU0bptanHKt
 LXrw9yLMtouVukSLIk62sw/lUIoW6TKpbxIa+CsEXUQrb0ucuViedCw/vTscrIKQ8AZK
 fo9dAHlSV7233hUDfTujtAPyZi1YgvJfF1hHgwGIVJonU4A2b/vrWsDw6mu7Ih3d8CF3
 2sgjSdMLYsMAKF01qEfiwAavl0PUnrxD2FXgG0cbq0COQEnLPNLvNSjC7V7LNy/3NMOs
 ryDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7BTLMCS1Mi2dNvYdv+3ijnHMkkYPGW7U6ROomwXAV8k=;
 b=PABHi85E0REe+D7ILHNMjwiIqgG+tdj3Y2ZLPJDEoS9IDjwN+kJeoWSoe9NubHb1/c
 8trOLI3qbGnX5pEntVO/n6N246WySuWuqQcnuFaWuWzL6pFJMxqWeWeh3Oa1t6on067M
 RfRx5ks9Tp+P37pOIjicsMJvIKggnCS7KRW8pNcHmoXCvIm46uSTPFp19TiJ1lQtmK2K
 u5V3AfqJRYvUmxmMO3Gxq8SWTKUNPp3q1cBbOXwwcLt5tekShS4s2JEjBGfkXsTfaUBb
 Ze1/SGqwsgfXainWQyNskQDLwdX3Wuuu0T0eOuOeaefyOwYyv83PUAA3F2IqH3lEtmLo
 UX7w==
X-Gm-Message-State: AOAM533HBvWkg/3LfXeGSaJucwtGuUNI7q84qUTL/TcragZvM9eU/U4V
 QUlMzWrPXeuSVnE1Eg0pZQCJhw==
X-Google-Smtp-Source: ABdhPJyOojjV7xVV9n/qLYTFQV7fLksb9HWdQ24IFK500xBhqpXRUXskGN2GPBtDdt7z9d3nMV6IwA==
X-Received: by 2002:aa7:92d4:0:b029:163:e68e:5ffb with SMTP id
 k20-20020aa792d40000b0290163e68e5ffbmr4360967pfa.40.1603983483549; 
 Thu, 29 Oct 2020 07:58:03 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.57.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:58:02 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:20 +0530
Message-Id: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.71.231 listed in dnsbl.sorbs.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kY9NR-0018mM-DM
Subject: [Kgdb-bugreport] [PATCH v6 0/7] arm64: Add framework to turn an IPI
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
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
  kgdb: roundup: Allow runtime arch specific override
  arm64: kgdb: Roundup cpus using IPI as NMI

 arch/arm/include/asm/irq.h       |  2 +-
 arch/arm/kernel/smp.c            |  3 +-
 arch/arm64/include/asm/irq.h     |  6 +++
 arch/arm64/include/asm/kgdb.h    |  9 +++++
 arch/arm64/include/asm/nmi.h     | 17 ++++++++
 arch/arm64/kernel/Makefile       |  2 +-
 arch/arm64/kernel/ipi_nmi.c      | 84 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/kgdb.c         | 35 +++++++++++++++++
 arch/arm64/kernel/smp.c          |  8 ++++
 arch/mips/include/asm/irq.h      |  2 +-
 arch/mips/kernel/process.c       |  3 +-
 arch/powerpc/include/asm/nmi.h   |  2 +-
 arch/powerpc/kernel/kgdb.c       |  3 +-
 arch/powerpc/kernel/stacktrace.c |  3 +-
 arch/sparc/include/asm/irq_64.h  |  2 +-
 arch/sparc/kernel/process_64.c   |  4 +-
 arch/sparc/kernel/smp_64.c       |  3 +-
 arch/x86/include/asm/irq.h       |  2 +-
 arch/x86/kernel/apic/hw_nmi.c    |  3 +-
 arch/x86/kernel/kgdb.c           |  6 ++-
 drivers/irqchip/irq-gic-v3.c     | 29 ++++++++++----
 include/linux/kgdb.h             |  5 ++-
 include/linux/nmi.h              | 12 ++----
 kernel/debug/debug_core.c        | 10 ++++-
 24 files changed, 221 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
