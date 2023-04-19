Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08A6E85EB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:27:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppHCn-00049d-Mh
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:27:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppHCm-00049X-HI
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=25B8XpzGl30nnQXc7pjFTkaHGbx7UR1/WEEDjJTDF98=; b=KnluWAaqFBfscS/439b+3gbpDc
 lAbL8xcJ5SIj92RrfEjbq9yWWQc/zc3F7BkUf53aIzirOAKhAQ28Wid+PhyGqglXAjONPBdV3q2lF
 osAvRtI8bsvSF6TsyYzxX+Rq3rZhlD8zux5QC+XhHXrPZNkm6mkgoqKqG0D++IAue9KA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=25B8XpzGl30nnQXc7pjFTkaHGbx7UR1/WEEDjJTDF98=; b=mGWJBqRiRx5djif5UbtwQh9C2J
 Vsl7ln0UWfQXLAj7m7BMsGDM/sYv6YLFTW+Pp+B4e/OC3HGE3qvHW/8F2aLmfZD+OJJEt0D4Tti96
 TdeNl6CLUIULhfSTJ1PMtjcsa1n9iIHmjbzTCFpi6XMD1k25aK5qXDV37rog39vHPJr0=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppHCl-00D6xj-SA for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:27:16 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1a67bcde3a7so5565975ad.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681946830; x=1684538830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25B8XpzGl30nnQXc7pjFTkaHGbx7UR1/WEEDjJTDF98=;
 b=KPjju+gLwGF2izQOEgwyVnqf8A6RXe8rlqw2Amgix01w+WoP1AEHmshDMaBH19+iLW
 qH7ERECPkFFvYvJlrG/yyp6Karl3H9Awlu7vfKBhpZ1XnGNUgCeoWja2rEoXRkrvw5m6
 zPnTZ708NpEEOS1bgeQZ5UPPlIAcT1mRIS1A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946830; x=1684538830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25B8XpzGl30nnQXc7pjFTkaHGbx7UR1/WEEDjJTDF98=;
 b=c3MRv+K8Kvwo33DLQ87YcnWm7GD9WT5msqMo2iu1XSV7zU1STj3cYwXDRYoShqjMIx
 zK/vO3iz6cLJdjDSFmWRxUy3OL2/Jd6hzRwSorpzCT2/2+iW7dkzJ3yfiRjywJGvAAmD
 8XCtcgTIPUDx71yeUQAfZW9FvA+D08r0a/+gttRtjufX4Ixr0iy7kRa9ffMqfp/zQn1k
 O10Y2Y0G66x5QUsRic7agZ7KTbo0ppPwBqURNk3HXzyM+1S3XOhZPxRcQWkXSDiuZmKC
 wG6UNrN0vYEPjSK20GSsmB8gp4N9hqjKG1fAJjN6pmkDBwvBJu/BzcCn7V7mnAdZPZMY
 fZzA==
X-Gm-Message-State: AAQBX9cg39dUk+0TZA2GB7vItQGyuot80FAKl5OwrAe0nMrOWbwTnA12
 EhvZHoY0EhlxIqUHRrLanZHb3GD/OtaE6mg9iKk=
X-Google-Smtp-Source: AKy350ZZrZJ5+OO/w2IYX4HjwSzmdypxalKREpzh3tzWqSewaK2EchHc8k1ghGwj4XrJCa9x6dAFug==
X-Received: by 2002:a17:90a:fe88:b0:23f:9d83:ad76 with SMTP id
 co8-20020a17090afe8800b0023f9d83ad76mr4060143pjb.23.1681945021144; 
 Wed, 19 Apr 2023 15:57:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:55:55 -0700
Message-ID: <20230419155341.v8.1.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
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
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Introduce framework
 to turn an IPI as NMI using pseudo NMIs. The main motivation for this feature
 is to have an IPI that can be leveraged to invoke NMI functions on other
 CPUs. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppHCl-00D6xj-SA
Subject: [Kgdb-bugreport] [PATCH v8 01/10] arm64: Add framework to turn IPI
 as NMI
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
 Masahiro Yamada <masahiroy@kernel.org>, ito-yuichi@fujitsu.com,
 Joey Gouly <joey.gouly@arm.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Introduce framework to turn an IPI as NMI using pseudo NMIs. The main
motivation for this feature is to have an IPI that can be leveraged to
invoke NMI functions on other CPUs.

And current prospective users are NMI backtrace and KGDB CPUs round-up
whose support is added via future patches.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Tested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param

 arch/arm64/include/asm/nmi.h | 17 ++++++++++
 arch/arm64/kernel/Makefile   |  2 +-
 arch/arm64/kernel/ipi_nmi.c  | 65 ++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
new file mode 100644
index 000000000000..2cc4b4d4090e
--- /dev/null
+++ b/arch/arm64/include/asm/nmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_NMI_H
+#define __ASM_NMI_H
+
+#ifndef __ASSEMBLER__
+
+#include <linux/cpumask.h>
+
+extern bool arm64_supports_nmi(void);
+extern void arm64_send_nmi(cpumask_t *mask);
+
+void set_smp_dynamic_ipi(int ipi);
+void dynamic_ipi_setup(void);
+void dynamic_ipi_teardown(void);
+
+#endif /* !__ASSEMBLER__ */
+#endif
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index ceba6792f5b3..d57c8f99ca69 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
 			   syscall.o proton-pack.o idreg-override.o idle.o	\
-			   patching.o
+			   patching.o ipi_nmi.o
 
 obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
 					   sys_compat.o
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
new file mode 100644
index 000000000000..712411eed949
--- /dev/null
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * NMI support for IPIs
+ *
+ * Copyright (C) 2020 Linaro Limited
+ * Author: Sumit Garg <sumit.garg@linaro.org>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/smp.h>
+
+#include <asm/nmi.h>
+
+static struct irq_desc *ipi_nmi_desc __read_mostly;
+static int ipi_nmi_id __read_mostly;
+
+bool arm64_supports_nmi(void)
+{
+	if (ipi_nmi_desc)
+		return true;
+
+	return false;
+}
+
+void arm64_send_nmi(cpumask_t *mask)
+{
+	if (WARN_ON_ONCE(!ipi_nmi_desc))
+		return;
+
+	__ipi_send_mask(ipi_nmi_desc, mask);
+}
+
+static irqreturn_t ipi_nmi_handler(int irq, void *data)
+{
+	/* nop, NMI handlers for special features can be added here. */
+
+	return IRQ_NONE;
+}
+
+void dynamic_ipi_setup(void)
+{
+	if (!ipi_nmi_desc)
+		return;
+
+	if (!prepare_percpu_nmi(ipi_nmi_id))
+		enable_percpu_nmi(ipi_nmi_id, IRQ_TYPE_NONE);
+}
+
+void dynamic_ipi_teardown(void)
+{
+	if (!ipi_nmi_desc)
+		return;
+
+	disable_percpu_nmi(ipi_nmi_id);
+	teardown_percpu_nmi(ipi_nmi_id);
+}
+
+void __init set_smp_dynamic_ipi(int ipi)
+{
+	if (!request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number)) {
+		ipi_nmi_desc = irq_to_desc(ipi);
+		ipi_nmi_id = ipi;
+	}
+}
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
