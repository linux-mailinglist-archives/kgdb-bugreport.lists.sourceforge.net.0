Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C906E85A4
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:03:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppGqC-0004wz-CS
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:03:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppGqA-0004wt-M6
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EfHs6iQcu6f/xzGNIRNs/Y6zNI7wkCv1JLv9sFf5g1M=; b=fajFD4gbXFo0vXms+iaE0h0HH3
 Oz/O0u5rVEihjFfLa/5ezU7K9DGdxR1pdf+00Y1qIgCV2gD0kTwQfxLrwo2t9c1OoPKr8pysCmEXB
 jQYHUNPBZJ6sl1QxOi9Sto23NF9OE5agVQAxJMV/25oua3OFGD7UowL9QwHk7AypRDpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EfHs6iQcu6f/xzGNIRNs/Y6zNI7wkCv1JLv9sFf5g1M=; b=F
 ZeBWRMPeuv2dQLsRVoIAMQAIdGfNJJ7m/e0ZElzXnTDOOYZo7iKPQKq9yEZDyTAgRPhSFoGnqmxlu
 SorvGEeFSSykCJDP6XO87jFHcdDzmu/iDUeM9PLSqIorlmko45Yg2y4PtdJ8O7N7bVGL5CD7mUizv
 6q5+/TJQVzaH0fdU=;
Received: from mail-yw1-f179.google.com ([209.85.128.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppGq6-00D6DK-0i for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:03:53 +0000
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-54f8e81c3f3so4069347b3.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681945424; x=1684537424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EfHs6iQcu6f/xzGNIRNs/Y6zNI7wkCv1JLv9sFf5g1M=;
 b=g2ezwQN+gF0ySsGKk5INLd0x2cokFxD3P43Ho4OvY0KZDWkKOCLC29ESRsL7Cv2xiH
 xMsK0jhAocSFAPkMQrBtVXJrdmlalkH8UX/zm69dQD3yICFfSZJsvdlzNtdZjaqJRE4Y
 46pa75kfs68kDrGry6lcT2hx+jNgK0csL5GSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681945424; x=1684537424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EfHs6iQcu6f/xzGNIRNs/Y6zNI7wkCv1JLv9sFf5g1M=;
 b=Ut4exqoG+15tdpHxdXOTf16w7+A1N7tXIQx9BmC9zYAThvqEO7kB5pU4xCdIPZicyg
 njLbuq2puTt2wC+bBH34/xoe+gL3Jzssh5fv4MfArQTrZTawsBLATFrcj5dVLTqnfnbx
 DmcodKVgxk9O9o17SUq7tIyhFzpv4GEv3g3p8+8ajt9XbgSF5OoqzWM4Ms/N0Z6rAw+I
 F2SRMd/HkROCMRbk6zQtpsvsVPD5IMhMkP12x7BwIo4OTg3wfUvlixyceNDzwR+pfm37
 +4+4jmp2nqrddPF1zIWACx/hEiPqnpaN+1pr4Z6PZup2RTW4cCnlu/kQgUXd9Ey57TeY
 y7AQ==
X-Gm-Message-State: AAQBX9dv4jHpyU2XAWB4O+rPd0ULge+ZzfX6eeFImABvnqVExSk5dynv
 r2eo+NhnBqQSYZmKckUH3S+gp0UNO0jYR6RoR1A=
X-Google-Smtp-Source: AKy350ZiPT69ec5g7FHlxHkgLJsXu49t1r2PGDTeEGKpYVM7Qe0rm8s8+T+i58n9/utMvufCZU7NAA==
X-Received: by 2002:a17:902:e74a:b0:1a6:46d7:77dc with SMTP id
 p10-20020a170902e74a00b001a646d777dcmr7987289plf.43.1681945018669; 
 Wed, 19 Apr 2023 15:56:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:56:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:55:54 -0700
Message-ID: <20230419225604.21204-1-dianders@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is an attempt to resurrect Sumit's old patch series [1]
 that allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
 also to round up CPUs in kdb/kgdb. The last post from Sumit that [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.179 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppGq6-00D6DK-0i
Subject: [Kgdb-bugreport] [PATCH v8 00/10] arm64: Add framework to turn an
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Ard Biesheuvel <ardb@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Pierre Gondois <Pierre.Gondois@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>,
 Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This is an attempt to resurrect Sumit's old patch series [1] that
allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
also to round up CPUs in kdb/kgdb. The last post from Sumit that I
could find was v7, so I called this series v8. I haven't copied all of
his old changelongs here, but you can find them from the link.

Since v7, I have:
* Addressed the small amount of feedback that was there for v7.
* Rebased.
* Added a new patch that prevents us from spamming the logs with idle
  tasks.
* Added an extra patch to gracefully fall back to regular IPIs if
  pseudo-NMIs aren't there.

Since there appear to be a few different patches series related to
being able to use NMIs to get stack traces of crashed systems, let me
try to organize them to the best of my understanding:

a) This series. On its own, a) will (among other things) enable stack
   traces of all running processes with the soft lockup detector if
   you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". On
   its own, a) doesn't give a hard lockup detector.

