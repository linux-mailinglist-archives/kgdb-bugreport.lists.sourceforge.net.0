Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F349B2EFE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2X-0007d1-DS
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t2FoU-00062W-S6
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 19 Oct 2024 20:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tnrNWImyCc8UFNCbhhQNGSmESpX1XAb7S/oAMtopL3k=; b=TcLa9XzZ5xBOsVDkJPkj4PUajy
 nnudHyyZM7HIsrvt6b5KLWUorEYSvVVILdlZtU8FjL6e5AsMsCtSn5xFTSmd70MGeWKHQSGrXW7LS
 gaSONnnKRZriDiDG1OJhhkusLyAN5wpB9qaWkQ8NmoYfcfJDJNHkdJbRJGUraf+VvbbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tnrNWImyCc8UFNCbhhQNGSmESpX1XAb7S/oAMtopL3k=; b=P
 MMmrN3AMpEC1MjiBQjrRZFeOZaZUkfFvKyHyE/Rr8i0gGzHLWrBE7iyDu/XIdMhONXvy1lf/QafBB
 r0+enkmmD/DWR79+Ct9llGCp818x21M5yuz96PpYiFLbM+1Ygpu+pH6B6eo5I4xDlmnIghskNzOBn
 nGyahIKqBxVRfl14=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2FoU-0007En-5y for kgdb-bugreport@lists.sourceforge.net;
 Sat, 19 Oct 2024 20:12:38 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id E32A31770FF; Sat, 19 Oct 2024 19:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729367835; bh=rbDsl3guE2D9QHGVw/TooNST7vP+mdZMY+3vCZ7AxnA=;
 h=Date:From:To:Subject:From;
 b=pHX9IpIL7cT7SgbWV9/8QbmOMJJT66AkKZkbEVhe8YtY5OTC7w6nTfMQFA++zmuKZ
 NMiiKU0dVeC/XsTTl2Ts5x/C/IFWIBYnjtlv60oQ3p8TrHPrGjvE/plIDykY6gixkb
 0t6dySdmkVJc0O56YQnSnpcbx0SfRKQOjr4GjsNTlx/qcIBl3DW8i5TsniT8Hj/00x
 XzFMEP2BxaZH14IMPAN270RcdVwQ3P4S2wc2Gg5gnkHhoK7k40yJdaZICdej+J5P5P
 E1Vu8Jj9z1tj7ZGwVRPQg7lUHdDk6F6pFuWjQWsGC9GlO58l4VHXaZ1sReu56xN9a7
 Q5F34T/kGukqw==
Date: Sat, 19 Oct 2024 19:57:15 +0000
From: Nir Lichtman <nir@lichtman.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Message-ID: <20241019195715.GA810861@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
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
X-Headers-End: 1t2FoU-0007En-5y
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:55 +0000
Subject: [Kgdb-bugreport] [PATCH] KDB: Fix incorrect treatment of numbers in
 the CLI
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

Solution: Before assuming that the input from the user is a number,
check that it contains only characters that represent numbers.
Also, along the way, transition to using kstrtoul instead of
simple_strtoul (better practice as stated in the definition of the
function)

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/debug/kdb/kdb_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index f5f7d7fb5936..4efdc4d25a59 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -402,18 +402,18 @@ static void kdb_printenv(void)
  */
 int kdbgetularg(const char *arg, unsigned long *value)
 {
-	char *endp;
 	unsigned long val;
 
-	val = simple_strtoul(arg, &endp, 0);
+	if ((strpbrk(arg, hex_asc) == NULL)
+	 && (strpbrk(arg, hex_asc_upper) == NULL))
+		return KDB_BADINT;
 
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
