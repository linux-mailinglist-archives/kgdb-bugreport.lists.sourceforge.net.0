Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA169B2F07
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2a-0007fX-3x
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t4iHV-0005H4-MS
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 26 Oct 2024 15:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Nfs1j0zoBi/S7b06OGDYmVcvuna4bmzP6bJXkVf9sY=; b=REI6/G6qzb5SqF9KgsrkjvcSKQ
 MpwHvmQz1Zf+/uLAriatEnPbznr+OvGJDF8xdjvb0JYljAr//dAaKkSX1QnCHxS+fXAZ12+ugerwm
 2FzgnQ3jpPszpi8hlSHphd02YkJasjsbXQbFP1sNKkfuVWweWGcI3IvhZTXUj1clswTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Nfs1j0zoBi/S7b06OGDYmVcvuna4bmzP6bJXkVf9sY=; b=dSNQQ62Zyvr2MgJ5Wx0zXbmBQ5
 mfYHZ6T/1Le9JAApCWmQsMERz4LCFtLI7+6DqnUgn5APRBHBExCBMikj6CGcNLdrnT3BmGXTCmsCq
 0TD+GofWCjkmH2rO/YEuFaLCsgHIHVLx/N5VSJujENNHA7mvR2Sl1RIjQKo2sqdDjH/g=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4iHV-000816-PU for kgdb-bugreport@lists.sourceforge.net;
 Sat, 26 Oct 2024 15:00:46 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 1946F177103; Sat, 26 Oct 2024 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729954840; bh=1LOBijO8+8t8Q8WP98HjEGTmpGQ9fmPyBouPtW6mbBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqorxNqVryyCnmkG7CnSzi+K4LAaFz3iVHymQ8XnzFQRDV0KKe+Ri2Pdxelw3JyJu
 OfcVCmxi7fx/zmjOIlNp8Z8GKWbj7ejhBU8kAM3BZ7nHJq/Yes9hUi2BEeRAh/VVIw
 DkoMMi4l2baedUUvtuZ11O3tbcc+XxdQz2b07J+Bev4ojAuXkGaxTv0sDcrG1MLSyE
 kf/3vHla1Gk9Hg1dfaANa4Tm1Hk26iv8wpTemjeKuBWd60xYK2SlEbMfs4MNjx66kI
 kbmE78YmihAhLLsRTTCub7vUMfmP10mXigt+pyGJV4IHsyVP+evmLEbC2888xl/N46
 J8lCxn2CIGlKg==
Date: Sat, 26 Oct 2024 15:00:40 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241026150040.GC892629@lichtman.org>
References: <20241026144724.GA892311@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241026144724.GA892311@lichtman.org>
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
 <dianders@chromium.org> Signed-off-by: Nir Lichtman <nir@lichtman.org> 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1t4iHV-000816-PU
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:56 +0000
Subject: [Kgdb-bugreport] [PATCH v3 3/3] kdb: Remove fallback interpretation
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
Signed-off-by: Nir Lichtman <nir@lichtman.org>

---
 kernel/debug/kdb/kdb_main.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930de4fdc708..d929a4335078 100644
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
