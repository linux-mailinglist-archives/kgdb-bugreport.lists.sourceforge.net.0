Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA32178DE99
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Aug 2023 21:13:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbQdP-0001mz-Hs
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 30 Aug 2023 19:13:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qbQdM-0001ms-7H
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JDyOflW/myJYlvUctAoCcIDpgS4q3OQICcXlfqcE06A=; b=SMYjwHZdCrFpacMIn8of9x0oiU
 Ls/IixWbVzFOz1OdoYYd3DjNfji8QFcWKQf5kyJCw3dr6apfY5AQUbN5w5i+d7OYIHRc7a76tvgd8
 DWCSlVkiop0RhZPTArW/ehVsALGg8/K23Q0bmLP1V1PXXEKDHJOSejh6XwLO3sIq1Gzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JDyOflW/myJYlvUctAoCcIDpgS4q3OQICcXlfqcE06A=; b=S
 5zkkWncXyA+RF9xXjLe2eWpaF+poog78b75Dm0uDeA531dsOC9FQKoRqZejX3dR/Y6H34ltocTyAM
 P8MobtogC66M42glc2kjTBwtzcLI/ViXyZ//xt+/iLZYXfJNSIWG9Dlkl5dUkycJbzZe9iZYM7TPC
 0uI2hlOZNhpDzsu4=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbQdJ-0003qu-Dc for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:45 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so8947515ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 30 Aug 2023 12:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693422816; x=1694027616;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JDyOflW/myJYlvUctAoCcIDpgS4q3OQICcXlfqcE06A=;
 b=Cv0LG1IJ1Ftzjxqv6+NQyE/I43FlI6rT76NZV8Ec090c9ulyu9FkzcRJbhpZK8O03K
 eFjYc3cXKEj5YDe6fJBajSepNPRZpQyuYqETIWJPYFg/Adq4ZqLmYOtj51B5t+UcYh14
 r9PZzCXWubpW1wR1NrcAKAIyZL5xFETE7XOZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422816; x=1694027616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JDyOflW/myJYlvUctAoCcIDpgS4q3OQICcXlfqcE06A=;
 b=kc7f3IsPVemcVLcokQrepITwfTNdGy7H73Gf2iyAjSyjhdR9jFh6UkJfU2mi2TaCZs
 Ys+qY7vTiXXRP4e3JYvEaLsCYt8MA1I8pyQnQ86TxkoKMYaY1gpiwpF/ReWr8KK2pMl6
 vMXFxnkUX69VQpZmEyEygNDEiKZh6o2AZnFQgm5sEqNZcZFYX2CPWf8pMDpl544cSnjx
 M0HcfiaI0pOrtKIQ6DUyu5gvDc0te82m2k4kIUNg4P9Yhn3EgyeURm057PbitXmb1hx5
 t77W57hDa2/PhF1wqyH1lobmHsmTvs7pyknR87TIfiKhHBlGkEvIsXHSDrVtOw3u9Her
 ns/w==
X-Gm-Message-State: AOJu0YxGk6pY62vX7SvXfc2H+jH68oPoYiT5k1LlGbaDiGD/xSHm4/GP
 ohLk4FjisS30y+yM4oI4yffksA==
X-Google-Smtp-Source: AGHT+IGIFKcBlvPX1UPhPdOymNrV4WzWDOO5asyuyncWbRsGOmjSkkWcqoVmoyXrNeHfI0T2bMbH7A==
X-Received: by 2002:a17:902:c941:b0:1c0:bcbc:d67 with SMTP id
 i1-20020a170902c94100b001c0bcbc0d67mr767212pla.22.1693422815685; 
 Wed, 30 Aug 2023 12:13:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e315:dec6:467c:83c5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001bbdf32f011sm11338928plg.269.2023.08.30.12.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:13:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed, 30 Aug 2023 12:11:21 -0700
