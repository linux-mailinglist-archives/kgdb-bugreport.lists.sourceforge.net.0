Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42970A956
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrB-0004bO-66
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03nQ-00080N-B8
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yrP+bq8OuhPbpRrmH69BUF/ETBoN12s5FsuLw9NdkoQ=; b=MuJDKcrI9GnvLGaTq2SoId6Hpy
 QOQmkNM+l1DrE1fOyFeSoQ5IVKgSSqTzyDTQO4JtqFTrj4JalSvyScH4H1HmgeCfAcVmy+BBX8E7b
 MxF45nECHToEAZwSsihopUTGrCWBQh0CAg9C+1kYSyEM07A5BE92GDOX9BwUT4AfCF20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yrP+bq8OuhPbpRrmH69BUF/ETBoN12s5FsuLw9NdkoQ=; b=VFLz5we8NinLaj/5Xe5cYAIbhh
 sl5q4Y9B9Aa+pSew6WB6NS2gN/b30MMO0b7VonnGXIsOzn2Q4Y9yHNbLmNdTX8NCORtUiENDBG33t
 BgqmV3SWReUYg3tpBSejA94+u9H5mbJzQkeHRmKacTWMd+v/vNtJCIBXc/javS5C5yyQ=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03nP-00DXuD-GN for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:40 +0000
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so3217673a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516894; x=1687108894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrP+bq8OuhPbpRrmH69BUF/ETBoN12s5FsuLw9NdkoQ=;
 b=KkHmwe229DgAVffDLLznQfZWYuRIjXT+TDyQaWKGhvDfbVO2pTXwGDMq0uniEUc2pr
 PrWIBYD5RByt6+6OuFJh3BfSsmjMjr+HVbYZDUr8BC7pa7Ol2rviQXeKqKzIVrcEOc/5
 3zOswXTomM9TSMrnUjjTtNDfYXbvYca89iJE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516894; x=1687108894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrP+bq8OuhPbpRrmH69BUF/ETBoN12s5FsuLw9NdkoQ=;
 b=RW4vVEwWPy8hTN94jpgPgk0fEJm6czASNz/ns7GqCylvWHkKJO2Twh2RmKdN1GWbi/
 JtnQmb188crChGtktwl2VnZY5vWAbMdbz1sLFaRUoRPs/80Br1TKvsq15SbI4K1JcDzq
 c/YWPPzZJ/i5AQtfqYEoax2doAFN7f/a93keOJyteXpVkneZ/iVp945bjXnXc4xuoV7H
 g5KB0pgx/9KwiY0NxQfz2ITcqnVISM4qkuW8kBf6VdIEXahC1vnG+T83SvJwpOCaeO70
 hlpGHtX/Gf+ZI2G2x0ZCJJIvUnYwgfLGr4xV/I6pnFyg+gcII0CIFQ7AGFfyAn6i2p9t
 nZ3A==
X-Gm-Message-State: AC+VfDz+mRmz8IXcgdYWnYTfMtrmoCgFeEiD218Zrf8+bgDgN4v+pY44
 gIdNPWprLkISF9EbOkahC/9w7Q==
X-Google-Smtp-Source: ACHHUZ54/kcRAIYK35dSsdk2yWtyGoA/hM9uTSr2W1P6Cx1odcfE7RiCCJfOYdeD35/q03bKDA/ezA==
X-Received: by 2002:a17:90a:f2d1:b0:24e:3a0a:9b48 with SMTP id
 gt17-20020a17090af2d100b0024e3a0a9b48mr2771022pjb.21.1684516893906; 
 Fri, 19 May 2023 10:21:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:42 -0700
