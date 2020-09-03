Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF325C0FC
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 14:29:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDoN0-0001jD-By
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 12:29:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kDoMz-0001j7-Ij
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l42Sw4hGC87WjooQg2VTZSFCehZO9m9AdkULNCdGfhY=; b=R7FRN/wOw5WcvT59XCFgAF0tlu
 wf2UDDcOAB8HHxrzT84l6VpMSXOzWT5TY/lUQ8sQZxhiVGcvdT+X5lO56dSZcV8sSJl15pwhLASLm
 8BRv+PJPbnl39jUkGgApkw/JKqRFm6MmjyIaHpfil/kJiwtMk8ibjemywHr8Y9jgqh58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l42Sw4hGC87WjooQg2VTZSFCehZO9m9AdkULNCdGfhY=; b=Zz4Nao05QPzYvEoK0OBohIxeCY
 j65l5miOHKjmAf3uMp9fnqinkaVlFL8iAbb0tjSV+gnBp5SPYXvgMGW/r/smap5rUU5Orwig1EH6w
 O7lMe0iKTjrNhGD6jRhgkGbi0sDFlR2bNDQZ5QKbUiWRJy0RAccntlDnsE+FrePpAce4=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDoMq-00AVGe-5k
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:29:37 +0000
Received: by mail-pf1-f194.google.com with SMTP id d22so2212015pfn.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 03 Sep 2020 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l42Sw4hGC87WjooQg2VTZSFCehZO9m9AdkULNCdGfhY=;
 b=QQ94vAR9C6a51GpTGkrB1+xPpXfRafgvPa3tu6a+3G75SJXaTYLuJc+aYbErLcWfPr
 CucHQhF5l4BWTgM4UZBaXdBwO+8s55QNcM+2DJ92B86SADz7QZakpwkUXnwFHnL04xJR
 smJhScLAnqI38oNpr05jXEP03UuXB94dw1B1goqFZLPlwmWeZNgTVbv0kittkb9EuS61
 9Vu4GMgFj1p3zoMvDwBo1EDUY8JFsb2AScBfwOSCR32qSiq76EQjJYR4WmTCu5a6kdrG
 qcqRr57lm9R51EqFelU2ta3IbNgwRf2dWKoJDqzGSpKc0QH4zoncfhXeUayjhlOKr2CQ
 2Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l42Sw4hGC87WjooQg2VTZSFCehZO9m9AdkULNCdGfhY=;
 b=qXPYL2r7Zz5xnWU4m4Uj/Gq0354+6KEHuuSqY7me6ra+ub82atQAcMpfA4qyvrr/Lf
 /nTcPZN3kccKGs6CIsFId3ionANC3YWo4m49gFUeb2FTsM96+dgSzZ8Sfuu17dGIFplj
 tYNMitv3aKxFu+RyQ5pB++RYgTZV//Hbq+D2p3ph0q6+i33L2PHlEbNeEXaQX+j/Uy69
 zvO1ITcH+5/tttfOsNeA6mKdh97ZEwTzSGnTGKM3EK5iGaAoHbQ4AW+jAj938q37NwIw
 AP2Qw3QRl0zM6eisU21Gu8Q+QIwXntECcCICtD0xAItISXjojsQLjnhfFxJ4vP4QXUAq
 7Oww==
X-Gm-Message-State: AOAM531trOJaT8UCFrLPJEUUWV+gHEVIBTjfqCJOmibNg5aAVtv0k5Hg
 DzFAwCpJzyno8LJx0ompG1MYS6Sptb+Mbw==
X-Google-Smtp-Source: ABdhPJwA8w/V9i9vrKKv3vQBxhzDj1BOn4fq9KGcKRyand8nMjBomLB0bAwwW8ejG7VaZ6lBdtyH9Q==
X-Received: by 2002:a63:ce56:: with SMTP id r22mr2749565pgi.141.1599134763468; 
 Thu, 03 Sep 2020 05:06:03 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.248])
 by smtp.gmail.com with ESMTPSA id s1sm2922022pgh.47.2020.09.03.05.05.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:06:02 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu,  3 Sep 2020 17:35:11 +0530
Message-Id: <1599134712-30923-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
References: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kDoMq-00AVGe-5k
Subject: [Kgdb-bugreport] [PATCH v3 3/4] arm64: smp: Setup IPI_CALL_NMI_FUNC
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Setup IPI_CALL_NMI_FUNC as a pseudo NMI using generic interrupt framework
APIs. In case a plarform doesn't provide support for pseudo NMIs, switch
back to IPI_CALL_NMI_FUNC being a normal interrupt.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/smp.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1b4c07c..572f8f5 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -81,6 +81,7 @@ enum ipi_msg_type {
 static int ipi_irq_base __read_mostly;
 static int nr_ipi __read_mostly = NR_IPI;
 static struct irq_desc *ipi_desc[NR_IPI] __read_mostly;
+static int ipi_nmi = -1;
 
 static void ipi_setup(int cpu);
 static void ipi_teardown(int cpu);
@@ -971,8 +972,14 @@ static void ipi_setup(int cpu)
 	if (WARN_ON_ONCE(!ipi_irq_base))
 		return;
 
-	for (i = 0; i < nr_ipi; i++)
-		enable_percpu_irq(ipi_irq_base + i, 0);
+	for (i = 0; i < nr_ipi; i++) {
+		if (ipi_nmi == ipi_irq_base + i) {
+			if (!prepare_percpu_nmi(ipi_nmi))
+				enable_percpu_nmi(ipi_nmi, 0);
+		} else {
+			enable_percpu_irq(ipi_irq_base + i, 0);
+		}
+	}
 }
 
 static void ipi_teardown(int cpu)
@@ -982,23 +989,34 @@ static void ipi_teardown(int cpu)
 	if (WARN_ON_ONCE(!ipi_irq_base))
 		return;
 
-	for (i = 0; i < nr_ipi; i++)
-		disable_percpu_irq(ipi_irq_base + i);
+	for (i = 0; i < nr_ipi; i++) {
+		if (ipi_nmi == ipi_irq_base + i) {
+			disable_percpu_nmi(ipi_nmi);
+			teardown_percpu_nmi(ipi_nmi);
+		} else {
+			disable_percpu_irq(ipi_irq_base + i);
+		}
+	}
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
+				 ipi_handler, "IPI", &cpu_number);
+	if (!err)
+		ipi_nmi = ipi_base + IPI_CALL_NMI_FUNC;
 
-		err = request_percpu_irq(ipi_base + i, ipi_handler,
-					 "IPI", &cpu_number);
-		WARN_ON(err);
+	for (i = 0; i < nr_ipi; i++) {
+		if (ipi_base + i != ipi_nmi) {
+			err = request_percpu_irq(ipi_base + i, ipi_handler,
+						 "IPI", &cpu_number);
+			WARN_ON(err);
+		}
 
 		ipi_desc[i] = irq_to_desc(ipi_base + i);
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
