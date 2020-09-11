Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2326605A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Sep 2020 15:36:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kGjEP-0005oP-Q9
	for lists+kgdb-bugreport@lfdr.de; Fri, 11 Sep 2020 13:36:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kGjEP-0005oJ-Dv
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V7c2tVI1sHEIHH1AjuWkw+8Vv4jkByqBwniC8b3+X7E=; b=ad5wI9GhQZQJMumrSY79G9Uh4t
 pRkufQ9M5IroogaleR3cG2/5JLEiyJ2YHHmYitpBq6Ww0J8BPaEjKRW8KyJ6lIIPiPS2yyUJ+IWaL
 bmWDrldarJl7KALxUSZ8+MatzLfWSUYr2K3Zr1PNKG8qBo5WijL0T8SJgVMfUtMB57VY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V7c2tVI1sHEIHH1AjuWkw+8Vv4jkByqBwniC8b3+X7E=; b=lfwDZf7ZLvTO1epHwpbYq76+HT
 LilesQoF+C2+gqmCk00uPx4SeL1CLcQIBp2ZRrwyaX4h+VK2TNEVKBpk8bXBsCmTfRWgEA8FS80gd
 SK0gAU3ZiKGIe5Cp3wELP+mbhIJBtWAgd5JRXWvrROWbGK+Ch3RtIz9cwELtlsL1yxBY=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGjEJ-004CR9-0N
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:36:49 +0000
Received: by mail-oi1-f193.google.com with SMTP id i17so9438049oig.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 11 Sep 2020 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V7c2tVI1sHEIHH1AjuWkw+8Vv4jkByqBwniC8b3+X7E=;
 b=IPiXzooyc34XdY1D6OA308FNNt0ps3oUF0Df+DJViiEfKqHZVjejg3Ul3W/k9it8IG
 ZPjc34I3fmGpsJqjMubs6bOIJ+18H5ABsl65dH1Cv1/RcCHX+APupzonwUq2HbhPyVwO
 LwDTFeNGwv5p2zxycWhDc6202u3+/eR4/G4tPRfGltc0bK1kSgfRjV+U/X4Rufw4l735
 9+Zzcc+BnyhsOg5mpksee8x7Rv+KQRi32iKb//u+GY7kk+pB+uLyaLoH0ma8BfKjzPWY
 IxF6DhPh+EglOOw1BTq5Z1DhbyaunfohQkQDTMioOOHUnXpjq2ifNLioiorbOzQwo7Rn
 IbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V7c2tVI1sHEIHH1AjuWkw+8Vv4jkByqBwniC8b3+X7E=;
 b=BHcsFv3dzeC7njTNNl0MPtNIRZRzNSuvE6Z1W3Kw8eErpRaxcS9/uyj0s4WHT9nqOt
 uMZr7hj8j2vfVuHS1NbEqfSfeR67+Vi97HdQLvf+QiFDwvFASqbvbYFPhMew0vPOtexM
 Pb7YBYgAbrZBiGFSx1BzuWeKlbG1hSb5FaYLWPRhl+TJ0jTzyTlxV1wvKTgPNRS/stLH
 j0L51xoErv9u4CAQANX2/VkN0m6rrgHqjs7S/5bYVrjhAsO+7Z39t4c8/LYKIAvXUxWC
 D+ZANqEtlPDtIkope+p4xr81+B/C64fdj6MNAUsBqx3fOdgZY5CdT7DOEZxwaDXNKb7h
 mj0A==
X-Gm-Message-State: AOAM532nS6++piNeLGvcWGTIYw+Zd5ATbtdd29g1bOc8u1EnbDMrXv/I
 P83xMvFkfgI9nAY7Z/oJkGOI/653NlkZHw==
X-Google-Smtp-Source: ABdhPJy5G1MDK6kqBvQVO9OUwpmI/w6cEPnvwQ+s+rirVNKyqdVtvb8FhGeb80XLNvA9lxYHwbi3wg==
X-Received: by 2002:a17:90b:100f:: with SMTP id
 gm15mr2186766pjb.235.1599830955357; 
 Fri, 11 Sep 2020 06:29:15 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.48])
 by smtp.gmail.com with ESMTPSA id e10sm557988pgb.45.2020.09.11.06.29.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:29:14 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Fri, 11 Sep 2020 18:58:40 +0530
Message-Id: <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kGjEJ-004CR9-0N
Subject: [Kgdb-bugreport] [PATCH v4 1/5] arm64: Add framework to turn IPI as
 NMI
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
particular platform doesn't support pseudo NMIs, then request IPI as a
regular IRQ.

The main motivation for this feature is to have an IPI that can be
leveraged to invoke NMI functions on other CPUs. And current prospective
users are NMI backtrace and KGDB CPUs round-up whose support is added
via future patches.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/nmi.h | 16 +++++++++
 arch/arm64/kernel/Makefile   |  2 +-
 arch/arm64/kernel/ipi_nmi.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
new file mode 100644
index 0000000..3433c55
--- /dev/null
+++ b/arch/arm64/include/asm/nmi.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_NMI_H
+#define __ASM_NMI_H
+
+#ifndef __ASSEMBLER__
+
+#include <linux/cpumask.h>
+
+extern void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask);
+
+void set_smp_ipi_nmi(int ipi);
+void ipi_nmi_setup(int cpu);
+void ipi_nmi_teardown(int cpu);
+
+#endif /* !__ASSEMBLER__ */
+#endif
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index a561cbb..022c26b 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -19,7 +19,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   return_address.o cpuinfo.o cpu_errata.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
-			   syscall.o
+			   syscall.o ipi_nmi.o
 
 targets			+= efi-entry.o
 
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
new file mode 100644
index 0000000..355ef92
--- /dev/null
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -0,0 +1,80 @@
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
+static struct irq_desc *ipi_desc __read_mostly;
+static int ipi_id __read_mostly;
+static bool is_nmi __read_mostly;
+
+void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask)
+{
+	if (WARN_ON_ONCE(!ipi_desc))
+		return;
+
+	__ipi_send_mask(ipi_desc, mask);
+}
+
+static irqreturn_t ipi_nmi_handler(int irq, void *data)
+{
+	/* nop, NMI handlers for special features can be added here. */
+
+	return IRQ_HANDLED;
+}
+
+void ipi_nmi_setup(int cpu)
+{
+	if (!ipi_desc)
+		return;
+
+	if (is_nmi) {
+		if (!prepare_percpu_nmi(ipi_id))
+			enable_percpu_nmi(ipi_id, 0);
+	} else {
+		enable_percpu_irq(ipi_id, 0);
+	}
+}
+
+void ipi_nmi_teardown(int cpu)
+{
+	if (!ipi_desc)
+		return;
+
+	if (is_nmi) {
+		disable_percpu_nmi(ipi_id);
+		teardown_percpu_nmi(ipi_id);
+	} else {
+		disable_percpu_irq(ipi_id);
+	}
+}
+
+void __init set_smp_ipi_nmi(int ipi)
+{
+	int err;
+
+	err = request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number);
+	if (err) {
+		err = request_percpu_irq(ipi, ipi_nmi_handler, "IPI",
+					 &cpu_number);
+		WARN_ON(err);
+		is_nmi = false;
+	} else {
+		is_nmi = true;
+	}
+
+	ipi_desc = irq_to_desc(ipi);
+	irq_set_status_flags(ipi, IRQ_HIDDEN);
+	ipi_id = ipi;
+
+	/* Setup the boot CPU immediately */
+	ipi_nmi_setup(smp_processor_id());
+}
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
