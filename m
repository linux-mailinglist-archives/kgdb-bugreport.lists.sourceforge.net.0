Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 116C11CDAD1
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 May 2020 15:10:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jY8Co-0005Fs-S2
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 13:10:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <liwei391@huawei.com>) id 1jXy1F-0007RC-Ul
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 02:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EJvPRlZk+ulXFzy+ZlM3CsDVc3WpzUPPg+o4awKH6NM=; b=EmlSfMoOWY732Qb0hQmgZ69Y25
 7882dvanTyW0Df0tumjD4gk42KZ6gl0Z7qK3WaGKHBerHZF5Oc4FYZ0yntFpVTVLayDY1LcGWafre
 xGYZ0BebbiCD/nHnIUZVqSOnEm0C1ZsZWgq5owm/5VHTLil2Vwi9je900P6dtBZPktU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EJvPRlZk+ulXFzy+ZlM3CsDVc3WpzUPPg+o4awKH6NM=; b=N
 EYGmHejBRue9DjyeYj8VeZln3XaQF7ZNqqwkoqUnrJhOlyUsn41smLq7V9Y3szZLFqz0CwxQGDjAB
 mmiVm+fUnFAY6cQao/vdWd5+0FR7I2V5QXBx699b1bpNXXXTxEGRXshEAHXcoj5dHjJa0vpEP/Sbu
 pBou0ob8znefNGNY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jXy1D-000J03-DJ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 02:18:13 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BD2768CF532A022CC47C;
 Mon, 11 May 2020 10:18:02 +0800 (CST)
Received: from euler.huawei.com (10.175.101.6) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 11 May 2020 10:17:59 +0800
From: Wei Li <liwei391@huawei.com>
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 11 May 2020 10:16:37 +0800
Message-ID: <20200511021637.37029-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jXy1D-000J03-DJ
X-Mailman-Approved-At: Mon, 11 May 2020 13:10:48 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: Make the internal env 'KDBFLAGS'
 undefinable
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

'KDBFLAGS' is an internal variable of kdb, it is combined by 'KDBDEBUG'
and state flags. But the user can define an environment variable named
'KDBFLAGS' too, so let's make it undefinable to avoid confusion.

Signed-off-by: Wei Li <liwei391@huawei.com>
---
 kernel/debug/kdb/kdb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 4fc43fb17127..d3d060136821 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -423,7 +423,8 @@ int kdb_set(int argc, const char **argv)
 			| (debugflags << KDB_DEBUG_FLAG_SHIFT);
 
 		return 0;
-	}
+	} else if (strcmp(argv[1], "KDBFLAGS") == 0)
+		return KDB_NOPERM;
 
 	/*
 	 * Tokenizer squashed the '=' sign.  argv[1] is variable
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
