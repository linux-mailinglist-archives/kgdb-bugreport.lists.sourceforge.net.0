Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B67729EFA8
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 16:24:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9n1-00066R-7p
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 15:24:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9mz-00066K-LE
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p2BcD1V2PWIC84tedyjPNBhOL9YmKQfq2/p2+3YKmlM=; b=dd1Wyw34YqkWRztgLm3yWVH96F
 WpSNcBhUCyA9kwv9olPq+raVszmnglFLp3ThQPHOdrS3DDMG3KWMJmbDxlrfLnrLDdQQpUvJmAb44
 Et8KsYOQngKqQRgwbe53g/CLLIVHX2HO95rcMoG+QAvA+x9crXwxklotbSPzFjT01vcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p2BcD1V2PWIC84tedyjPNBhOL9YmKQfq2/p2+3YKmlM=; b=U6FJn8XURs1PylOwrDwHZX7Up0
 nqWfUH/A7mTX4BF+B62xvOoFleDPMS6ha58m3kVtEF2/mi83lX8E9dgwLKXX1RWnGHSzMp0Bxwq2j
 oE9Sx6f+CVplSyGfTjk48bTX8Hyy76gMUaODdkiSHxqXiZs1vFZPPUeJgiH57eeLAUTo=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9mk-001Ayq-JN
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:24:32 +0000
Received: by mail-pl1-f196.google.com with SMTP id j5so1451010plk.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p2BcD1V2PWIC84tedyjPNBhOL9YmKQfq2/p2+3YKmlM=;
 b=n+vTpMTQwDqndje9E2gUY+QXt7Qn9stwgTDRJVc0Cb2sT9hBHygE98lnxVG0ts+MDi
 /o6XKBcMYGUY+P667hm/S4Q4mSnWcAPronjlvdfnJM73yqvIfjttWAKSf5Jskef3zhN0
 evwSzWN0/Y7S52GsN5KSLAgUTXGLSclADgHcOAWt0/aDq2JzFi3aacKFk49xlKIB/3on
 3TC13ZIo2vI9A2lDoROQlyqL2+IdRMfsRKM4bj8eua2ExXB55m4eeSeLvshwkQK9G8YN
 I5xYYQGNNIb4u0pOelBmyBqijvUZzbzPvPVE1l3zQupUh/v/3fQZuFt5Bft8kuOlOIJ9
 BtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p2BcD1V2PWIC84tedyjPNBhOL9YmKQfq2/p2+3YKmlM=;
 b=QME/jUzdj4TIrStW9eVtqNeQYGtkIBV8X5T9nqRLkrq9krY48jW156uOnz+lTDLnC0
 HHAx4wKvOwE5gW/hMfUluj/ykxtK02cv7JX5nMuWrhF2L1aZPLdmEDbRBbYRLMtm1HVH
 J2Z5EFrcxBOjsMdFx4Depx7zcpcYR23FQOeczH8VPlNVUprTJoLmRtxMA17RJgAmBjV3
 YAxTQdOOHfiC0q4JGxO9wGAIkWoRhyuZi1HUIcAz/KkjMdEWtFRNOmBZe/dWCyB0Ub7L
 nvVKDuMeF/anPboS1xS8fcGRpEkBq00CkiJL25GLDMTILATtZZpEXpWqKne/MVZELVoK
 4MaQ==
X-Gm-Message-State: AOAM53336wtTfr6e0JTSw5kmNUPctoIJHhwNzmH45CzD5LEW4Jf3eNru
 do1FVM+UYTe5qmBViSG4OHYU0KxpZzoWbg==
X-Google-Smtp-Source: ABdhPJwzdKIE9Z+RU535miYWHiUs7hW+ACKuH9/ZGTNzlFy1YROrCmeOP6o4woJU5feSQy9V41Wcyg==
X-Received: by 2002:a17:902:bf43:b029:d6:19b1:7942 with SMTP id
 u3-20020a170902bf43b02900d619b17942mr4289008pls.61.1603983552904; 
 Thu, 29 Oct 2020 07:59:12 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.59.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:59:12 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:27 +0530
Message-Id: <1603983387-8738-8-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kY9mk-001Ayq-JN
Subject: [Kgdb-bugreport] [PATCH v6 7/7] arm64: kgdb: Roundup cpus using IPI
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

arm64 platforms with GICv3 or later supports pseudo NMIs which can be
leveraged to roundup CPUs which are stuck in hard lockup state with
interrupts disabled that wouldn't be possible with a normal IPI.

So instead switch to roundup CPUs using IPI turned as NMI. And in
case a particular arm64 platform doesn't supports pseudo NMIs,
it will switch back to default kgdb CPUs roundup mechanism.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/kgdb.h |  9 +++++++++
 arch/arm64/kernel/ipi_nmi.c   |  5 +++++
 arch/arm64/kernel/kgdb.c      | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
index 21fc85e..c3d2425 100644
--- a/arch/arm64/include/asm/kgdb.h
+++ b/arch/arm64/include/asm/kgdb.h
@@ -24,6 +24,15 @@ static inline void arch_kgdb_breakpoint(void)
 extern void kgdb_handle_bus_error(void);
 extern int kgdb_fault_expected;
 
+#ifdef CONFIG_KGDB
+extern bool kgdb_ipi_nmicallback(int cpu, void *regs);
+#else
+static inline bool kgdb_ipi_nmicallback(int cpu, void *regs)
+{
+	return false;
+}
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 /*
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index 597dcf7..6ace182 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/smp.h>
 
@@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
 	irqreturn_t ret = IRQ_NONE;
+	unsigned int cpu = smp_processor_id();
 
 	if (nmi_cpu_backtrace(get_irq_regs()))
 		ret = IRQ_HANDLED;
 
+	if (kgdb_ipi_nmicallback(cpu, get_irq_regs()))
+		ret = IRQ_HANDLED;
+
 	return ret;
 }
 
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 1a157ca3..c26e710 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -17,6 +17,7 @@
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
+#include <asm/nmi.h>
 #include <asm/traps.h>
 
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
@@ -353,3 +354,37 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+bool kgdb_ipi_nmicallback(int cpu, void *regs)
+{
+	if (atomic_read(&kgdb_active) != -1) {
+		kgdb_nmicallback(cpu, regs);
+		return true;
+	}
+
+	return false;
+}
+
+static void kgdb_smp_callback(void *data)
+{
+	unsigned int cpu = smp_processor_id();
+
+	if (atomic_read(&kgdb_active) != -1)
+		kgdb_nmicallback(cpu, get_irq_regs());
+}
+
+bool kgdb_arch_roundup_cpus(void)
+{
+	struct cpumask mask;
+
+	if (!arm64_supports_nmi())
+		return false;
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
+	if (cpumask_empty(&mask))
+		return false;
+
+	arm64_send_nmi(&mask);
+	return true;
+}
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
