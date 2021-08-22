Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5733FC5AC
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 31 Aug 2021 12:33:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mL151-000391-V0
	for lists+kgdb-bugreport@lfdr.de; Tue, 31 Aug 2021 10:33:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1mHdrX-00061a-O5
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 Aug 2021 03:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=POmpQfKktXcbonVTRyeCDvT8cX60exDeb9SgTsw7wX0=; b=Y2ce8mv+0EUCZeuYIXstH6SpZq
 D0vEg61oEnU/06paFTuv3GXdlGut5SyIZDG2+4vHTYUsnjLKuf1PwWP1q9uS3ywzvUjgpQt0/WXQ8
 fkIaEzL/JTqWdvD9efi60y0NwnVFsN5ubx5TWv53CKxuwYL//SqlL4NaMyxxrs9jBUoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=POmpQfKktXcbonVTRyeCDvT8cX60exDeb9SgTsw7wX0=; b=l
 l+xOKQWiydPOVYnV3kRRImrGaEk0ruXFQLpn5L05lVD/IOBywvlCJDZlICsKQ+DWJAKm9xwaltHGL
 hf6lG7VDsgNYwdi3zA1C9AtEDh+w9z1Zq7JkYI/gtgZi4crfCFnCcfKO0UpZRmenuuNQp/L3Zs3e9
 r2EGk5M3au+LpjJs=;
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mHdrU-00023V-0S
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 Aug 2021 03:09:31 +0000
Received: from BC-Mail-Ex05.internal.baidu.com (unknown [172.31.51.45])
 by Forcepoint Email with ESMTPS id 7613EDB7DEEE151A9891;
 Sun, 22 Aug 2021 10:22:21 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex05.internal.baidu.com (172.31.51.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sun, 22 Aug 2021 10:22:21 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.17) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sun, 22 Aug 2021 10:22:20 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <ason.wessel@windriver.com>, <daniel.thompson@linaro.org>,
 <dianders@chromium.org>
Date: Sun, 22 Aug 2021 10:22:06 +0800
Message-ID: <20210822022206.221-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
X-Originating-IP: [172.31.62.17]
X-ClientProxiedBy: BC-Mail-Ex17.internal.baidu.com (172.31.51.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sco.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1mHdrU-00023V-0S
X-Mailman-Approved-At: Tue, 31 Aug 2021 10:33:22 +0000
Subject: [Kgdb-bugreport] [PATCH] kernel: debug: Convert to SPDX identifier
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
 kernel/debug/debug_core.c | 5 +----
 kernel/debug/gdbstub.c    | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index b4aa6bb6b2bd..da06a5553835 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
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
