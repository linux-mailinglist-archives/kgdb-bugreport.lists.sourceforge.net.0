Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C07E728E014
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Oct 2020 13:54:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSfMv-00065T-Gz
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Oct 2020 11:54:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kSeqa-0007lE-AQ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yCAlxQYBAHJOM66Tl9XrWq4I3MFhx12/Jre9Tsla770=; b=Mtlc2VJwHZRatvtM4ZNRoczsDa
 zc6mQ6eZdLy1nGfwqzCiSWfEJ82tnm5nQbRDUU8tLuV7iXNLNfOLFg8EAlCqf0CEgTdFmLS5I9x8w
 1i521hD/JvF8V9T7R9LJyUEJiFsjKlYub7WIXo9Fb3RZStzug/Bhvw0vijA7WAHDlPnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yCAlxQYBAHJOM66Tl9XrWq4I3MFhx12/Jre9Tsla770=; b=KkDeOHKd9ELbilHjt69y0qjkq/
 +fF6K30q1xi17SmmQcN2creUO2F9VsxDMGeaODAwJt4wIzcN2s6jJthR9Y4m9uH/ZZi7JWcffT2Pu
 q/Jpiiz7Pp2gq7jyAhK9me/rntfj+8G7D0A0SSUHpOxr+P1GYPBioTR1jk9tPE1tjXA4=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSeqS-00F5mh-7y
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:21:32 +0000
Received: by mail-oi1-f195.google.com with SMTP id j7so2796034oie.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yCAlxQYBAHJOM66Tl9XrWq4I3MFhx12/Jre9Tsla770=;
 b=TEjlQZLOxzuYSMYwL++eUGhRQeAT+WtUpGlNQjNTx7NrlyXm35SSmALugfO79ZNY6u
 xSoMGpm0cxMlXIcTrPqj0GqHNV9tAUhnAq7sjvT4AsSzNCXaSS31YamqHgQ3Bwa1y9oK
 uMtjaTEKNr/As71Et4xDgFLc4awXt9vW4zqqTjGlC+9P2DF07ZBeeYaOWIotR8ku2k3c
 FY2SKWsbquGHtvBCfIDYBbIkI3wBDpdg4AKCi2XDOG1Ac7v8WSYT7/inOyhwhbxQDoZ1
 wy1XzW7cBX0HN6uhMwhA9vJPJd6itein5OGxtz11X70UbB1kkQsQKcPftYU2aCo/oW0F
 KioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yCAlxQYBAHJOM66Tl9XrWq4I3MFhx12/Jre9Tsla770=;
 b=J5GL4OXIkNW/mAN6zlVREE+8Pj9Fv/rwI23ANPkrBfT9s3f5FoKLAnfBd9NwCX3031
 AtaOf0Pu9FX4YJhotrhql1gXJUO4ioIxLfKu/Ihmld4URb8CUki9E3uo5hGe0nNyNSmp
 L2gqUrgUr3yIGywDwLJIOp6vGSpFLFk1ITpndR4WQoef/KG+rBXA8L/kXEJRRmWgAp8L
 EIeIun8RRzCSOPJMmyUGgh7N+g4oV53luo9eQTQ+dpujBRw5HT49KwKWb3Yrlxho50/7
 RxuPyuHyAuKeZyc8mRe3ewD9ksZVasRX0QB8G5SolQrPfEzzJdHb2OCegTMjqS9rKYUw
 3Y+w==
X-Gm-Message-State: AOAM533aERN8AK0B1XLfr6JAYnQ9+fUKiMqrH8bu4JvVntNizhiGGXjI
 3lQsbSQOngABHHbhLpVnsCfuz5TBihsMv/Ne
X-Google-Smtp-Source: ABdhPJwZgJCLnB0sYHZvmp2LbPzGTwbKFKenfSU6o+4rxDcwmkwakAExJItwc5kA+H/MrkRB0LpILg==
X-Received: by 2002:a17:90a:9504:: with SMTP id
 t4mr3171951pjo.82.1602673992891; 
 Wed, 14 Oct 2020 04:13:12 -0700 (PDT)
Received: from localhost.localdomain ([117.252.65.235])
 by smtp.gmail.com with ESMTPSA id f21sm3060102pfk.169.2020.10.14.04.13.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:13:11 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Wed, 14 Oct 2020 16:42:10 +0530
Message-Id: <1602673931-28782-5-git-send-email-sumit.garg@linaro.org>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kSeqS-00F5mh-7y
Subject: [Kgdb-bugreport] [PATCH v5 4/5] arm64: kgdb: Round up cpus using
 IPI as NMI
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

arm64 platforms with GICv3 or later supports pseudo NMIs which can be
leveraged to round up CPUs which are stuck in hard lockup state with
interrupts disabled that wouldn't be possible with a normal IPI.

So instead switch to round up CPUs using IPI turned as NMI. And in
case a particular arm64 platform doesn't supports pseudo NMIs,
this IPI will act as a normal IPI which maintains existing kgdb
functionality.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/kgdb.h |  8 ++++++++
 arch/arm64/kernel/ipi_nmi.c   |  5 ++++-
 arch/arm64/kernel/kgdb.c      | 21 +++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
index 21fc85e..6f3d3af 100644
--- a/arch/arm64/include/asm/kgdb.h
+++ b/arch/arm64/include/asm/kgdb.h
@@ -24,6 +24,14 @@ static inline void arch_kgdb_breakpoint(void)
 extern void kgdb_handle_bus_error(void);
 extern int kgdb_fault_expected;
 
+#ifdef CONFIG_KGDB
+extern void ipi_kgdb_nmicallback(int cpu, void *regs);
+#else
+static inline void ipi_kgdb_nmicallback(int cpu, void *regs)
+{
+}
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 /*
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index a959256..e0a9e03 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/kgdb.h>
 #include <linux/smp.h>
 
 #include <asm/nmi.h>
@@ -26,7 +27,9 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask)
 
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
-	/* nop, NMI handlers for special features can be added here. */
+	unsigned int cpu = smp_processor_id();
+
+	ipi_kgdb_nmicallback(cpu, get_irq_regs());
 
 	return IRQ_HANDLED;
 }
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 1a157ca3..0991275 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -17,6 +17,7 @@
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
+#include <asm/nmi.h>
 #include <asm/traps.h>
 
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
@@ -353,3 +354,23 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+void ipi_kgdb_nmicallback(int cpu, void *regs)
+{
+	if (atomic_read(&kgdb_active) != -1)
+		kgdb_nmicallback(cpu, regs);
+}
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
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
