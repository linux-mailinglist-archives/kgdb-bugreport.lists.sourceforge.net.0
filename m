Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D226604A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Sep 2020 15:29:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kGj7X-0002r1-Ah
	for lists+kgdb-bugreport@lfdr.de; Fri, 11 Sep 2020 13:29:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kGj7V-0002qZ-7X
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Borfb2c/AuKaxrPEvHGpc2ZkIkK0QqkS7G7OkbQVw6o=; b=csvC1VRjgmh2OXE4nVoZ5/Yuc/
 0lqOboHZ6qZ1QqCvkysrdFaPaIpXT7HUlq4Xpg07wtOBR/kEtXEX6+T58aDGx9QNxIEul8uI+RZ4i
 Gq9VvMuGnArrODCNnxLLXdefJ4/8/85CcB8LrgRqu/eHTQhI/eeY2lsE1MSf5CjZlg/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Borfb2c/AuKaxrPEvHGpc2ZkIkK0QqkS7G7OkbQVw6o=; b=d58e/HWy5w7bJdjbXUrihHsCvB
 QcIy5e68HxiDFIdxAy2Zr2c+w4nFdS3SRl8PYTeMPgXGjusuUeO4DvFdPHIi1VuoPCcDSBeN7rmFu
 9QBBIec89A7rDk1vzZHfqXDgTz1AIaIwKP7HDc2+goLBJ7eAt5BBXPPmmk13seezpPlQ=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGj7O-004Bsr-4N
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:29:41 +0000
Received: by mail-pf1-f193.google.com with SMTP id d9so7356138pfd.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 11 Sep 2020 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Borfb2c/AuKaxrPEvHGpc2ZkIkK0QqkS7G7OkbQVw6o=;
 b=jGOWZRFHUPusoZoYx87HUc0UdvWsBxz/6APZqblOC9XbCFv0ytJIfpKbUiqGR+qoBp
 OecjXlHzj+qtca8/4IwvdC6BImis+apETeuCYAtSsst/IzfSeJ9zBlJJOWLAZ8Q3b6pm
 yKHIP/rm3cGeLhNBMovZS3Ac8tjlfx5ca9yGhAwO+l3zo/53AazZkVt70xeUCA9FCju/
 EGMp/NOXqs0btZS4XhRbtqqwXskqCdE6JBpojPgaA7D1Dyl9f8kzzekwPx3+YC8LIm61
 J7tsBhGdMbL0TwkfjHVGE+2z6hAPvDArpTr24zfjOcqFOHryVEhD9n16KKxaEvvfXSfS
 0BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Borfb2c/AuKaxrPEvHGpc2ZkIkK0QqkS7G7OkbQVw6o=;
 b=VEbGKxOsKqJkvIxolL9bI26oZfI22nx1nosLZPaT/x8+AAHoBwHcHsvpdBdgk/yc7k
 CRhtDsSVWLj2E+N59bRsIcdu04FqbN69X6Q3QI53volRuYKypmpyCCzRt8MFiYONYgGd
 AC2Odq2oisOYZ5Z0WoUr1k9fvh4iO+ufmfLyXB/WXEXnySozAB7hX3CBth6KOtx4VIp/
 jxgBgPMHs8d5cIYsXJ8TQuQyq/EHF+fjck9T/5YAjbaednJkvJDIl+IjvZo+aufA5Vei
 6Cfm8m/Y1dOV16Nu+L4bDR+sPXiGKIJTacJ2AXVfUunXWHwcS0jH2CrITIANIXiZFwIK
 nFdQ==
X-Gm-Message-State: AOAM531BRaNtzgiydIvFvHChbKJmS1EI18sCSMCtKqjJASOninddfycF
 mPeO/YrfaWoIqsuKn+EGaGJyUg==
X-Google-Smtp-Source: ABdhPJxr9ACTHLE1mqe3DgZIxSLIMmNQF1fyLmvRkWYTYL0CQRvGUt3F8c0z0XSGcO/b1SJoc8A1AA==
X-Received: by 2002:a62:5244:: with SMTP id g65mr2133117pfb.132.1599830968549; 
 Fri, 11 Sep 2020 06:29:28 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.48])
 by smtp.gmail.com with ESMTPSA id e10sm557988pgb.45.2020.09.11.06.29.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:29:27 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Fri, 11 Sep 2020 18:58:42 +0530
Message-Id: <1599830924-13990-4-git-send-email-sumit.garg@linaro.org>
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
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kGj7O-004Bsr-4N
Subject: [Kgdb-bugreport] [PATCH v4 3/5] arm64: smp: Allocate and setup IPI
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Allocate an unused IPI that can be turned as NMI using ipi_nmi framework.
Also, invoke corresponding NMI setup/teardown APIs.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index b6bde26..3f3b1ff 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -43,6 +43,7 @@
 #include <asm/daifflags.h>
 #include <asm/kvm_mmu.h>
 #include <asm/mmu_context.h>
+#include <asm/nmi.h>
 #include <asm/numa.h>
 #include <asm/processor.h>
 #include <asm/smp_plat.h>
@@ -962,6 +963,8 @@ static void ipi_setup(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		enable_percpu_irq(ipi_irq_base + i, 0);
+
+	ipi_nmi_setup(cpu);
 }
 
 static void ipi_teardown(int cpu)
@@ -973,6 +976,8 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		disable_percpu_irq(ipi_irq_base + i);
+
+	ipi_nmi_teardown(cpu);
 }
 
 void __init set_smp_ipi_range(int ipi_base, int n)
@@ -993,6 +998,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
 	}
 
+	if (n > nr_ipi)
+		set_smp_ipi_nmi(ipi_base + nr_ipi);
+
 	ipi_irq_base = ipi_base;
 
 	/* Setup the boot CPU immediately */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
