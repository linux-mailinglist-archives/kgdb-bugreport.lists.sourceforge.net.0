Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C928DFAB
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Oct 2020 13:13:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSeiW-0006f7-Er
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Oct 2020 11:13:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kSeiV-0006f0-K9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpD0KoAJugnynysnqxP48a140Onq0eehtWGl3LDXcA8=; b=ezyFapOm06VfhFL7ihs97n1zDW
 DyOr2De01piLBMjXu9sySVcm90f+iDAW7pmKS4gFvHY+ZFlO3xy1gaJe4uAAj7cDmNoAor+DUacs6
 RDJn3xdwsi3eBkJaOQ3ZwQiWjjOeYIhsgEzPoew+tuWHf2yHs77gNhHVge8Yl5Rypb1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EpD0KoAJugnynysnqxP48a140Onq0eehtWGl3LDXcA8=; b=j53nilh37CZbIgt0IVUk5NYjkA
 0KwoE58PYWFdkNxkfjHezQkKLlRaY2lQMoeXceyKKP9IsCVBdV9Y6wWKavcqpi3bXttPe5m9DcWrA
 2NxvZgsZ0N2brfXHiw/SZOOj7KOPOLuwH0aOQOSTukxdX+3vwU+LfkRaQIirMTDXckjo=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSeiF-00A8B3-NG
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:13:11 +0000
Received: by mail-pg1-f196.google.com with SMTP id l18so1761422pgg.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 04:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EpD0KoAJugnynysnqxP48a140Onq0eehtWGl3LDXcA8=;
 b=rhlKPpmoFDFeIoxy0kn5lhdCooSlojGLKWwvSf9X7yfOTfzXwIaetVpSYSSpeWKKug
 cOUW5T33OovRClyFr3AAzlcjdKJrYrktXQ6wsXSXNKC5cRn8x2J1sRCa/HZqTddfmYSU
 DMYU5csdUSbfAbkBmbcHhXGe1z/ASSyaK5XFJ145Xm7dxc5dIIDF0JhU3nGnmCCmT5Uk
 Rafmd4bzUSEx9TbZVmnjiqM4BBxQCOgVY+7T123Pjpqz3iIik7sOLFBnQSWnN545O2Xp
 +/MJjG9v4ynUN+/2mEQ+zR9sLNGIoFf6+2B0y/ER8Yt6HPTyL9b1B1YdrQhu1X6mX//5
 nArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EpD0KoAJugnynysnqxP48a140Onq0eehtWGl3LDXcA8=;
 b=fgNXCH829M5Cc7720abdBV3D9WcsgxW+AiTHzAGT0dBBIPuq4zXOzlaX6DHz5vIHxv
 HB2KjOD6LmVuBiDx3QCcEfytWNe2MwgyZTsPgBalWI05t6c6JrQRWJL5z6YLSgOQJFvu
 fAjqKeonRaQrOfhRmDVuo1WlSkpCSd/WX6vGYYn/IHI+LknRt/3x9B4MguLvDXQ13Fye
 rNAqCkF/RT/6nvrCULMddSkSHHRbrq691TceuqIKHIv9fu8H/fy/0sueHJYaVrcoMgA3
 n6e4K/smkkHlo/453bn3TpueMEguY8cynv4rvmdQ+lW8TBiL8QhFzE8sW4IA3vd81hhB
 8X6w==
X-Gm-Message-State: AOAM5319wOXHrW0uRmkACa/aPnNFIWcIOqxzuZu0YeCwFrV+LLQhEeJO
 tEd47qRYie1865gIDtNjfEwzwg==
X-Google-Smtp-Source: ABdhPJzaYk4hfLpQXPJqrqB7Ua6rrW4FRzGCxUK0kKHZCvvp95FQqLfGnm7s02jcWl6Qmk/w7UdE/A==
X-Received: by 2002:a05:6a00:887:b029:142:2501:396f with SMTP id
 q7-20020a056a000887b02901422501396fmr3766377pfj.52.1602673969100; 
 Wed, 14 Oct 2020 04:12:49 -0700 (PDT)
Received: from localhost.localdomain ([117.252.65.235])
 by smtp.gmail.com with ESMTPSA id f21sm3060102pfk.169.2020.10.14.04.12.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:12:48 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Wed, 14 Oct 2020 16:42:07 +0530
Message-Id: <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kSeiF-00A8B3-NG
Subject: [Kgdb-bugreport] [PATCH v5 1/5] arm64: Add framework to turn IPI as
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
 kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, tglx@linutronix.de, msys.mizuma@gmail.com,
 julien.thierry.kdev@gmail.com
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
 arch/arm64/kernel/ipi_nmi.c  | 77 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)
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
index bbaf0bc..525a1e0 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -17,7 +17,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
 			   return_address.o cpuinfo.o cpu_errata.o		\
 			   cpufeature.o alternative.o cacheinfo.o		\
 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
-			   syscall.o proton-pack.o
+			   syscall.o proton-pack.o ipi_nmi.o
 
 targets			+= efi-entry.o
 
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
new file mode 100644
index 0000000..a959256
--- /dev/null
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -0,0 +1,77 @@
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
+			enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
+	} else {
+		enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
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
+}
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
