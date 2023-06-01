Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3E71F4D6
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pyv-0003fj-7k
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pyt-0003fc-NM
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wK2qTWWUlvlWswvV25kHoV1Nx+E83dWl0Aza3PbFaXw=; b=Zgc5yHO0VH4+uVSJfsT2524JFQ
 8X+6EV9XhfWG80hskzLpw/gFepFzPMg0ba1IRnAAlMu1ZnQuYEKkdp4RQBclILqGzmQjLDQpPXvA6
 6TduXa3OXHozIw/id8R4YCqzduMXY+VeeE1zP4nAUoivOQ25qJ49/OuhTdfQM8L/9uxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wK2qTWWUlvlWswvV25kHoV1Nx+E83dWl0Aza3PbFaXw=; b=h
 Il9ryUaTAD7YDANjzGMG+rk9Eb6veMMQEPSHZdJRfo/MUYFWcr4J7PBjAwjzM6UvQpbNuDmcQrdTP
 o6Dh2CfUYnW4CtH37wgbxuBgYQDqaoocXAc3MRE11Mei86ELgya+9PLBNWt4KE5C0dOf83zGI5ZuN
 u1EtU0CYNv7hNdD4=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pyp-0005Bc-1R for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:16 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-64d247a023aso1064014b3a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655425; x=1688247425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wK2qTWWUlvlWswvV25kHoV1Nx+E83dWl0Aza3PbFaXw=;
 b=VjkyfUKU1dkg5kT2BFXow4+y0HeGzDVKSaONjNBRNW8oLVR/Alj7nxwARt7jAN4AAd
 LeszuaBRTc4EKoRYji2WEy+1ZUighHRYU33p6yuhIh4aTq/1brBqn37H8mLeVIu/k+4w
 OX1kckaXSmVRq+aZdP5wkU6jO0HaJRTPBztMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655425; x=1688247425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wK2qTWWUlvlWswvV25kHoV1Nx+E83dWl0Aza3PbFaXw=;
 b=N6M4Aj3CmZKhUwBR3CPjpl3pxP/ly8CrR/ABP3KKgvRog6yu83Izbd9pq0L0q8pcyO
 JXuGIdOwb78GgOymG64YvK017s9uP90OnE6BCu0mMSXUNZst4bzQGlrlu+7YpDFsnz3L
 pq6Frk80qEeaCU+t7ivzBFrYz/zMWJHD+nEVACB5zkcCgY70rmy0O7oKiou5hE/Au0TP
 3m4g7Z6VF/kXvc0yGrweI9f284ffMGP0OF74cig920UXbaWFDd2cj+UjtzTLshJ4YgQA
 hjWvo6GD80cvNOwnl6HD3HwgBUcpXrEMnjG2IoE/IVjuhoOV6pjqVdEVGiY/1WPMDOWA
 IbsA==
X-Gm-Message-State: AC+VfDyJAZi1Fmm1/vKyyxn6EwkB/8Fyf9ulDhNHWYoASblBypOgQEtE
 nJ04JKZf7E08B2cEXtUnctk6iA==
X-Google-Smtp-Source: ACHHUZ5HygCX8YZytHhbbDr3bRwb0rXBa6fo96DufozZDOKQ1Pv8Ou3d9q1G/o0NgyZNtzPCEB3dPQ==
X-Received: by 2002:a05:6a20:4299:b0:10f:b53d:8641 with SMTP id
 o25-20020a056a20429900b0010fb53d8641mr9155808pzj.46.1685655425420; 
 Thu, 01 Jun 2023 14:37:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:44 -0700
