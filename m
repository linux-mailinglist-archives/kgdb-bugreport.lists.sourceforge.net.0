Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B028E013
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Oct 2020 13:54:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSfMv-00065e-Ji
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Oct 2020 11:54:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kSeqj-0007n2-4W
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EUkHDvfGVE/Mcc9y3ck7YoAw/1fhaX3NtNSY/g0jhfY=; b=Wyhv3d2fW3kQsAJBh9+gxAfVsP
 03W802sn07bg67Ma2Gu8LFcxytm1fm/tiG6pZ5+mz7DaPgiTVQ7rJElNvrH77cPPHVrTxZpaWAKAw
 T9NswDCtTp1PYvYnGAkHMdIe7K0+gAnv+kHAdYOY+lZb50f7DD92t8Athl8IukipDFLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EUkHDvfGVE/Mcc9y3ck7YoAw/1fhaX3NtNSY/g0jhfY=; b=dLywwZS9e7v+dJziyJxOxaWtk/
 lByBQoZE7TjZPLzr1QhmXQ2DAsLmR6uTfipL0ojEYrzHZ62wYM2UwnudJCUCt+J5UIOEBm5adecUu
 tL5qWLuVI2xtqANJmgNHTpNZQGVhfitbl2fnqM7WAx/V5BAe+dWRXMpSHyYP7cEZt3kU=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSeqf-00F5nm-4W
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:21:41 +0000
Received: by mail-oi1-f195.google.com with SMTP id w141so2862747oia.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EUkHDvfGVE/Mcc9y3ck7YoAw/1fhaX3NtNSY/g0jhfY=;
 b=FYmcxhvH0YuLvemO1AyMtpefAmnRpXGpQXtcK0AOZ7sP5KXApkDaiAxscIbi25/JS7
 oub8Nuu9A7q/RCNQ4DsUKWc+34EOV/1Eekj5w/Oxz5qL3/jAJjrpVCKWi8dCbv6jVjo/
 3loFSiCsh4GLzrebFVrFKst9Afli9pXjJ7VsPDNN/L/6oSpaWDtwSHxhGKl3D9l6HLLV
 ruPFCUKH/09wjzTZn+a2Z0CpJy0lxl6UnKDYkRPE7TRtWvgBMKFB4K8k7pKeFDLz7Len
 R4887268UA0WpU6UxYBP5N99gQrZHa96GMl6+Jy7F88LVtmVll9z5F384pI/oSbI+7mZ
 xecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EUkHDvfGVE/Mcc9y3ck7YoAw/1fhaX3NtNSY/g0jhfY=;
 b=h5bIsZ6rHkQeUaJWtJsBVVWppzt1szmuKu0Kos8/3a6P0BCOgFTyonih7YRHE2RT0W
 6jmwxdWriZ322DULuFjr2ZLZuHaTxB7/sFXYQ+GtEUzBMCqAjSStVIkXOfhAU1Gek2C8
 aQ2SZ7r2t0YdIkKAkD9BYT6XmIumj8fG4x5fs7lxnyde/I+on+/gCKL9fyMymT4YCJbi
 S59tk79Cjo/nMYKMOgI8+MCCqhRcSgjf2Kp8ftzZxNKlATim3WK0scgOcYPXvTv1dwM6
 L5Fgp8IfGHZxa8OfqlSLPxODA4yUm4U30QH3jqjzIIFRpAhYqPhXWGgIzhRVbcMs/8vu
 WX5Q==
X-Gm-Message-State: AOAM533mgaUTfJH3QLBPMncLYzQjcEIk3Xg7Ig4gMinQylL8/eoOgo0Q
 n3VClPRosJ4mRf5mUbEz/O+veajkkWkEmpNr
X-Google-Smtp-Source: ABdhPJw/CZvq+k4z2trU3PIw1LtcMHYqbyozAmkwTA7XP6H6ZXN05RSuiZF6PfflggOwwVnj6abBpQ==
X-Received: by 2002:a17:90b:305:: with SMTP id
 ay5mr3083885pjb.129.1602673984880; 
 Wed, 14 Oct 2020 04:13:04 -0700 (PDT)
Received: from localhost.localdomain ([117.252.65.235])
 by smtp.gmail.com with ESMTPSA id f21sm3060102pfk.169.2020.10.14.04.12.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:13:04 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Wed, 14 Oct 2020 16:42:09 +0530
Message-Id: <1602673931-28782-4-git-send-email-sumit.garg@linaro.org>
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
X-Headers-End: 1kSeqf-00F5nm-4W
Subject: [Kgdb-bugreport] [PATCH v5 3/5] arm64: smp: Allocate and setup IPI
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
 kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, tglx@linutronix.de, msys.mizuma@gmail.com,
 julien.thierry.kdev@gmail.com
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
index 82e75fc..129ebfb 100644
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
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		disable_percpu_irq(ipi_irq_base + i);
+
+	ipi_nmi_teardown(cpu);
 }
 #endif
 
@@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
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
