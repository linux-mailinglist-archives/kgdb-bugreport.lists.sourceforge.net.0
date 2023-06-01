Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC0671F4DF
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pz5-0004lu-Ks
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pz4-0004lo-0O
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pZEI6Qd7tJdeWnwaS3kN3vC1A5EXJtp5KG07jP5WNyg=; b=WkDKPzCKQ9V3x99X6roV/JDLW0
 OIZKjFZHM6U8Aab39YXdr6w2/mGa+qTekYLKTatnThq8WgHToveH6AeE4G2qAzc6NPx4/kqyBs/P+
 4PAV1zvH1cK9jM757ZK0FuNGAFUa1cDYxOVx8fwQL5TRo1d3q/MFKqaarN98y3Tfy9LI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pZEI6Qd7tJdeWnwaS3kN3vC1A5EXJtp5KG07jP5WNyg=; b=R6A3WkNrgs8rb1mkm9bNStyZhh
 x7zWcy2lcyqdaSL4L/broQBzC28aFe1+UX/pDXsUe+orYQqBZp8/Lmabt56KIY0wJT0OsQinEU0dT
 TjqJyhrxK+3BkMYJQjEv2xiPcJYBp3W3DyAQbv0CBfXR888YF1Dg4nXBrQIHWsFWIHfo=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pz4-008k4e-8w for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:26 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-64d1a0d640cso1056493b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655440; x=1688247440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZEI6Qd7tJdeWnwaS3kN3vC1A5EXJtp5KG07jP5WNyg=;
 b=JCAPoe0UpPAv7b1ZAoftxG1P1Hl0vpy0Cq9P6rzVeNVHhducqeN2ZSZojZbVaWW7dC
 V/r0eOU8zgusv6UU08goYhmBOTNL9X1E2+EeO3BOcET7CCGt7ad1tSvNoW5LKgBFJ/Sy
 CFgDlXkaNjTm6x7b8QEVI4t2zoTG++PINUd2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655440; x=1688247440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZEI6Qd7tJdeWnwaS3kN3vC1A5EXJtp5KG07jP5WNyg=;
 b=cpEq3/7cIxUzHWk7kKipqE/qDuwl1aMA74852s4XQb813UcjqhY/c+3syidE+IVrDz
 2K5feU9mEQGr3aNzUSdGEa8MiZNLLThZ0NYAGa4ny9LVXbYjDo9Hlr6fjE130Dt3zV4c
 ms1YUuzYBpjUPtiTbY1yauNjR/Z/r93z8/deW8suP8qbVbpcwtua4Zo4vKjQjb5ZJ8YE
 wE4Ccd9fvHwfVSgP7emG0FH9bxdX4/xoi0NDBBSLNk3+60YGOpbvUjt+RzgedBqtQ5kv
 J+eEFGrap1bO9uQ09e6uNMmwpqFwZIXpmYrYy/UDE9b4G5Xs4LWYMYRPAe7SOyCrr0GX
 K1lQ==
X-Gm-Message-State: AC+VfDxykW4ahO4dflDmh3WmQJlWtkST51VqUv54VGUAWywXuVSiRYxM
 uWs8OEX40wgKJcj2hfh29gDIWQ==
X-Google-Smtp-Source: ACHHUZ7TxkqQeHk3f5nB+sAADSHmxXcXgS1PF5xyCA13nK+lN+RUiZlRh2TxB02uIQ36XVKsZ9fK0A==
X-Received: by 2002:a05:6a00:841:b0:643:6aed:3a9 with SMTP id
 q1-20020a056a00084100b006436aed03a9mr9872210pfk.0.1685655440701; 
 Thu, 01 Jun 2023 14:37:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:51 -0700
Message-ID: <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
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
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Let's use the debug
 IPI for rounding up CPUs in kgdb. When the debug IPI is backed by an NMI
 (or pseudo NMI) then this will let us debug even hard locked CPUs. When the
 debug IPI isn't backed by an NM [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pz4-008k4e-8w
Subject: [Kgdb-bugreport] [PATCH v9 7/7] arm64: kgdb: Roundup cpus using the
 debug IPI
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
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Wei Li <liwei391@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
IPI is backed by an NMI (or pseudo NMI) then this will let us debug
even hard locked CPUs. When the debug IPI isn't backed by an NMI then
this won't really have any huge benefit but it will still work.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v9:
- Remove fallback for when debug IPI isn't available.
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.

 arch/arm64/kernel/ipi_debug.c |  5 +++++
 arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kernel/ipi_debug.c b/arch/arm64/kernel/ipi_debug.c
index 6984ed507e1f..5794894d94f1 100644
--- a/arch/arm64/kernel/ipi_debug.c
+++ b/arch/arm64/kernel/ipi_debug.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/smp.h>
 
@@ -40,6 +41,7 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 static irqreturn_t ipi_debug_handler(int irq, void *data)
 {
 	irqreturn_t ret = IRQ_NONE;
+	unsigned int cpu = smp_processor_id();
 
 	/*
 	 * NOTE: Just like in arch_trigger_cpumask_backtrace(), we're calling
@@ -49,6 +51,9 @@ static irqreturn_t ipi_debug_handler(int irq, void *data)
 	if (nmi_cpu_backtrace(get_irq_regs()))
 		ret = IRQ_HANDLED;
 
+	if (!kgdb_nmicallback(cpu, get_irq_regs()))
+		ret = IRQ_HANDLED;
+
 	return ret;
 }
 
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 4e1f983df3d1..9c4c47507cd4 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -20,6 +20,8 @@
 #include <asm/patching.h>
 #include <asm/traps.h>
 
+#include "ipi_debug.h"
+
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{ "x0", 8, offsetof(struct pt_regs, regs[0])},
 	{ "x1", 8, offsetof(struct pt_regs, regs[1])},
@@ -356,3 +358,15 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+void kgdb_roundup_cpus(void)
+{
+	struct cpumask mask;
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
+	if (cpumask_empty(&mask))
+		return;
+
+	arm64_debug_ipi(&mask);
+}
-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
