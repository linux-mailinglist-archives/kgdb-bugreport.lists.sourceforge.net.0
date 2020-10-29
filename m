Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0656229EFD0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 16:28:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9qt-00070e-Mz
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 15:28:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9qs-00070K-9x
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=; b=e7ch0LKlr+d35I0GKv3qndWve2
 b1udk/pMlS+VJyfDRAhX2YF65rlboIY0tli1cI7pze2cie5FW8JfgudCjc1U+RiMAUPLu9R0eSey3
 pjvP1ripXcgIB50LBIKMGmxTO2uXh2N23O8A0QieNLGt4bgq79FEGIaaNzzVDFYpTdoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=; b=O0Bup0YivgnoffzlI59KST9CO8
 eie4ebADV2r2oYWxkvjMRiFDDZNB5uUO+QLHNtqBS5PZOW5Lvb5/HP9x77pMymFPIzMk0ch6Ra1TA
 S6U1ZTFWmjCutoPYUnqQNBOaI4yy6BGb9QSczPAcwg73I6cVQsCwpmIVrQXX3WzC5IEM=;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9qo-00Bieb-7e
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:28:34 +0000
Received: by mail-vs1-f66.google.com with SMTP id d19so1719222vso.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=;
 b=XJjksHkYjikof0fGwOzB1QkkJRMDBaLHRUDrY80u2Tk8IH/yUVD8vNqh+AAMwDF9St
 knzq2LyaXm7qnqr2hVVDAp2Az6bDj4MxRUVPgtflqKHXkEYzXfRMiY2a1MGIZvHh2fgM
 dWU3O5F/Sb8Mz1QDYYtzqaJvWY3YNDrAYvBDZg/CQNOnsqkfV/7ZMC/6TdLDkeI4bAG0
 Psyg8AsSTJxuh4yaYGnKqrIpwZaek1nTr4aViON9Mwrh8pCSKF763tbtlsfCwuBAPc9Z
 Mr26xOICSLDIEjReczhTA53I9mWmGajpJ4R12nCyfQocQ0/HLlCN45+LwZuU0xwJNzMj
 iSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4e2yfnMR++56KFut6kOLfTQarMmYrpZq1CE3qMECL4w=;
 b=MoMb5mLd5d6aCu5v0KflhLgs1ssteR5f6D3yWC9KP8HfVH4o1SulzucMcuTh3mIE28
 rnkNNkq9Bu6Hruonro676ILMAvpgCXnQoob0525t2kmB0Mp1h1F5cVzaLIpbEhZQ5wu8
 HebVw08AXeEf7G4hYOxBorOB2PU2oQo9lIZqsNMndCStbNgXcPNvY3wxvsx/3FvcUQY7
 tjLUcfQsY2oEmLHkr0lh8cB+CtjBHdC/hXWs1jKA/33j9e9FQNfkga5q8cQ+K6GQNNuk
 V6a2dUHVJh6wll2v7Fe7zvR5SCTCX+1ceL4fc+ZJASO80DYd1t4puvm+dChCSjIg57xG
 Ky/w==
X-Gm-Message-State: AOAM531wE107uPPYeoRhjaL0gvV3beuw/rw7D9TrVmgwc2ejxrRcEOwj
 GTcf6Y22bHZmgiBv1lYpENkIN9jrjAPrxw==
X-Google-Smtp-Source: ABdhPJyiFdf8LurYKm67IsPhbarLKLZU2AeeQGSDNWS6LPY1vM5kvG4v7s5v59ie2r66eT8JZWSEYQ==
X-Received: by 2002:a17:902:9042:b029:d5:eef1:c9c8 with SMTP id
 w2-20020a1709029042b02900d5eef1c9c8mr4826847plz.0.1603983523466; 
 Thu, 29 Oct 2020 07:58:43 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.58.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:58:42 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:24 +0530
Message-Id: <1603983387-8738-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.71.231 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kY9qo-00Bieb-7e
Subject: [Kgdb-bugreport] [PATCH v6 4/7] nmi: backtrace: Allow runtime arch
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
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
