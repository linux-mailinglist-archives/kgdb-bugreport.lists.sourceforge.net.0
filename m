Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E2787443
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 24 Aug 2023 17:33:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZCKi-0005Bv-F2
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 24 Aug 2023 15:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qZCKh-0005Bp-CO
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 24 Aug 2023 15:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T9bVyGzTH2zmR0WPmuHA6a+YW0a3OEEqHcUXZPEfFW0=; b=T60pLAwEs8ssRDG1JqK+/WKzt6
 gLj7LuYIlHaKEDfTXfofe37+0IVbPUTzQVrqHvXZg8XrORqaatI4sCGLeW2kWzrbbrYLII3enkVJK
 PSL7ONX4il/IZBLNCVwYbg2itNqIsPcZD0osXyn8A4ydGcbyuDnFH3sGSjZ/1D+RBR+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T9bVyGzTH2zmR0WPmuHA6a+YW0a3OEEqHcUXZPEfFW0=; b=Jwva8iAr9N+Z5JVtypjGf+L0ZD
 /nwmlKfpRBFCb4+vfcbXo1sSPHjrcSbWYovNMVLRf8iLobgCHvlLZCRsBwOucAA+fBYObLLhdo2Qx
 0xLElnhpQnpezNwhZIZc0D1VJLUyOF1FVMhpTyWG3Hkn5qFJ2K2qtDKOjSdOUZ7K5ZvE=;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZCKf-00ENqA-KG for kgdb-bugreport@lists.sourceforge.net;
 Thu, 24 Aug 2023 15:33:15 +0000
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3a85c5854deso3111929b6e.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 24 Aug 2023 08:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692891188; x=1693495988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9bVyGzTH2zmR0WPmuHA6a+YW0a3OEEqHcUXZPEfFW0=;
 b=ntnbrUTRct0Yxi4YCkMx7kj2ghFSLE7fgcjgZVQbVU7WAl+4rynlWJzEse/LIKmhFr
 g/EQvsC4XMZojs3+UnMW7ceP0Yiw5Yg9jXZh6pX66ukm1uKuQiSohpCSn0rgtaFBbr8G
 DCjJZW8Z2aXewsz/BkmhFRRxrbzHVKqvcI0RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692891188; x=1693495988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9bVyGzTH2zmR0WPmuHA6a+YW0a3OEEqHcUXZPEfFW0=;
 b=HrJmD8PbygWdxO/Xy8vYuVutheCzIImKhEFlSz9ABI3/ZiaOSkZ2lwuzAfS7r8WGFx
 HMnyyQo/nQ97+5fbQ4GHlQ7ANcN3QFFtQFptkVMMZbbXei1WHKt90V/gwUdOTA+bwsuK
 T6ZTlmBdPBUHOilQNRPKFxBsRgf8mKlEtvIksLcFq2yWYycvou9DiFXs70R86JCAGr87
 E9066Juu8+WCgLjZKEW+O1P8vQNGutSKY5W5JHSX7LkRCboEa1d8jB4mmOUJa36LVfuV
 wd4kPcdT0E6WaJu5aiv7AUmAI8JqNoOOZAQvvtQgDJKcObJPE4lR/Qo4w+Lly1UCfYgz
 fLOw==
X-Gm-Message-State: AOJu0YwK9X6IkKGfoOAeXRcmYCwuYUj+UXHZuJLIwFf3GM2LfNb+0tYS
 VY7VXPQWvVt0UDIhoqBvNh0OtQ==
X-Google-Smtp-Source: AGHT+IEvJ4H0vINg/6XE+RVOX5JgXx5/xrn+YtCi8eZp4rHBsIvH9UestC6Ui9GwBkNR+4c1v0L4cg==
X-Received: by 2002:a05:6808:1a06:b0:3a7:5d6e:dce9 with SMTP id
 bk6-20020a0568081a0600b003a75d6edce9mr79504oib.23.1692891187929; 
 Thu, 24 Aug 2023 08:33:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:afa3:fcf5:1b7f:f7e2])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a63711e000000b0056365ee8603sm11631337pgc.67.2023.08.24.08.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:33:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu, 24 Aug 2023 08:30:30 -0700
