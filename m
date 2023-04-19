Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 486396E85D4
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:22:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppH8T-0007S6-0Y
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:22:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppH8R-0007Rz-Mz
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dpO6xBr8GRTIiZAwOhR7DhqHQGx50IOyRoOo/b42ur0=; b=OJ/ggc297NGIvyTZ72hjuhDQsx
 wGS3mLILSRO8TQbcJHTDYmsQybCsbwdmr17j1kbAIm86wj0/xKCJBnQaItuEuZc6orq1/a1rognnf
 NrI4x3UuliX8W7BOpGuFIjh4fckmiPAkDJ/HQSVYlTb+efHBwW6i954Rc0afPSOyeqyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dpO6xBr8GRTIiZAwOhR7DhqHQGx50IOyRoOo/b42ur0=; b=ihSldQntr15z+KrALbyB1/h7QB
 erHsZ90hW7h7RrCU795s3zuKfpW51DGm30msyTuggC9m9w68cFVgikDfxnHbhT/ACs3h1IY99qiAR
 IVi8AhV/XpfPsD+ZN3rLebhDvDWc8pXz6oFxacs/kkYzlzJnO5VamiWjtHSM5eWCkdmk=;
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppH8O-00D6o0-MX for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:22:46 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-187ec6a5504so257449fac.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681946556; x=1684538556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpO6xBr8GRTIiZAwOhR7DhqHQGx50IOyRoOo/b42ur0=;
 b=kydz5jP0bHGMVKJ1NxNFV9oVJZKVJvddcw42N0CNU79Tzx2gmp5qk4wDYG1OvlpM57
 xkJ27h9yWXMgaRUQ6w3IGeur4c/5co8/VXNCdXRROFUxOSJsglN1GOcJYTpdVQv4rUHj
 i4s2AiXlRfRqXr96Pfvzg8IRpa/fZZ4FJkSx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946556; x=1684538556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpO6xBr8GRTIiZAwOhR7DhqHQGx50IOyRoOo/b42ur0=;
 b=CwWIfgO0cakOjpimIuwaIRwtTI6pzgn6X82p4TSNDv5kNrORUlaVgpgaA4l5iaFtsG
 MUh7QLI+uRNnTeX0Z99l66fVvFTyBrqTxsakYyIgQzqhWVN04zIgS8fCnj4hu8at/JMs
 QdGZjqDPGvdwWfkNXXJTcCNSoQZYn9v08HXTSXob0dV1ogRV6Q3ufmyvthBM1dhoiDD7
 fwNTzAclRU4SoB2b5bWS8Ohk6P6gS7mhOEYOxWkfckVxaZDt3inPcI04q9bP0SdHzInV
 SciuCRINcyIG+sLvOQI69R0kxDZucFMKY3TuVZhU1A84/2TshrK/QuL5jUj1Dtby7y8S
 M39w==
X-Gm-Message-State: AAQBX9csFdTtXNafg2obGrbBxWmYEC7hb0pCEtu/6c7Ag4kijqK5sTDw
 ON7fagogNlrAMNiZKpnQq1D0r5poWcsWa05llNE=
X-Google-Smtp-Source: AKy350aK5ae5EGORUG+NerzBv8kCtz8aZ4AMVRXzvnaMvPW39Dl9faoU7w/z73Q50CZOVchx5jXuaw==
X-Received: by 2002:a17:90a:c297:b0:240:3dc7:4939 with SMTP id
 f23-20020a17090ac29700b002403dc74939mr4439076pjt.27.1681945032562; 
 Wed, 19 Apr 2023 15:57:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:55:59 -0700
Message-ID: <20230419155341.v8.5.I65981105e1f62550b0316625dd1e599deaf9e1aa@changeid>
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
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Enable NMI backtrace
 support on arm64 using IPI turned as an NMI leveraging pseudo NMIs support.
 It is now possible for users to get a backtrace of a CPU stuck in hard-lockup
 using magic SYSRQ. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.43 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppH8O-00D6o0-MX
Subject: [Kgdb-bugreport] [PATCH v8 05/10] arm64: ipi_nmi: Add support for
 NMI backtrace
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
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Enable NMI backtrace support on arm64 using IPI turned as an NMI
leveraging pseudo NMIs support. It is now possible for users to get a
backtrace of a CPU stuck in hard-lockup using magic SYSRQ.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Tested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP

 arch/arm64/include/asm/irq.h |  4 ++++
 arch/arm64/kernel/ipi_nmi.c  | 18 ++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index fac08e18bcd5..dc35b9d23a81 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -6,6 +6,10 @@
 
 #include <asm-generic/irq.h>
 
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+					   bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+
 struct pt_regs;
 
 int set_handle_irq(void (*handle_irq)(struct pt_regs *));
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index 712411eed949..c592e92b8cbf 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/nmi.h>
 #include <linux/smp.h>
 
 #include <asm/nmi.h>
@@ -31,11 +32,24 @@ void arm64_send_nmi(cpumask_t *mask)
 	__ipi_send_mask(ipi_nmi_desc, mask);
 }
 
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+{
+	if (!ipi_nmi_desc)
+		return false;
+
+	nmi_trigger_cpumask_backtrace(mask, exclude_self, arm64_send_nmi);
+
+	return true;
+}
+
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
-	/* nop, NMI handlers for special features can be added here. */
+	irqreturn_t ret = IRQ_NONE;
+
+	if (nmi_cpu_backtrace(get_irq_regs()))
+		ret = IRQ_HANDLED;
 
-	return IRQ_NONE;
+	return ret;
 }
 
 void dynamic_ipi_setup(void)
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
