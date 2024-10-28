Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA89B3A4F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 20:19:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5VGz-0006qp-5D
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 19:19:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t5VGy-0006qe-5g
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAoVBLST7aaflzoAvIIer7iI4G/wHAvHcFWLlNv/Acg=; b=mcxYkx7/3unBK0x7VyE1giiFqk
 K6rJ3irEuc8U29BUPeKXPDicp2tnQdpI/T6ftK8t3WlagKoRZl/OLn5jCMULL7i6VYFd7o3f3adBz
 6t4IqXUYUmF1mrWblo2QkSw2dlaP1qu3IRx6P8G9I6xU19OC5OIOOXO3xzhp2NkVYiFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pAoVBLST7aaflzoAvIIer7iI4G/wHAvHcFWLlNv/Acg=; b=Fou+8NT/qlGUsBvvQXHqPrp6B/
 0ckCDGPuO7i+sHN6eMZu8lLKH360i3IieYqpRqUDmpw3yIR7u3zZOEAhue61nck0RFIFhkBAo8p4D
 XScuB5xgLLn3FINvVeUxHHYoneFXHoyN6cIrFHOVT6SWAIg8ogbVbGcSCCdEcG5Y3TVc=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5VGx-0003Aa-9p for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:19:28 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id A1F51177105; Mon, 28 Oct 2024 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1730143156; bh=sbgrO/yBULG2+7IsMeomLRSzsqua8q10+wJvS4i1xf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANzo7qWSKjNcfjWeS/On7Q8LOFvZW1NQYrrwlUqgz4lT08STwBlQYCyokQlk9frM5
 D29GdRUxfCbNNLNDheT5aKyNDSKdiIb2vUbThEBa34lxW5DKM+8Oz5XpMOPPmvYPq2
 9ciWjZcsZfloirhmaTr93CNe3KkkFrjUlpN5t9e4UXMpjiT3OZCilK7HoFav9RXFaF
 a5hwzqbqyJuxgkNuAPDOgWpiuUGjexCV2dZHqVkROVwj0nevgXcr4KcOWrm+cWfgxs
 FMQu/Q2QGz2xPwPNFIWFg0MOoAjKhju5c29AvTzyFR1fugHaG/1QV0pTz73HBmVyXK
 MTngLGPkTgU0g==
Date: Mon, 28 Oct 2024 19:19:16 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241028191916.GA918454@lichtman.org>
References: <20241028191700.GA918263@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028191700.GA918263@lichtman.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yuran Pereira <yuran.pereira@hotmail.com> The
 simple_str*
 family of functions perform no error checking in scenarios where the input
 value overflows the intended output variable. This results in these functions
 successfully returning even whe [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1t5VGx-0003Aa-9p
Subject: [Kgdb-bugreport] [PATCH v4 1/3] kdb: Replace the use of
 simple_strto with safer kstrto in kdb_main
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
Cc: daniel.thompson@linaro.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Yuran Pereira <yuran.pereira@hotmail.com>

The simple_str* family of functions perform no error checking in
scenarios where the input value overflows the intended output variable.
This results in these functions successfully returning even when the
output does not match the input string.

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch replaces all uses of the simple_strto* series of functions
with their safer kstrto* alternatives.

Side effects of this patch:
- Every string to long or long long conversion using kstrto* is now
  checked for failure.
- kstrto* errors are handled with appropriate `KDB_BADINT` wherever
  applicable.
- A good side effect is that we end up saving a few lines of code
  since unlike in simple_strto* functions, kstrto functions do not
  need an additional "end pointer" variable, and the return values
  of the latter can be directly checked in an "if" statement without
  the need to define additional `ret` or `err` variables.
  This, of course, results in cleaner, yet still easy to understand
  code.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
[nir: addressed review comments by fixing styling, invalid conversion and a missing error return]
Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/debug/kdb/kdb_main.c | 69 +++++++++++--------------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index f5f7d7fb5936..f8703ab760d9 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -306,8 +306,8 @@ static int kdbgetulenv(const char *match, unsigned long *value)
 		return KDB_NOTENV;
 	if (strlen(ep) == 0)
 		return KDB_NOENVVALUE;
-
-	*value = simple_strtoul(ep, NULL, 0);
+	if (kstrtoul(ep, 0, value))
+		return KDB_BADINT;
 
 	return 0;
 }
