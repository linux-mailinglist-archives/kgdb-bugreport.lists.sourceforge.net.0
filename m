Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B5401A8A
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 Sep 2021 13:23:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mNCih-0007Ss-9p
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 Sep 2021 11:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <caihuoqing@baidu.com>) id 1mNCif-0007Sk-OW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Sep 2021 11:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRZQ9a+Qvz/02u8WKfELhO/03994Yz8p7KYgdKFE2Sc=; b=aoB9n+9iJZm8LNkqknYPtFpBAe
 Y2tH4ImpKhFKHSz7eU6kIxNCdACAtZix88ipR10dL+tisgR5eCZYL7N+ro3F8FEctAqJm4diqbINW
 oWixAYD2oI4kCbfYQ0HuuSvdA3KovNl4Qv/TcvQhm49ud96dQXv5jzEJKP3SulExecdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IRZQ9a+Qvz/02u8WKfELhO/03994Yz8p7KYgdKFE2Sc=; b=Z
 d1b0ACyheuknRpZtOX6uBK/TXk4u/92aU4keheE+pEfCFLHutl3ER36+OkoEamamdnGWDP30kRQYD
 YBIOYYoGifzm1EJ5hl8orDtFp4Y/EfHG0iARuhwT/uSk9PKf2jSMeaQJx2svBBcSz0ZGAVUF9FCz9
 MY8jfWAz4bARhMTw=;
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mNCid-00HGQB-CP
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Sep 2021 11:23:21 +0000
Received: from BJHW-Mail-Ex11.internal.baidu.com (unknown [10.127.64.34])
 by Forcepoint Email with ESMTPS id 81BDD6BC8BE2EDBD5A51;
 Mon,  6 Sep 2021 19:23:10 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 6 Sep 2021 19:23:10 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 6 Sep 2021 19:23:09 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <daniel.thompson@linaro.org>, <ason.wessel@windriver.com>,
 <dianders@chromium.org>
Date: Mon, 6 Sep 2021 19:23:02 +0800
Message-ID: <20210906112302.937-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: use SPDX-License-Identifier instead of a verbose license text
 Signed-off-by: Cai Huoqing <caihuoqing@baidu.com> --- v1->v2: change GPL-2.0
 to GPL-2.0-only kernel/debug/debug_core.c | 5 +---- kernel/debug/gdbstub.c
 | 5 +---- 2 files changed, 2 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [111.202.115.85 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1mNCid-00HGQB-CP
Subject: [Kgdb-bugreport] [PATCH v2] kernel: debug: Convert to SPDX
 identifier
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
Cc: kgdb-bugreport@lists.sourceforge.net, Cai Huoqing <caihuoqing@baidu.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

use SPDX-License-Identifier instead of a verbose license text

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: change GPL-2.0 to GPL-2.0-only

 kernel/debug/debug_core.c | 5 +----
 kernel/debug/gdbstub.c    | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index b4aa6bb6b2bd..da06a5553835 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Kernel Debug Core
  *
@@ -22,10 +23,6 @@
  *
  * Original KGDB stub: David Grothe <dave@gcom.com>,
  * Tigran Aivazian <tigran@sco.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) "KGDB: " fmt
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index b6f28fad4307..9d34d2364b5a 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Kernel Debug Core
  *
@@ -22,10 +23,6 @@
  *
  * Original KGDB stub: David Grothe <dave@gcom.com>,
  * Tigran Aivazian <tigran@sco.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/kernel.h>
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
