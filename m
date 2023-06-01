Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050171F4D9
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pz0-0003gA-HA
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pyx-0003g2-W6
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KFbc1DnTsptgPHbVgbrtLnQoZRYq2p52Sq+V7Mil0Po=; b=mqhSWo7eXFl5Ie7hXQ9UJt5sZo
 6iMQffHTcfRWUmrUeLc5rTtYHte1muENEiD3L3ewboif+YlYaA8KJ5W2J4FPPXUzKfbxyMxFMzPBi
 GdmS0CkwchNgwMI2o8HkIcnLU1dW5TL1OR/IY2tlpWoy8Br0ghCpnmIw7WB47iwVa124=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KFbc1DnTsptgPHbVgbrtLnQoZRYq2p52Sq+V7Mil0Po=; b=dmXD5PK7T4oNuUwCbSV2iLjxF0
 dUt9GHRMzFo2F2iKEu8EwcTByKiOJy6sMPMt6kXYBl1GzTEroD6GBNBsVdc4gZWhj/B4DQhMFhwx1
 sSUkIehPljbU/8nyy88NOiYrPEhozzQaZqkYjytbOYKGeFxxhH/3IacjmVEBWywh5rZg=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pyx-008k4K-Tj for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:20 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-64d3bc502ddso1698578b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655434; x=1688247434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFbc1DnTsptgPHbVgbrtLnQoZRYq2p52Sq+V7Mil0Po=;
 b=Y+IRG40LZKw0u4RWejoPo9t2VThioi9WMya6GxurCgZXecIGTCiWNYFwet6YeXaBL1
 s6e2+jx6ksC3geJ2joOYMSft3G8UQ2LyzodMjp70BrhkADj72DmV4KOC7eg1PWGkJS7W
 bhnuM4cF9tMcOEK2gfzpuj7nrcaJZqp/6IeD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655434; x=1688247434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KFbc1DnTsptgPHbVgbrtLnQoZRYq2p52Sq+V7Mil0Po=;
 b=PpUgcjHKz0c/BZj96RxUkeL3t0sN8Zb/iqh8EKNYVGTQVzS2/DhQYTKiVdxfRDPOym
 6SUbaWjdr7klNuNCvpVYOtAB/ZeUQHcs4oCE8+J5z9VajlgZmYeSGC5XssKP+CvPPSJz
 oV7ubb1hQE9w05bPfsWyBmgnhrl/vn9fvV20WbOQQ9/hNayUyd9IIQWRSUIgblcb7ls1
 tCbcKUVr1dMODiI70WVd5SsFIsniCmgH7HvTL7sNLIHyj7sj6FF/TNLB3djdHY8klvUI
 HfEJ3eaIamK1wVWzyapIRQfevcqi8BzP2ngJyEg7GzQwkd5v4IJsDT8BX5WSCfPsWaZ8
 rPow==
X-Gm-Message-State: AC+VfDzPlh4yZ855NVB+juwciQooW4AiAZG/a40HA3stvI4XM+5uYAXW
 MtA7vS3zxTSROu7C6O6/3c+ODQ==
X-Google-Smtp-Source: ACHHUZ6rVQO/ue/4i8mO1Mux6x0NhxVI4bfPrl/BtKSwVXR51RsA4b7YL68gkPubx0VgpaYp2gyoBg==
X-Received: by 2002:a05:6a00:c89:b0:652:7b99:df30 with SMTP id
 a9-20020a056a000c8900b006527b99df30mr1613289pfv.25.1685655434352; 
 Thu, 01 Jun 2023 14:37:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:48 -0700
Message-ID: <20230601143109.v9.4.I6d7f7d5fa0aa293c8c3374194947254b93114d37@changeid>
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
In-Reply-To: <20230601213440.2488667-1-dianders@chromium.org>
References: <20230601213440.2488667-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sumit Garg <sumit.garg@linaro.org> All current arm64
 interrupt controllers have at least 8 IPIs. Currently we are only using 7
 of them on arm64. Let's use the 8th one as a debug IPI. This uses the new
 "debug IPI" infrastructure which w [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pyx-008k4K-Tj
Subject: [Kgdb-bugreport] [PATCH v9 4/7] arm64: smp: Assign and setup the
 debug IPI
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
Cc: Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

All current arm64 interrupt controllers have at least 8
IPIs. Currently we are only using 7 of them on arm64. Let's use the
8th one as a debug IPI. This uses the new "debug IPI" infrastructure
which will try to allocate this IPI as an NMI/pseudo NMI if possible.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I could imagine that people object to using up the last free IPI on
interrupt controllers with only 8 IPIs. However, it shouldn't be a big
deal. If we later need an extra IPI, it shouldn't be too hard to
combine some of the existing ones. Presumably we could just get rid of
the "crash stop" IPI and have the normal "stop" IPI do the crash if
"waiting_for_crash_ipi" is non-zero

Changes in v9:
- Add a warning if we don't have enough IPIs for the NMI IPI
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
- Update commit description

Changes in v8:
- debug_ipi_setup() and debug_ipi_teardown() no longer take cpu param

 arch/arm64/kernel/smp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index edd63894d61e..db019b49d3bd 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -53,6 +53,8 @@
 
 #include <trace/events/ipi.h>
 
+#include "ipi_debug.h"
+
 DEFINE_PER_CPU_READ_MOSTLY(int, cpu_number);
 EXPORT_PER_CPU_SYMBOL(cpu_number);
 
@@ -935,6 +937,8 @@ static void ipi_setup(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		enable_percpu_irq(ipi_irq_base + i, 0);
+
+	debug_ipi_setup();
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -947,6 +951,8 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		disable_percpu_irq(ipi_irq_base + i);
+
+	debug_ipi_teardown();
 }
 #endif
 
@@ -968,6 +974,11 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
 	}
 
+	if (n > nr_ipi)
+		set_smp_debug_ipi(ipi_base + nr_ipi);
+	else
+		WARN(1, "Not enough IPIs for NMI IPI\n");
+
 	ipi_irq_base = ipi_base;
 
 	/* Setup the boot CPU immediately */
-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
