Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7B694E8FD
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 10:55:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdQpk-0001Z5-Ve
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 08:55:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdQpi-0001Yx-Mw
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 08:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57sepqWn/sUxIbQd3TpbiUWWZXp1hqxPZsAhBlY1icA=; b=CmUCVN2W2drWCz3JWs9BTk+X5z
 tvgzYXEW/GU5XiM7Q4PrHYXqkiJ7+E9tasJ/1tmS87OE/aT6XpudkDL6cGT2+0fWeYXbXzCbmjL9m
 Pqs+ULFzdbhXiKeclfXQA8kTd43vnEXwT5cDDIZAW6krwR7bXm7JRqYWsgNcKn05iWa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=57sepqWn/sUxIbQd3TpbiUWWZXp1hqxPZsAhBlY1icA=; b=a
 NvqhPZ3vjuN1w/QqEIUTe9d2lBJ0jj5CYzn0wkrbcEFFwtk4Ywu/fNsasZDVbbosLZcH8pDfL6gas
 ilU48uhOhDuVieweXwo+YtUO/THsgdRiBvJzejMuYcBbBp6ajNilGJN18Td11ZWk9BJHgZc1gp+cj
 Sk7WfjL5B6fOjpy4=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdQpg-0000Xd-66 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 08:55:18 +0000
Received: (qmail 17320 invoked by uid 990); 12 Aug 2024 08:55:09 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 12 Aug 2024 10:55:08 +0200
From: Florian Rommel <mail@florommel.de>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Mon, 12 Aug 2024 10:54:59 +0200
Message-ID: <20240812085459.291741-1-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.998197) MIME_GOOD(-0.1)
 R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.598197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=U2xzaysom7aggwNAgqQ4tbOTx6Vj6CldEEI4Twwh5kA=;
 b=f/GZTBtKx8fKpeZpOmH3VDWt4ZZOWTfNNz77oPV7I3KGPFg3FOxX//BswJY12X9wpP2Q/5btGX
 CGGBIntfumlcApFZwoIdl2pV+km8FrAjU5I27wK1YPuuIyaEAUp4UWFj3VxETl6UfyhjlVPfhwN9
 Pxom3lf5rKr3fkN93yX7mkDPedQ5NpttPtcpZLS6D1aSuL723ijrjhTr4wV1tYY7mHEodCw6fYkQ
 6h7y9qD9RRki9mWvfiehPdW6qnCQTQ8gz2KlNNCZ57ndpljzMxFvw/7/yY+c9cRNrXyx0mePFnYk
 Px33vDGlkqxeA2AJI3n+EPMBXuMdmuH6FLOkicbUTR2Mjy0pvgK094dySYevapWndSkkNqpDp+4A
 hijYDzqVUIDAV9mF9HhLM64Re/+uYGIyzXh5i6BqiqjucRLUcL6O2GhcTw5GHlwX4+IihFgI7B/0
 /XytifEyKhhKfW7WUItH/uz45L5nSXTMcvW7k4xEWwIKJRlRnLeWxJ1TFbGxBuvEvMrX6SZMrkLI
 YwtYlNY63CO7b2uamtUpiy46JfqcnBMVwGFABdbCIelzjpcfKJojU0pbaFMkwNVmvikrv9uqgWx1
 i8qM6DU9OInhOUg7q2t6LfA45FEYOl6sjxuKm2TEJBBcVTDF08RUoFN5VCI3sI6ZTRZU1Qo1bgtw
 s=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The test for access watchpoints (hw_access_break_test) was
 broken (always failed) because the compiler optimized out the write to the
 static helper variable (hw_break_val2), as it is never read anywhe [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.26.156.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdQpg-0000Xd-66
Subject: [Kgdb-bugreport] [PATCH] kgdbts: fix hw_access_break_test
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
Cc: Florian Rommel <mail@florommel.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The test for access watchpoints (hw_access_break_test) was broken
(always failed) because the compiler optimized out the write to the
static helper variable (hw_break_val2), as it is never read anywhere.
This resulted in the target variable (hw_break_val) not being accessed
and thus the breakpoint not being triggered.

Remove the helper variable (hw_break_val2), and use READ_ONCE to force
reading the target variable (hw_break_val).

Signed-off-by: Florian Rommel <mail@florommel.de>
---
 drivers/misc/kgdbts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 88b91ad8e541..0cf31164b470 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -95,6 +95,7 @@
 #include <linux/kallsyms.h>
 
 #include <asm/sections.h>
+#include <asm/rwonce.h>
 
 #define v1printk(a...) do {		\
 	if (verbose)			\
@@ -126,7 +127,6 @@ static int final_ack;
 static int force_hwbrks;
 static int hwbreaks_ok;
 static int hw_break_val;
-static int hw_break_val2;
 static int cont_instead_of_sstep;
 static unsigned long cont_thread_id;
 static unsigned long sstep_thread_id;
@@ -284,7 +284,7 @@ static void hw_rem_access_break(char *arg)
 
 static void hw_break_val_access(void)
 {
-	hw_break_val2 = hw_break_val;
+	READ_ONCE(hw_break_val);
 }
 
 static void hw_break_val_write(void)
-- 
2.46.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
