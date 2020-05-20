Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2741DB12F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 13:13:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbMfI-0003wg-0T
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 11:13:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jbMfG-0003wU-3c
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L4VlC3w2vGN2vXDu2vdOxtfNJ1ZDmhnMu1C9iDb4k5Q=; b=GvKNDQg/Pm+jzwpDvGMUbvfhHx
 EOU+plEWnu4IA7sXJdGkFgZKVJ16vqFIGhfKlvpOg4Q9ooAF9OO8p7oJIBOyE/mrGkwYe6LBwt4oo
 1FOgS+3Vvf0s1T+2ebFzz3Lh6OKY3ftro+Gv2m9bi+JoBTlzzNApmqAX3SwxDDwo8zIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L4VlC3w2vGN2vXDu2vdOxtfNJ1ZDmhnMu1C9iDb4k5Q=; b=iBLyyRHz8Fi8T+zLHhWNrTuln7
 CGau9P6CvQLV9EJNSBRmGUAispNBmHbqCcxYXt++TRkwRRAYA5UEnudQCSA+XxjIZRU/1zTWASTdz
 VSJnKNh67Jn+gjvrkUg96fZtqJTPT5XZOaK0KctC2nIvEBlo6eRs3KIm8XngV+cKp8e4=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbMf9-00GXCF-JT
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:13:33 +0000
Received: by mail-pf1-f196.google.com with SMTP id 145so1372549pfw.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L4VlC3w2vGN2vXDu2vdOxtfNJ1ZDmhnMu1C9iDb4k5Q=;
 b=qNl6HzvIrP8iK8PRiHj/zvYTJ4DNHplta8G2LBd6c7zrLo9i6ACDRVaLkd6wXoXCJB
 +Fuka+XhWtRFpeAoF054KBR5WugZjBOv8jYQKfvLaSICPXf9AP3Zltm4vXBY+oWnEfez
 J1s6wj0eGeX1s/UrjZsBUIjUJKuYkd4aznXtek3r9WIw3NWoXXiMxBgc5QUGuJIdRYTu
 +yD1LPTQQ6D1fOc6EZ1NjUvpkAa3wEo8qscsWG+J7LF8y7qEUCk6GeYvOEmLUuJ03SAi
 Bin0nIdV7vyudrOoQomqHhjsrl55+SCMPftq7nhExZAGFrnf1zxw64T90Necr5seGfNb
 D3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L4VlC3w2vGN2vXDu2vdOxtfNJ1ZDmhnMu1C9iDb4k5Q=;
 b=rVffzuWqb32ThViGLSJy3CoSDHP1W8YDLYJYfh1FCBlKQlJ0fmUvVpb79cv0oRCe7g
 TH2yEvvEDF9xjS/Bi2QezPiXz8byxqZTTvN2PLHm+NOrpRc69bC5/ZZZYzqdLY0xu24n
 Q8Gg98o6dHD7WcQkYxYnIYwSu5AwnDfnrdARixW1CzaLbUnGpcdgc3kdz2Is7/aeJqGm
 H0ZeKwgq3oVd0yGVxq3EX+JtpJDQTBYQLJ+blucQMP7HVQbcVLr+0Qbpmwb7MyeC9c2s
 yOlll7xiqNYabMbhqdLbC3C1uTdRnm8Xhau6jkI87goDeyVQ9s+dBG11Sun1vJuJ4aFM
 l/fA==
X-Gm-Message-State: AOAM533iqrdQPHrZU/aJdptvusOBWZd58YE0NouG3NpzWCMjeDpUY4ha
 BI2h0b6AuBRuAQk9us6KU+HQ4g==
X-Google-Smtp-Source: ABdhPJzFrj1psMvJysAYcuO/Cf5POOGdTZuwteJpZy4CrbC1e194avqYMKbaNslTxsDvhte0gChECQ==
X-Received: by 2002:a63:e60b:: with SMTP id g11mr3836980pgh.120.1589973194777; 
 Wed, 20 May 2020 04:13:14 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id q134sm2044974pfc.143.2020.05.20.04.13.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 04:13:13 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 20 May 2020 16:41:54 +0530
Message-Id: <1589973115-14757-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
References: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jbMf9-00GXCF-JT
Subject: [Kgdb-bugreport] [PATCH v2 3/4] arm64: smp: Setup IPI_CALL_NMI_FUNC
 as a pseudo NMI
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

Setup IPI_CALL_NMI_FUNC as a pseudo NMI using generic interrupt framework
APIs. In case a plarform doesn't provide support for pseudo NMIs, switch
back to IPI_CALL_NMI_FUNC being a normal interrupt.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/smp.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 236784e..c5e42a1 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -68,6 +68,7 @@ struct secondary_data secondary_data;
 int cpus_stuck_in_kernel;
 
 static int ipi_irq_base;
+static int ipi_nmi = -1;
 static int nr_ipi = NR_IPI;
 static struct irq_desc *ipi_desc[NR_IPI];
 
@@ -986,8 +987,14 @@ static void ipi_setup(int cpu)
 	if (ipi_irq_base) {
 		int i;
 
-		for (i = 0; i < nr_ipi; i++)
-			enable_percpu_irq(ipi_irq_base + i, 0);
+		for (i = 0; i < nr_ipi; i++) {
+			if (ipi_nmi == ipi_irq_base + i) {
+				if (!prepare_percpu_nmi(ipi_nmi))
+					enable_percpu_nmi(ipi_nmi, 0);
+			} else {
+				enable_percpu_irq(ipi_irq_base + i, 0);
+			}
+		}
 	}
 }
 
@@ -997,23 +1004,33 @@ static void ipi_teardown(int cpu)
 		int i;
 
 		for (i = 0; i < nr_ipi; i++)
-			disable_percpu_irq(ipi_irq_base + i);
+			if (ipi_nmi == ipi_irq_base + i) {
+				disable_percpu_nmi(ipi_nmi);
+				teardown_percpu_nmi(ipi_nmi);
+			} else {
+				disable_percpu_irq(ipi_irq_base + i);
+			}
 	}
 }
 
 void __init set_smp_ipi_range(int ipi_base, int n)
 {
-	int i;
+	int i, err;
 
 	WARN_ON(n < NR_IPI);
 	nr_ipi = min(n, NR_IPI);
 
-	for (i = 0; i < nr_ipi; i++) {
-		int err;
+	err = request_percpu_nmi(ipi_base + IPI_CALL_NMI_FUNC,
+				 ipi_handler, "IPI", &irq_stat);
+	if (!err)
+		ipi_nmi = ipi_base + IPI_CALL_NMI_FUNC;
 
-		err = request_percpu_irq(ipi_base + i, ipi_handler,
-					 "IPI", &irq_stat);
-		WARN_ON(err);
+	for (i = 0; i < nr_ipi; i++) {
+		if (ipi_base + i != ipi_nmi) {
+			err = request_percpu_irq(ipi_base + i, ipi_handler,
+						 "IPI", &irq_stat);
+			WARN_ON(err);
+		}
 
 		ipi_desc[i] = irq_to_desc(ipi_base + i);
 		irq_set_status_flags(ipi_base + i, IRQ_NO_ACCOUNTING);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
