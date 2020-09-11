Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBF26604C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Sep 2020 15:30:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kGj7m-0005VF-U2
	for lists+kgdb-bugreport@lfdr.de; Fri, 11 Sep 2020 13:29:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kGj7l-0005V8-Fx
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8XXWl4v9PBTaJqTU0LTHaO4yR2LTPizMFNymaqYIWU=; b=c4fvY/PI9OHfAO/JDW09qlwEns
 YT1Zcyc/BQ6BytftlZtxI1VLGOcOPDapd1tmD3R/Vcy2I+jey7Hb/IJ9ktVqLEloG1ImltwV7d5wr
 4BgpBJzxO0tE44kfBge7zwtW0h7z+IHHE5kgMSPx4p2TaTQydzwCloRacDIG0kALnVTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J8XXWl4v9PBTaJqTU0LTHaO4yR2LTPizMFNymaqYIWU=; b=byvGzulkwbGuFTDZCkdhK10NDr
 tOLFRbBKjKku7YDo70tK/bL2UGxwFfs29UCoQWUEi6Qlsq+OrRQiG7j8/Wic8nKAic7VqoPr7LrF2
 u6RPyf26L+23TY9KupP1ZLdvNU1NAAI+JCwAfY5JkUsYGK5o7b7nxPRrioVw+NFUy7qM=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGj7c-004URz-2u
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:29:57 +0000
Received: by mail-pg1-f193.google.com with SMTP id 34so6634332pgo.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 11 Sep 2020 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J8XXWl4v9PBTaJqTU0LTHaO4yR2LTPizMFNymaqYIWU=;
 b=oMLE8rM8iM22jHrw1tJVriGCJdRA1UU9284YM4yPrEVz8JGMXc468KKUHFkOv8kZaM
 IQntWXGwecrKYhSd3zKZekV9erPYLtHP2zh2m+vEJKSME1gs9vAzG2PduN7/i5AI59yy
 0txAVl3MJnpldlYdvFKDUWTEpnosfq1O51eVJtT97YcTYT28Ln+iIQbpO741qfgW0rtf
 xcOwz5P8xsckuDs+y/C97e/Np1ciQuyhzZmKh2cDDh88U5kG0pjFoYklwm7SACpSOI11
 4N+M6aUC/v72MEEGG7Zj4jGDZUl1daCgdXxJt4OgYItqqWGNOLZCLTJvL6d0OktecC/G
 svXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J8XXWl4v9PBTaJqTU0LTHaO4yR2LTPizMFNymaqYIWU=;
 b=df910dpCJLHTEnwQ58nsnxoQx+uKstiEyJ4izNE1P6sAYTlJn4DUWvN43DivCuVedG
 9VOYuO10ACSfEZpmLUuY79hF0iwKA9xmkbsyOCg8jL6J4Gsjgq7OquKaqBOHzVbZ54jr
 gVhi78wl+X3lsCu6XMxNSDG6WyyYznXCNm+T8HqStq8urkpOAYScWYSbcW/I4P1AKWsU
 V0fw5MEdGkOQL+NRpCVGkakvfTYwmoDqg0T87ZCa0jCs+/VlumKSmwp+KTL2Q2e3FOup
 eylgeHSxoQtBkyWNFfnZ3eaPFXLWuGiMpmSQtUsLKFKbxejydFUqEJQkTmPwdmQWVmaP
 wjBg==
X-Gm-Message-State: AOAM532XWUdgJ57gAxSbf2ku/QQe+FXViaZnfE/MvVj6nRmEiavbbHca
 61z0w4D4JWbrEPC8XK8vYyhE0A==
X-Google-Smtp-Source: ABdhPJw8LOM8mjmqzKYH9VAZAt/tSr5GGEC3yJjnUtjTsmmZ+TNtaich1KH/B6flKrFEBX4t5n1h7g==
X-Received: by 2002:a62:cfc5:0:b029:13e:d13d:a083 with SMTP id
 b188-20020a62cfc50000b029013ed13da083mr2213644pfg.26.1599830975328; 
 Fri, 11 Sep 2020 06:29:35 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.48])
 by smtp.gmail.com with ESMTPSA id e10sm557988pgb.45.2020.09.11.06.29.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:29:34 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Fri, 11 Sep 2020 18:58:43 +0530
Message-Id: <1599830924-13990-5-git-send-email-sumit.garg@linaro.org>
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
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kGj7c-004URz-2u
Subject: [Kgdb-bugreport] [PATCH v4 4/5] arm64: kgdb: Round up cpus using
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
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
index 355ef92..627bc11 100644
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
