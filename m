Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E12148BB4
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Jan 2020 17:16:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iv1dN-0002bu-Bc
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Jan 2020 16:16:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iv1dL-0002bn-FA
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Jan 2020 16:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nSXw1FH2Wu4q8idO487DbalH4sVKjca42Sb3FT6ZgYk=; b=e7ah6i4N1CIG8XlFTA6fKjg95k
 fGTTjIyRfhnC6n45OCBLptFgpvbV06ppX+TNukb3E2vxFgQjC/D2H/WYPpBrSVh5Z/Zy6DXSZsaVT
 6BHp59Cc5mtUJkzKSgCa6J3ID9VDxnpZhVlb1xejEFfk84mk68YCao+pED9yEE17Df/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nSXw1FH2Wu4q8idO487DbalH4sVKjca42Sb3FT6ZgYk=; b=N
 KuC0i8dUWfYL17bH/fDr5mp2is6JwM+opga9DdWOo8D89Mk1Zm+qMpFHls57EZDsc3hkRyTLxD3k9
 4X5jOyI8oKiNlA/r9I+Rr1kXggk6gk9efC1udtIxf9DN8ny9AxS7QS9p1kW8afwACvUwJumD3v73l
 pL4EX+mnqlQy5QiU=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iv1dJ-0041c7-R4
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Jan 2020 16:16:35 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 08:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="375546997"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 24 Jan 2020 08:14:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6EE8C115; Fri, 24 Jan 2020 18:14:41 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Douglas Anderson <dianders@chromium.org>
Date: Fri, 24 Jan 2020 18:14:40 +0200
Message-Id: <20200124161440.65688-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iv1dJ-0041c7-R4
Subject: [Kgdb-bugreport] [PATCH v1] kdb: Use for_each_console() helper
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Replace open coded single-linked list iteration loop with for_each_console()
helper in use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/debug/kdb/kdb_io.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 8bcdded5d61f..924bc9298a42 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -553,7 +553,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 	int this_cpu, old_cpu;
 	char *cp, *cp2, *cphold = NULL, replaced_byte = ' ';
 	char *moreprompt = "more> ";
-	struct console *c = console_drivers;
+	struct console *c;
 	unsigned long uninitialized_var(flags);
 
 	/* Serialize kdb_printf if multiple cpus try to write at once.
@@ -698,10 +698,9 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 				cp2++;
 			}
 		}
-		while (c) {
+		for_each_console(c) {
 			c->write(c, cp, retlen - (cp - kdb_buffer));
 			touch_nmi_watchdog();
-			c = c->next;
 		}
 	}
 	if (logging) {
@@ -752,7 +751,6 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			moreprompt = "more> ";
 
 		kdb_input_flush();
-		c = console_drivers;
 
 		if (dbg_io_ops && !dbg_io_ops->is_console) {
 			len = strlen(moreprompt);
@@ -762,10 +760,9 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 				cp++;
 			}
 		}
-		while (c) {
+		for_each_console(c) {
 			c->write(c, moreprompt, strlen(moreprompt));
 			touch_nmi_watchdog();
-			c = c->next;
 		}
 
 		if (logging)
-- 
2.24.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