Message-ID: <20230824083012.v11.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824153233.1006420-1-dianders@chromium.org>
References: <20230824153233.1006420-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Enable arch_trigger_cpumask_backtrace() support on arm64.
 This enables things much like they are enabled on arm32 (including some of
 the funky logic around NR_IPI, nr_ipi, and MAX_IPI) but with the di [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZCKf-00ENqA-KG
Subject: [Kgdb-bugreport] [PATCH v11 4/6] arm64: smp: Add arch support for
 backtrace using pseudo-NMI
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
Cc: Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 ito-yuichi@fujitsu.com, D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Enable arch_trigger_cpumask_backtrace() support on arm64. This enables
things much like they are enabled on arm32 (including some of the
funky logic around NR_IPI, nr_ipi, and MAX_IPI) but with the
difference that, unlike arm32, we'll try to enable the backtrace to
use pseudo-NMI.

NOTE: this patch is a squash of the little bit of code adding the
ability to mark an IPI to try to use pseudo-NMI plus the little bit of
code to hook things up for kgdb. This approach was decided upon in the
discussion of v9 [1].

This patch depends on commit 36759e343ff9 ("nmi_backtrace: allow
excluding an arbitrary CPU") since that commit changed the prototype
of arch_trigger_cpumask_backtrace(), which this patch implements.

[1] https://lore.kernel.org/r/ZORY51mF4alI41G1@FVFF77S0Q05N

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v11:
- Adjust comment about NR_IPI/MAX_IPI.
- Don't use confusing "backed by" idiom in comment.
- Made arm64_backtrace_ipi() static.

Changes in v10:
- Backtrace now directly supported in smp.c
- Squash backtrace into patch adding support for pseudo-NMI IPIs.

Changes in v9:
- Added comments that we might not be using NMI always.
- Fold in v8 patch #10 ("Fallback to a regular IPI if NMI isn't enabled")
- Moved header file out of "include" since it didn't need to be there.
- Remove arm64_supports_nmi()
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
- arch_trigger_cpumask_backtrace() no longer returns bool

Changes in v8:
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
- debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param

 arch/arm64/include/asm/irq.h |  3 ++
 arch/arm64/kernel/smp.c      | 86 +++++++++++++++++++++++++++++++-----
 2 files changed, 78 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index fac08e18bcd5..50ce8b697ff3 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -6,6 +6,9 @@
 
 #include <asm-generic/irq.h>
 
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+
 struct pt_regs;
 
 int set_handle_irq(void (*handle_irq)(struct pt_regs *));
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a5848f1ef817..c8896cbc5327 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -33,6 +33,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/kexec.h>
 #include <linux/kvm_host.h>
+#include <linux/nmi.h>
 
 #include <asm/alternative.h>
 #include <asm/atomic.h>
@@ -72,12 +73,18 @@ enum ipi_msg_type {
 	IPI_CPU_CRASH_STOP,
 	IPI_TIMER,
 	IPI_IRQ_WORK,
-	NR_IPI
+	NR_IPI,
+	/*
+	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
+	 * with trace_ipi_*
+	 */
+	IPI_CPU_BACKTRACE = NR_IPI,
+	MAX_IPI
 };
 
 static int ipi_irq_base __read_mostly;
 static int nr_ipi __read_mostly = NR_IPI;
-static struct irq_desc *ipi_desc[NR_IPI] __read_mostly;
+static struct irq_desc *ipi_desc[MAX_IPI] __read_mostly;
 
 static void ipi_setup(int cpu);
 
@@ -845,6 +852,22 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
 #endif
 }
 
+static void arm64_backtrace_ipi(cpumask_t *mask)
+{
+	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
+}
+
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
+{
+	/*
+	 * NOTE: though nmi_trigger_cpumask_backtrace has "nmi_" in the name,
+	 * nothing about it truly needs to be implemented using an NMI, it's
+	 * just that it's _allowed_ to work with NMIs. If ipi_should_be_nmi()
+	 * returned false our backtrace attempt will just use a regular IPI.
+	 */
+	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
+}
+
 /*
  * Main handler for inter-processor interrupts
  */
@@ -888,6 +911,14 @@ static void do_handle_IPI(int ipinr)
 		break;
 #endif
 
+	case IPI_CPU_BACKTRACE:
+		/*
+		 * NOTE: in some cases this _won't_ be NMI context. See the
+		 * comment in arch_trigger_cpumask_backtrace().
+		 */
+		nmi_cpu_backtrace(get_irq_regs());
+		break;
+
 	default:
 		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
 		break;
@@ -909,6 +940,19 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 	__ipi_send_mask(ipi_desc[ipinr], target);
 }
 
+static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
+{
+	if (!system_uses_irq_prio_masking())
+		return false;
+
+	switch (ipi) {
+	case IPI_CPU_BACKTRACE:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void ipi_setup(int cpu)
 {
 	int i;
@@ -916,8 +960,14 @@ static void ipi_setup(int cpu)
 	if (WARN_ON_ONCE(!ipi_irq_base))
 		return;
 
-	for (i = 0; i < nr_ipi; i++)
-		enable_percpu_irq(ipi_irq_base + i, 0);
+	for (i = 0; i < nr_ipi; i++) {
+		if (ipi_should_be_nmi(i)) {
+			prepare_percpu_nmi(ipi_irq_base + i);
+			enable_percpu_nmi(ipi_irq_base + i, 0);
+		} else {
+			enable_percpu_irq(ipi_irq_base + i, 0);
+		}
+	}
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -928,8 +978,14 @@ static void ipi_teardown(int cpu)
 	if (WARN_ON_ONCE(!ipi_irq_base))
 		return;
 
-	for (i = 0; i < nr_ipi; i++)
-		disable_percpu_irq(ipi_irq_base + i);
+	for (i = 0; i < nr_ipi; i++) {
+		if (ipi_should_be_nmi(i)) {
+			disable_percpu_nmi(ipi_irq_base + i);
+			teardown_percpu_nmi(ipi_irq_base + i);
+		} else {
+			disable_percpu_irq(ipi_irq_base + i);
+		}
+	}
 }
 #endif
 
@@ -937,15 +993,23 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 {
 	int i;
 
-	WARN_ON(n < NR_IPI);
-	nr_ipi = min(n, NR_IPI);
+	WARN_ON(n < MAX_IPI);
+	nr_ipi = min(n, MAX_IPI);
 
 	for (i = 0; i < nr_ipi; i++) {
 		int err;
 
-		err = request_percpu_irq(ipi_base + i, ipi_handler,
-					 "IPI", &cpu_number);
-		WARN_ON(err);
+		if (ipi_should_be_nmi(i)) {
+			err = request_percpu_nmi(ipi_base + i, ipi_handler,
+						 "IPI", &cpu_number);
+			WARN(err, "Could not request IPI %d as NMI, err=%d\n",
+			     i, err);
+		} else {
+			err = request_percpu_irq(ipi_base + i, ipi_handler,
+						 "IPI", &cpu_number);
+			WARN(err, "Could not request IPI %d as IRQ, err=%d\n",
+			     i, err);
+		}
 
 		ipi_desc[i] = irq_to_desc(ipi_base + i);
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
-- 
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
