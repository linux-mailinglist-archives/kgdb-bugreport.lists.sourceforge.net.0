Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B71DB12D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 13:13:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbMez-00027o-Kr
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 11:13:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jbMey-00027Y-Ol
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZG9/oyco7B79XCj6TKIn88+qkDpSNwk8w2d1UWYERo0=; b=jcxZhhjj9J/qypala7JYTP96di
 bodOYbbLX3WXDYQN401RXIsQrPJKPWU6fqo2g2i1qwink9mrh3hmG9d4q4M1/oXhLxynaqX9/uHLp
 72WNmWN4oIZD30ppP5gF9RgyX1+EqK5ztLquqM3R3kBHL7m2hxtK3bU6lCwDorOM+UfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZG9/oyco7B79XCj6TKIn88+qkDpSNwk8w2d1UWYERo0=; b=RxffonsGDtWtXacOAKA2Og20fC
 rRGP7ITGBq8319NStP7cbYUQuscbeLy1C4BlBK1DjpeTTlbd+ieQY82Uo1NiTjpKvZUTxlEtspblk
 cbXvkBsGlkX2cZK4PTzkNjJmzT0614v7cRESr8egfDMrnv5sazpTwgq5SNbJ9eQRg/A8=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbMev-008tJO-3b
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:13:16 +0000
Received: by mail-pf1-f194.google.com with SMTP id n18so1401240pfa.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZG9/oyco7B79XCj6TKIn88+qkDpSNwk8w2d1UWYERo0=;
 b=pdAwNIlvROhiKpL/uEs/CC2blZgu9oXn0Cip5pIyL+nIKtHyciusiYEz1cZHlaoldy
 11bzJLJpdW3zY2XILih4rOtUwCCavUZFMs8eYp8a69jMGrEyovcPGuyMlNMwqRw/J0Nd
 sVGmw/B6Cu9iE1/8flZoqNa5DmIadUAAyYBR2UqNtvdvb/mUlDMknuK2bxsAotyaHJw7
 afeMaBCy/zcIeP6yN4vijo3dtNwFpDuQkl/EyXebZaW6ZH+d28yZT6+wVwxPG5azbPAK
 cAw/AutnoRZ7i1RjlCBe4Pt4M9KMv3aA0uWSM8hY2ouSd+5X/aDy2zXH6Lf5tYsAPZ/U
 HjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZG9/oyco7B79XCj6TKIn88+qkDpSNwk8w2d1UWYERo0=;
 b=eigFoT7qNLWbKS6Kv3nsCOMM4iSte63cQ/tiKWN6M3qtfE0V9zW5XovcA/JJYrjhHk
 oEu6MTeELvNbtrAN33S+aYAb0CLTv1JqrNGAuaKVdLg8SogVh3FeEXKQSidCwstmdJO6
 n5gzmkjIZ8sZJXZ8hOFCCxTqir6UAIkIsbXKFvw9piu/cckNVZVfpZ9CZxq4nw37ctVz
 0GsezTQGiD7O2SrITc4nBc7tkDhxWNjoVAKG9SfMmq+P2TNMAKr3YaM44UGRsB3bJ9No
 b+9DI0L0LWR/t1+s7gAqNA5WnX1zEKI0jKMPurcElyc01rggmi9Me4E7JVCdF9ymuWGc
 Fqfg==
X-Gm-Message-State: AOAM530r2MO8sfeSwDv/9MmX1inAur3q8ubSJBLU7TZNvtdc6+1SRFZC
 Hr1JeKPb28SRZPyCsMmzD4d40fU8oKM=
X-Google-Smtp-Source: ABdhPJyAXA8IR3qjB6XDW9mgUh5Gkt/Gfwj2utLLwP9UmxbL/P36lgEOjUZ0/LGMAYySKXzpGmJeRg==
X-Received: by 2002:a62:ee02:: with SMTP id e2mr3672825pfi.161.1589973187571; 
 Wed, 20 May 2020 04:13:07 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id q134sm2044974pfc.143.2020.05.20.04.13.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 04:13:06 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 20 May 2020 16:41:53 +0530
Message-Id: <1589973115-14757-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
References: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jbMev-008tJO-3b
Subject: [Kgdb-bugreport] [PATCH v2 2/4] irqchip/gic-v3: Enable support for
 SGIs to act as NMIs
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

Add support to handle SGIs as regular NMIs. As SGIs or IPIs defaults to a
special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
handler update in case of SGIs.

Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
as IRQs/NMIs happen as part of this routine.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/irqchip/irq-gic-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 82095b8..ceef63b 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -477,6 +477,11 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 	if (WARN_ON(gic_irq(d) >= 8192))
 		return -EINVAL;
 
+	if (get_intid_range(d) == SGI_RANGE) {
+		gic_irq_set_prio(d, GICD_INT_NMI_PRI);
+		return 0;
+	}
+
 	/* desc lock should already be held */
 	if (gic_irq_in_rdist(d)) {
 		u32 idx = gic_get_ppi_index(d);
@@ -514,6 +519,11 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 	if (WARN_ON(gic_irq(d) >= 8192))
 		return;
 
+	if (get_intid_range(d) == SGI_RANGE) {
+		gic_irq_set_prio(d, GICD_INT_DEF_PRI);
+		return;
+	}
+
 	/* desc lock should already be held */
 	if (gic_irq_in_rdist(d)) {
 		u32 idx = gic_get_ppi_index(d);
@@ -1675,6 +1685,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
 
 	gic_dist_init();
 	gic_cpu_init();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
@@ -1686,8 +1697,6 @@ static int __init gic_init_bases(void __iomem *dist_base,
 			gicv2m_init(handle, gic_data.domain);
 	}
 
-	gic_enable_nmi_support();
-
 	return 0;
 
 out_free:
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
