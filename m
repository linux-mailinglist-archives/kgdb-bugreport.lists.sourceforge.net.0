Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B923DEF1C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Aug 2021 15:30:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mAuVN-0000rw-Vn
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Aug 2021 13:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1mAuVL-0000rT-S9
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JcS09GR5JxL0wxh7byS8wnH3e0xYQhVouJmEluHPAn4=; b=j+/DOPxh0pHKN3ctuxS5RE5a7+
 AtjaU0ADhKLFsznUfchfkoKGJmQDwtSfhthE8FdvFufIDqQhOLkDxLfNbgSWvWQZCdZKG2C8QhcjH
 QOQVzevEcbuaZ86c8U3qmW1VDT+ctQNlZnccE2MAHKGefb4LLCmBcuUnGXIq1iDfbab4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JcS09GR5JxL0wxh7byS8wnH3e0xYQhVouJmEluHPAn4=; b=aczFeSIK7dENEKM6+kNqqHQA4s
 3DdT/HlCg3ipR2q95GBya1oItagF10+jrg4qsJwuAYuTyBhzDFroVaaT9sW/mGADXqdsHJM2FPeXY
 FyBvQEArbUZFKhykpUeGmx6yD9tSyKqMjRMHATuABSTFOj75LCkB81axGJN/YSuxI4hM=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAuVJ-0008RF-MU
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Aug 2021 13:30:47 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1627996385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcS09GR5JxL0wxh7byS8wnH3e0xYQhVouJmEluHPAn4=;
 b=F4Kr6r8HNs8LTHORLhZYOfHJ0zhDPtuon3LD0tc3Gr2e/ZQ14v+JJTvAYl7qIM2MpajGIK
 Xvq1ewJgFto4MhazwVpQ0Lpa4Qpa7ebvuhAFrKYByLx3DmnIkyB9joIAAx33fwX47sv2jC
 XTEnzFbPyxSx1PUwbUSqjiQOXtUGWVippyuJ3TJEK3fh0mnN9Hdvgj5geL1RUuohLjWmoZ
 zJ+JHO9I9NawG8KH8CbOWm/AxHWDJY33eLGzDT9ahOfQCr7kWCjAPcHABD6yCjX56NvHWt
 MDH8UCcXnb/zI4BocNRa77BVyz9YWAepuG0OZNpGcK3xbYgqlalxwbYV+zJZAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1627996385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcS09GR5JxL0wxh7byS8wnH3e0xYQhVouJmEluHPAn4=;
 b=2FvCWmHq0n4iYAZlTThn1l3Z/ypeLK+B8838CtejWTXR1ZLqHIHX2f18YAsE0ENkc2fJWw
 2G5uHsBObvQqPCAA==
To: Petr Mladek <pmladek@suse.com>
Date: Tue,  3 Aug 2021 15:18:54 +0206
Message-Id: <20210803131301.5588-4-john.ogness@linutronix.de>
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mAuVJ-0008RF-MU
Subject: [Kgdb-bugreport] [PATCH printk v1 03/10] kgdb: delay roundup if
 holding printk cpulock
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
during cpu roundup. This will conflict with the printk cpulock.
Therefore, a CPU must ensure that it is not holding the printk
cpulock when calling kgdb_cpu_enter(). If it is, it must allow its
printk context to complete first.

