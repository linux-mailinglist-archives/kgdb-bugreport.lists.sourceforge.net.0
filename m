Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 886276E85D3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:22:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppH8Q-0000io-EX
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:22:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppH8P-0000ii-1N
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I4TtHmnmxTTT3fwHdqQt/qizkftz4ebAquvrklnKCnk=; b=VOpGVE2n3LmaZe6yRrJHNKK/1N
 GVPyO8ddfv7PPmBZKpc4C2Eehk8zRPVpopolNDtiWETE4+MRqW1Ki9psLk5kB9jO8Hj7B6BtUDmph
 ZrFj1omx5hl2tEsNgm0Ow7kn1eUTZLBeEVzpJoL+8M7blHSqY61ooN51wjOVDJij7c5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I4TtHmnmxTTT3fwHdqQt/qizkftz4ebAquvrklnKCnk=; b=A9x1Onnb9OKNq45B3spPe7ka7R
 dVHhG0ielyPriodd9qCC115I2EaFpFHEcNsRV0XyrSUbiz+2vkev3OO+x0gjjYPmi+LlfHoT8XSUl
 q0QGuwxkqiy1oB96iE5/hNBDHmFv4LhDTGVn0F5bmgSCSUlUFjmy3QH/G7Z+v1SGzaxY=;
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppH8P-00D6o6-D9 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:22:45 +0000
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-760f5070ccfso41856639f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681946559; x=1684538559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4TtHmnmxTTT3fwHdqQt/qizkftz4ebAquvrklnKCnk=;
 b=WFJQ/Gkdf8PDb20mDAwhfn1b660oZklLz70M4gbS/36NX9EkCYYw4lQOR1+46XGCXD
 OSoXe3b0rg2vCHOYeT32EbdsQz6osH9TxolyX9Jxo2+keoL8DOqwGihUlbBYwdBTzA6s
 gdIIbFNmkWlftqi/rKxWCJ32MAVSl2shcG/G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946559; x=1684538559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4TtHmnmxTTT3fwHdqQt/qizkftz4ebAquvrklnKCnk=;
 b=JyChPthh+Redpp8S2GZ9ZHZFLiqLqykFfYxpU+ixmvZyuhj/QaPt/v4U7aQ0MCtly4
 nIUuzZas9bGYxMdv9iNEmoTl1Y+JPif/aRO1Dgh/jZ6H8HMHEzfKu+40KPwZv+wHpXmT
 t4Gtfi03aDTrrQORLt8wegJyr5M6uiiCAYwg2RkEUStXSbCFEB7HEEgKm1AVaIkaS/8+
 cZ9WR5KMGfi5LwMs9w6x6vlOCIc9vL98nBzwj3qZzFJMHM3/OyOt9KiU3j6Y0Mx6nxjV
 s8vpLuLTfLxpXtZMqNmGnwrXEvuWs1s9cp0gVmerTl6aJPLZcApPmdgRQJtX0KcGwwiS
 fBrQ==
X-Gm-Message-State: AAQBX9eKP3mMcRe72MA+lnoXsswzkZ1Zuh9pc0mPSXShUJr1sED5UkL4
 p4r01lCF7kRrk2Srh6CfaSClO8DkYSInYLIWorg=
X-Google-Smtp-Source: AKy350b31hKFXuPuDEwurP1haUg/kmKABno9CTcx0NTyRaIS7gBQqk+Fl95MtSp5XkH6F/eDr8jp1Q==
X-Received: by 2002:a17:90a:72c8:b0:246:9bad:2354 with SMTP id
 l8-20020a17090a72c800b002469bad2354mr4196693pjk.43.1681945025926; 
 Wed, 19 Apr 2023 15:57:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:55:57 -0700
Message-ID: <20230419155341.v8.3.I6d7f7d5fa0aa293c8c3374194947254b93114d37@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sumit Garg <sumit.garg@linaro.org> Assign an unused
 IPI which can be turned as NMI using ipi_nmi framework. Also,
 invoke corresponding
 dynamic IPI setup/teardown APIs. Signed-off-by: Sumit Garg
 <sumit.garg@linaro.org>
 Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com> Tested-by: Chen-Yu
 Tsai <wens@csie.org> Signed-off-by: Douglas Anderson <dianders@chromium.org
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.47 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppH8P-00D6o6-D9
Subject: [Kgdb-bugreport] [PATCH v8 03/10] arm64: smp: Assign and setup an
 IPI as NMI
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
 Pierre Gondois <Pierre.Gondois@arm.com>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Assign an unused IPI which can be turned as NMI using ipi_nmi framework.
Also, invoke corresponding dynamic IPI setup/teardown APIs.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Tested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param

 arch/arm64/kernel/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 4e8327264255..94ff063527c6 100644
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
@@ -938,6 +939,8 @@ static void ipi_setup(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		enable_percpu_irq(ipi_irq_base + i, 0);
+
+	dynamic_ipi_setup();
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -950,6 +953,8 @@ static void ipi_teardown(int cpu)
 
 	for (i = 0; i < nr_ipi; i++)
 		disable_percpu_irq(ipi_irq_base + i);
+
+	dynamic_ipi_teardown();
 }
 #endif
 
@@ -971,6 +976,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
 		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
 	}
 
+	if (n > nr_ipi)
+		set_smp_dynamic_ipi(ipi_base + nr_ipi);
+
 	ipi_irq_base = ipi_base;
 
 	/* Setup the boot CPU immediately */
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
