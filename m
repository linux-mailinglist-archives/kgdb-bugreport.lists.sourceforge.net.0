Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E332F1D5FFF
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 16 May 2020 11:30:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZt9B-00036a-OP
	for lists+kgdb-bugreport@lfdr.de; Sat, 16 May 2020 09:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <liwei391@huawei.com>) id 1jZt97-00036M-UY
 for kgdb-bugreport@lists.sourceforge.net; Sat, 16 May 2020 09:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pyo9phapEC6pvB/344CvVVXed28eErr1qWzJ32ML5zY=; b=Dh4xiqrVkafvC6kXb+HM2iP+S2
 uSMM83bzCafR+KYckCqpHl8NbOkJQAjwPfv9Q0WOxyF20EfWSi3p2Nv9Uxuf4luU1KF5zDi+4f7H6
 XzLu0EOugApECMYgsGOTbCoWmtijQic15tSWEu6wbbbrvNFpDU0g5KZMWqgIG+WCXgqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pyo9phapEC6pvB/344CvVVXed28eErr1qWzJ32ML5zY=; b=G
 AQxjA/pWBCD+gSBxILCfVm7+pMllQ8U8WbOQsq3t5drBBIk/bIJkJwuvKVfRyijY+lfJoxH86O/79
 RrKrAIojv+qSaow/klRsbkfP5j1/jT0CFkWS+PjEp0YV30/Jv8+vsLFnwfzaKbVxXPGIWbzuXEvje
 00SG+/cx9Sl0FzU0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZt94-00Czaf-K7
 for kgdb-bugreport@lists.sourceforge.net; Sat, 16 May 2020 09:30:17 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 585C89868A0B93C86D5A;
 Sat, 16 May 2020 17:29:59 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sat, 16 May 2020 17:29:57 +0800
From: Wei Li <liwei391@huawei.com>
To: Doug Anderson <dianders@chromium.org>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 May 2020 17:26:06 +0800
Message-ID: <20200516092606.41576-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jZt94-00Czaf-K7
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Make the internal env 'KDBFLAGS'
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

'KDBFLAGS' is an internal variable of kdb, it is combined by 'KDBDEBUG'
and state flags. But the user can define an environment variable named
'KDBFLAGS' too, so let's make it undefinable to avoid confusion.

Signed-off-by: Wei Li <liwei391@huawei.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1 -> v2:
 - Fix lack of braces.

 kernel/debug/kdb/kdb_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 4fc43fb17127..75b798340300 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -423,6 +423,8 @@ int kdb_set(int argc, const char **argv)
 			| (debugflags << KDB_DEBUG_FLAG_SHIFT);
 
 		return 0;
+	} else if (strcmp(argv[1], "KDBFLAGS") == 0) {
+		return KDB_NOPERM;
 	}
 
 	/*
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