A new helper function kgdb_roundup_delay() is introduced for kgdb
to determine if it is holding the printk cpulock. If so, a flag is
set so that when the printk cpulock is released, kgdb will be
re-triggered for that CPU.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/powerpc/include/asm/smp.h |  1 +
 arch/powerpc/kernel/kgdb.c     | 10 +++++++-
 arch/powerpc/kernel/smp.c      |  5 ++++
 arch/x86/kernel/kgdb.c         |  9 ++++---
 include/linux/kgdb.h           |  3 +++
 include/linux/printk.h         |  8 ++++++
 kernel/debug/debug_core.c      | 45 ++++++++++++++++++++--------------
 kernel/printk/printk.c         | 12 +++++++++
 8 files changed, 70 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 03b3d010cbab..eec452e647b3 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -58,6 +58,7 @@ struct smp_ops_t {
 
 extern int smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
 extern int smp_send_safe_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
+extern void smp_send_debugger_break_cpu(unsigned int cpu);
 extern void smp_send_debugger_break(void);
 extern void start_secondary_resume(void);
 extern void smp_generic_give_timebase(void);
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index bdee7262c080..d57d37497862 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -120,11 +120,19 @@ int kgdb_skipexception(int exception, struct pt_regs *regs)
 
 static int kgdb_debugger_ipi(struct pt_regs *regs)
 {
-	kgdb_nmicallback(raw_smp_processor_id(), regs);
+	int cpu = raw_smp_processor_id();
+
+	if (!kgdb_roundup_delay(cpu))
+		kgdb_nmicallback(cpu, regs);
 	return 0;
 }
 
 #ifdef CONFIG_SMP
+void kgdb_roundup_cpu(unsigned int cpu)
+{
+	smp_send_debugger_break_cpu(cpu);
+}
+
 void kgdb_roundup_cpus(void)
 {
 	smp_send_debugger_break();
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 447b78a87c8f..816d7f09bbf9 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -582,6 +582,11 @@ static void debugger_ipi_callback(struct pt_regs *regs)
 	debugger_ipi(regs);
 }
 
+void smp_send_debugger_break_cpu(unsigned int cpu)
+{
+	smp_send_nmi_ipi(cpu, debugger_ipi_callback, 1000000);
+}
+
 void smp_send_debugger_break(void)
 {
 	smp_send_nmi_ipi(NMI_IPI_ALL_OTHERS, debugger_ipi_callback, 1000000);
diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index 3a43a2dee658..37bd37cdf2b6 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -502,9 +502,12 @@ static int kgdb_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 		if (atomic_read(&kgdb_active) != -1) {
 			/* KGDB CPU roundup */
 			cpu = raw_smp_processor_id();
-			kgdb_nmicallback(cpu, regs);
-			set_bit(cpu, was_in_debug_nmi);
-			touch_nmi_watchdog();
+
+			if (!kgdb_roundup_delay(cpu)) {
+				kgdb_nmicallback(cpu, regs);
+				set_bit(cpu, was_in_debug_nmi);
+				touch_nmi_watchdog();
+			}
 
 			return NMI_HANDLED;
 		}
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 258cdde8d356..9bca0d98db5a 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -212,6 +212,8 @@ extern void kgdb_call_nmi_hook(void *ignored);
  */
 extern void kgdb_roundup_cpus(void);
 
+extern void kgdb_roundup_cpu(unsigned int cpu);
+
 /**
  *	kgdb_arch_set_pc - Generic call back to the program counter
  *	@regs: Current &struct pt_regs.
@@ -365,5 +367,6 @@ extern void kgdb_free_init_mem(void);
 #define dbg_late_init()
 static inline void kgdb_panic(const char *msg) {}
 static inline void kgdb_free_init_mem(void) { }
+static inline void kgdb_roundup_cpu(unsigned int cpu) {}
 #endif /* ! CONFIG_KGDB */
 #endif /* _KGDB_H_ */
diff --git a/include/linux/printk.h b/include/linux/printk.h
index ac738d1d9934..974ea2c99749 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -280,10 +280,18 @@ static inline void dump_stack(void)
 extern int __printk_cpu_trylock(void);
 extern void __printk_wait_on_cpu_lock(void);
 extern void __printk_cpu_unlock(void);
+extern bool kgdb_roundup_delay(unsigned int cpu);
+
 #else
+
 #define __printk_cpu_trylock()		1
 #define __printk_wait_on_cpu_lock()
 #define __printk_cpu_unlock()
+
+static inline bool kgdb_roundup_delay(unsigned int cpu)
+{
+	return false;
+}
 #endif /* CONFIG_SMP */
 
 /**
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index b4aa6bb6b2bd..9117ca86b81c 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -241,35 +241,42 @@ NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
 static DEFINE_PER_CPU(call_single_data_t, kgdb_roundup_csd) =
 	CSD_INIT(kgdb_call_nmi_hook, NULL);
 
-void __weak kgdb_roundup_cpus(void)
+void __weak kgdb_roundup_cpu(unsigned int cpu)
 {
 	call_single_data_t *csd;
+	int ret;
+
+	csd = &per_cpu(kgdb_roundup_csd, cpu);
+
+	/*
+	 * If it didn't round up last time, don't try again
+	 * since smp_call_function_single_async() will block.
+	 *
+	 * If rounding_up is false then we know that the
+	 * previous call must have at least started and that
+	 * means smp_call_function_single_async() won't block.
+	 */
+	if (kgdb_info[cpu].rounding_up)
+		return;
+	kgdb_info[cpu].rounding_up = true;
+
+	ret = smp_call_function_single_async(cpu, csd);
+	if (ret)
+		kgdb_info[cpu].rounding_up = false;
+}
+NOKPROBE_SYMBOL(kgdb_roundup_cpu);
+
+void __weak kgdb_roundup_cpus(void)
+{
 	int this_cpu = raw_smp_processor_id();
 	int cpu;
-	int ret;
 
 	for_each_online_cpu(cpu) {
 		/* No need to roundup ourselves */
 		if (cpu == this_cpu)
 			continue;
 
-		csd = &per_cpu(kgdb_roundup_csd, cpu);
-
-		/*
-		 * If it didn't round up last time, don't try again
-		 * since smp_call_function_single_async() will block.
-		 *
-		 * If rounding_up is false then we know that the
-		 * previous call must have at least started and that
-		 * means smp_call_function_single_async() won't block.
-		 */
-		if (kgdb_info[cpu].rounding_up)
-			continue;
-		kgdb_info[cpu].rounding_up = true;
-
-		ret = smp_call_function_single_async(cpu, csd);
-		if (ret)
-			kgdb_info[cpu].rounding_up = false;
+		kgdb_roundup_cpu(cpu);
 	}
 }
 NOKPROBE_SYMBOL(kgdb_roundup_cpus);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3d0c933937b4..1b546e117f10 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -44,6 +44,7 @@
 #include <linux/irq_work.h>
 #include <linux/ctype.h>
 #include <linux/uio.h>
+#include <linux/kgdb.h>
 #include <linux/sched/clock.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
@@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
 #ifdef CONFIG_SMP
 static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
 static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
+static unsigned int kgdb_cpu = -1;
 
 /**
  * __printk_wait_on_cpu_lock() - Busy wait until the printk cpu-reentrant
@@ -325,6 +327,16 @@ void __printk_cpu_unlock(void)
 			   -1); /* LMM(__printk_cpu_unlock:B) */
 }
 EXPORT_SYMBOL(__printk_cpu_unlock);
+
+bool kgdb_roundup_delay(unsigned int cpu)
+{
+	if (cpu != atomic_read(&printk_cpulock_owner))
+		return false;
+
+	kgdb_cpu = cpu;
+	return true;
+}
+EXPORT_SYMBOL(kgdb_roundup_delay);
 #endif /* CONFIG_SMP */
 
 /* Number of registered extended console drivers. */
-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
