Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 802163791DD
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 May 2021 17:04:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lg7Se-00057J-Ly
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 May 2021 15:04:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lg7Sc-00057B-QS
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 May 2021 15:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jdYJkkj29NwpYVvjgfY8FHXag2cPo8Xu+j//oZAxZsI=; b=jZY1ubTOqwAssWQ5qnsFCi5xpN
 tV6X8OOsNqVqkeOycHoLLuokVTnTKX2EwKfp2o6avzyGMXmgTrLeqvJxS4HSAkd4TlKxVXKclOzRF
 La60sIQJF7cIWcsuaYJRkVHhCkuVMftLP2C5wHfgcrX0sxJ/70W2KxaZK18F30wHWY6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jdYJkkj29NwpYVvjgfY8FHXag2cPo8Xu+j//oZAxZsI=; b=S
 LEaXvrOv40w/mkZR6H7TFtMAQpDcZxTbptcy9WKJA72eruLNNJ7N+A/0jUrRiwIdvUahLm3mhXLIj
 MpvrpnNdaHrv3NprbFQhwt8H8J69ye9yvt4UjWiTyHGqQvdu8i/d3Qbgqr7YCQBgZFcDcwF+cSoLs
 9mmVCsxOoa0cxAGs=;
Received: from mga06.intel.com ([134.134.136.31])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg7SX-002Cet-4S
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 May 2021 15:04:43 +0000
IronPort-SDR: rMyzeYq7CZf7klgRI8cLPu3hiiOG0LBZ3FC6tMxdpnQ5zqRkWgTr1/bEBsE6HEGC9WS4qZVCbu
 6LJbk5E5vJzg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260478000"
X-IronPort-AV: E=Sophos;i="5.82,286,1613462400"; d="scan'208";a="260478000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 08:04:31 -0700
IronPort-SDR: 5HtizJ1vAOQZfmDWuujDPkjkF4zn0yMx9a+JK8MEiXghp0HskM5L/WkqyoCEer5wcgyVmNat77
 67u0ynZXBGMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="470818104"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2021 08:03:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6A7D812A; Mon, 10 May 2021 18:04:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
 Joe Perches <joe@perches.com>, Sumit Garg <sumit.garg@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-nilfs@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Date: Mon, 10 May 2021 18:04:10 +0300
Message-Id: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lg7SX-002Cet-4S
Subject: [Kgdb-bugreport] [PATCH v1 1/4] lib/vsprintf: Allow to override
 date and time separator
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

ISO 8601 defines 'T' as a separator between date and time. Though,
some ABIs use time and date with ' ' separator instead.

Add a flavour to the %pt specifier to override default separator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/core-api/printk-formats.rst |  6 +++++-
 lib/test_printf.c                         |  5 +++++
 lib/vsprintf.c                            | 19 ++++++++++++++++---
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index f063a384c7c8..bc85fd4685e7 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -514,9 +514,10 @@ Time and date
 ::
 
 	%pt[RT]			YYYY-mm-ddTHH:MM:SS
+	%pt[RT]s		YYYY-mm-dd HH:MM:SS
 	%pt[RT]d		YYYY-mm-dd
 	%pt[RT]t		HH:MM:SS
-	%pt[RT][dt][r]
+	%pt[RT][dt][rs]
 
 For printing date and time as represented by::
 
@@ -528,6 +529,9 @@ in human readable format.
 By default year will be incremented by 1900 and month by 1.
 Use %pt[RT]r (raw) to suppress this behaviour.
 
+The %pt[RT]s (space) will override ISO 8601 by using ' ' instead of 'T'
+between date and time. It won't have any effect when date or time is omitted.
+
 Passed by reference.
 
 struct clk
diff --git a/lib/test_printf.c b/lib/test_printf.c
index ec0d5976bb69..8ac71aee46af 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -528,6 +528,11 @@ time_and_date(void)
 	test("0119-00-04T15:32:23", "%ptTr", &t);
 	test("15:32:23|2019-01-04", "%ptTt|%ptTd", &t, &t);
 	test("15:32:23|0119-00-04", "%ptTtr|%ptTdr", &t, &t);
+
+	test("2019-01-04 15:32:23", "%ptTs", &t);
+	test("0119-00-04 15:32:23", "%ptTsr", &t);
+	test("15:32:23|2019-01-04", "%ptTts|%ptTds", &t, &t);
+	test("15:32:23|0119-00-04", "%ptTtrs|%ptTdrs", &t, &t);
 }
 
 static void __init
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index f0c35d9b65bf..5f36c7a43cdc 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1834,7 +1834,8 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
 	      struct printf_spec spec, const char *fmt)
 {
 	bool have_t = true, have_d = true;
-	bool raw = false;
+	bool raw = false, space = false;
+	bool found = true;
 	int count = 2;
 
 	if (check_pointer(&buf, end, tm, spec))
@@ -1851,14 +1852,26 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
 		break;
 	}
 
-	raw = fmt[count] == 'r';
+	do {
+		switch (fmt[count++]) {
+		case 'r':
+			raw = true;
+			break;
+		case 's':
+			space = true;
+			break;
+		default:
+			found = false;
+			break;
+		}
+	} while (found);
 
 	if (have_d)
 		buf = date_str(buf, end, tm, raw);
 	if (have_d && have_t) {
 		/* Respect ISO 8601 */
 		if (buf < end)
-			*buf = 'T';
+			*buf = space ? ' ' : 'T';
 		buf++;
 	}
 	if (have_t)
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
