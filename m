Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE16E8613
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:52:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppHb4-0007qC-Hg
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:52:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppHb3-0007q6-0I
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E4z5GDt+xM87DteGPLwbziaQRjegx46K8N8SblpggcI=; b=LevCViFEMzVDZG4V7pJXQuHni8
 qHX8dLRphHzZsP/GgdNt6hnP9IcHUPJ5059hWVsDBsWDb/EyE+bHSkk5OM7Z9kkqsO07PCKIb/xY/
 U87/TMyCSYly67t4nY2tEm+FWcra+OpsBO0AsQWQgAoR5z/Xvkwtx5C7dsw5eZCsOG7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E4z5GDt+xM87DteGPLwbziaQRjegx46K8N8SblpggcI=; b=fMmff/eqhMk2hFiiXCIG9A4YSM
 m3oRdLN3uTn+W5ydk6Un4fuKg8ZLr5SbDFKRlKH4ySOPOKqn/sh5aXv12nj8Xf8xrGuhcGsLSB3a3
 cojQ2A35T51HW+7yCZy5Dx0EaqIr4OkQuOlcMqxyPLFUTaewj35zR/2EltqtiOam81hs=;
Received: from mail-qt1-f169.google.com ([209.85.160.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppHay-00D8Jx-Nk for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:52:20 +0000
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-3ec3b9a9f4bso1007271cf.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681948331; x=1684540331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4z5GDt+xM87DteGPLwbziaQRjegx46K8N8SblpggcI=;
 b=GpJKOpdPQllESj7tWz2GxB9zuKlmEyHqXL4Z9Rw2qCHNr9eoywvOoQwqcftt6QUbkl
 R1a1YR5USLjW3W9oLhn8d6UHnW3cokiNyRnwsrBFshSLZ34937WJTxUldedMnJYi9sNH
 xAdspLWorM5CVQIiVeG4sfdk9VZAp6/II+alI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681948331; x=1684540331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4z5GDt+xM87DteGPLwbziaQRjegx46K8N8SblpggcI=;
 b=imajB+dIs++PIBxs3LG5LsgxLXX8eCnUVknGr6BYwYuAp1fJmveIaXmuWczLwfbln5
 EWE/bMGR22Z+KGtxRsEq/tDLfUD4Y0ZInLlW8hKIo1GM6p9GF67bk6e7PrLpuuO/ontD
 6kpr1GYXOXr8c/pYDFa0tVPGGRGjaNlG4eZXwai8xeV3xidnk8LixMNSPBACk5zb282f
 NZTjUaAD0vNZP3wb37mpEFTi6ybgEc67g+m9Cft44UzFf//oKQj/5bLNrsFUcNx1LuAf
 65j6rLFICtlAvzmnfFN9ApTAQi0jboyMIpe3L9BDdCPSot/ZwCN/V861Urvs+RGBN2kh
 tSDw==
X-Gm-Message-State: AAQBX9cd0dTHDxCagsK6OMOQQ5Q357WXvxj2aH8YQPDNe6TP7qf0SNzt
 7wFwEWg0pbXqnSBfAqbHDWUxOM0/KrxMYkABIUQ=
X-Google-Smtp-Source: AKy350aIOHfPbowBDglSQr5Ur+c9Q9vdVJvKvaRSc+zSrfA52Pfz++ZHTr6h2HiJKmK6NXRBfzJ5NQ==
X-Received: by 2002:a17:90a:5a82:b0:23f:83de:7e4a with SMTP id
 n2-20020a17090a5a8200b0023f83de7e4amr4268789pji.7.1681945044116; 
 Wed, 19 Apr 2023 15:57:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:56:04 -0700
Message-ID: <20230419155341.v8.10.Ic3659997d6243139d0522fc3afcdfd88d7a5f030@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The current ipi_nmi implementation relies on the arm64
 pseudo-NMI
 support. This needs to be enabled in both the kernel config with
 CONFIG_ARM64_PSEUDO_NMI
 and on the kernel command line with "irqchip. [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.169 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppHay-00D8Jx-Nk
Subject: [Kgdb-bugreport] [PATCH v8 10/10] arm64: ipi_nmi: Fallback to a
 regular IPI if NMI isn't enabled
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The current ipi_nmi implementation relies on the arm64 pseudo-NMI
support. This needs to be enabled in both the kernel config with
CONFIG_ARM64_PSEUDO_NMI and on the kernel command line with
"irqchip.gicv3_pseudo_nmi=1".

Let's add a fallback of using a regular IPI if the NMI isn't
enabled. The fallback mechanism of using a regular IPI matches what
arm32 does all the time since there is no NMI there.

The reason for doing this is to make the trigger_all_cpu_backtrace()
class of functions work. While those functions all return a bool
indicating that the caller should try a fallback upon failure, an
inspection of the callers shows that nearly nobody implements a
fallback. It's better to at least provide something here.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I dunno what people think of this patch. If it's great, we could
actually drop some of the patches out of this series since some of
them are to account for the fact that we might not be able to register
an "ipi_nmi". If it's awful, it could simply be dropped.

Changes in v8:
- "Fallback to a regular IPI if NMI isn't enabled" new for v8

 arch/arm64/kernel/ipi_nmi.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index 2adaaf1519e5..02868752845c 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -16,6 +16,7 @@
 
 static struct irq_desc *ipi_nmi_desc __read_mostly;
 static int ipi_nmi_id __read_mostly;
+static bool is_nmi;
 
 bool arm64_supports_nmi(void)
 {
@@ -62,8 +63,12 @@ void dynamic_ipi_setup(void)
 	if (!ipi_nmi_desc)
 		return;
 
-	if (!prepare_percpu_nmi(ipi_nmi_id))
-		enable_percpu_nmi(ipi_nmi_id, IRQ_TYPE_NONE);
+	if (is_nmi) {
+		if (!prepare_percpu_nmi(ipi_nmi_id))
+			enable_percpu_nmi(ipi_nmi_id, IRQ_TYPE_NONE);
+	} else {
+		enable_percpu_irq(ipi_nmi_id, IRQ_TYPE_NONE);
+	}
 }
 
 void dynamic_ipi_teardown(void)
@@ -71,14 +76,28 @@ void dynamic_ipi_teardown(void)
 	if (!ipi_nmi_desc)
 		return;
 
-	disable_percpu_nmi(ipi_nmi_id);
-	teardown_percpu_nmi(ipi_nmi_id);
+	if (is_nmi) {
+		disable_percpu_nmi(ipi_nmi_id);
+		teardown_percpu_nmi(ipi_nmi_id);
+	} else {
+		disable_percpu_irq(ipi_nmi_id);
+	}
 }
 
 void __init set_smp_dynamic_ipi(int ipi)
 {
+	int err;
+
 	if (!request_percpu_nmi(ipi, ipi_nmi_handler, "IPI", &cpu_number)) {
-		ipi_nmi_desc = irq_to_desc(ipi);
-		ipi_nmi_id = ipi;
+		is_nmi = true;
+	} else {
+		err = request_percpu_irq(ipi, ipi_nmi_handler, "IPI", &cpu_number);
+		if (WARN_ON(err))
+			return;
+
+		irq_set_status_flags(ipi, IRQ_HIDDEN);
 	}
+
+	ipi_nmi_desc = irq_to_desc(ipi);
+	ipi_nmi_id = ipi;
 }
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
