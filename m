Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A65937AAE2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 17:40:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgUUM-00044G-HD
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 15:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgUUI-00043p-AF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 15:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wbgQjGe3g3yszoqHAZDrtdS2KszpmGd0Nv94KR3A70w=; b=Ejx8j8v0XdgQ12hBnjAOkHEM9I
 8vjfBdj8jJJ7tvcd0bU+FgmKJJMRjOMYreE+JMZyFiFYxPUrBny8eTpmuGOG/BMQnSrbD6peF6rO7
 92pQPGMcRmeUcUEg1JtgOihsZ6DBSUms4mWeYgUhPUcYIULNNW5V4pCQkn6YxJf86kyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wbgQjGe3g3yszoqHAZDrtdS2KszpmGd0Nv94KR3A70w=; b=e
 AsM5NgpBSwYYx2uFqoPPclUrr7ap3UJctHuU76w7/wBlcSNxeGnXtmIOI5UXgMx9D/KQDOzQcKvuh
 qZ8VPkk212BT4WSb0zQ5R85LEAt79+DNXYfHKaIVOUi1EPgqVVSCQFeF8fZ7U4xgnrzaQWG4ILtwP
 fX9Z/8vgmifxJQtc=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgUUB-0006dG-O3
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 15:39:57 +0000
IronPort-SDR: rPEKjQCrroQq5jCks8xOZ1ADPt0DWR0g83Cev6OqPW22ojpC+MUROt6Vb7RbQgebLuf4yViKlf
 pYCM8sVB+W0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196377023"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="196377023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 08:39:45 -0700
IronPort-SDR: BmOdmLk95HugbOBhf/VKi8M9ccrx7snWj519gBrlC2bQnNhtXA3yQfhaFPsqxh2n6tgM7lv4WM
 FP1+rlI4gmjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="434604794"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 08:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2186BD7; Tue, 11 May 2021 18:40:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
 Joe Perches <joe@perches.com>, Sumit Garg <sumit.garg@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-nilfs@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Date: Tue, 11 May 2021 18:39:55 +0300
Message-Id: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lgUUB-0006dG-O3
Subject: [Kgdb-bugreport] [PATCH v2 1/4] lib/vsprintf: Allow to override ISO
 8601 date and time separator
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
some ABIs use time and date with ' ' (space) separator instead.

Add a flavour to the %pt specifier to override default separator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed the parameters set, renamed variable and dropped comment (Petr)
 Documentation/core-api/printk-formats.rst |  7 ++++++-
 lib/test_printf.c                         |  5 +++++
 lib/vsprintf.c                            | 22 +++++++++++++++++-----
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index f063a384c7c8..1dd4ebf0be79 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -514,9 +514,10 @@ Time and date
 ::
 
 	%pt[RT]			YYYY-mm-ddTHH:MM:SS
+	%pt[RT]s		YYYY-mm-dd HH:MM:SS
 	%pt[RT]d		YYYY-mm-dd
 	%pt[RT]t		HH:MM:SS
-	%pt[RT][dt][r]
+	%pt[RT][dt][r][s]
 
 For printing date and time as represented by::
 
@@ -528,6 +529,10 @@ in human readable format.
 By default year will be incremented by 1900 and month by 1.
 Use %pt[RT]r (raw) to suppress this behaviour.
 
+The %pt[RT]s (space) will override ISO 8601 separator by using ' ' (space)
+instead of 'T' (Capital T) between date and time. It won't have any effect
+when date or time is omitted.
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
index f0c35d9b65bf..14a4e4e8a657 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1834,7 +1834,8 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
 	      struct printf_spec spec, const char *fmt)
 {
 	bool have_t = true, have_d = true;
-	bool raw = false;
+	bool raw = false, iso8601_separator = true;
+	bool found = true;
 	int count = 2;
 
 	if (check_pointer(&buf, end, tm, spec))
@@ -1851,14 +1852,25 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
 		break;
 	}
 
-	raw = fmt[count] == 'r';
+	do {
+		switch (fmt[count++]) {
+		case 'r':
+			raw = true;
+			break;
+		case 's':
+			iso8601_separator = false;
+			break;
+		default:
+			found = false;
+			break;
+		}
+	} while (found);
 
 	if (have_d)
 		buf = date_str(buf, end, tm, raw);
 	if (have_d && have_t) {
-		/* Respect ISO 8601 */
 		if (buf < end)
-			*buf = 'T';
+			*buf = iso8601_separator ? 'T' : ' ';
 		buf++;
 	}
 	if (have_t)
@@ -2298,7 +2310,7 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  * - 'd[234]' For a dentry name (optionally 2-4 last components)
  * - 'D[234]' Same as 'd' but for a struct file
  * - 'g' For block_device name (gendisk + partition number)
- * - 't[RT][dt][r]' For time and date as represented by:
+ * - 't[RT][dt][r][s]' For time and date as represented by:
  *      R    struct rtc_time
  *      T    time64_t
  * - 'C' For a clock, it prints the name (Common Clock Framework) or address
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
