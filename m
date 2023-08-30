Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8878DE9C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Aug 2023 21:13:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbQdS-0007rx-PN
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 30 Aug 2023 19:13:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qbQdQ-0007rr-WF
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QGHKcN7Ka8B60Cc8NAsYNSueTLmOdg2PizihYDqFSZs=; b=PGuJM2A32MnAeJ3RyYujY5iZNc
 9No6pkXOdqXkbW/bihhC4WoZms6XL/y6ky6MlHt6mQfLFha3P95wUZ6UbifSozn0H4eoYc2qP/tIB
 OJKGNHsIxV5Om2uVRgs4HL86oyO8W25cxPt+aTmDLANSKB+tZ4qW9jgzWZhUscbsxdDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QGHKcN7Ka8B60Cc8NAsYNSueTLmOdg2PizihYDqFSZs=; b=Jjjt4CwEMCK8n1NjtPQUdRhloc
 oU9A//9eb4ah8RdkXz24LfKlYRc4fRh/y+d7jdfV9yewsgrATTPNq/05Shs8QxbQBWezfC84+Jjcn
 adRQ6SimknF/uxVa5fY/L1M1WpSDuUJAUPy9kl1jCLV6EOj/3c9lky2I/OhxE3zGZYlE=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbQdQ-003saS-Lp for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:49 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1bd9b4f8e0eso27805ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 30 Aug 2023 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693422823; x=1694027623;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGHKcN7Ka8B60Cc8NAsYNSueTLmOdg2PizihYDqFSZs=;
 b=DCNXnT4jXKDlL7LISypbKb38sKPuJPxZ6o8qF3uJD6miXVG0F95+Pzx+z1n/q8kP38
 +bfgAN5N10tTJB2+y+0lvtnu7jq6J5sfjXoX6O838gquKk2nikRtirq8+KARAKPxkQSJ
 4ebAU1omXBxOgawbMOGKROpVs8dScZj2dCLBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422823; x=1694027623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGHKcN7Ka8B60Cc8NAsYNSueTLmOdg2PizihYDqFSZs=;
 b=LQLsiTY9fwVhe18EckAWQfLsVEtxlmmYzgtID2+fqGW3raSdxLQ+8xswiKK/hoNe03
 /4Xhpl/kqbDwldKvUpyAfFeKW1uohC0FVRV0pQFIi2snlG6Bsp0Mqn1MbhwBdt2/6KW+
 7P/tGaW7jlXE2PVT9ECoUszj04Tz2NCnU4wjGwNcVtZjX84qiOXysxvb/Aj7Bob5tOP2
 Yg0CSw4ZoXYLOp2lkpgH5dWclIJRHkdeRFrxVbzphaOjGAybrWhs67vtkEmxoL9S4pvx
 J0SoVLBeO5Ev+Mf+DwCp+O43RVNgQq5Ilg0dxhAV0b9cnLt4I+iDodFyGGpncBEny6lM
 YONg==
X-Gm-Message-State: AOJu0Yzl1hI86PVPHa1YdJQYxpz/N3/mcPZ2vMU/MXCTHsmmki7FkD/m
 /5INb5EoU2p2ECgxZmPnfTxykQ==
X-Google-Smtp-Source: AGHT+IGHLoraFTbGB/BxEaiA4QfM3FoXZ9A5Wt6qDnQMmcmH/dI+mTNuF8xBJCW6mk1vkdMY6M7zoA==
X-Received: by 2002:a17:902:d48e:b0:1b9:f7f4:5687 with SMTP id
 c14-20020a170902d48e00b001b9f7f45687mr3502248plg.24.1693422823023; 
 Wed, 30 Aug 2023 12:13:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e315:dec6:467c:83c5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001bbdf32f011sm11338928plg.269.2023.08.30.12.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:13:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed, 30 Aug 2023 12:11:24 -0700
Message-ID: <20230830121115.v12.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230830191314.1618136-1-dianders@chromium.org>
References: <20230830191314.1618136-1-dianders@chromium.org>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbQdQ-003saS-Lp
Subject: [Kgdb-bugreport] [PATCH v12 3/7] arm64: smp: Remove dedicated
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Stephane Eranian <eranian@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Sami Tolvanen <samitolvanen@google.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Kees Cook <keescook@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
I have no idea how to test this. I just took Mark's patch and jammed
it into my series. Logicially the patch seems reasonable to me.

(no changes since v11)

Changes in v11:
- arch_send_wakeup_ipi() now takes an unsigned int.

Changes in v10:
- ("arm64: smp: Remove dedicated wakeup IPI") new for v10.

 arch/arm64/include/asm/smp.h              |  4 ++--
 arch/arm64/kernel/acpi_parking_protocol.c |  2 +-
 arch/arm64/kernel/smp.c                   | 28 +++++++++--------------
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 9b31e6d0da17..efb13112b408 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -89,9 +89,9 @@ extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
 
 #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
-extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
+extern void arch_send_wakeup_ipi(unsigned int cpu);
 #else
-static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
+static inline void arch_send_wakeup_ipi(unsigned int cpu)
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
index 960b98b43506..a5848f1ef817 100644
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
+void arch_send_wakeup_ipi(unsigned int cpu)
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
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
