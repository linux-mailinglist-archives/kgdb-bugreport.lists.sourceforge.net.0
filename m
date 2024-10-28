Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1DB9B3A5B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 20:22:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5VJz-0001o1-E5
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 19:22:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t5VJx-0001nv-PR
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IMTYA7R+qYz96hph/uzKY7Zgp9oNYhe3aSzXBC5iiko=; b=CMhOz88q2U+P9Pqur/pFJ0FVeP
 jUCtmLOEzqrKcAZQl5cmaRKzgvhab3pxw7vxU0+LU9/ZNR08oRz2iOau6ivz3Xwjz7WfWB/Q9mq/i
 WNcAjc3SmPQWYZ2jS+EfELTgyHDX9HtBCDasjkjH1ixjqKUPR4kpNFfJZ+DKpscDw3J4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IMTYA7R+qYz96hph/uzKY7Zgp9oNYhe3aSzXBC5iiko=; b=QcfWxZgUEGor1jZycbLRnSp3ZB
 x5Q8L6CxNixBeYu90wNnql72/Ae01nC2uQIjP2erRWzcbjgzBPbCSnCro3eVvWwtKg8HfqjvdjwtC
 4C6Gf4fzabjzhvNRoj+KVAurIZJLHus3jkOeie4Dwa3x2vcfitplh8bR93+7cb391TPU=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5VJx-0003Jl-RL for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:22:34 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 37E6F177105; Mon, 28 Oct 2024 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1730143348; bh=szimE7eBz9lG15cvVJZu71amUFqFA7UkiIsHssfIPCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/jywdv42FPkDQrTpWP48OpYogue+g+GhfVCISb5pVNwsXbtvtZ8km20XEiUQegzb
 O7FznrT4h9ELt/2pv82bOJgTqC6sNB5S5tIeq7px7bbj3mhksZpBrq3SazNfHqDRWJ
 Yx+JNEheHm1C10scgOBjLi/UZP0sXA7C9gZsOF7pX2HphD87aQaBm3mMEE/kHFxXbR
 fnksx5Ro5eF++OqzgHIHZucx45OJ/ph5NYa9G25w5i/8J3/UAh5vrAojgrFzun88l6
 gJXLK6Mxa3UwDhSkTzgKrSF3Cf9uOGXgeazHMT62aYp3OJYCl24R1T0Tjd3wjHHI9O
 u1EZAuMHzerSg==
Date: Mon, 28 Oct 2024 19:22:28 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241028192228.GC918454@lichtman.org>
References: <20241028191700.GA918263@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028191700.GA918263@lichtman.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove logic that enables a fallback of interpreting numbers
 supplied in KDB CLI to be interpreted as hex without explicit "0x" prefix
 as this can be confusing for the end users. Suggested-by: Douglas Anderson
 <dianders@chromium.org> Reviewed-by: Douglas Anderson <dianders@chromium.org>
 Signed-off-by: Nir Lichtman <nir@lichtman.org> --- kernel/debug/kdb/kdb_main.c
 | 16 ++++--- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t5VJx-0003Jl-RL
Subject: [Kgdb-bugreport] [PATCH v4 3/3] kdb: Remove fallback interpretation
 of arbitrary numbers as hex
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

Remove logic that enables a fallback of interpreting numbers supplied in KDB CLI
to be interpreted as hex without explicit "0x" prefix as this can be confusing
for the end users.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/debug/kdb/kdb_main.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index f8703ab760d9..5f4be507d79f 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -402,23 +402,15 @@ static void kdb_printenv(void)
  */
 int kdbgetularg(const char *arg, unsigned long *value)
 {
-	/*
-	 * If the first fails, also try base 16, for us
-	 * folks too lazy to type the leading 0x...
-	 */
-	if (kstrtoul(arg, 0, value)) {
-		if (kstrtoul(arg, 16, value))
-			return KDB_BADINT;
-	}
+	if (kstrtoul(arg, 0, value))
+		return KDB_BADINT;
 	return 0;
 }
 
 int kdbgetu64arg(const char *arg, u64 *value)
 {
-	if (kstrtou64(arg, 0, value)) {
-		if (kstrtou64(arg, 16, value))
-			return KDB_BADINT;
-	}
+	if (kstrtou64(arg, 0, value))
+		return KDB_BADINT;
 	return 0;
 }
 
-- 
2.39.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
