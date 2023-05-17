Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0D706891
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 May 2023 14:48:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pzGZi-0002XP-AY
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 May 2023 12:48:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@kernel.org>) id 1pzGZh-0002X9-5y
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 12:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+m0jPCA3lKy/BRNgyWSM5i2fXW0Dzja7CpAdMtRoW1I=; b=PUSvlcN8AHd+zoP8ExFCAwON76
 PPqbR9/Y3VJkHr2ysopFGy7Yc9y1qVlYR1PHrf5Lfo93yNwHfn8im3oFa6PjuyaspXH1xOWRMWm8S
 KQkIr6TITxszGxeGzD7MnwxPxrgOxj+ChBIvn/1zfdjTYqnG/3GuWqWfkzNG/18xXOJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+m0jPCA3lKy/BRNgyWSM5i2fXW0Dzja7CpAdMtRoW1I=; b=W
 7hDB/bTpYmJWbEDuGb3gEEQNzdiBsjJbP0eRO3EHlGp7lTRIo5QdaxiafwxRAVvEZVIAzhoEWA91Q
 27FJKqNnHKv+cgf0PdjyAoPiU8D5tFrkQD1jBVoruV3x1sgWXaGOd2E+t68P6jZc64Fe3dSCJKD+m
 XCRDrJSuyaHwetgw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzGZh-00B3ow-De for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 12:48:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0454C646CC;
 Wed, 17 May 2023 12:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD3AC433EF;
 Wed, 17 May 2023 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684327687;
 bh=4HY0Ym8gMukTRRYv/O34wSKiu5KYThcxaes5f1ODcQA=;
 h=From:To:Cc:Subject:Date:From;
 b=RV1B+/gave4YwzwHMlfheMuunRRiS6UUzx2WS5YDa5RX/UWlgJLu5gmqjAdex83fL
 hDZgf1Z1sS3rGN0dXt81apAxQ+gJzm2DXYSIsmSx++SZKw42V4rxQNVpwhcBspDqCv
 7795yRXTwkVvYUlrHgoxG5RbGaeBHrajveeJXdUlESFMl/1LEnNlZLDltY+cE/tiEc
 spRcf/Dzz3YsCbMjj95LW1NVsuHTL2UieW1Ne19EBJUGQEz76NVBnSGj4E5pCOQ7lp
 MLx59IcdstIn7q9jP51g823DhcnuftpdkTZHgFP+SZORyt/b/3EHWWEbmtBJ7Tg5lv
 87vlZgEl8dPAg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 17 May 2023 14:47:53 +0200
Message-Id: <20230517124802.929751-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Arnd Bergmann <arnd@arndb.de> The
 kdb_kbd_cleanup_state()
 is called from another file through the kdb_private.h file, but that is not
 included before the definition,
 causing a W=1 warning: kernel/debug/kdb/kdb_keyboard.c:198:6:
 error: no previous prototype for 'kdb_kbd_cleanup_state'
 [-Werror=missing-prototypes]
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
X-Headers-End: 1pzGZh-00B3ow-De
Subject: [Kgdb-bugreport] [PATCH] kdb: include kdb_private.h for function
 prototypes
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
Cc: kgdb-bugreport@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Arnd Bergmann <arnd@arndb.de>

The kdb_kbd_cleanup_state() is called from another file through
the kdb_private.h file, but that is not included before the
definition, causing a W=1 warning:

kernel/debug/kdb/kdb_keyboard.c:198:6: error: no previous prototype for 'kdb_kbd_cleanup_state' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/debug/kdb/kdb_keyboard.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/debug/kdb/kdb_keyboard.c b/kernel/debug/kdb/kdb_keyboard.c
index f87c750d3eb3..3c2987f46f6e 100644
--- a/kernel/debug/kdb/kdb_keyboard.c
+++ b/kernel/debug/kdb/kdb_keyboard.c
@@ -13,6 +13,8 @@
 #include <linux/ctype.h>
 #include <linux/io.h>
 
+#include "kdb_private.h"
+
 /* Keyboard Controller Registers on normal PCs. */
 
 #define KBD_STATUS_REG		0x64	/* Status register (R) */
-- 
2.39.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
