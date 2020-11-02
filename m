Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BE2A29F3
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:52:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYOF-0005bs-4H
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:52:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYOC-0005bQ-Ve
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=; b=W9OhcKerMqj3+2F4Froq3KulFO
 6ocz7YQ0HSjodQY3Sx1YURxi1LncRyUBHvS3c6gyCxjtPV8ThGTFIxwJXfXTYz1Tt3ibwYn8g2YK0
 0KQ9u00rITNf2gUzGauMuvL1t2OVmejdn5QtXvC0V+JSFY9k5rJK9PRPsFThg9820U0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=; b=H+ATj4++ozMIa0avDfGVf8yBoy
 9ddg3KSJz5+MoOZP4DC0uL41/xoAK2qudSEuAZtZOH9r+ZedOe13R94hKMZ8I9ohTl8CMzbbxSmHI
 5q+8VArZBNSLHQHEcenli1pRmBQWZYqgX/0DsX1jKq8WfzRheC1Pg8v+GnjQzz+7gKXs=;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYO8-006KKU-CC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:52:44 +0000
Received: by mail-il1-f195.google.com with SMTP id q1so12673894ilt.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=;
 b=hJ9/Ezv1ZgdvCLAG1rgjJ/9mpQ+SKh3LvAYZ/WUKYXIalESoV9Oql4vEQPCT2oMRus
 Drdj9tN3YSjMyBl+gq1AeNPOpvihBVmc1GU7Jm/9saZgCQNc7QuyUJilIvyNHRHrw9VW
 fY1y9FZJNr/taNUexlK7F8FnmRslj7+n7UVcb6vdTIfHXDkMGs9Vv+EQPz03XeTpwM4T
 y0sxHRkvp7vk08etU9dCuWcROXesLKCqMHWaZ93iaANXXu+HO+gONdCfJ23JAcZbp6zr
 1PC8Lnkk0Pilok7g7Kx4MQXncXBIwSgsu/qS0WXMl5HrPqZek7EGWxjeoaUiBFo3oGqX
 Q5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=;
 b=m/CxZmy1md0enYUr4XYBvQn5IvbrFVnX2VDyMuJTLFViX3tCnYyCQoPD5gzw378Px3
 lXxY0wcaahKOK+dSubLExDZYndc+SAth7xEMMhj4QwzPqUUvIQLReVoPj67zYEoW/rxY
 RYqhZnZFO7wPf4w/L6lh6lmktJbiNwQ7YmZirFFaEMmvmSv/H3lYBl18QWD+dLzMKUwQ
 yF/QwSpK0cClIkJ6iLVHshnA+1IYiyN8nDXsjWwv6kTbhvCodrYMVlP/oWvkdigzMHAw
 VZFhtGrpuDUhScOy90l76vKBCMQXAzsiFbVPipqhiXjIhuvMbYKWhSvZHIyTDkNiHlN5
 Uh5A==
X-Gm-Message-State: AOAM533FnEqh8d+wbcposRB2i2GHWMWMSeffB0A7PRc7ZGqwO5BAlmQt
 i9ri4ZFikiEQpu1skTB7jNMr4aXCLsja0g==
X-Google-Smtp-Source: ABdhPJxo+jJRsFTKov77OJRU77007ycelGKbPaV5dYEs45Z4UJIU+NvAvFXsfZkDaHO0m3EtjWrM2A==
X-Received: by 2002:a63:3d8c:: with SMTP id k134mr12755914pga.22.1604317583680; 
 Mon, 02 Nov 2020 03:46:23 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.46.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:46:22 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:45 +0530
Message-Id: <1604317487-14543-6-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZYO8-006KKU-CC
Subject: [Kgdb-bugreport] [PATCH v7 5/7] arm64: ipi_nmi: Add support for NMI
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

Enable NMI backtrace support on arm64 using IPI turned as an NMI
leveraging pseudo NMIs support. It is now possible for users to get a
backtrace of a CPU stuck in hard-lockup using magic SYSRQ.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/irq.h |  6 ++++++
 arch/arm64/kernel/ipi_nmi.c  | 18 ++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index b2b0c64..ef018a8 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -6,6 +6,12 @@
 
 #include <asm-generic/irq.h>
 
+#ifdef CONFIG_SMP
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+					   bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+#endif
+
 struct pt_regs;
 
 static inline int nr_legacy_irqs(void)
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index a945dcf..597dcf7 100644
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
 
 void dynamic_ipi_setup(int cpu)
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