Message-ID: <20230601213440.2488667-1-dianders@chromium.org>
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is an attempt to resurrect Sumit's old patch series [1]
 that allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
 also to round up CPUs in kdb/kgdb. The last post from Sumit that [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pyp-0005Bc-1R
Subject: [Kgdb-bugreport] [PATCH v9 0/7] arm64: Add debug IPI for backtraces
 / kgdb; try to use NMI for it
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Wei Li <liwei391@huawei.com>,
 Frederic Weisbecker <frederic@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This is an attempt to resurrect Sumit's old patch series [1] that
allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
also to round up CPUs in kdb/kgdb. The last post from Sumit that I
could find was v7, so I started my series at v8. I haven't copied all
of his old changelongs here, but you can find them from the link.

I'm really looking for a way to land this patch series. In response to
v8, Mark Rutland indicated [2] that he was worried about the soundness
of pseudo NMI. Those definitely need to get fixed, but IMO this patch
series could still land in the meantime. That would at least let
people test with it.

Request for anyone reading this: please help indicate your support of
this patch series landing by replying, even if you don't have the
background for a full review. My suspicion is that there are a lot of
people who agree that this would be super useful to get landed.

Since v8, I have cleaned up this patch series by integrating the 10th
patch from v8 [3] into the whole series. As part of this, I renamed
the "NMI IPI" to the "debug IPI" since it could now be backed by a
regular IPI in the case that pseudo NMIs weren't available. With the
fallback, this allowed me to drop some extra patches from the
series. This feels (to me) to be pretty clean and hopefully others
agree. Any patch I touched significantly I removed Masayoshi and
Chen-Yu's tags from.

...also in v8, I reorderd the patches a bit in a way that seemed a
little cleaner to me.

Since v7, I have:
* Addressed the small amount of feedback that was there for v7.
* Rebased.
* Added a new patch that prevents us from spamming the logs with idle
  tasks.
* Added an extra patch to gracefully fall back to regular IPIs if
  pseudo-NMIs aren't there.

It can be noted that this patch series works very well with the recent
"hardlockup" patches that have landed through Andrew Morton's tree and
are currently in linuxnext. It works especially well with the "buddy"
lockup detector.

[1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-email-sumit.garg@linaro.org/
[2] https://lore.kernel.org/lkml/ZFvGqD%2F%2Fpm%2FlZb+p@FVFF77S0Q05N.cambridge.arm.com/
[3] https://lore.kernel.org/r/20230419155341.v8.10.Ic3659997d6243139d0522fc3afcdfd88d7a5f030@changeid/

Changes in v9:
- Add a warning if we don't have enough IPIs for the NMI IPI
- Added comments that we might not be using NMI always.
- Added missing "inline"
- Added to commit message that this doesn't catch all cases.
- Fold in v8 patch #10 ("Fallback to a regular IPI if NMI isn't enabled")
- Moved header file out of "include" since it didn't need to be there.
- Remove arm64_supports_nmi()
- Remove fallback for when debug IPI isn't available.
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
- Update commit description
- arch_trigger_cpumask_backtrace() no longer returns bool

Changes in v8:
- "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
- "Tag the arm64 idle functions as __cpuidle" new for v8
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
- debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param

Douglas Anderson (2):
  arm64: idle: Tag the arm64 idle functions as __cpuidle
  kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB

Sumit Garg (5):
  irqchip/gic-v3: Enable support for SGIs to act as NMIs
  arm64: Add framework for a debug IPI
  arm64: smp: Assign and setup the debug IPI
  arm64: ipi_debug: Add support for backtrace using the debug IPI
  arm64: kgdb: Roundup cpus using the debug IPI

 arch/arm64/include/asm/irq.h  |   3 +
 arch/arm64/kernel/Makefile    |   2 +-
 arch/arm64/kernel/idle.c      |   4 +-
 arch/arm64/kernel/ipi_debug.c | 102 ++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ipi_debug.h |  13 +++++
 arch/arm64/kernel/kgdb.c      |  14 +++++
 arch/arm64/kernel/smp.c       |  11 ++++
 drivers/irqchip/irq-gic-v3.c  |  29 +++++++---
 include/linux/kgdb.h          |   1 +
 9 files changed, 168 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/kernel/ipi_debug.c
 create mode 100644 arch/arm64/kernel/ipi_debug.h

-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