Message-ID: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With the recent feature added to enable perf events to use
 pseudo NMIs as interrupts on platforms which support GICv3 or later, its
 now been possible to enable hard lockup detector (or NMI watchdog) o [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03nP-00DXuD-GN
Subject: [Kgdb-bugreport] [PATCH v5 18/18] arm64: Enable perf events based
 hard lockup detector
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

With the recent feature added to enable perf events to use pseudo NMIs
as interrupts on platforms which support GICv3 or later, its now been
possible to enable hard lockup detector (or NMI watchdog) on arm64
platforms. So enable corresponding support.

One thing to note here is that normally lockup detector is initialized
just after the early initcalls but PMU on arm64 comes up much later as
device_initcall(). To cope with that, override
arch_perf_nmi_is_available() to let the watchdog framework know PMU
not ready, and inform the framework to re-initialize lockup detection
once PMU has been initialized.

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together.

As part of making this match with my series, I needed to resolve
conflicts with the patch ("watchdog/hardlockup: Have the perf
hardlockup use __weak functions more cleanly"). This makes ${SUBJECT}
patch now depend on the patch ("watchdog/perf: Add a weak function for
an arch to detect if perf can use NMIs"). As talked about in that
patch, there may be better alternatives to accomplish the same thing.

As mentioned in the cover letter, I'm not really expecting this patch
to land together with the patches for the buddy detector. I included
it with my series simply for convenience of testing both series
together.

NOTE: the previous patch posted by Lecopzer pointed to Sumit's
patch [2] in the commit text but provided no context. I moved it to
this "after the cut" note.

[1] https://lore.kernel.org/r/20220903093415.15850-7-lecopzer.chen@mediatek.com/
[2] http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org

(no changes since v4)

Changes in v4:
- Pulled ("Enable perf events based hard ...") into my series for v4.

 arch/arm64/Kconfig               |  2 ++
 arch/arm64/kernel/watchdog_hld.c | 12 ++++++++++++
 drivers/perf/arm_pmu.c           |  5 +++++
 drivers/perf/arm_pmuv3.c         | 12 ++++++++++--
 include/linux/perf/arm_pmu.h     |  2 ++
 5 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b1201d25a8a4..b3718e538f18 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -203,12 +203,14 @@ config ARM64
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_GCC_PLUGINS
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KVM
 	select HAVE_NMI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_PREEMPT_DYNAMIC_KEY
diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
index 2401eb1b7e55..dcd25322127c 100644
--- a/arch/arm64/kernel/watchdog_hld.c
+++ b/arch/arm64/kernel/watchdog_hld.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/nmi.h>
 #include <linux/cpufreq.h>
+#include <linux/perf/arm_pmu.h>
 
 /*
  * Safe maximum CPU frequency in case a particular platform doesn't implement
@@ -22,3 +24,13 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
 
 	return (u64)max_cpu_freq * watchdog_thresh;
 }
+
+bool __init arch_perf_nmi_is_available(void)
+{
+	/*
+	 * hardlockup_detector_perf_init() will success even if Pseudo-NMI turns off,
+	 * however, the pmu interrupts will act like a normal interrupt instead of
+	 * NMI and the hardlockup detector would be broken.
+	 */
+	return arm_pmu_irq_is_nmi();
+}
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 15bd1e34a88e..7b9caa502d33 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -687,6 +687,11 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
 	return per_cpu(hw_events->irq, cpu);
 }
 
+bool arm_pmu_irq_is_nmi(void)
+{
+	return has_nmi;
+}
+
 /*
  * PMU hardware loses all context when a CPU goes offline.
  * When a CPU is hotplugged back in, since some hardware registers are
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index c98e4039386d..7b28d65f3f1c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/smp.h>
+#include <linux/nmi.h>
 
 #include <asm/arm_pmuv3.h>
 
@@ -1348,10 +1349,17 @@ static struct platform_driver armv8_pmu_driver = {
 
 static int __init armv8_pmu_driver_init(void)
 {
+	int ret;
+
 	if (acpi_disabled)
-		return platform_driver_register(&armv8_pmu_driver);
+		ret = platform_driver_register(&armv8_pmu_driver);
 	else
-		return arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
+		ret = arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
+
+	if (!ret)
+		lockup_detector_retry_init();
+
+	return ret;
 }
 device_initcall(armv8_pmu_driver_init)
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 525b5d64e394..5b00f5cb4cf9 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -171,6 +171,8 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
 #define kvm_host_pmu_init(x)	do { } while(0)
 #endif
 
+bool arm_pmu_irq_is_nmi(void);
+
 /* Internal functions only for core arm_pmu code */
 struct arm_pmu *armpmu_alloc(void);
 void armpmu_free(struct arm_pmu *pmu);
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
