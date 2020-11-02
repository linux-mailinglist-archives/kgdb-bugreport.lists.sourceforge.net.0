Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB052A29BD
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:46:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYHw-0003qh-AD
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:46:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYHv-0003qQ-2k
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TBLIKfpsklTZAlEASF12NJyKPiqj9Rqie6gj0u/aah0=; b=ZRkuYC33kBT7Z9+w62Z0/JIp1X
 edg3DE/kIMa2IoUkdS3/R/0iqaR7TtEGSMc/NMtmgkbPUaKQmFjgNqqtNEwyDm3ImA/78Xarqj5PH
 E8DXDRgEZ7nckIo4aq//z5fB9aZGUbU6mivpP2ezLES5YwfSvFsmsKxVIrKl1w5LH5tI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TBLIKfpsklTZAlEASF12NJyKPiqj9Rqie6gj0u/aah0=; b=TQDbvJqKADHSojcYxZAAhBX/E7
 EfujdNdXdiqnurniAVXeayd2IhcjAUqP+Th+bBApjc7Lf8JPyGOzI8jGBajZpgmo1vNIm9W03fW/E
 j2/sEH9zSqN29DLx5/+7Du16mVPUfOL8GBOa7ofPpMLnOrheD1w2j6iaRiVqU1Fxkbcg=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYHi-006Jtw-H5
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:15 +0000
Received: by mail-pg1-f193.google.com with SMTP id i7so8634608pgh.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TBLIKfpsklTZAlEASF12NJyKPiqj9Rqie6gj0u/aah0=;
 b=E0zlvuCR88oHQsE4WYprnL6Cyxa8vZWkrCSnRxyAkYmj/8JBrBP6Y8xASUQayvZAR5
 Yg8kWJ1lQk2tLGfyJCZ9Hu1sPRIkpt5zxfYG6KqV6+2vTYwD5ERfO42Yixd29XgwT5ST
 AiP8f8DUKEFz+d2LlXJbTiH+nSAw3u987NNCPUZhpcLOmUMmr4BqWikHwrgdAfBTQg0I
 ZlnjA8CvgHaizhr2X9PyB0in3prA9L/haL55wNR5TTTLOf4HwW1YU3B8QNIUrj4Ybhk6
 8P3eMbb0DrTdQimvjHb09bmR2EVMPE0D9R6oChUQ9i1Jxts44Yli9lrPgxIlALJCE1KU
 4aiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TBLIKfpsklTZAlEASF12NJyKPiqj9Rqie6gj0u/aah0=;
 b=hoePOQ281MYGL5zFNQI49WnLhMI5SOYE+lDqDLX+V2aUK70hc+73fHoI1S7srezOzw
 Um3Dn+ZYSEgpDBBNm38rk1avr0vEWsy/QOaF6X5i6c9waVwwVYT9121xWoLtB3e1twnN
 5arEsH1cCT5ViISCUD/htlPvHxgBgh0cZ+RKkayNUjvYUj74AO2Hp8T8JCNXcn5/99Rk
 rW/fhvFmGv8MrZ38RAxnhN+rKmAPNPjb9PJxgn6tydyyGspzpPYDXc21wK/Kryl7QnuK
 GQz7mD20vO3Xm4kZpWbV5e79Hifrw5n1I7w21cGQc9UPhQIQI0UehEqeCPJM97H+NibJ
 2Ovw==
X-Gm-Message-State: AOAM531eNEjlJuEMisOore2Vo57RDz44zFUlwfe0NPa03z47ZiSCdVgH
 W/XzE9+RkJuaK0A124xsbzjnAw==
X-Google-Smtp-Source: ABdhPJzeSbWyx0zTDhLxg+mHYiTpnkodIkCYGRCeMEkqtHqivG6UrK+sVI8IK1jDmCGe66Wo9QvQaw==
X-Received: by 2002:a17:90a:5d8e:: with SMTP id
 t14mr15827085pji.199.1604317549868; 
 Mon, 02 Nov 2020 03:45:49 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.45.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:45:49 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:41 +0530
Message-Id: <1604317487-14543-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZYHi-006Jtw-H5
Subject: [Kgdb-bugreport] [PATCH v7 1/7] arm64: Add framework to turn IPI as
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
Cc: mark.rutland@arm.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 mpe@ellerman.id.au, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 bp@alien8.de, julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Introduce framework to turn an IPI as NMI using pseudo NMIs. The main
motivation for this feature is to have an IPI that can be leveraged to
invoke NMI functions on other CPUs.

And current prospective users are NMI backtrace and KGDB CPUs round-up
whose support is added via future patches.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/nmi.h | 17 ++++++++++++
 arch/arm64/kernel/Makefile   |  2 +-
 arch/arm64/kernel/ipi_nmi.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 arch/arm64/kernel/ipi_nmi.c

diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
new file mode 100644
index 0000000..4cd14b6
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
+void dynamic_ipi_setup(int cpu);
+void dynamic_ipi_teardown(int cpu);
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
index 0000000..a945dcf
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
+void dynamic_ipi_setup(int cpu)
+{
+	if (!ipi_nmi_desc)
+		return;
+
+	if (!prepare_percpu_nmi(ipi_nmi_id))
+		enable_percpu_nmi(ipi_nmi_id, IRQ_TYPE_NONE);
+}
+
+void dynamic_ipi_teardown(int cpu)
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
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
