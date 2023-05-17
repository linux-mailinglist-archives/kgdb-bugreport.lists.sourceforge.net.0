Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 305FB7068AE
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 May 2023 14:54:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pzGfr-0007QV-KO
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 May 2023 12:54:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@kernel.org>) id 1pzGfq-0007QP-MW
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 12:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tm5KNSH7UnfUk/sRRuENKRjAAiPRJm/Lqpw4geT+8qI=; b=foYT6DdVqOHyT//cn1fQUgrBeb
 BxTtzXOMQWiHxeJOnaW7GROgLie0tiApym7w4kXdGaHvsiqReSsXYrReCPuyY6buIR/MvNqnazfYq
 /6i4mqPlgAR+TJUnZqyF7I29eC4GHQ5UjpZ6XKfQr4FiKS9s7RpytP/TovfqmJhX7dYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tm5KNSH7UnfUk/sRRuENKRjAAiPRJm/Lqpw4geT+8qI=; b=E
 5H1bR5oOHhpRjxBeLm23exRCT4JBhX6z8Ve2kaSjapUhKsRxoSw8R1UmE7bgh6EtxnDBB+qgQ+XM1
 abdlGGbQSthM7kbexRoQ/54DUfpCJnHJSvfLG7JCWP4YgLKll2Fx0iZeJHIvbYI1prPG7ilh5H5LK
 tMPAzlRDScuMfxqc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzGfq-0004R1-FI for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 12:54:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15BB564052;
 Wed, 17 May 2023 12:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506A2C433D2;
 Wed, 17 May 2023 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684328068;
 bh=nc29UDrIzO0K1XrrlSRT98qfuvFbPBoKCvdXYVf6s80=;
 h=From:To:Cc:Subject:Date:From;
 b=nkomx8kuTnEAGcwqhXaP550kiR6KMRbHeWoYuNBp8tXXIzslqThf+dLOXAVc467X8
 GpB1Chozz6vx8UMHKoWPeDVbWIFgrJFAHhfMsjmcr9izjE04oGKMffP9dDlEcuEO9y
 QusgbvrUgOLy7I7tIvVcegzvp1gBO6VZ8SXJUS291HlKQSAJobess2Np9fLFrKLoC+
 7VMERVDpqW8I55FPQDuQSaA09a0RL/EEjuT0DCKCUeFO/419R09dGaZ4jr8qBBT2mh
 YPucdwE7RHotyr28PlvMZ7jnwvFL7TrzkcTgN9dRPX6xSySIUzFjeLvIosRotnQdy1
 cI6/myrhgvMCA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 17 May 2023 14:54:09 +0200
Message-Id: <20230517125423.930967-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Arnd Bergmann <arnd@arndb.de> kdb_send_sig() is defined
 in the signal code and called from kdb, but the declaration is part of the
 kdb internal code. Include this from signal.c as well to avoid the warning:
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzGfq-0004R1-FI
Subject: [Kgdb-bugreport] [PATCH] kdb: include header in signal handling code
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Arnd Bergmann <arnd@arndb.de>

kdb_send_sig() is defined in the signal code and called from kdb,
but the declaration is part of the kdb internal code.
Include this from signal.c as well to avoid the warning:

kernel/signal.c:4789:6: error: no previous prototype for 'kdb_send_sig' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/signal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/signal.c b/kernel/signal.c
index 8f6330f0e9ca..d38df14f71ac 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4780,6 +4780,8 @@ void __init signals_init(void)
 
 #ifdef CONFIG_KGDB_KDB
 #include <linux/kdb.h>
+#include "debug/kdb/kdb_private.h"
+
 /*
  * kdb_send_sig - Allows kdb to send signals without exposing
  * signal internals.  This function checks if the required locks are
-- 
2.39.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
