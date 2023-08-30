Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153CC78DE9D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Aug 2023 21:13:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbQdX-0001nQ-Qv
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 30 Aug 2023 19:13:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qbQdU-0001nK-V3
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slAW2Im/sTTYajsirP7USWN9swEAOtCmSWTeStPwo7o=; b=FCfVpW85gt0mfmEBroWg0Foz6i
 AkGQpJHohZsNn+R+iXhDegeDkYeSzRLtqgts6Wij+C6sIyIopb6SGs/ewlhjpJOI1BoC4wkJbljtG
 w/awJZNk/sxQVV6dxquN9ON/HRQe2PtT7/YGhivYIf9Jr5MfqaVRSnuy5jSkc/v8PfeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=slAW2Im/sTTYajsirP7USWN9swEAOtCmSWTeStPwo7o=; b=S8ghH3tC4hf0pAR7ERGJbqmKr1
 qMl3R8vT3hR4ZlEAur64zw3+P7ijv5cQmfqqsPUQvPK4XQbV+6hUfYCdETWfeaXQMR1R1lrpOfHJ6
 e9pc2LzGcpJMORp+mz8otpsLaL+4YqmfMZF1KURM3qUOMZZJFcIu6dSqLGT7kT6DMF9I=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbQdS-003saX-QD for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:53 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1c09673b006so31355ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 30 Aug 2023 12:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693422825; x=1694027625;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slAW2Im/sTTYajsirP7USWN9swEAOtCmSWTeStPwo7o=;
 b=R6QktM6k8QJ0YHVbYYdSmzxZ75iVqfvQt1lclJc44FFr7qyUWa//fe8lp7VBF2qFfI
 N7fQsQfMkMddxWnz4+62bwZyZxPcmxF9HVlxSlTIjf6dRY0IGxDRn9qUY6ULR4bIjy9m
 0yvwfeOR7672BuDOLMLTaFa9IWS5bNbusjicE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422825; x=1694027625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slAW2Im/sTTYajsirP7USWN9swEAOtCmSWTeStPwo7o=;
 b=fTXjHqdCvOXsgF0OIlFtXX2T2I/i8bWaMo8YKJe1qLL0Fxhrrm0+Ri9FmLX+Z0vxxg
 XqjVY9rUxE0OSx7ORau+VL+hioBbtrWI/WupZ1tQJHLtU9G2XsFlzS7b35gmRQ6M9D8A
 tDnWMNjSbSd5C/D2kL/aNqUY3KdaGglJYmJLYuX3ftZjJifk3RDC0ofuZrNiEH7ONjEx
 YTZMhUDXAE6TcY18Dbq5AmdYgDH302dGkPDM8v2npr+RBLnRaTQadZtkRMZtRFbojGyx
 xfxhfVQvR4r+CsnNP8EW/ZQbYSjo2BZFJBLRa8aS4d4d1E1f4HHHEJd3KnbupV26rO0P
 iQQA==
X-Gm-Message-State: AOJu0YwSoiy9RQ9lkwSBsYvCu4SyFtabTQhFqlfgu3Q3QWcdowU2y+Rc
 R/nP1HrTayVXGGSVVDgDNZV4hw==
X-Google-Smtp-Source: AGHT+IGs5wmPH6VUj5vxSMDVt8IZit/qtArisBlDNtIox6ThtJQg2l+nj/lBya2WEJt+SNieKhhn9g==
X-Received: by 2002:a17:902:6b42:b0:1c0:a5c9:e05a with SMTP id
 g2-20020a1709026b4200b001c0a5c9e05amr2579799plt.43.1693422825157; 
 Wed, 30 Aug 2023 12:13:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e315:dec6:467c:83c5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001bbdf32f011sm11338928plg.269.2023.08.30.12.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:13:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed, 30 Aug 2023 12:11:25 -0700
Message-ID: <20230830121115.v12.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230830191314.1618136-1-dianders@chromium.org>
References: <20230830191314.1618136-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbQdS-003saX-QD
Subject: [Kgdb-bugreport] [PATCH v12 4/7] arm64: smp: Add arch support for
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
Cc: Valentin Schneider <vschneid@redhat.com>, ito-yuichi@fujitsu.com,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Tomohiro Misono <misono.tomohiro@fujitsu.com>,
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

This patch depends on commit 8d539b84f1e3 ("nmi_backtrace: allow
excluding an arbitrary CPU") since that commit changed the prototype
of arch_trigger_cpumask_backtrace(), which this patch implements.

[1] https://lore.kernel.org/r/ZORY51mF4alI41G1@FVFF77S0Q05N

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Misono Tomohiro <misono.tomohiro@fujitsu.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v12:
- Minor comment change to add "()" after nmi_trigger_cpumask_backtrace.
- Updated the commit hash of the commit this depends on.

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
index a5848f1ef817..28c904ca499a 100644
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
+	 * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_" in the name,
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
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
