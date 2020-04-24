Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B41B72C8
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 13:12:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRwFW-0002ag-RD
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 11:12:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRwFV-0002a9-G0
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGgPpUWWcJSKxFWk1j0ZpUZcDZ7qWSk+2Ep1V3opjsY=; b=m6BGHNyFKikfsuG5Rj9PQX9PRR
 Zts0OOMVu9FgnjPplCX1b43S3YwdD9A++jmyHTQ/y2RyiHe7m6kK8MpdmyPfaQJ+rGNGlgQuMXwz1
 CEG3OD41OXWQnakq/PgyR+/G9L54XIEtpSc3YQJLzR6KegJNX6RvCfFa8f97lsGiZc2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mGgPpUWWcJSKxFWk1j0ZpUZcDZ7qWSk+2Ep1V3opjsY=; b=V3FPhTzctisbY1XqUR0+Ak2/4W
 KgQ+I6tsazK/Q5fwNAjFWHNR2C6JvCpLrVLSmrh8ee+GN5ysI6B4J/INcr/DRUqCHaCg+0P/FT8Ix
 2E7k499bnnbG6ZsFsxxNlzMdkO7vm5ZYK7HssPJBIHKXWGz2lVd5/ZWZV+WaS8+RhXqo=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRwFU-00CUAW-9O
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:12:01 +0000
Received: by mail-pj1-f65.google.com with SMTP id e6so3776182pjt.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mGgPpUWWcJSKxFWk1j0ZpUZcDZ7qWSk+2Ep1V3opjsY=;
 b=RhV+Dgur2THbXVsj1cTu37mw8UPw80MKORypqDq7r/YfZFzDSHI0k79rvvs3kRsL+N
 5X10akzNH/fucZMO2P+Hqo+FCdis++edlXsKCaoPKGeOFZHpR8rNipVNdkPBE7nc1FtL
 JAnQMkVN/9e0A5DGLVeib1jx8kE46Ta4BFi4iS2XnJgWwfNMkyjGivbJIDXz4IO5uVih
 iP/Ss+WpI9mJhxFgwThDtMgqbXhV0bZwV4YtOYbHxLvaiwTwi0YHM57IX3IXb2K6ZmMa
 ZnfIe/U12bZDfeCOntbNTqUd4qRY76VDrfjXvdCam3jgPIhzv9/AA8CqliMBJ94JV9O2
 R7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mGgPpUWWcJSKxFWk1j0ZpUZcDZ7qWSk+2Ep1V3opjsY=;
 b=JH8fPOGrz9psA9AvRnufVtVXk/WjvMdGd/aqwahBAO7Wh5ySEIqL6EdQ2Cu4k+Uu93
 L55xa0fQSNkjkiHuSBsRuJ8wEkYPcJtchZfG7CjTA0nyM1SVd0GD5l64roLMIP2Cd9yM
 rwPS+F5KTKKEWcF9+MYNOUQSrILcqKHHqN9VAMpG8v94JKAXMRzCvd7xI4SiQdouKCvV
 Lmta01pj3zcilPL2sav33vnmeM+pyk8vGnBSwUIH/v00ofrmQH8vGzMwk3+7vbjoX9SB
 ktNRT46c7R+8MIGiCQi3wjy2Y60ik/UpH2U3Co6YKLS/h7FIfXJD00JxDu4f03xPkYQs
 PCyQ==
X-Gm-Message-State: AGi0PuZE/1P4RzsrI6ktNZjr7OM8JVZBJAztrMj6vSXuryMUsTvhEHkY
 YJcBtV0zOYWV6PV4cTXHyUd/VQ==
X-Google-Smtp-Source: APiQypL+FHEDBtk6zd1EZND+1rWOLvFjGjy05fIVV+X1HKwQAax28zUwpf9w2/xAFM9nylW0/w1XRg==
X-Received: by 2002:a17:902:8647:: with SMTP id
 y7mr8684677plt.87.1587726714544; 
 Fri, 24 Apr 2020 04:11:54 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.186])
 by smtp.gmail.com with ESMTPSA id o11sm4637628pgd.58.2020.04.24.04.11.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 04:11:53 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Apr 2020 16:39:14 +0530
Message-Id: <1587726554-32018-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jRwFU-00CUAW-9O
Subject: [Kgdb-bugreport] [RFC Patch v1 4/4] arm64: kgdb: Round up cpus
 using IPI_CALL_NMI_FUNC
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

arm64 platforms with GICv3 or later supports pseudo NMIs which can be
leveraged to round up CPUs which are stuck in hard lockup state with
interrupts disabled that wouldn't be possible with a normal IPI.

So instead switch to round up CPUs using IPI_CALL_NMI_FUNC. And in
case a particular arm64 platform doesn't supports pseudo NMIs,
IPI_CALL_NMI_FUNC will act as a normal IPI which maintains existing
kgdb functionality.

Also, one thing to note here is that with CPUs running in NMI context,
kernel has special handling for printk() which involves CPU specific
buffers and defering printk() until exit from NMI context. But with kgdb
we don't want to defer printk() especially backtrace on corresponding
CPUs. So switch to normal printk() context instead prior to entering
kgdb context.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/kgdb.c | 15 +++++++++++++++
 arch/arm64/kernel/smp.c  | 17 ++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 4311992..0851ead 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -14,6 +14,7 @@
 #include <linux/kgdb.h>
 #include <linux/kprobes.h>
 #include <linux/sched/task_stack.h>
+#include <linux/smp.h>
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
@@ -353,3 +354,17 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+#ifdef CONFIG_SMP
+void kgdb_roundup_cpus(void)
+{
+	struct cpumask mask;
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
+	if (cpumask_empty(&mask))
+		return;
+
+	arch_send_call_nmi_func_ipi_mask(&mask);
+}
+#endif
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 27c8ee1..c7158f6e8 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -31,6 +31,7 @@
 #include <linux/of.h>
 #include <linux/irq_work.h>
 #include <linux/kexec.h>
+#include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 
 #include <asm/alternative.h>
@@ -976,9 +977,19 @@ void handle_IPI(int ipinr, struct pt_regs *regs)
 		/* Handle it as a normal interrupt if not in NMI context */
 		if (!in_nmi())
 			irq_enter();
-
-		/* nop, IPI handlers for special features can be added here. */
-
+#ifdef CONFIG_KGDB
+		if (atomic_read(&kgdb_active) != -1) {
+			/*
+			 * For kgdb to work properly, we need printk to operate
+			 * in normal context.
+			 */
+			if (in_nmi())
+				printk_nmi_exit();
+			kgdb_nmicallback(raw_smp_processor_id(), regs);
+			if (in_nmi())
+				printk_nmi_enter();
+		}
+#endif
 		if (!in_nmi())
 			irq_exit();
 		break;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
