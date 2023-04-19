Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 647386E85EE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:30:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppHG7-0003WL-2r
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:30:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppHG5-0003WF-CG
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HWZTrwd5TxmiYLg/mD/63PXcodsl+Y0F8uDPTGYpPFY=; b=O17MoZ2jp7lyDp92MeFLyw4uYm
 CvDVnvIjx59W3PdBW+AXrx8qhOmPfkzJGCZCT87RGuk0JE5iBlwiGlymcIPUDFY5btzYna48JSgT4
 qWjgRTtAZTWzMRbcsDJn8pWA2nz7AnBQ8RZ6TFNmBEUNjfitR08RJW3LO7LvDgJStK3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HWZTrwd5TxmiYLg/mD/63PXcodsl+Y0F8uDPTGYpPFY=; b=E5gFxR+3z8tjkHxolORenm6bDf
 9vFfhtTrmlw7JNbMkvje+vNoX8+bCl6j5w6Oifs9Llo1l+IOLXv18YbBg3SXS3Vwh/VKFBeya9LRk
 MNRoRRyhd9rR+amYLhp6yxdmeMguzXL2SwQaaYMtuTXqOe9I96huRDs/dLkzos+lEOiM=;
Received: from mail-oa1-f46.google.com ([209.85.160.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppHG3-00049H-R8 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:30:40 +0000
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-187df75c906so265544fac.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681947034; x=1684539034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWZTrwd5TxmiYLg/mD/63PXcodsl+Y0F8uDPTGYpPFY=;
 b=lMGR9MM7Um+WYvnR+2gS8JuDZbCyCCCCAt/e48Ri+Mxaraw8Kz2ct0B0WIiOsO+XNa
 6RJDa7q4N21dV8fu3Hp1tcN172hc1HtjMWWuBX06a0bXVAAgRrJc8MfH+JLyNt9qat+l
 NbFkJ1V2Au+4xr2ywqoI0+ObaYAB23eJy1cYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681947034; x=1684539034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWZTrwd5TxmiYLg/mD/63PXcodsl+Y0F8uDPTGYpPFY=;
 b=ZsOAGd3xWpha5i73IwR4UKoyAPhRRsvMw7yfsOPmCBctlG1gyOZCiWUAhEvYKVhYQA
 fc6nke4We/tOYuU/KdGDwq1fo/tN0Ej1+lK6+ag2HeUUdAq/kfS89PDL2J3psWo84jnv
 kqj3AAyoC9piQRAQE25aa6w+CdXuMwqH8NVUv4fPNJse6GWVSm24cChKUzRRhEwNlg/5
 Wal5H7ZSLlDl7BrmAY2Il+L0EvBtEjs5SqhAn2XTL8FJDk7A1gNscqp3CS3DMDabUoMX
 JActcgoQY6p/k8pSThLbUOJYd0RKd0l8l490GKX4UxvXJ6pp62q802D+YNHC/p/Twsdi
 fzDw==
X-Gm-Message-State: AAQBX9eZk/3l4+SOdxHSJLyWgFPXVFT7pgBTuKcoWGLjxLH4edRwlicn
 oQLx4qFE/LmH3a0yAxNeCF+dqyrJNv855dEOggk=
X-Google-Smtp-Source: AKy350bzal91TPSNwTZw0WiWqcU5p5zvcdk0BkVsNFuBNbks1jS5AwavXMPCBAcH6HwZUkYAxgIWew==
X-Received: by 2002:a05:6a20:8b2f:b0:cc:5f27:d003 with SMTP id
 l47-20020a056a208b2f00b000cc5f27d003mr42212pzh.56.1681945041867; 
 Wed, 19 Apr 2023 15:57:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:56:03 -0700
Message-ID: <20230419155341.v8.9.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> arm64 platforms with
 GICv3 or later supports pseudo NMIs which can be leveraged to roundup CPUs
 which are stuck in hard lockup state with interrupts disabled that wouldn't
 be possible with a normal IP [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.46 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppHG3-00049H-R8
Subject: [Kgdb-bugreport] [PATCH v8 09/10] arm64: kgdb: Roundup cpus using
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

arm64 platforms with GICv3 or later supports pseudo NMIs which can be
leveraged to roundup CPUs which are stuck in hard lockup state with
interrupts disabled that wouldn't be possible with a normal IPI.

So instead switch to roundup CPUs using IPI turned as NMI. And in
case a particular arm64 platform doesn't supports pseudo NMIs,
it will switch back to default kgdb CPUs roundup mechanism.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/kernel/ipi_nmi.c |  5 +++++
 arch/arm64/kernel/kgdb.c    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index c592e92b8cbf..2adaaf1519e5 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/smp.h>
 
@@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
 	irqreturn_t ret = IRQ_NONE;
+	unsigned int cpu = smp_processor_id();
 
 	if (nmi_cpu_backtrace(get_irq_regs()))
 		ret = IRQ_HANDLED;
 
+	if (!kgdb_nmicallback(cpu, get_irq_regs()))
+		ret = IRQ_HANDLED;
+
 	return ret;
 }
 
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index cda9c1e9864f..2c85bc1df013 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -17,6 +17,7 @@
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
+#include <asm/nmi.h>
 #include <asm/patching.h>
 #include <asm/traps.h>
 
@@ -354,3 +355,20 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+void kgdb_roundup_cpus(void)
+{
+	struct cpumask mask;
+
+	if (!arm64_supports_nmi()) {
+		kgdb_smp_call_nmi_hook();
+		return;
+	}
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
+	if (cpumask_empty(&mask))
+		return;
+
+	arm64_send_nmi(&mask);
+}
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
