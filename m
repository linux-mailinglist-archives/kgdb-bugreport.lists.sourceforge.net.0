Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F910CA45
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Nov 2019 15:20:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iaKf2-00064I-NU
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Nov 2019 14:20:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <colin.king@canonical.com>) id 1iaJWf-0001CZ-QQ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Nov 2019 13:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rTzeQxkPlZt6P6Atu9/S+3q4U9ix17PWkcFYSIge2e4=; b=GNM8BO6iYY8GnD86UnU45GK2tW
 dp9n3HbL/pgWLCz0cLdQhH+1jlSWcfttrww6DJ3wRQCFgfnyrjb6APuFimVuIjoEg5DySeqU9ubO6
 0kDKepO+xuRaJQz/xNNJUDHpIKrdZz1StJ/6VIk6CVNmjeeQLOydmo/RX04TfjqNptJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rTzeQxkPlZt6P6Atu9/S+3q4U9ix17PWkcFYSIge2e4=; b=O
 p6e4CzWHdbx48V5GvXRco9m7sg17lmFbtPtibIPMN30iSpn4H1ZW6IKz42Lc+NuoNPmxswvVakXFY
 hHLyE2xtT95UiiTf1/JKN/iyhnOtj6Hg2o68VQwxYqqnf3AiwqfVdnSrqMI3jiMM94ogv464spSUa
 N41DERo6mYpfj3jQ=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1iaJWd-00GJUx-JS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Nov 2019 13:08:05 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iaJWU-0000Ep-1V; Thu, 28 Nov 2019 13:07:54 +0000
From: Colin King <colin.king@canonical.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net
Date: Thu, 28 Nov 2019 13:07:53 +0000
Message-Id: <20191128130753.181246-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: canonical.com]
X-Headers-End: 1iaJWd-00GJUx-JS
X-Mailman-Approved-At: Thu, 28 Nov 2019 14:20:43 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: remove redundant assignment to
 pointer bp
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Colin Ian King <colin.king@canonical.com>

The point bp is assigned a value that is never read, it is being
re-assigned later to bp = &kdb_breakpoints[lowbp] in a for-loop.
Remove the redundant assignment.

Addresses-Coverity ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/debug/kdb/kdb_bp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index 62c301ad0773..d7ebb2c79cb8 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -412,7 +412,6 @@ static int kdb_bc(int argc, const char **argv)
 		 * assume that the breakpoint number is desired.
 		 */
 		if (addr < KDB_MAXBPT) {
-			bp = &kdb_breakpoints[addr];
 			lowbp = highbp = addr;
 			highbp++;
 		} else {
-- 
2.24.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
