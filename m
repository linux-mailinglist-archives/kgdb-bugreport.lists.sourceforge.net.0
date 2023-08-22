Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA10784C0D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 23:31:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYYxq-0004c9-6O
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 21:31:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYYxo-0004bx-LP
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7NTSblsAu8PNy2OgT43FimYv6UYWrsT3fb8iGcpeqoY=; b=iMTBZaOd791iVs56YtFaPRlsIS
 ncCN3xM3c7bRvMcOywV28nfrBZCi8MvRzapOxFfuUgfPUTrckD4zxEf5Xd85hZ+TNbiN0YBWNJs5i
 jFQTPJVSISvmGwUi+okMejeTri5yTILjNXlNcxMPPYfahWgZvHo2V15R5QGVICUO937A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7NTSblsAu8PNy2OgT43FimYv6UYWrsT3fb8iGcpeqoY=; b=m6U+GcxUzJ4L+a5XH/Tjdfv4tZ
 9aJf5/Ojb18BOSm+cJDfufaOLQf6frUCykvxPUwKQzUV1K1kTKEEeHq/wQy5LwP3khq0bZI+PCr4i
 WobRVGQDCYFh229w4epOSwLvWmzjbX/9RYuV6nuzdc98AXBbo2a7bzo5e7KqL0Og4O2s=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYYxj-00Cf5e-QG for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:30:59 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1bf078d5fb7so33245615ad.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692739850; x=1693344650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NTSblsAu8PNy2OgT43FimYv6UYWrsT3fb8iGcpeqoY=;
 b=SSwVk0/Y6ZNUglAJO0DD6i6/m5NNNngXeG3Y6lw2BIZyrknN1/imUbQMG5WLp0Op+m
 d9VQYQnoaA6skHN+tGDuiemWjBBac93s/XMTWlw8mW/NLtczFpdMrwj2baINYvFmYBlV
 +hNDcfecQe2m+uT4ySEkasCQpLR/uSQXdaOkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692739850; x=1693344650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NTSblsAu8PNy2OgT43FimYv6UYWrsT3fb8iGcpeqoY=;
 b=DsaHrkizK6dNRDbLLq7Y03evwTgMnZoMVMQNAkakAcByGgOuBH1qABfdMN2YBGoWrT
 uFgw7p1qUwkz2dFWereaBhCdnDHZo3I9GuAuTIeTBhIjGXcH8VHWnkNdsxrrs6Ie1lmp
 RDaKKcBRLzoW829N+KFyOhMIiUbAjNI6WDWFBR8Q4KAXnvnUtTaJiVKGf1iShT/sYpEM
 4azVeeOvc2jgvh0HIiiHBp8BM34NRp8K0Ryvb97pmlj4J6adlhb/VxuUmLxqIyGZcqc9
 zg5YXu4fEqIGWI78EIPON4RnmF2pvHeYaopaKv0+FdHbC6qXoR6IRE2tYAHOazdHVcqx
 9S8Q==
X-Gm-Message-State: AOJu0YyFOisFAf44NaUsh4sBsItIVF0P5qQsnHh/PiAd7B4d/sjMGNxP
 HiGd5BQym+FynytL5Qok5PezRA==
X-Google-Smtp-Source: AGHT+IHA2klR/hpR4pC+xNHo1EGJFPmRBiLjPNVhxt8TvBFzkQhWq2zyCjyW7Wf1mZrMjB+TX9rFuw==
X-Received: by 2002:a17:902:b403:b0:1bd:bfc0:4627 with SMTP id
 x3-20020a170902b40300b001bdbfc04627mr7708342plr.40.1692739850223; 
 Tue, 22 Aug 2023 14:30:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:83f0:2bc5:38c4:a9de])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b001befac3b3cbsm9451475plg.290.2023.08.22.14.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 14:30:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Tue, 22 Aug 2023 14:26:58 -0700
Message-ID: <20230822142644.v10.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822212927.249645-1-dianders@chromium.org>
References: <20230822212927.249645-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Mark Rutland <mark.rutland@arm.com> To enable NMI
 backtrace
 and KGDB's NMI cpu roundup, we need to free up at least one dedicated IPI.
 On arm64 the IPI_WAKEUP IPI is only used for the ACPI parking protocol, which
 itself is only used on some very early ARMv8 systems which couldn't implement
 PSCI. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYYxj-00Cf5e-QG
