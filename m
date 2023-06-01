Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E471F4D8
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pyz-0004lT-C3
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pyv-0004lM-Ma
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxngL/nWZ9CvmSVXwg8pkM18NqkUW/hq6cWY9xHbU50=; b=XAPRkXTfUjjQI9wSuCkDtQnX96
 ax6mbI+JCDFzJ70+VvDLxCStqPDbfEPWYltC8ymwEyF1CcyEZjOWnV3NrVTDxG0g6LjK64qPm2PpR
 t1Rkf9JuBOT9QAnqeAPQp/0tqNKQTLXPFfIACRsZo0ZOBGXw0g8DZwsZlHevh5I2g1to=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VxngL/nWZ9CvmSVXwg8pkM18NqkUW/hq6cWY9xHbU50=; b=CcornZnNt8L385LEEs/OIWodmq
 7Ond+41APdqHtV8Aeb9NZl7aPtH9TLz74HipDf6AN3nnO9T+LryJJLcTvWDRjD65OIJ6GGVG5rlAJ
 +1+75j1GQWQFD5xU/92bmvvTzUpaNIPFsNB2H/RqslplM7CNACp61hMyC8o1Ion0JH6c=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pyv-008k4H-QY for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:18 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-64f47448aeaso1070760b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655432; x=1688247432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxngL/nWZ9CvmSVXwg8pkM18NqkUW/hq6cWY9xHbU50=;
 b=aXtBMJsuEHVcZIKV7cLRpp9gJah5t0XCzX6mPhaAfDBP1dJ5ow0nIMbyHBqXyExXs/
 iONAnH757E2JdGKhPAJpJ0T+0at+owiwzn2oTUIqycF0fDPlNwbji/qaAjIXJsOAh/DF
 EzBp3VrZJfcftxuQAMYGMNArokNyBuLgHVwN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655432; x=1688247432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxngL/nWZ9CvmSVXwg8pkM18NqkUW/hq6cWY9xHbU50=;
 b=FL+uGUxtXmpyoSze3ALfH10yB8/Er0YwvLoKxXhYUsSPXY/qLQKRO9qi18tO9LDkgD
 Z7J2LKncWCqNqBDlc8ou85dCVU/LxPsvkX4+Q8znzREAbw0MAEsuXSqwO3kl/LS8FArD
 xZNa/FEGCcRzc2aTWQNJdqiYOgF5p8nJGhX6fu1xnrZ+c1jzD9hf+MYrLj5uRIyBR+mB
 6Zeml82ISd+Rson3G6u7W0jnODqfBvVMTCd9oVYqB4epP0W1eYEXEQQMk+Gj3HZ0gkAr
 pXG3db2wdXl9CVtMXg5Fp8ECFxlC9AsYRVeXGUYhkJF9ptIsYK7qgHrBWVny+wUXyzah
 nkLA==
X-Gm-Message-State: AC+VfDxlcgHlY6qHiNvh6j+2jTvMG/e9n6cBHZDCI9oezQ/QeKrwf992
 2MhveYmtsb+q7H3l0XP6jfYlNA==
X-Google-Smtp-Source: ACHHUZ5ef/rtEIYJxyW1OxKT1bSL//A95UwWPCmZBbTCdj36TOdor4jNJCZmCSlkwGKN3QsCenCWSg==
X-Received: by 2002:a05:6a00:8ca:b0:64c:b45f:fc86 with SMTP id
 s10-20020a056a0008ca00b0064cb45ffc86mr10767019pfu.17.1685655432123; 
 Thu, 01 Jun 2023 14:37:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:47 -0700
