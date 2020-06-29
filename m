Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928920DD00
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 22:51:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jq0kB-0005jK-TP
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 20:51:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cengiz@kernel.wtf>) id 1jq0kA-0005jB-2v
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 20:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R9iN1s0rURejGgnL8BFjMhv7ALGwhdrXDovjWU0Q0qM=; b=L6uear5qJzCVjIm83jmMn8aBmv
 Q6Hl3e9l8wqjoxpc7pu3Ll2+Kptn2LwJDcwbHCh9ZnwkSHQ4yj6BTdTyD3PsG0FCKl0eqsEzxp/52
 Nz3fXqvLixRgKr3gZtJet5mbSzks61P38nUFuYr0MvZVB1hvkGnRYjnJ7lCLN4dpnYKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R9iN1s0rURejGgnL8BFjMhv7ALGwhdrXDovjWU0Q0qM=; b=kzcJRn0jZcWU61WB0ap924kEoX
 /n49Da1bimoyUy76UluhTpDeZtS0aVMAJFCwC5///WTUj+pQ0PfsMbM7ufa9TizAFDj7CwXTOESv1
 a6sAjD36TuPCeYyIFTwiWFMqq7SAyJHMapDgNowHIgLAUZDt5I0Raz8RY3EuvKf801YY=;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jq0k8-002PGY-4J
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 20:51:10 +0000
Received: from localhost.localdomain (unknown [176.88.144.104])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8516C24000E;
 Mon, 29 Jun 2020 20:50:45 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: daniel.thompson@linaro.org
Date: Mon, 29 Jun 2020 23:50:13 +0300
Message-Id: <20200629205012.3263-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629153756.cxg74nec3repa4lu@holly.lan>
References: <20200629153756.cxg74nec3repa4lu@holly.lan>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.70.178.230 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jq0k8-002PGY-4J
Subject: [Kgdb-bugreport] [PATCH v2] kdb: remove unnecessary null check of
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com, cengiz@kernel.wtf,
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
 kernel/debug/kdb/kdb_io.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 683a799618ad..4ac59a4fbeec 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -549,14 +549,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	if (msg_len == 0)
 		return;
 
-	if (dbg_io_ops) {
-		const char *cp = msg;
-		int len = msg_len;
+	const char *cp = msg;
+	int len = msg_len;
 
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