Message-ID: <20230830191314.1618136-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
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
 no trust [209.85.214.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbQdJ-0003qu-Dc
Subject: [Kgdb-bugreport] [PATCH v12 0/7] arm64: Add IPI for backtraces /
 kgdb; try to use NMI for some IPIs
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
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Kees Cook <keescook@chromium.org>,
 Frederic Weisbecker <frederic@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This is an attempt to resurrect Sumit's old patch series [1] that
allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
also to round up CPUs in kdb/kgdb. The last post from Sumit that I
could find was v7, so I started my series at v8. I haven't copied all
of his old changelongs here, but you can find them from the link.

This patch series targets v6.6. Specifically it can't land in v6.5
since it depends on commit 8d539b84f1e3 ("nmi_backtrace: allow
excluding an arbitrary CPU").

It should be noted that Mark still feels there might be some corner
cases where pseudo-NMI is not production ready [2] [3], but as far as
I'm aware there are no concrete/documented issues. Regardless of
whether this should be enabled for production, though, this series
will be invaluable to anyone trying to debug crashes on arm64
machines.

v12 of this series collects tags, fixes a few small nits in comments
and commit messages from v11 and adds a new (and somewhat unrelated)
small patch to the end of the series. There are no code changes other
than the last patch, which is tiny.

v11 of this series addressed Stephen Boyd's feedback on v10 and added
a missing "static" that the patches robot found.

v10 of this series attempted to address all of Mark's feedback on
v9. As a quick summary:
- It includes his patch to remove IPI_WAKEUP, freeing up an extra IPI.
- It no longer combines the "kgdb" and "backtrace" IPIs. If we need
  another IPI these could always be recombined later.
- It promotes IPI_CPU_STOP and IPI_CPU_CRASH_STOP to NMI.
- It puts nearly all the code directly in smp.c.
- Several of the patches are squashed together.
- Patch #6 ("kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB")
  was dropped from the series since it landed.

Between v8 and v9, I had cleaned up this patch series by integrating
the 10th patch from v8 [4] into the whole series. As part of this, I
renamed the "NMI IPI" to the "debug IPI" since it could now be backed
by a regular IPI in the case that pseudo NMIs weren't available. With
the fallback, this allowed me to drop some extra patches from the
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
are currently in mainline. It works especially well with the "buddy"
lockup detector.

[1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-email-sumit.garg@linaro.org/
[2] https://lore.kernel.org/lkml/ZFvGqD%2F%2Fpm%2FlZb+p@FVFF77S0Q05N.cambridge.arm.com/
[3] https://lore.kernel.org/lkml/ZNDKVP2m-iiZCz3v@FVFF77S0Q05N.cambridge.arm.com
[4] https://lore.kernel.org/r/20230419155341.v8.10.Ic3659997d6243139d0522fc3afcdfd88d7a5f030@changeid/

Changes in v12:
- ("arm64: smp: Mark IPI globals as __ro_after_init") new for v12.
- Added a comment about why we account for 16 SGIs when Linux uses 8.
- Minor comment change to add "()" after nmi_trigger_cpumask_backtrace.
- Updated the commit hash of the commit this depends on.

Changes in v11:
- Adjust comment about NR_IPI/MAX_IPI.
- Don't use confusing "backed by" idiom in comment.
- Made arm64_backtrace_ipi() static.
- Updated commit message as per Stephen.
- arch_send_wakeup_ipi() now takes an unsigned int.

Changes in v10:
- ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for v10.
- ("arm64: smp: Remove dedicated wakeup IPI") new for v10.
- Backtrace now directly supported in smp.c
- Don't allocate the cpumask on the stack; just iterate.
- Moved kgdb calls to smp.c to avoid needing to export IPI info.
- Rewrite as needed for 5.11+ as per Mark Rutland and Sumit.
- Squash backtrace into patch adding support for pseudo-NMI IPIs.
- kgdb now has its own IPI.

Changes in v9:
- Added comments that we might not be using NMI always.
- Added to commit message that this doesn't catch all cases.
- Fold in v8 patch #10 ("Fallback to a regular IPI if NMI isn't enabled")
- Moved header file out of "include" since it didn't need to be there.
- Remove arm64_supports_nmi()
- Remove fallback for when debug IPI isn't available.
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
- arch_trigger_cpumask_backtrace() no longer returns bool

Changes in v8:
- "Tag the arm64 idle functions as __cpuidle" new for v8
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
- debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param

Douglas Anderson (6):
  irqchip/gic-v3: Enable support for SGIs to act as NMIs
  arm64: idle: Tag the arm64 idle functions as __cpuidle
  arm64: smp: Add arch support for backtrace using pseudo-NMI
  arm64: smp: IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI
  arm64: kgdb: Implement kgdb_roundup_cpus() to enable pseudo-NMI
    roundup
  arm64: smp: Mark IPI globals as __ro_after_init

Mark Rutland (1):
  arm64: smp: Remove dedicated wakeup IPI

 arch/arm64/include/asm/irq.h              |   3 +
 arch/arm64/include/asm/smp.h              |   4 +-
 arch/arm64/kernel/acpi_parking_protocol.c |   2 +-
 arch/arm64/kernel/idle.c                  |   4 +-
 arch/arm64/kernel/smp.c                   | 139 +++++++++++++++++-----
 drivers/irqchip/irq-gic-v3.c              |  59 ++++++---
 6 files changed, 160 insertions(+), 51 deletions(-)

-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