Message-ID: <20230601143109.v9.3.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
In-Reply-To: <20230601213440.2488667-1-dianders@chromium.org>
References: <20230601213440.2488667-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Introduce a
 framework
 for an IPI that will be used for debug purposes. The primary use case of
 this IPI will be to generate stack crawls on other CPUs, but it will also
 be used to round up CPUs for kg [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pyv-008k4H-QY
Subject: [Kgdb-bugreport] [PATCH v9 3/7] arm64: Add framework for a debug IPI
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Masahiro Yamada <masahiroy@kernel.org>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Introduce a framework for an IPI that will be used for debug
purposes. The primary use case of this IPI will be to generate stack
crawls on other CPUs, but it will also be used to round up CPUs for
kgdb.

When possible, we try to allocate this debug IPI as an NMI (or a
pseudo NMI). If that fails (due to CONFIG, an incompatible interrupt
controller, a quirk, missing the "irqchip.gicv3_pseudo_nmi=1" kernel
parameter, etc) we fall back to a normal IPI.

NOTE: hooking this up for CPU backtrace / kgdb will happen in a future
patch, this just adds the framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I didn't get any feedback from v8 patch #10 [1], but I went ahead and
folded it in here anyway since it really simplfies things. If people
don't like the fallback to regular IPI, I can also undo it.

[1] https://lore.kernel.org/r/20230419155341.v8.10.Ic3659997d6243139d0522fc3afcdfd88d7a5f030@changeid/

Changes in v9:
- Fold in v8 patch #10 ("Fallback to a regular IPI if NMI isn't enabled")
- Moved header file out of "include" since it didn't need to be there.
- Remove arm64_supports_nmi()
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.

Changes in v8:
- debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param

 arch/arm64/kernel/Makefile    |  2 +-
 arch/arm64/kernel/ipi_debug.c | 76 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ipi_debug.h | 13 ++++++
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kernel/ipi_debug.c
 create mode 100644 arch/arm64/kernel/ipi_debug.h

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index cc22011ab66a..737838f803b7 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
 			   syscall.o proton-pack.o idreg-override.o idle.o	\
-			   patching.o
+			   patching.o ipi_debug.o
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
 					   sys_compat.o
diff --git a/arch/arm64/kernel/ipi_debug.c b/arch/arm64/kernel/ipi_debug.c
new file mode 100644
index 000000000000..b57833e31eaf
--- /dev/null
+++ b/arch/arm64/kernel/ipi_debug.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Debug IPI support
+ *
+ * Copyright (C) 2020 Linaro Limited
+ * Author: Sumit Garg <sumit.garg@linaro.org>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/smp.h>
+
+#include "ipi_debug.h"
+
+static struct irq_desc *ipi_debug_desc __read_mostly;
+static int ipi_debug_id __read_mostly;
+static bool is_nmi;
+
+void arm64_debug_ipi(cpumask_t *mask)
+{
+	if (WARN_ON_ONCE(!ipi_debug_desc))
+		return;
+
+	__ipi_send_mask(ipi_debug_desc, mask);
+}
+
+static irqreturn_t ipi_debug_handler(int irq, void *data)
+{
+	/* nop, NMI handlers for special features can be added here. */
+
+	return IRQ_NONE;
+}
+
+void debug_ipi_setup(void)
+{
+	if (!ipi_debug_desc)
+		return;
+
+	if (is_nmi) {
+		if (!prepare_percpu_nmi(ipi_debug_id))
+			enable_percpu_nmi(ipi_debug_id, IRQ_TYPE_NONE);
+	} else {
+		enable_percpu_irq(ipi_debug_id, IRQ_TYPE_NONE);
+	}
+}
+
+void debug_ipi_teardown(void)
+{
+	if (!ipi_debug_desc)
+		return;
+
+	if (is_nmi) {
+		disable_percpu_nmi(ipi_debug_id);
+		teardown_percpu_nmi(ipi_debug_id);
+	} else {
+		disable_percpu_irq(ipi_debug_id);
+	}
+}
+
+void __init set_smp_debug_ipi(int ipi)
+{
+	int err;
+
+	if (!request_percpu_nmi(ipi, ipi_debug_handler, "IPI", &cpu_number)) {
+		is_nmi = true;
+	} else {
+		err = request_percpu_irq(ipi, ipi_debug_handler, "IPI", &cpu_number);
+		if (WARN_ON(err))
+			return;
+
+		irq_set_status_flags(ipi, IRQ_HIDDEN);
+	}
+
+	ipi_debug_desc = irq_to_desc(ipi);
+	ipi_debug_id = ipi;
+}
diff --git a/arch/arm64/kernel/ipi_debug.h b/arch/arm64/kernel/ipi_debug.h
new file mode 100644
index 000000000000..f6011a09282f
--- /dev/null
+++ b/arch/arm64/kernel/ipi_debug.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_NMI_H
+#define __ASM_NMI_H
+
+#include <linux/cpumask.h>
+
+void arm64_debug_ipi(cpumask_t *mask);
+
+void set_smp_debug_ipi(int ipi);
+void debug_ipi_setup(void);
+void debug_ipi_teardown(void);
+
+#endif
-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
