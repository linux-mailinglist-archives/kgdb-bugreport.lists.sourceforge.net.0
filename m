Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C893428DFBB
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Oct 2020 13:21:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSeqg-0005J8-Jh
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Oct 2020 11:21:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kSeqg-0005Iw-8V
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pARdoa1Mzik3sFMoHiQMoHrcZnI06KYeFtpW0tbTfww=; b=XvtsGpU1cAC2SGojaqnbMxajzC
 ImniusFfd+S9l+uTb3H7d+99y2F09r7JcJl8ytcn/ljLbA9WgzSZzPhSBO9j/DC8GqdERM20kE7ZS
 CAVu/QsBeq8Y6sLI/tYDZiyjzRK+/tlVidOD0z51/t+GeUmOaT3jvChMrjtD44Hk6T/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pARdoa1Mzik3sFMoHiQMoHrcZnI06KYeFtpW0tbTfww=; b=X2rXBPXYEjMTtK8mBiRBhazwe0
 x+m9AsAKGL6CbE6CIcbNMccWyqMjGLJ11Lp1jrsTCQTbB3MfnCgpzGMeiJRBFTLymLtsw/IprvfiS
 +6vBuI/1zx3yuET+eLf61TumoylwozeWvgozsCDx2n44oNnafAcMgeTvLH7TcoBRPEHg=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSeqX-00F5nL-Sl
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:21:38 +0000
Received: by mail-oi1-f194.google.com with SMTP id w141so2862745oia.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pARdoa1Mzik3sFMoHiQMoHrcZnI06KYeFtpW0tbTfww=;
 b=IeK3ROMEUBzEPfFI89bhNOg9C4y+EbMx+iOpDcSO2ElT9727J1tgmW4RGkoN9rzQCi
 atrhNXA/wIu0f3I1aUjUzfWJOXjgL6ECP1sjx5Ab/Zg6rz4eLuNJ5K5zG4S+aUjq3Oib
 cxdYRcNEiBhmj8iTu2QGxIrvq/cWsxizqSDQaCe/jTslqIZZuju7rjE6gQl422bWlEjL
 9VCljp63Olb+jJp9giRDzKoseDjX99Tb6AE4eMevIMw+ALO/CA+sUTfNuLNhJEGb8c0J
 oYI0Zt3nfikvx5QJ/4IuAxaIq8L6SWRqFGI6bPnICR1dB4i6tEKQYBgZXVGY2JmDCaQt
 J1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pARdoa1Mzik3sFMoHiQMoHrcZnI06KYeFtpW0tbTfww=;
 b=Bdw7bLnI/Oorv8xfX0AzwYaExTGi8IV9J0daGLOcj7QXxpVVP2hOZ6FZJzRiO9Jg6n
 l0s1Ux6KoHKNDGi7sDZtV2093jmBszF3lFgjsJQ6+bTdZjmp+8x5FxClGUP5QnqR71ss
 FaEVykmBtnBuALB/4xihj/nw7Iuqoq0Fx+fLwpIEyGpMFhWGAdSGp57RGU7aU0NZTxlK
 Bmas4SSklztcx/nt82NlVEbxSM7MQJuEs/MF8ukmb8fzP8ZsIpNF2aoEB9esS6a/5q9V
 Mk/qvvr4tg7HjJTZM5F8Nha9hRUvoZn6nNV8MdOajd7Jr4lyHn/zMKRitUdMRUd4QEHe
 NqPg==
X-Gm-Message-State: AOAM532JnErfArAPN0jP5oztJB1vJeDwpY8TKZet0plZBxp228JDEoY0
 yIFAq+DqNCTnsL9ONk27ijNh9ZEKalDJlHtl
X-Google-Smtp-Source: ABdhPJxGgmScGvPFqKQIvL1Gl6IbDWm4Zk16CAUqS+hExrozMFM5iv/+6ThqFh0h4Q+YpuS9RR+sFA==
X-Received: by 2002:a17:90a:de90:: with SMTP id
 n16mr2940279pjv.215.1602674000885; 
 Wed, 14 Oct 2020 04:13:20 -0700 (PDT)
Received: from localhost.localdomain ([117.252.65.235])
 by smtp.gmail.com with ESMTPSA id f21sm3060102pfk.169.2020.10.14.04.13.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:13:20 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Wed, 14 Oct 2020 16:42:11 +0530
Message-Id: <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
X-Headers-End: 1kSeqX-00F5nL-Sl
Subject: [Kgdb-bugreport] [PATCH v5 5/5] arm64: ipi_nmi: Add support for NMI
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
 kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, tglx@linutronix.de, msys.mizuma@gmail.com,
 julien.thierry.kdev@gmail.com
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
index e0a9e03..e1dc19d 100644
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
