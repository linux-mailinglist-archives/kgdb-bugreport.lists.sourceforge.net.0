Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C026605B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Sep 2020 15:37:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kGjEz-0002d1-A2
	for lists+kgdb-bugreport@lfdr.de; Fri, 11 Sep 2020 13:37:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kGjEx-0002co-Hy
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UMF4bf/xlX5iMhhFdvv4POZJxLXNJMbFMY0/ylfkgBU=; b=exnAZ/FZk97SsYKxkiad1iyWQb
 XRoCFi8WQ2S0bkRoxcIczRZH0mIHQJOvsnfTW553Tt3Uas/WPZMPexffSYziOhAanrUT8ewa0SVHR
 j/CY0q3aB8sd7d1tbyAw55E2MO7yQHn78whYFh7I1TGvPFh2igz0odCcZ2nGitUyB36o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UMF4bf/xlX5iMhhFdvv4POZJxLXNJMbFMY0/ylfkgBU=; b=JDsc7jDfndQAsHr0ZttxDTwMTg
 9WTknvtszuUp0frUCi35KyENps5z/b+ALczj93NNVHieyY/STtPCxRHHMenMXmZJ/oVSM7Vgi1ieK
 OleXPDq6q8md9HCd62VDios9gUg62QQVn2FpkghGhNVMeu2L5B6dxficz/FjmlzhqfJ8=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGjEr-004V29-Mj
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:37:23 +0000
Received: by mail-oi1-f193.google.com with SMTP id n2so9484291oij.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 11 Sep 2020 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UMF4bf/xlX5iMhhFdvv4POZJxLXNJMbFMY0/ylfkgBU=;
 b=EuQDuBTvOvwLK210071x8IREFokQkgZaord4oFCyWIF92/r5O+/EHGVhTZB7Xa3ZYA
 O6Y2+67Gs5ian2S/VK+fTAa2hAr+hTP0YsK989soxdqSat1sWOjtSlXx5AUdQdheN/r7
 l+FNLv+QNEE9hzRIazVRwnfqsbKvqZLqCiwKBW/iegqkTtCcFFxV4oK/Aay+X8OFVNwt
 ea7F6VWqHxZ4ol/1WXrJ5YTrlZSyygzFH08zKGn8NikhCkP2wRHgnIytnzENhf+9t8q5
 EeOBCzZuDaOq0opR7A5YOpMF84iYa5OGzmk8Wn8tzIGeF3MAZphGwwlyFNNa9ikyVoXk
 rKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UMF4bf/xlX5iMhhFdvv4POZJxLXNJMbFMY0/ylfkgBU=;
 b=drDMuRWvNJb2YkjBK9ZfH5CChZlEKvYijolv9TUpBMNwVbZtP8WKoWzpVn7aHeV/Ke
 fLZA6FRchvfnEKYzQajAt11Pc2gXJ4OOzZlGXZMbLzDNA2uYTzm4IKpS+1iuxnFnGCty
 j4WXKQnKAPwqa5glPd7TluR557OwHqiDK+8+YVyXO6VU8q+IUH2ooY2UNSninqCNfshQ
 2PkdZNzVNJ0pf20EOxZ7mrfXJjX3lqh4KPHOKOs7/dSfZakAFJ8t/2FCtNO4w/MDlFYD
 TV34KzhSvXjJ4edGxXqTv8kf2D0Mdh4+7XphRWd4QxQ9aTvGqQ2DlIMqakjWoDTbJehA
 NQyw==
X-Gm-Message-State: AOAM532GgmU66ujlXf0SyKa778QaD57Ky6oR97JWy+ZYJr5eEUxy7RgR
 9Q2d/MfOO0Ax6WIAqxvkEpL0zNysHE19IQ==
X-Google-Smtp-Source: ABdhPJxB8cUOtjFdM+vSMsIEhsYFJvwax+iseMhfwh9gbEQK9y8yNt7VouZeSvdSOUYF8uN7QozcNQ==
X-Received: by 2002:a17:90a:f992:: with SMTP id
 cq18mr2296365pjb.136.1599830983031; 
 Fri, 11 Sep 2020 06:29:43 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.48])
 by smtp.gmail.com with ESMTPSA id e10sm557988pgb.45.2020.09.11.06.29.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:29:42 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Fri, 11 Sep 2020 18:58:44 +0530
Message-Id: <1599830924-13990-6-git-send-email-sumit.garg@linaro.org>
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
X-Headers-End: 1kGjEr-004V29-Mj
Subject: [Kgdb-bugreport] [PATCH v4 5/5] arm64: ipi_nmi: Add support for NMI
 backtrace
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

Enable NMI backtrace support on arm64 using IPI turned as an NMI
leveraging pseudo NMIs support. It is now possible for users to get a
backtrace of a CPU stuck in hard-lockup using magic SYSRQ.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/irq.h |  6 ++++++
 arch/arm64/kernel/ipi_nmi.c  | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index b2b0c64..e840bf1 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -6,6 +6,12 @@
 
 #include <asm-generic/irq.h>
 
+#ifdef CONFIG_SMP
+extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+					   bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+#endif
+
 struct pt_regs;
 
 static inline int nr_legacy_irqs(void)
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index 627bc11..d3aa430 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kgdb.h>
+#include <linux/nmi.h>
 #include <linux/smp.h>
 
 #include <asm/nmi.h>
@@ -25,12 +26,21 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask)
 	__ipi_send_mask(ipi_desc, mask);
 }
 
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+{
+	nmi_trigger_cpumask_backtrace(mask, exclude_self,
+				      arch_send_call_nmi_func_ipi_mask);
+}
+
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
 	unsigned int cpu = smp_processor_id();
 
-	ipi_kgdb_nmicallback(cpu, get_irq_regs());
+	if (nmi_cpu_backtrace(get_irq_regs()))
+		goto out;
 
+	ipi_kgdb_nmicallback(cpu, get_irq_regs());
+out:
 	return IRQ_HANDLED;
 }
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
