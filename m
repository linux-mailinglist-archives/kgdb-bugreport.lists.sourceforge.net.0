Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E612029EF16
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 16:03:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9Sy-00014N-Mr
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 15:03:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9Sx-000144-C2
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=; b=A3Qm8fQJHo7Bgx4G50ZqGvWRXq
 vl4U3FF8ijLN3D4l0bzTCyplexjG+LSrC5X7Qr9kPHqs5G5wYlcy+TxfkKco6xh9pEZnf62oQYNwS
 GUR/952aBCMXebJHTS4kNABIOpIY973MoGHMQUpP88fG1+5pPCRoJAQjUYWzLlNAIV5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=; b=Q7eLX7XKwfSuPqeOYFB5TfMPuz
 T0RttzCIdSm3MgLNRXZSBRjPMo9OARSY1Luwm5IF5leDe9/55LqVCV7a4uTJ/cwWjbyZ4oQLNStnK
 y3oChNUMJ4LBRqr8VKbHao1IX2cE/UGiMJfQiPrq72BBu/htA7hoYkMm8gR3TOoSd3tE=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9Ss-00Bgik-0L
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:03:51 +0000
Received: by mail-pg1-f194.google.com with SMTP id t14so2579468pgg.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=;
 b=I5prQNYU5tqab1IAfmZ0Npzyxgasjwchz+CCyq076+/YxECJ9irL5REQHWRDrYdShV
 jM2Y9CHbIKhcjSTBzw49Xd7cj0kjYmyK6qSFFodBZuF0Vw/gVdCgm2pRnigrLwoaikAM
 NfPhzzzlvNCLa6OnTOdYnw7RyWOUzfu5Xaj5f9LVIb3Kea34JJqKoDVQwQzZDIiBfxvg
 hbK3AjBepCXhJ+bQPSwLFS9LeRaGFvViqvSWt4d0+hWKSKdGYSM06UStkCFRe22FTcL3
 jWEwctUzQpa7fU1nexbrqOK4C0QbYl1lx2kdPLoTUaKtFJIQjZeJCKZrav9GONuYdtTv
 Jjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MUHxFreF4fdTU7bboIWPPhRLi/D8nJxSl4ZDICONfD4=;
 b=l/70kPd2itT3jnt/D1IkUsVGX3o6lGCtyYXHjcRhnSjiEmPYPVyntsbdnPhH+0qWtT
 hLCIDa9LpmT9jti9ho85zPSXUDRtaUylqDZhcFVcf2pJ9K+/9MJvGTedDd2rSzbbN/8H
 ph6l42sSHrjhJKrpUYnwx00tGldm9ZPlMJCNjT0JLjAX04mvt+0aOHkARErm01yMh8RA
 kv+OmoAXrS4yO5ncLLmlPx5FoEwtobdU0Ev069jwecDGe11/oNuQyqfE04x27BFXvTI6
 tRS28jReZ6zPNUL5MTwJVQYLmJNqmT1709nxYEzBiX7gO2m4RnVR7wM04ltORN76yTA9
 QAyg==
X-Gm-Message-State: AOAM533XWs8ciqxs8jLmsMOHVl+w+sa2Jgg1Og00NY79kQya1EATbG+T
 /oS2rNZC7XlsdciVafkh7ubuS5btIETESQ==
X-Google-Smtp-Source: ABdhPJwqp0xpo/eiBJyVtR3vcK/b8J0sVo6R8J+CU3LZlp/xmNnniW8nrAxtjB/bf7UgrPh+AotL+w==
X-Received: by 2002:a17:902:7d89:b029:d5:cfb6:e44 with SMTP id
 a9-20020a1709027d89b02900d5cfb60e44mr4658355plm.28.1603983513751; 
 Thu, 29 Oct 2020 07:58:33 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.58.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:58:33 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:23 +0530
Message-Id: <1603983387-8738-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.71.231 listed in dnsbl.sorbs.net]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kY9Ss-00Bgik-0L
Subject: [Kgdb-bugreport] [PATCH v6 3/7] arm64: smp: Assign and setup an IPI
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 mpe@ellerman.id.au, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 bp@alien8.de, julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Assign an unused IPI which can be turned as NMI using ipi_nmi framework.
Also, invoke corresponding dynamic IPI setup/teardown APIs.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 82e75fc..2e118e2 100644
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
+	dynamic_ipi_setup(cpu);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		disable_percpu_irq(ipi_irq_base + i);
+
+	dynamic_ipi_teardown(cpu);
 }
 #endif
 
@@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
 	}
 
+	if (n > nr_ipi)
+		set_smp_dynamic_ipi(ipi_base + nr_ipi);
+
 	ipi_irq_base = ipi_base;
 
 	/* Setup the boot CPU immediately */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
