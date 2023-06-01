Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299071F4DD
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pz4-00065c-3X
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pz1-00065M-Pu
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9zVBczE5O/mOGSjCuNx2rXBFKme8bX0ZhvLdtMhoiJw=; b=eGCkEA/BG+w9+wku9iL+/EHZnf
 A1OBK8ezcBnbz4qkvhLrmJ3o25wKR+UOSy+ZgEn4fDR3ueajg7KDhQvP0zs+RkvSW/MpSXU5ZZ+ZH
 ISLM9EnWc9sJ5j7CDX7YO9axYwlw0ssJYINsdqsGcvnA5orVJFyEFA609REOnmeiYowE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9zVBczE5O/mOGSjCuNx2rXBFKme8bX0ZhvLdtMhoiJw=; b=QOKyG3TkRK6E5eViZM85GZe1n+
 J5EymASHp+1XCsSW6Xag8qbxRMTFRvTPB2C5CJC4ZjfuCX6hjZjHdYZWWfEMC4ints8CCEyYEqOqB
 gytsY3WISeiv1CiSJUBAuq7X7vJiOPUkgTClgT3xfgd2LxwipBYu+EcWzDF1gf9XiqZE=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pz0-008k4N-4D for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:23 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-650c89c7e4fso1044377b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655436; x=1688247436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zVBczE5O/mOGSjCuNx2rXBFKme8bX0ZhvLdtMhoiJw=;
 b=gJtJ5FNgW645QFhWJrwgv+eoPxUDcKJjQ0xUeo56kyURgPks4SkoC2MQNDgXTtkZn7
 QpKWQwG1Ny/ElORyKFDpyWZbKE5bj+Wp8fgVBvS+d/n6lwbgm1qW/f/93p6MP2NY714A
 nlF2KzG2LMv/VRRI6kZ2Dt7zapyMsrojNB0GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655436; x=1688247436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zVBczE5O/mOGSjCuNx2rXBFKme8bX0ZhvLdtMhoiJw=;
 b=BZOMmqwIROBj/U0EvKN7oV2aGVN8HGMzWUlOGGCFvWknuzWnMPKbTKSeipOd5YN64h
 GxFMPTTWdOr1vBnqun6mBq6Azj/jHHb6E0uSqkv92kqZd/2PjetADb4P/I9V0oG+A0rL
 J/990FwLtXUAQVqbRxeRxUfWzbUgTrn7V594OdOSLwIq8HjC9nXvGVohPIJqMOVLkbCi
 hBF0q9yLCfZwZH68tAbPd6GXoSGolhy3Z9v/7zrTg+soG6679uDQPhx6rdAd/5hDkqJR
 J2x7C+FgbV6Ykm7UUsxcb7Mn9vCSy4ZwfbuXrJJ02/BQdURlTtGtvir3GAG18bIfDvUI
 scOQ==
X-Gm-Message-State: AC+VfDxgU5+bulbk5AvTxGbBTz65UDiLKiyj1pgcLgxaQina+VXxAZQN
 l6R1Oe+rQgc4KpnBbl/TW7dLug==
X-Google-Smtp-Source: ACHHUZ5+oSxNdbJJZmlNccaogK7aaVEwJBbdqRJ3q2/KAcjer9oPcCVCtZIErTbQBeOU2bnwefC/oQ==
X-Received: by 2002:a05:6a00:1797:b0:651:ce88:27f5 with SMTP id
 s23-20020a056a00179700b00651ce8827f5mr2208089pfg.13.1685655436495; 
 Thu, 01 Jun 2023 14:37:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:49 -0700
Message-ID: <20230601143109.v9.5.I65981105e1f62550b0316625dd1e599deaf9e1aa@changeid>
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
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Enable
 arch_trigger_cpumask_backtrace()
 support on arm64 using the new debug IPI. With this arm64 can now get
 backtraces
 in cases where callers of the trigger_xyz_backtrace() class of functions
 don't [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pz0-008k4N-4D
Subject: [Kgdb-bugreport] [PATCH v9 5/7] arm64: ipi_debug: Add support for
 backtrace using the debug IPI
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Enable arch_trigger_cpumask_backtrace() support on arm64 using the new
debug IPI. With this arm64 can now get backtraces in cases where
callers of the trigger_xyz_backtrace() class of functions don't check
the return code and implement a fallback. One example is
`kernel.softlockup_all_cpu_backtrace`. This also allows us to
backtrace hard locked up CPUs in cases where the debug IPI is backed
by an NMI (or pseudo NMI).

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v9:
- Added comments that we might not be using NMI always.
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
- arch_trigger_cpumask_backtrace() no longer returns bool

Changes in v8:
- Removed "#ifdef CONFIG_SMP" since arm64 is always SMP

 arch/arm64/include/asm/irq.h  |  3 +++
 arch/arm64/kernel/ipi_debug.c | 25 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index fac08e18bcd5..be2d103f316e 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -6,6 +6,9 @@
 
 #include <asm-generic/irq.h>
 
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+
 struct pt_regs;
 
 int set_handle_irq(void (*handle_irq)(struct pt_regs *));
diff --git a/arch/arm64/kernel/ipi_debug.c b/arch/arm64/kernel/ipi_debug.c
index b57833e31eaf..6984ed507e1f 100644
--- a/arch/arm64/kernel/ipi_debug.c
+++ b/arch/arm64/kernel/ipi_debug.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/nmi.h>
 #include <linux/smp.h>
 
 #include "ipi_debug.h"
@@ -24,11 +25,31 @@ void arm64_debug_ipi(cpumask_t *mask)
 	__ipi_send_mask(ipi_debug_desc, mask);
 }
 
+void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+{
+	/*
+	 * NOTE: though nmi_trigger_cpumask_backtrace has "nmi_" in the name,
+	 * nothing about it truly needs to be backed by an NMI, it's just that
+	 * it's _allowed_ to be called from an NMI. If set_smp_debug_ipi()
+	 * failed to get an NMI (or pseudo-NMI) this will just be backed by a
+	 * regular IPI.
+	 */
+	nmi_trigger_cpumask_backtrace(mask, exclude_self, arm64_debug_ipi);
+}
+
 static irqreturn_t ipi_debug_handler(int irq, void *data)
 {
-	/* nop, NMI handlers for special features can be added here. */
+	irqreturn_t ret = IRQ_NONE;
+
+	/*
+	 * NOTE: Just like in arch_trigger_cpumask_backtrace(), we're calling
+	 * a function with "nmi_" in the name but it works fine even if we
+	 * are using a regulaor IPI.
+	 */
+	if (nmi_cpu_backtrace(get_irq_regs()))
+		ret = IRQ_HANDLED;
 
-	return IRQ_NONE;
+	return ret;
 }
 
 void debug_ipi_setup(void)
-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
