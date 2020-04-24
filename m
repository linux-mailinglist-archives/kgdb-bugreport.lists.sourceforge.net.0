Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AE1B7329
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 13:37:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRwdk-0007ee-3x
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 11:37:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRwdi-0007e8-C9
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EKk8wf3cz8RUWzn1IoJAXdPdtXtapZhuXqAKZvlxhk0=; b=TbR8QXmXJbZJIFN88guvxH5zw9
 QTonte49sQVsjj5YZX1u18nCCeAdeGa/poK9XtonpHsQL8/fqa6GB0hF8Hl7Adyve5PmaniurMyMU
 soErhTmAPfPsmMD3Cw42BM9n4ndEhyg1VU3tJSEVgEK8YtKW5J9oSclXMh5Sz2IH/H0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EKk8wf3cz8RUWzn1IoJAXdPdtXtapZhuXqAKZvlxhk0=; b=eqENZblGCl+Cecq6mcZeM0bsvV
 wzZpXmeoV34DiSFTa/X97InguyrtykuQ6waKxS+yp0z2zG2Q6fI4dwqN4wmtKBwl42aoYdFGlbSFU
 hmYrZ+oW5Gvjng2y6sZsFG8v8eBADnkCeCB6MpkW5ijDt4Z1nNChONnFCS+/vovNL4qM=;
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRwdh-00CkRM-0O
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:37:02 +0000
Received: by mail-ot1-f67.google.com with SMTP id m18so11754804otq.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EKk8wf3cz8RUWzn1IoJAXdPdtXtapZhuXqAKZvlxhk0=;
 b=YVByvnPda4cATjn80837BpLybRu1ueTExKc+WHBVax5RorJ+ZNuwn2MuexnHp4cYo5
 pJSZ9w7zONizNG7Z3GdcKH+Tkhn25h8TR9XHtivZtX1CpbXpXvI867BueiUOFBq9kLNZ
 KvqEdfylxYMdXjK11Cje/hpe6RxW7SkgNCglD4qg+8esQ0DGRN1unACq9B/XSrSjvNe/
 U+Gs2Tw/SQUjHpha+1570GDCr8HtTa+kiYHbNnrfrd8ZE7Tvhm3n3vodJ2Mcm89E3GwA
 /Yg4yBEGGmx3zLlYG2FU4efb942GYE84eO8krDcE4jT0MmEvsksbti+duvjQPCEo+yUl
 fsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EKk8wf3cz8RUWzn1IoJAXdPdtXtapZhuXqAKZvlxhk0=;
 b=Q3mfdFPbPn0kUdjB9XjFg/N3KxroKZIFo8/GJ+dYRCWudAZuCcalhTo6rtpVSa5BZ9
 4RC7xhF8K+NnsJi+dFYryEn86Q/OC2T8hIUvw09TSOz6akmQky+BGBdMgd4r/H2knrt0
 I1hrgwyFl4Y6A+4cji4vjMQEaQ1WkabqWgx+PxUoQhC2WWM3l9QVN12W8H2wofAKEec4
 vncBbQFnU0NF2tY/RUJRyyOF2iaX8yD/MqOAX+7sNqO/ly1b6jafft74uP30Uk4q83Sg
 6/CrWJa0qgPAGDcRkEulCHqvhR9NcMsq1crZ7xd0SgVcDdYrD6K01Ln3ciU4cbgo1l/i
 69tQ==
X-Gm-Message-State: AGi0PuaNNLeABs5oDdW5W5d2joRVFyfN/dodkQIJXoiFdcB0PGL59w4b
 lR9ZWWqM5uGAzlSU+JPGGokFF8ABh9adow==
X-Google-Smtp-Source: APiQypJ3GgW9Pqsjfrzr6QtP90j+8rGXoeLfM9QDDeJW24ES89o3cFiti2XOv8eDeWoqo/y4W3Qbew==
X-Received: by 2002:a17:90a:c702:: with SMTP id
 o2mr5618006pjt.196.1587726689928; 
 Fri, 24 Apr 2020 04:11:29 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.186])
 by smtp.gmail.com with ESMTPSA id o11sm4637628pgd.58.2020.04.24.04.11.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 04:11:29 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Apr 2020 16:39:11 +0530
Message-Id: <1587726554-32018-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jRwdh-00CkRM-0O
Subject: [Kgdb-bugreport] [RFC Patch v1 1/4] arm64: smp: Introduce a new IPI
 as IPI_CALL_NMI_FUNC
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net, catalin.marinas@arm.com,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org, maz@kernel.org,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de, will@kernel.org,
 julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Introduce a new inter processor interrupt as IPI_CALL_NMI_FUNC that
can be invoked to run special handlers in NMI context. One such handler
example is kgdb_nmicallback() which is invoked in order to round up CPUs
to enter kgdb context.

As currently pseudo NMIs are supported on specific arm64 platforms which
incorporates GICv3 or later version of interrupt controller. In case a
particular platform doesn't support pseudo NMIs, IPI_CALL_NMI_FUNC will
act as a normal IPI which can still be used to invoke special handlers.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/hardirq.h |  2 +-
 arch/arm64/include/asm/smp.h     |  1 +
 arch/arm64/kernel/smp.c          | 20 +++++++++++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/hardirq.h b/arch/arm64/include/asm/hardirq.h
index 87ad961..abaa23a 100644
--- a/arch/arm64/include/asm/hardirq.h
+++ b/arch/arm64/include/asm/hardirq.h
@@ -13,7 +13,7 @@
 #include <asm/kvm_arm.h>
 #include <asm/sysreg.h>
 
-#define NR_IPI	7
+#define NR_IPI	8
 
 typedef struct {
 	unsigned int __softirq_pending;
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 40d5ba0..cc32776 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -108,6 +108,7 @@ extern void secondary_entry(void);
 
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
+extern void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask);
 
 #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
 extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 061f60f..42fe7bb 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -74,7 +74,8 @@ enum ipi_msg_type {
 	IPI_CPU_CRASH_STOP,
 	IPI_TIMER,
 	IPI_IRQ_WORK,
-	IPI_WAKEUP
+	IPI_WAKEUP,
+	IPI_CALL_NMI_FUNC
 };
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -798,6 +799,7 @@ static const char *ipi_types[NR_IPI] __tracepoint_string = {
 	S(IPI_TIMER, "Timer broadcast interrupts"),
 	S(IPI_IRQ_WORK, "IRQ work interrupts"),
 	S(IPI_WAKEUP, "CPU wake-up interrupts"),
+	S(IPI_CALL_NMI_FUNC, "NMI function call interrupts"),
 };
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
@@ -856,6 +858,11 @@ void arch_irq_work_raise(void)
 }
 #endif
 
+void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask)
+{
+	smp_cross_call(mask, IPI_CALL_NMI_FUNC);
+}
+
 static void local_cpu_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
@@ -960,6 +967,17 @@ void handle_IPI(int ipinr, struct pt_regs *regs)
 		break;
 #endif
 
+	case IPI_CALL_NMI_FUNC:
+		/* Handle it as a normal interrupt if not in NMI context */
+		if (!in_nmi())
+			irq_enter();
+
+		/* nop, IPI handlers for special features can be added here. */
+
+		if (!in_nmi())
+			irq_exit();
+		break;
+
 	default:
 		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
 		break;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
