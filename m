Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3A1C740D
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 May 2020 17:17:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWLnw-00070D-7M
	for lists+kgdb-bugreport@lfdr.de; Wed, 06 May 2020 15:17:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jWLnu-000705-PG
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 15:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LgY4kIYifyPMDhv+Zkp4hoj8aQPGHZ8Vmvaea5U7io0=; b=dbfDdDREyedHWLZQLH0UkEcU/O
 vL4J6wgDiEeBNLoeAgkr9VZHVOSwVNriIQwxWTEX/bSFUOSTKYdxJoZWpCu5SRuof/qp1FeMzkfuj
 7Y1JbopJX9AalETHhIt86OTgZhoRj4ReGjwEJzM61ZN0tPHJ1rLf+vlPRGh+aWXaJhnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LgY4kIYifyPMDhv+Zkp4hoj8aQPGHZ8Vmvaea5U7io0=; b=Z
 fmy7HQv0rDNR6Dx//2CKowosZgbhJ00OyKXq1YQQ5bdJQ8m0JSypK1Q9YUEMFuN2pRIEy+paDBfyD
 DtnqBRrtOlqZsvwzqkgJQNpxNd+A2mOpmLCjTu2pKb9vI1t+IVEq5wILokkjf2x9tTUviD26Fricm
 qD/7okvhdXeAg5WU=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWLnt-009y9k-5G
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 15:17:46 +0000
IronPort-SDR: vDNZMDmtkVk12z74CEl3SZgMg/QRR9gYG+ZZioADjWHcX3zYhpVlMekz9F0L5Wxuz4WHP1bgHd
 0S3BoSxI3eOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 08:17:30 -0700
IronPort-SDR: fyMLpfkQZzN0cPEcEYn+PlMC56IWqEdGBrYzjYY1q+kPUy1r+v5uJbqM9N/6QnkGlaFtxb4Mi9
 jUkh0AcjWfJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; d="scan'208";a="369820037"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2020 08:17:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B4750D7; Wed,  6 May 2020 18:17:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net
Date: Wed,  6 May 2020 18:17:27 +0300
Message-Id: <20200506151727.2960-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jWLnt-009y9k-5G
Subject: [Kgdb-bugreport] [PATCH v1] kgdb: Drop malformed kernel doc comment
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Kernel doc does not understand POD variables to be referred to.

.../debug_core.c:73: warning: cannot understand function prototype:
'int                             kgdb_connected; '

Convert kernel doc to pure comment.

Fixes: dc7d55270521 ("kgdb: core")
Cc: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/debug/debug_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 01bc3eea3d4db..cd28a17b49a03 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -67,9 +67,7 @@ static int kgdb_break_asap;
 
 struct debuggerinfo_struct kgdb_info[NR_CPUS];
 
-/**
- * kgdb_connected - Is a host GDB connected to us?
- */
+/* kgdb_connected - Is a host GDB connected to us? */
 int				kgdb_connected;
 EXPORT_SYMBOL_GPL(kgdb_connected);
 
-- 
2.26.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
