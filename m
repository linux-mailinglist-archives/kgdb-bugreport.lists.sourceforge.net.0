Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651E1B72C4
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 13:12:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRwFS-00016H-Tt
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 11:11:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRwFR-000163-35
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxQ4o9PvJLeDXlCdKC6FnBvF+Rh/OB42QR1xOvGVmug=; b=XJyJyKWzll1pKNXGT1lbqi9uAT
 Zt0/VknkKim82ZgYJkgbv5styp36J1J4enk8zbvYDiEQKiy6w3YABfvU/ap2Ar621+HC1i9HZy4tS
 eJtlCNPE/0QmBOr+rfLCh5wZmXrpMRqBwMaK2RKVzt2dbsxtLN7WUcENgjyDbyKgKVwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VxQ4o9PvJLeDXlCdKC6FnBvF+Rh/OB42QR1xOvGVmug=; b=GxBM/DKx/u3/foq+gaLh9+nt9+
 85OrMlb+2ws2gtUFLehzx4sdSGqMqXs+/EK10Ypg+thvb5whXnZ5ZIuJwV6qMy0Szq4+0zX0JTQwq
 tMHuH5VR4VjaNQpQEemUqIZecSkahXxVRpRNp4bYoQGbz2yHAiFQtsTuFLLoHF5u0dNE=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRwFM-00Cib4-Nc
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:11:56 +0000
Received: by mail-pg1-f195.google.com with SMTP id s18so1810204pgl.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VxQ4o9PvJLeDXlCdKC6FnBvF+Rh/OB42QR1xOvGVmug=;
 b=YacZq7PZlYzawRE/JiR4rFErkePmBp3ThfIGiML8t+nhfJ0kt+oFtkRos1HE7c/4zM
 9jNUz/wb7GU1eHxtS4Qg6wF38dlfF6j7kM7V4Zm7PXK8tJL6Am8vbaImoAlhnfqg4jmJ
 GIXimV9vmSiTSuISRhnd4c1lvIPs4lOfv7oJO4IaCm5Xa/6PrUz6X97dC54BXanvgqOa
 ZfaRNIK7Sht6YUCwwj9ezBpg5CS0Y51cepH8ZiCazq0sdoZ1uCyiL1fzgRGVwjnPwHKJ
 g7MEvkNL1pv1CHsK2gOWkQx4if0WwWMILQaviXmVHfBjNenrJOgSgFm2aQjtmNc/SkHJ
 Zdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VxQ4o9PvJLeDXlCdKC6FnBvF+Rh/OB42QR1xOvGVmug=;
 b=EQLo8QCKE3Rig8fNZOncZjBR4Snx5oZV//NF9ovS+zdNO8ARonZh0qRhNaUC4EFmVx
 W6cwg8kthgnhMRHkZZYiTF6mVJtp2S8jWniOu7emtyraHpEvYLek8Wx+Y0Q+mS0R8Zb9
 onVBLKhGdoMeb8clrWaWbTZ27HCby1R0PDR1HJZpeYLq6hCMod/NQiCSPpIJP36nDtQQ
 kOQrDwaAs4jOAuWpGHywyFNfD6Az8LbCxcXRpDlQd7gaKjkFvHQYfC5dbrXAjfTeFBsV
 1iXZVlZPZjb+YZRqv/qtLBy3tXoLkR5I3/sbK/PGzSZrLmuGXWP6vtaOQ4ylJ5+ExO4P
 h97Q==
X-Gm-Message-State: AGi0PuasU3eaKrtj8s4bpaGPC0Zl4cniNL11+G6wLZwUSc+t/FIF2pJ+
 Zl6MzfjeaDtN+jJbKsPxoSAs3g==
X-Google-Smtp-Source: APiQypKsve8n7Z+70T9CcZrjuYG102mPugIIPPAH3Qu3Es+6cyhZhldMNasw9Iy9/gJxspU7QTFreA==
X-Received: by 2002:aa7:874f:: with SMTP id g15mr9462253pfo.45.1587726706941; 
 Fri, 24 Apr 2020 04:11:46 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.186])
 by smtp.gmail.com with ESMTPSA id o11sm4637628pgd.58.2020.04.24.04.11.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 04:11:46 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Apr 2020 16:39:13 +0530
Message-Id: <1587726554-32018-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jRwFM-00Cib4-Nc
Subject: [Kgdb-bugreport] [RFC Patch v1 3/4] irqchip/gic-v3: Enable arch
 specific IPI as pseudo NMI
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

Add support to mark arch specific IPI as pseudo NMI. Currently its used
to allows arm64 specific IPI_CALL_NMI_FUNC to be marked as pseudo NMI.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/smp.c      |  5 +++++
 drivers/irqchip/irq-gic-v3.c | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 42fe7bb..27c8ee1 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -802,6 +802,11 @@ static const char *ipi_types[NR_IPI] __tracepoint_string = {
 	S(IPI_CALL_NMI_FUNC, "NMI function call interrupts"),
 };
 
+int arch_get_ipinr_nmi(void)
+{
+	return IPI_CALL_NMI_FUNC;
+}
+
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 {
 	trace_ipi_raise(target, ipi_types[ipinr]);
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index be361bf..a3d2cf3 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1048,6 +1048,11 @@ static int gic_dist_supports_lpis(void)
 		!gicv3_nolpi);
 }
 
+int __weak arch_get_ipinr_nmi(void)
+{
+	return -1;
+}
+
 static void gic_cpu_init(void)
 {
 	void __iomem *rbase;
@@ -1072,6 +1077,15 @@ static void gic_cpu_init(void)
 
 	gic_cpu_config(rbase, gic_data.ppi_nr + 16, gic_redist_wait_for_rwp);
 
+	if (gic_supports_nmi()) {
+		int ipinr;
+
+		ipinr = arch_get_ipinr_nmi();
+		if (ipinr >= 0 && ipinr < 16)
+			writeb_relaxed(GICD_INT_NMI_PRI,
+				       rbase + GICD_IPRIORITYR + ipinr);
+	}
+
 	/* initialise system registers */
 	gic_cpu_sys_reg_init();
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