@@ -402,42 +402,23 @@ static void kdb_printenv(void)
  */
 int kdbgetularg(const char *arg, unsigned long *value)
 {
-	char *endp;
-	unsigned long val;
-
-	val = simple_strtoul(arg, &endp, 0);
-
-	if (endp == arg) {
-		/*
-		 * Also try base 16, for us folks too lazy to type the
-		 * leading 0x...
-		 */
-		val = simple_strtoul(arg, &endp, 16);
-		if (endp == arg)
+	/*
+	 * If the first fails, also try base 16, for us
+	 * folks too lazy to type the leading 0x...
+	 */
+	if (kstrtoul(arg, 0, value)) {
+		if (kstrtoul(arg, 16, value))
 			return KDB_BADINT;
 	}
-
-	*value = val;
-
 	return 0;
 }
 
 int kdbgetu64arg(const char *arg, u64 *value)
 {
-	char *endp;
-	u64 val;
-
-	val = simple_strtoull(arg, &endp, 0);
-
-	if (endp == arg) {
-
-		val = simple_strtoull(arg, &endp, 16);
-		if (endp == arg)
+	if (kstrtou64(arg, 0, value)) {
+		if (kstrtou64(arg, 16, value))
 			return KDB_BADINT;
 	}
-
-	*value = val;
-
 	return 0;
 }
 
@@ -473,10 +454,10 @@ int kdb_set(int argc, const char **argv)
 	 */
 	if (strcmp(argv[1], "KDBDEBUG") == 0) {
 		unsigned int debugflags;
-		char *cp;
+		int ret;
 
-		debugflags = simple_strtoul(argv[2], &cp, 0);
-		if (cp == argv[2] || debugflags & ~KDB_DEBUG_FLAG_MASK) {
+		ret = kstrtouint(argv[2], 0, &debugflags);
+		if (ret || debugflags & ~KDB_DEBUG_FLAG_MASK) {
 			kdb_printf("kdb: illegal debug flags '%s'\n",
 				    argv[2]);
 			return 0;
@@ -1619,10 +1600,10 @@ static int kdb_md(int argc, const char **argv)
 		if (!argv[0][3])
 			valid = 1;
 		else if (argv[0][3] == 'c' && argv[0][4]) {
-			char *p;
-			repeat = simple_strtoul(argv[0] + 4, &p, 10);
+			if (kstrtouint(argv[0] + 4, 10, &repeat))
+				return KDB_BADINT;
 			mdcount = ((repeat * bytesperword) + 15) / 16;
-			valid = !*p;
+			valid = 1;
 		}
 		last_repeat = repeat;
 	} else if (strcmp(argv[0], "md") == 0)
@@ -2083,15 +2064,10 @@ static int kdb_dmesg(int argc, const char **argv)
 	if (argc > 2)
 		return KDB_ARGCOUNT;
 	if (argc) {
-		char *cp;
-		lines = simple_strtol(argv[1], &cp, 0);
-		if (*cp)
+		if (kstrtoint(argv[1], 0, &lines))
 			lines = 0;
-		if (argc > 1) {
-			adjust = simple_strtoul(argv[2], &cp, 0);
-			if (*cp || adjust < 0)
-				adjust = 0;
-		}
+		if (argc > 1 && (kstrtoint(argv[2], 0, &adjust) || adjust < 0))
+			adjust = 0;
 	}
 
 	/* disable LOGGING if set */
@@ -2428,14 +2404,12 @@ static int kdb_help(int argc, const char **argv)
 static int kdb_kill(int argc, const char **argv)
 {
 	long sig, pid;
-	char *endp;
 	struct task_struct *p;
 
 	if (argc != 2)
 		return KDB_ARGCOUNT;
 
-	sig = simple_strtol(argv[1], &endp, 0);
-	if (*endp)
+	if (kstrtol(argv[1], 0, &sig))
 		return KDB_BADINT;
 	if ((sig >= 0) || !valid_signal(-sig)) {
 		kdb_printf("Invalid signal parameter.<-signal>\n");
@@ -2443,8 +2417,7 @@ static int kdb_kill(int argc, const char **argv)
 	}
 	sig = -sig;
 
-	pid = simple_strtol(argv[2], &endp, 0);
-	if (*endp)
+	if (kstrtol(argv[2], 0, &pid))
 		return KDB_BADINT;
 	if (pid <= 0) {
 		kdb_printf("Process ID must be large than 0.\n");
-- 
2.39.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
