Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6E20CF35
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 16:41:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpuy8-0006OL-B4
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 14:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cengiz@kernel.wtf>) id 1jpush-0006h2-6Y
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LsB3vf6MVw2vdVbaObpkA0TxjzYE/GEEwWWmP1J9wvA=; b=Cf9NXaZHmOGWkhT68uAyX5aw8r
 OjoiU5xix941iDYL0lQXSqp9XtPLs7+Ca0E0QITYe0cO5aC/YztyoILO1KSW0yUCnUd3AzldUv+Xr
 y/3V48xg2uGv82WPdyA9qMxE7tVbkO52wkvOmH+lHvKE4SbaEAJsLOm1WaRynSMc93eM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LsB3vf6MVw2vdVbaObpkA0TxjzYE/GEEwWWmP1J9wvA=; b=g
 wr0VXxgzeASk5MC1ukvio9tTZ/YhE4ieyzXHQsWmU/PPO6JYs4SlbckI8I5HogMcGk6gkjJTaFewN
 SkJk1LNXwqDLM+ZQ/gb0v/35DXoLEu8b7T9c5aWZO1B06Rppt+unEDY73i8Xeo1ng1h5XxaGgywri
 RteLsmDZLReBJFyE=;
Received: from mslow2.mail.gandi.net ([217.70.178.242])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpusd-0056Ke-6B
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:35:35 +0000
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 575AE3AB655
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 14:00:27 +0000 (UTC)
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 53A10FF80E;
 Mon, 29 Jun 2020 14:00:09 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 29 Jun 2020 16:59:24 +0300
Message-Id: <20200629135923.14912-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jpusd-0056Ke-6B
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:41:11 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: prevent possible null deref in
 kdb_msg_write
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Cengiz Can <cengiz@kernel.wtf>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

`kdb_msg_write` operates on a global `struct kgdb_io *` called
`dbg_io_ops`.

Although it is initialized in `debug_core.c`, there's a null check in
`kdb_msg_write` which implies that it can be null whenever we dereference
it in this function call.

Coverity scanner caught this as CID 1465042.

I have modified the function to bail out if `dbg_io_ops` is not properly
initialized.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 kernel/debug/kdb/kdb_io.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 683a799618ad..85e579812458 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -549,14 +549,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	if (msg_len == 0)
 		return;
 
-	if (dbg_io_ops) {
-		const char *cp = msg;
-		int len = msg_len;
+	if (!dbg_io_ops)
+		return;
 
-		while (len--) {
-			dbg_io_ops->write_char(*cp);
-			cp++;
-		}
+	const char *cp = msg;
+	int len = msg_len;
+
+	while (len--) {
+		dbg_io_ops->write_char(*cp);
+		cp++;
 	}
 
 	for_each_console(c) {
-- 
2.27.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
