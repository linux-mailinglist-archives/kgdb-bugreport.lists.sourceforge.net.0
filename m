Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4F9B2EFF
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2X-0007d9-Mz
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t2GHI-0004YE-3b
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 19 Oct 2024 20:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4yjKeglWKrH6owi0pztnoYq9KsxnkOkLZvWrO1hqThU=; b=cvamqgPYN+q7HNlaWL3o2/MLeg
 DOYDWGx6zRke5hvlPaZlDlkH7KbPekYGhhNG7ZAXErq70dhE7aIONfbKckel1bkt5CtJJ2+n2pOr6
 4S4zrWZ3zK7YaDCrTKxjDgnMif68Z2bu4dsFwoQuC7/9jYtQYjHskEoSwpkfMVcKAwus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4yjKeglWKrH6owi0pztnoYq9KsxnkOkLZvWrO1hqThU=; b=hZU8t6Lopu4tTTp9SF46HflAQT
 EpLt1jS64B8Mu+jG5bFnPUVhDf/lbm4XiYbNaW2EZMsFiq0NYNuSaB6b99TmNnJiTcWcNNA5/mSkv
 LlxgEsM0+/NB1MjEhz7Cq1w4BtCtW91k9uE9XwYJRFi7QwejOcaBsLEylV9YgLnPF9Co=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2GHG-0008Sn-Sa for kgdb-bugreport@lists.sourceforge.net;
 Sat, 19 Oct 2024 20:42:23 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 41DC21770FF; Sat, 19 Oct 2024 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729370532; bh=ye+sQb4lcoOQCfVxdUhggBdY5bpunrH2WtgJp84HDHk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=vPXF3yvGzoTaX36QmS5Ubhia6Efa+0RX/GIDyYARchI2/uBcKRKOsk4FtFpBMD2wY
 IzOc8D/0qAQ23xnglP3TddH0X+QomOYCRJdmA9LVJSgC3MOy0YrwL0wNaNfkv/FOh2
 JvpDdB1ttreZCsuWf0+T7L4IWt/fAN+BkalIDP9eIFlsfjVxOWlKdftqhkfEMXs7PZ
 hN5ZTN7OYPDkgNNRprtA43zzB/QwGJuwpBA/31T6MaHFKAKLRX/O1ykazKD/LyrpK5
 mq8svYhEoKzqdEL3Wniw3pBTL8Vz/WvlSPGRbjw2L3r6YnLENgxdsKWylUrt17GylR
 /ttUDrubo3cYg==
Date: Sat, 19 Oct 2024 20:42:12 +0000
From: Nir Lichtman <nir@lichtman.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Message-ID: <20241019204212.GA811391@lichtman.org>
References: <20241019195715.GA810861@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241019195715.GA810861@lichtman.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Problem: In many cases,
 KDB treats invalid commands as numbers
 and instead of printing a usage error, goes ahead and just prints the number
 in hex Example: This can be demonstrated when typing for example "aaazzz",
 this confuses KDB into thinking this is the hexadecimal 0xAAA 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1t2GHG-0008Sn-Sa
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:55 +0000
Subject: [Kgdb-bugreport] [PATCH v2] KDB: Fix incorrect treatment of numbers
 in the CLI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Problem: In many cases, KDB treats invalid commands as numbers and
instead of printing a usage error, goes ahead and just prints the number
in hex

Example: This can be demonstrated when typing for example "aaazzz", this
confuses KDB into thinking this is the hexadecimal 0xAAA

Solution: Transition to using kstrtoul instead of simple_strtoul.
This function is more strict with what it treats as a number
and thus solves the issue.
(also better practice as stated in the definition of simple_strtoul).

v2: Removed redundant if condition I put in v1

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/debug/kdb/kdb_main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index f5f7d7fb5936..4cbd5cd26821 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -402,18 +402,15 @@ static void kdb_printenv(void)
  */
 int kdbgetularg(const char *arg, unsigned long *value)
 {
-	char *endp;
 	unsigned long val;
 
-	val = simple_strtoul(arg, &endp, 0);
 
-	if (endp == arg) {
+	if (kstrtoul(arg, 0, &val) != 0) {
 		/*
 		 * Also try base 16, for us folks too lazy to type the
 		 * leading 0x...
 		 */
-		val = simple_strtoul(arg, &endp, 16);
-		if (endp == arg)
+		if (kstrtoul(arg, 16, &val) != 0)
 			return KDB_BADINT;
 	}
 
-- 
2.39.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