Subject: [Kgdb-bugreport] [PATCH v10 3/6] arm64: smp: Remove dedicated
 wakeup IPI
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Mark Rutland <mark.rutland@arm.com>

To enable NMI backtrace and KGDB's NMI cpu roundup, we need to free up
at least one dedicated IPI.

On arm64 the IPI_WAKEUP IPI is only used for the ACPI parking protocol,
which itself is only used on some very early ARMv8 systems which
couldn't implement PSCI.

Remove the IPI_WAKEUP IPI, and rely on the IPI_RESCHEDULE IPI to wake
CPUs from the parked state. This will cause a tiny amonut of redundant
work to check the thread flags, but this is miniscule in relation to the
cost of taking and handling the IPI in the first place. We can safely
handle redundant IPI_RESCHEDULE IPIs, so there should be no functional
impact as a result of this change.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Sumit Garg <sumit.garg@linaro.org>
Cc: Will Deacon <will@kernel.org>
---
I have no idea how to test this. I just took Mark's patch and jammed
it into my series. Logicially the patch seems reasonable to me.

Changes in v10:
- ("arm64: smp: Remove dedicated wakeup IPI") new for v10.

 arch/arm64/include/asm/smp.h              |  4 ++--
 arch/arm64/kernel/acpi_parking_protocol.c |  2 +-
 arch/arm64/kernel/smp.c                   | 28 +++++++++--------------
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 9b31e6d0da17..798fd76a883a 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -89,9 +89,9 @@ extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
 
 #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
-extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
+extern void arch_send_wakeup_ipi(int cpu);
 #else
-static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
+static inline void arch_send_wakeup_ipi(int cpu)
 {
 	BUILD_BUG();
 }
diff --git a/arch/arm64/kernel/acpi_parking_protocol.c b/arch/arm64/kernel/acpi_parking_protocol.c
index b1990e38aed0..e1be29e608b7 100644
--- a/arch/arm64/kernel/acpi_parking_protocol.c
+++ b/arch/arm64/kernel/acpi_parking_protocol.c
@@ -103,7 +103,7 @@ static int acpi_parking_protocol_cpu_boot(unsigned int cpu)
 		       &mailbox->entry_point);
 	writel_relaxed(cpu_entry->gic_cpu_id, &mailbox->cpu_id);
 
-	arch_send_wakeup_ipi_mask(cpumask_of(cpu));
+	arch_send_wakeup_ipi(cpu);
 
 	return 0;
 }
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 960b98b43506..bfe60adbc453 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -72,7 +72,6 @@ enum ipi_msg_type {
 	IPI_CPU_CRASH_STOP,
 	IPI_TIMER,
 	IPI_IRQ_WORK,
-	IPI_WAKEUP,
 	NR_IPI
 };
 
@@ -764,7 +763,6 @@ static const char *ipi_types[NR_IPI] __tracepoint_string = {
 	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
 	[IPI_TIMER]		= "Timer broadcast interrupts",
 	[IPI_IRQ_WORK]		= "IRQ work interrupts",
-	[IPI_WAKEUP]		= "CPU wake-up interrupts",
 };
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr);
@@ -797,13 +795,6 @@ void arch_send_call_function_single_ipi(int cpu)
 	smp_cross_call(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
-#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
-void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
-{
-	smp_cross_call(mask, IPI_WAKEUP);
-}
-#endif
-
 #ifdef CONFIG_IRQ_WORK
 void arch_irq_work_raise(void)
 {
@@ -897,14 +888,6 @@ static void do_handle_IPI(int ipinr)
 		break;
 #endif
 
-#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
-	case IPI_WAKEUP:
-		WARN_ONCE(!acpi_parking_protocol_valid(cpu),
-			  "CPU%u: Wake-up IPI outside the ACPI parking protocol\n",
-			  cpu);
-		break;
-#endif
-
 	default:
 		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
 		break;
@@ -979,6 +962,17 @@ void arch_smp_send_reschedule(int cpu)
 	smp_cross_call(cpumask_of(cpu), IPI_RESCHEDULE);
 }
 
+#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
+void arch_send_wakeup_ipi(int cpu)
+{
+	/*
+	 * We use a scheduler IPI to wake the CPU as this avoids the need for a
+	 * dedicated IPI and we can safely handle spurious scheduler IPIs.
+	 */
+	arch_smp_send_reschedule(cpu);
+}
+#endif
+
 #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
 void tick_broadcast(const struct cpumask *mask)
 {
-- 
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
