Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1965C1B7346
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 13:38:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jRwf1-0008Kv-UI
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 11:38:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jRwev-0008KN-GA
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iZlX3qI3DOrQp2dXg0tXmAB1b4Jn5t/S/MWmmmiRunE=; b=T5yaAX8hVnXUHVdS+TnElIHNJs
 SECtzuAZXTM6fmHzKY6C4IQo+h9kOrzeaUQlbvJBstsovcTOIPb07xEWTGFypC+CqWNmk5CGD7NLq
 Fm6suh2zMdDsrp/bM0jvcSd/4HOFPpqxKVgZ5idocWVy7fTF4hJ9lth7UoXxRFGbZTQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iZlX3qI3DOrQp2dXg0tXmAB1b4Jn5t/S/MWmmmiRunE=; b=lwtJh9GR2OUBEYA/zis4fGWFn3
 Z+RKJ4o1B2FbxPQsmzZGwudjGWmunLHIvnpYbuacX+GwjkiRixgW0LB77MwRwd+wFQ4xKQvY+jTm5
 UiZB3uUXmvKlS1XyazM93gPjeecGYYAxOzXRujVgrv71t6RIHnaB6BrMM9Dm+oeSzNt4=;
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jRwes-00CVla-Nt
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 11:38:17 +0000
Received: by mail-ot1-f66.google.com with SMTP id i27so11779393ota.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iZlX3qI3DOrQp2dXg0tXmAB1b4Jn5t/S/MWmmmiRunE=;
 b=CVZnPFr9kE70O15FetLKinvjuz8SOPjO0QhwdMblhDxZ9Id5IeVNj7VVnd8hElz/sF
 AG1K68EzIIT1QBeciWSUX1tRXiBkRLrXW+yqqrS88Q6sUEI1yNOwrf9jdHlMJL8sehBB
 6w9hYV3EcVhFehuZslXH5yMUZpmA/rSNol6qhUtkJSqbWu7QnuGBnVXFNX8oq3vjXiqq
 kd8MHcAy6KgjwqLgbODiJn8IQ2GpMsYoXiQZu4MRPvC4xvN+hyEKyzG3SEazdUlxP9T6
 PC1SmBNgKCeGjDh+kQg7pNH9UeOwkWlYzVnNfmIxCFhb0BlVf4mAIGSwg7RU9spXUljF
 wDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iZlX3qI3DOrQp2dXg0tXmAB1b4Jn5t/S/MWmmmiRunE=;
 b=cTrafjcCPOqbucfDMZ+cgDlKSqEUqgWXM7gM9Lc6s/2jxLSA3A0xqQJcf2Athe1Q+R
 ZgmzpukherkFRnddznnwkeHUluxk8nGLmZJmdmbaNr6lP5Y0fCgDbwjDr+NnM16Fn75x
 Ab3kvYWc78sf2W1691i45+3eEyTXgfmghwvwdv5GtRAhfS46fAnQA4t5FHrFLHZqaErw
 UWSbVXK4lDlxZ3CAspTz7oVOXVLzW2h1gBVlIRxjTN2T2GgyMFwacz6MgACSYfKjxCJ3
 +vhn1iMzqKXAnFwovM3YiuUW6dpxGfxp3HdwNs2iqcZYdGAGRWWnSCcdTrIg+wEOTX/H
 1aIg==
X-Gm-Message-State: AGi0PubhI1Xt5FxoHocSoHY8TAF0OrY5YC93oekmPQaARgEOFX7HvF/y
 6yi9Sr7VAijBMVwmX8HktgDKljqEschtQg==
X-Google-Smtp-Source: APiQypIPAwj21VAG16p5qy62FUaJZAsNJzTP5WGLYMy0GUrRu2nsXVPQnqKsEw1+588tI2FpCpc0Hg==
X-Received: by 2002:a17:90a:d101:: with SMTP id l1mr5614004pju.1.1587726699499; 
 Fri, 24 Apr 2020 04:11:39 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.186])
 by smtp.gmail.com with ESMTPSA id o11sm4637628pgd.58.2020.04.24.04.11.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 04:11:38 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 24 Apr 2020 16:39:12 +0530
Message-Id: <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jRwes-00CVla-Nt
Subject: [Kgdb-bugreport] [RFC Patch v1 2/4] irqchip/gic-v3: Add support to
 handle SGI as pseudo NMI
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

With pseudo NMIs enabled, interrupt controller can be configured to
deliver SGI as a pseudo NMI. So add corresponding handling for SGIs.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/irqchip/irq-gic-v3.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index d7006ef..be361bf 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -609,17 +609,29 @@ static inline void gic_handle_nmi(u32 irqnr, struct pt_regs *regs)
 	if (irqs_enabled)
 		nmi_enter();
 
-	if (static_branch_likely(&supports_deactivate_key))
-		gic_write_eoir(irqnr);
 	/*
 	 * Leave the PSR.I bit set to prevent other NMIs to be
 	 * received while handling this one.
 	 * PSR.I will be restored when we ERET to the
 	 * interrupted context.
 	 */
-	err = handle_domain_nmi(gic_data.domain, irqnr, regs);
-	if (err)
-		gic_deactivate_unhandled(irqnr);
+	if (likely(irqnr > 15)) {
+		if (static_branch_likely(&supports_deactivate_key))
+			gic_write_eoir(irqnr);
+
+		err = handle_domain_nmi(gic_data.domain, irqnr, regs);
+		if (err)
+			gic_deactivate_unhandled(irqnr);
+	} else {
+		gic_write_eoir(irqnr);
+		if (static_branch_likely(&supports_deactivate_key))
+			gic_write_dir(irqnr);
+#ifdef CONFIG_SMP
+		handle_IPI(irqnr, regs);
+#else
+		WARN_ONCE(true, "Unexpected SGI received!\n");
+#endif
+	}
 
 	if (irqs_enabled)
 		nmi_exit();
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
