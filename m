Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FC2A29BE
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:46:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYI5-0003sc-Ch
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:46:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYI4-0003sK-1E
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=; b=MLv8OG7tZ0sAovl8If0T7XR9vp
 ieO65GrV8iKYZs3aDiH6B3B6xt3oxs8C9O4eVbp3S+0P2X8IuJnfWeOhhWkgh+aWl8vJ/GLr/6Rhl
 lZUmcILlvdrWAt6XN0wQBCd0wU96jTG8A+wB9b0DEE16yYR6jHkrZjp4+Hk+LjwWaStc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=; b=kVRi69SEFuZtIRop1EU1l0Bmrw
 CYMC38hGzMFXQhN2G1qOj6HbkP6SbiGTkh45pgctr5DXI541Sq2DS2gewbYA+Ky73psBII6YI4C52
 bSisdodl/hOYUKfe3o0xdfwhFVHQbPU31koDy2PDmTqWvc2nQHmqvr/kxoGbp5azUai4=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYI0-00GGjt-EA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:46:23 +0000
Received: by mail-pg1-f196.google.com with SMTP id k9so8873368pgt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=;
 b=skNzlcCkdr9wzJXlmrr6gmgfHRTLV42b1oW7ebcQoKXyoXyHWWt5Jr6PVfjM9LS+Rx
 UdZOnOkUaN29N6r8/5uxtPHxugCAQfUTVF2hPdZsCgUP5qW0QehGQKN0s9v47EgkGGWu
 MjCQbhdv0IKDH66Y18dIy6JqpbCTypO1JXzmeSWS33eQBYZkn5SbUTl6HPcm0FvKw6Rf
 hMbPJU4yg8M806nYFhwlxgKDWgYut7nLY7ZAkNtAYAL5xEwfpCO7g1TjrCf1t6bqILBR
 gwUhYmBpuflxVNfRcOQj8eOZ857M4bbZ+RRC1+5yvNybwmRO4KU2pgOhsFatJCPvV3eG
 qVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=;
 b=izJGlfxYLm9jMqEmf63x1kWjYKYCSNjZSpHX8dTo8hWl27txRzbsq1pt4H2qYVw79g
 CzYCq+y6C5/cPMSA4iFIDVbyHBRg2k+tYuShDgonC5YZvKoJMo40vsRHACjaLHcCkkfK
 l6Fu/XtDWdn9F7pJbtwp7v1hRcOUU95BSt3ykoEwj0GiMzfq3Y62FQd2WcJ8ySdip6W0
 k+p+D5wQcOZstWuY1z5JHQdlUQT1IK6FS+O/tc0H1YVXh1b4n9DewWYM2K7WPGXTUiGr
 i6cvvdSlVQJaigMZXMU0bg1X+KlPkjsoHlBc2zceecp3DBh6QdGjoQpfGJoJQGwYhOPV
 lOfA==
X-Gm-Message-State: AOAM530nQgJSU1Lx9kqz1+rYwceARhnQnk6CK06Es5XfGtIv20GTNNUc
 1lAtCS0NP7GbGAgl/nqODIixI+DPsiiifQ==
X-Google-Smtp-Source: ABdhPJxcN+aly9xBYoQsGmN+f/I9xVnYq1Ko48D+USEJqWMLjBrqoYTk1Rj65/kGBvvxlzWGdVbZ/Q==
X-Received: by 2002:a17:90b:3542:: with SMTP id
 lt2mr16842829pjb.187.1604317574793; 
 Mon, 02 Nov 2020 03:46:14 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.46.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:46:14 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:44 +0530
Message-Id: <1604317487-14543-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
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
X-Headers-End: 1kZYI0-00GGjt-EA
Subject: [Kgdb-bugreport] [PATCH v7 4/7] nmi: backtrace: Allow runtime arch
 specific override
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

Add a boolean return to arch_trigger_cpumask_backtrace() to support a
use-case where a particular architecture detects at runtime if it supports
NMI backtrace or it would like to fallback to default implementation using
SMP cross-calls.

Currently such an architecture example is arm64 supporting pseudo NMIs
feature which is only available on platforms which have support for GICv3
or later version.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm/include/asm/irq.h       |  2 +-
 arch/arm/kernel/smp.c            |  3 ++-
 arch/mips/include/asm/irq.h      |  2 +-
 arch/mips/kernel/process.c       |  3 ++-
 arch/powerpc/include/asm/nmi.h   |  2 +-
 arch/powerpc/kernel/stacktrace.c |  3 ++-
 arch/sparc/include/asm/irq_64.h  |  2 +-
 arch/sparc/kernel/process_64.c   |  4 +++-
 arch/x86/include/asm/irq.h       |  2 +-
 arch/x86/kernel/apic/hw_nmi.c    |  3 ++-
 include/linux/nmi.h              | 12 ++++--------
 11 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/arm/include/asm/irq.h b/arch/arm/include/asm/irq.h