b) A different recently-posted series [2] that adds a hard lockup
   detector based on perf. On its own, b) gives a stack crawl of the
   locked up CPU but no stack crawls of other CPUs (even if they're
   locked too). Together with a) + b) we get everything (full lockup
   detect, full ability to get stack crawls).

c) The old Android "buddy" hard lockup detector [3] that I'm
   considering trying to upstream. If b) lands then I believe c) would
   be redundant (at least for arm64). c) on its own is really only
   useful on arm64 for platforms that can print CPU_DBGPCSR somehow
   (see [4]). a) + c) is roughly as good as a) + b).

[1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-email-sumit.garg@linaro.org/
[2] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecopzer.chen@mediatek.com/
[3] https://issuetracker.google.com/172213097
[4] https://issuetracker.google.com/172213129

Changes in v8:
- dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
- dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
- Add loongarch support, too
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
- "Tag the arm64 idle functions as __cpuidle" new for v8
- "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
- "Fallback to a regular IPI if NMI isn't enabled" new for v8

Douglas Anderson (3):
  arm64: idle: Tag the arm64 idle functions as __cpuidle
  kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB
  arm64: ipi_nmi: Fallback to a regular IPI if NMI isn't enabled

Sumit Garg (7):
  arm64: Add framework to turn IPI as NMI
  irqchip/gic-v3: Enable support for SGIs to act as NMIs
  arm64: smp: Assign and setup an IPI as NMI
  nmi: backtrace: Allow runtime arch specific override
  arm64: ipi_nmi: Add support for NMI backtrace
  kgdb: Expose default CPUs roundup fallback mechanism
  arm64: kgdb: Roundup cpus using IPI as NMI

 arch/arm/include/asm/irq.h       |   2 +-
 arch/arm/kernel/smp.c            |   3 +-
 arch/arm64/include/asm/irq.h     |   4 ++
 arch/arm64/include/asm/nmi.h     |  17 +++++
 arch/arm64/kernel/Makefile       |   2 +-
 arch/arm64/kernel/idle.c         |   4 +-
 arch/arm64/kernel/ipi_nmi.c      | 103 +++++++++++++++++++++++++++++++
 arch/arm64/kernel/kgdb.c         |  18 ++++++
 arch/arm64/kernel/smp.c          |   8 +++
 arch/loongarch/include/asm/irq.h |   2 +-
 arch/loongarch/kernel/process.c  |   3 +-
 arch/mips/include/asm/irq.h      |   2 +-
 arch/mips/kernel/process.c       |   3 +-
 arch/powerpc/include/asm/nmi.h   |   2 +-
 arch/powerpc/kernel/stacktrace.c |   3 +-
 arch/sparc/include/asm/irq_64.h  |   2 +-
 arch/sparc/kernel/process_64.c   |   4 +-
 arch/x86/include/asm/irq.h       |   2 +-
 arch/x86/kernel/apic/hw_nmi.c    |   3 +-
 drivers/irqchip/irq-gic-v3.c     |  29 ++++++---
 include/linux/kgdb.h             |  13 ++++
 include/linux/nmi.h              |  12 ++--
 kernel/debug/debug_core.c        |   8 ++-
 23 files changed, 217 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
