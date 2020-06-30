Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2020F088
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 10:30:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqBew-0008SO-IF
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 08:30:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cengiz@kernel.wtf>) id 1jqBev-0008S8-Ma
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 08:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VATVENXYFj5EpWjzcjKDdDxtrXlKTZOFJfD8vL+9HIs=; b=TqYmUPam/8oWRAJEXWzSxk3uue
 UmSKXaMwtiYq3dmlN8MaeXjpY3qZTYHNNy7lb4w/db4BS/UGUNuDE3LuIz7+eacg0c8/1SHaUrLCy
 snKawXHQRTiwCWemr9gh57zbwyp3v3yc0SnJgDgo5cKmzXXQHZseeauzMGu0xk1w5YMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VATVENXYFj5EpWjzcjKDdDxtrXlKTZOFJfD8vL+9HIs=; b=kAKtMBgaJdg3YvtT+JYs9usoo5
 Ok13NUcEH49MiKLUgPKjbkOODjSMECvJh7zI9KH3M/u0d60dYS2jdArnYV6d/H8UfoVQnxNO10/B/
 jQ5DzW3fUA9ElEH2vk6D4cinWFf0cmqLG1lJU8KsdVR531mJcObVQXmd8tggNnSuhxfY=;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqBet-0074va-Be
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 08:30:29 +0000
Received: from localhost.localdomain (unknown [176.88.144.104])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DCB5D24001E;
 Tue, 30 Jun 2020 08:30:02 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: sumit.garg@linaro.org
Date: Tue, 30 Jun 2020 11:29:23 +0300
Message-Id: <20200630082922.28672-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
References: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.wtf]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.70.178.230 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqBet-0074va-Be
Subject: [Kgdb-bugreport] [PATCH v3] kdb: remove unnecessary null check of
 dbg_io_ops
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
Cc: pmladek@suse.com, daniel.thompson@linaro.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, cengiz@kernel.wtf,
 andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

`kdb_msg_write` operates on a global `struct kgdb_io *` called
`dbg_io_ops`.

It's initialized in `debug_core.c` and checked throughout the debug
flow.

There's a null check in `kdb_msg_write` which triggers static analyzers
and gives the (almost entirely wrong) impression that it can be null.

Coverity scanner caught this as CID 1465042.

I have removed the unnecessary null check and eliminated false-positive
forward null dereference warning.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 kernel/debug/kdb/kdb_io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 683a799618ad..81783ecaec58 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -545,18 +545,18 @@ static int kdb_search_string(char *searched, char *searchfor)
 static void kdb_msg_write(const char *msg, int msg_len)
 {
 	struct console *c;
+	const char *cp;
+	int len;
 
 	if (msg_len == 0)
 		return;
 
-	if (dbg_io_ops) {
-		const char *cp = msg;
-		int len = msg_len;
+	cp = msg;
+	len = msg_len;
 
-		while (len--) {
-			dbg_io_ops->write_char(*cp);
-			cp++;
-		}
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