index 46d4114..54b0180 100644
--- a/arch/arm/include/asm/irq.h
+++ b/arch/arm/include/asm/irq.h
@@ -31,7 +31,7 @@ void handle_IRQ(unsigned int, struct pt_regs *);
 void init_IRQ(void);
 
 #ifdef CONFIG_SMP
-extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
 					   bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 #endif
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 48099c6e..bb20a43 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -856,7 +856,8 @@ static void raise_nmi(cpumask_t *mask)
 	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_nmi);
+	return true;
 }
diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index c5d3517..34f3b42 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -78,7 +78,7 @@ extern int cp0_fdc_irq;
 
 extern int get_c0_fdc_int(void);
 
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
 				    bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 75ebd8d..d19e672 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -735,9 +735,10 @@ static void raise_backtrace(cpumask_t *mask)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace);
+	return true;
 }
 
 int mips_get_process_fp_mode(struct task_struct *task)
diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index 84b4cfe..a5eb3e2 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -9,7 +9,7 @@ static inline void arch_touch_nmi_watchdog(void) {}
 #endif
 
 #if defined(CONFIG_NMI_IPI) && defined(CONFIG_STACKTRACE)
-extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
 					   bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 #endif
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index b644065..22b112a 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -264,8 +264,9 @@ static void raise_backtrace_ipi(cpumask_t *mask)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace_ipi);
+	return true;
 }
 #endif /* defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_NMI_IPI) */
diff --git a/arch/sparc/include/asm/irq_64.h b/arch/sparc/include/asm/irq_64.h
index 4d748e9..35c01ff 100644
--- a/arch/sparc/include/asm/irq_64.h
+++ b/arch/sparc/include/asm/irq_64.h
@@ -87,7 +87,7 @@ static inline unsigned long get_softint(void)
 	return retval;
 }
 
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
 				    bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index a75093b..9182001 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -248,7 +248,7 @@ static void __global_reg_poll(struct global_reg_snapshot *gp)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	struct thread_info *tp = current_thread_info();
 	struct pt_regs *regs = get_irq_regs();
@@ -303,6 +303,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 	memset(global_cpu_snapshot, 0, sizeof(global_cpu_snapshot));
 
 	spin_unlock_irqrestore(&global_cpu_snapshot_lock, flags);
+
+	return true;
 }
 
 #ifdef CONFIG_MAGIC_SYSRQ
diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
index 528c8a7..b7668e0 100644
--- a/arch/x86/include/asm/irq.h
+++ b/arch/x86/include/asm/irq.h
@@ -47,7 +47,7 @@ extern void init_ISA_irqs(void);
 extern void __init init_IRQ(void);
 
 #ifdef CONFIG_X86_LOCAL_APIC
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
 				    bool exclude_self);
 
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
diff --git a/arch/x86/kernel/apic/hw_nmi.c b/arch/x86/kernel/apic/hw_nmi.c
index 34a992e..e7dcd28 100644
--- a/arch/x86/kernel/apic/hw_nmi.c
+++ b/arch/x86/kernel/apic/hw_nmi.c
@@ -34,10 +34,11 @@ static void nmi_raise_cpu_backtrace(cpumask_t *mask)
 	apic->send_IPI_mask(mask, NMI_VECTOR);
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self,
 				      nmi_raise_cpu_backtrace);
+	return true;
 }
 
 static int nmi_cpu_backtrace_handler(unsigned int cmd, struct pt_regs *regs)
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 750c7f3..cedbfc1 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -143,26 +143,22 @@ static inline void touch_nmi_watchdog(void)
 #ifdef arch_trigger_cpumask_backtrace
 static inline bool trigger_all_cpu_backtrace(void)
 {
-	arch_trigger_cpumask_backtrace(cpu_online_mask, false);
-	return true;
+	return arch_trigger_cpumask_backtrace(cpu_online_mask, false);
 }
 
 static inline bool trigger_allbutself_cpu_backtrace(void)
 {
-	arch_trigger_cpumask_backtrace(cpu_online_mask, true);
-	return true;
+	return arch_trigger_cpumask_backtrace(cpu_online_mask, true);
 }
 
 static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
 {
-	arch_trigger_cpumask_backtrace(mask, false);
-	return true;
+	return arch_trigger_cpumask_backtrace(mask, false);
 }
 
 static inline bool trigger_single_cpu_backtrace(int cpu)
 {
-	arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
-	return true;
+	return arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
 }
 
 /* generic implementation */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
