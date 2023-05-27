Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52F713194
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2iwt-0004Mf-Ex
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iwr-0004MZ-KZ
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KaDACvZxwdpKtf7kTBQLIF7ZNxT8GRJ6++BKiL/JB9M=; b=HnnGY9WT9dtDVOTpCWyZakm1m0
 oqrPPPNzwQgooMEcLIGQDo2d9rEYg29qHpVG1tuAjMlQBIFzOefJTHiWioPvAWBopMCzlDUWO6N6k
 1QeXTkDIwIp3YWPzQu9s5iNo2YTrEUZiDZDnmMxp/jEATWsL03H+Sq+z8NqowXkjI7cY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KaDACvZxwdpKtf7kTBQLIF7ZNxT8GRJ6++BKiL/JB9M=; b=OHAEZM+RxV1JuKWLep0Kxr4/0c
 e5ZrvNDokmfmctvjtOQcnyY141s8ey9tGy/FngCE7qDtlff6Cn3M5XEFzB7MpjbhX8CKB52xqQdSs
 EucI+vW9PTBHPewHoDoPeZidqKe8bq78sX14RrluLeoqI19lwmaw2m1ASXlo4E7BMWW4=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwr-003o1w-9a for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:25 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-64d5f65a2f7so1189848b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151740; x=1687743740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KaDACvZxwdpKtf7kTBQLIF7ZNxT8GRJ6++BKiL/JB9M=;
 b=jVuYAdq3YuUoT9q0ptR3Y7gogUCPfBKK+uzhCs3nYmVmC0ZcHgwMRd0F7jOf1hYEoN
 iVHyunZrSLGRZ/SUtKN1NZqFCsyZzudfiz0JVDxVcWLyOc754sGNrSqCni0+0DMifrdR
 CX1zK1B4IcAFWXPw6yd7iZFlWLLQa05o6HrVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151740; x=1687743740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KaDACvZxwdpKtf7kTBQLIF7ZNxT8GRJ6++BKiL/JB9M=;
 b=OdMUHByUC4jbLDAWjQZ3YN45ZCu4XKHfFZ6Dt0s36yx/k3w6g14D17QYyQgwdIKh50
 FA0tN1MuHsSZ168ouThBeGgDxSgaovAi+tQdgtTOJqwrqF9R6QgPYbWhLVNm0yn7QkEb
 CWbErcEoNu2fjKc357dkDkfs0m9+2C2vmlx9HQbjyoiNfGORhqmcuYOz6uskKhYvxRuc
 KO4vEQ+kVlLJB9WAuR1GgI/oXGAUL40nO/mu9Z7os2BxyQ+4BYQ2I0x1RsfF2XoUbxe8
 xd38XfnYYKEpxCDYpY5onaRuVKTrXkQZfh5qmiKOAKYeCtuNv5cyJUH6mmq3qw2/Gjmc
 7U2A==
X-Gm-Message-State: AC+VfDyXkAmFZP+3VYQ0YxrbIeX2g7utTsF4D75091fM+NLHVuXseZ88
 rq7u2/dqESknUDxVw6y3iwxApg==
X-Google-Smtp-Source: ACHHUZ7idAUslgayGvplEniRBtJYBCvMASeKUJDKY3K4A2M46AA1VPt7NOcvpx5WEYfIrIw0exEmRA==
X-Received: by 2002:a05:6a00:2409:b0:63b:8778:99e4 with SMTP id
 z9-20020a056a00240900b0063b877899e4mr5910255pfh.2.1685151739708; 
 Fri, 26 May 2023 18:42:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:32 -0700
Message-ID: <20230526184139.2.Ic6ebbf307ca0efe91f08ce2c1eb4a037ba6b0700@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Right now there is one arch (sparc64) that selects
 HAVE_NMI_WATCHDOG
 without selecting HAVE_HARDLOCKUP_DETECTOR_ARCH. Because of that one
 architecture, 
 we have some special case code in the watchdog c [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwr-003o1w-9a
Subject: [Kgdb-bugreport] [PATCH 02/10] watchdog/hardlockup:
 HAVE_NMI_WATCHDOG must implement watchdog_hardlockup_probe()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Right now there is one arch (sparc64) that selects HAVE_NMI_WATCHDOG
without selecting HAVE_HARDLOCKUP_DETECTOR_ARCH. Because of that one
architecture, we have some special case code in the watchdog core to
handle the fact that watchdog_hardlockup_probe() isn't implemented.

Let's implement watchdog_hardlockup_probe() for sparc64 and get rid of
the special case.

As a side effect of doing this, code inspection tells us that we could
fix a minor bug where the system won't properly realize that NMI
watchdogs are disabled. Specifically, on powerpc if
CONFIG_PPC_WATCHDOG is turned off the arch might still select
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH which selects
CONFIG_HAVE_NMI_WATCHDOG. Since CONFIG_PPC_WATCHDOG was off then
nothing will override the "weak" watchdog_hardlockup_probe() and we'll
fallback to looking at CONFIG_HAVE_NMI_WATCHDOG.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Though this does fix a minor bug, I didn't mark this as "Fixes"
because it's super minor. One could also argue that this wasn't a bug
at all but simply was never an implemented feature. The code that
added some amount of dynamicness here was commit a994a3147e4c
("watchdog/hardlockup/perf: Implement init time detection of perf")
which, as per the title, was only intending to make "perf"
dynamic. The old NMI watchdog presumably has never been handled
dynamically.

 arch/Kconfig            |  3 ++-
 arch/sparc/kernel/nmi.c |  5 +++++
 kernel/watchdog.c       | 13 -------------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 64d771855ecd..b4f6387b12fe 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -428,7 +428,8 @@ config HAVE_NMI_WATCHDOG
 	bool
 	help
 	  The arch provides a low level NMI watchdog. It provides
-	  asm/nmi.h, and defines its own arch_touch_nmi_watchdog().
+	  asm/nmi.h, and defines its own watchdog_hardlockup_probe() and
+	  arch_touch_nmi_watchdog().
 
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	bool
diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
index 9d9e29b75c43..17cdfdbf1f3b 100644
--- a/arch/sparc/kernel/nmi.c
+++ b/arch/sparc/kernel/nmi.c
@@ -65,6 +65,11 @@ void arch_touch_nmi_watchdog(void)
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
 
+int __init watchdog_hardlockup_probe(void)
+{
+	return 0;
+}
+
 static void die_nmi(const char *str, struct pt_regs *regs, int do_panic)
 {
 	int this_cpu = smp_processor_id();
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 4b9e31edb47f..62230f5b8878 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -217,19 +217,6 @@ void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
  */
 int __weak __init watchdog_hardlockup_probe(void)
 {
-	/*
-	 * If CONFIG_HAVE_NMI_WATCHDOG is defined then an architecture
-	 * is assumed to have the hard watchdog available and we return 0.
-	 */
-	if (IS_ENABLED(CONFIG_HAVE_NMI_WATCHDOG))
-		return 0;
-
-	/*
-	 * Hardlockup detectors other than those using CONFIG_HAVE_NMI_WATCHDOG
-	 * are required to implement a non-weak version of this probe function
-	 * to tell whether they are available. If they don't override then
-	 * we'll return -ENODEV.
-	 */
 	return -ENODEV;
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
