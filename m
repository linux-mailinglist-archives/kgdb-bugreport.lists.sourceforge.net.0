Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0637AAEE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 17:40:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgUUP-0004Wc-QX
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 15:40:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgUUK-0004W8-0p
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 15:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pzy/GRhdrHsdrGF2AyT7ghtkMm1ih6Ktu2lDno8HSjQ=; b=jb7kr10BuXZA4MVDZDNyacuOix
 BV0w4s5eRctzj87dqfYX/1jBkGTX4oLkZF2NTxaybA5PJjrXXHrX+mshU7wE38WY1UunM/ZDi6H25
 vkerqJd3tYKnPuvDkEknR+x1IDoO5PuyDumiye6zGEOo8UbSidacniJVrOV85nGMbTg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pzy/GRhdrHsdrGF2AyT7ghtkMm1ih6Ktu2lDno8HSjQ=; b=m4IIK5xr4cQpAY7CJ3i9Q2WUeM
 LpqfT3hocn3XyCa4Cjwjw754JSONihwlkXcZOiktkIOlRGO0FYGNKHPpo1DFpuqygQjnqfKghFJGU
 92Tor4V4MWY6F76QsDJb2WF35hrvK8iUnMgQFYdJ82Rmo9oqWNmBN3GJZDtRm6Avm6aI=;
Received: from mga02.intel.com ([134.134.136.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgUUE-0006dT-1e
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 15:40:01 +0000
IronPort-SDR: A6Q5zBQdYWL6xhvSkERAeI10tQjo78Hqh3Hy1gdGRNKqzJDb3t5zkvSBfYBjZj2YnRc5gFf9Kx
 qtjeY8J+DmJw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186607628"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="186607628"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 08:39:47 -0700
IronPort-SDR: 86nZRXlTLEaCDpZ77Kn6dY841tLXMMFInjNL2kB6ChDDRP8mHmyFf4eIjAZI0NIK1sw0HbHnIq
 Vz7xzlUM6U6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="392345254"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2021 08:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 41F98249; Tue, 11 May 2021 18:40:01 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
 Joe Perches <joe@perches.com>, Sumit Garg <sumit.garg@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-nilfs@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Date: Tue, 11 May 2021 18:39:57 +0300
Message-Id: <20210511153958.34527-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.20 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lgUUE-0006dT-1e
Subject: [Kgdb-bugreport] [PATCH v2 3/4] nilfs2: Switch to use %ptTs
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

Use %ptTs instead of open coded variant to print contents
of time64_t type in human readable form.

Use sysfs_emit() at the same time in the changed functions.

Cc: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: linux-nilfs@vger.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
v2: collected tags
 fs/nilfs2/sysfs.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/fs/nilfs2/sysfs.c b/fs/nilfs2/sysfs.c
index 303d71430bdd..4e10423f0448 100644
--- a/fs/nilfs2/sysfs.c
+++ b/fs/nilfs2/sysfs.c
@@ -19,19 +19,6 @@
 /* /sys/fs/<nilfs>/ */
 static struct kset *nilfs_kset;
 
-#define NILFS_SHOW_TIME(time_t_val, buf) ({ \
-		struct tm res; \
-		int count = 0; \
-		time64_to_tm(time_t_val, 0, &res); \
-		res.tm_year += 1900; \
-		res.tm_mon += 1; \
-		count = scnprintf(buf, PAGE_SIZE, \
-				    "%ld-%.2d-%.2d %.2d:%.2d:%.2d\n", \
-				    res.tm_year, res.tm_mon, res.tm_mday, \
-				    res.tm_hour, res.tm_min, res.tm_sec);\
-		count; \
-})
-
 #define NILFS_DEV_INT_GROUP_OPS(name, parent_name) \
 static ssize_t nilfs_##name##_attr_show(struct kobject *kobj, \
 					struct attribute *attr, char *buf) \
@@ -576,7 +563,7 @@ nilfs_segctor_last_seg_write_time_show(struct nilfs_segctor_attr *attr,
 	ctime = nilfs->ns_ctime;
 	up_read(&nilfs->ns_segctor_sem);
 
-	return NILFS_SHOW_TIME(ctime, buf);
+	return sysfs_emit(buf, "%ptTs\n", &ctime);
 }
 
 static ssize_t
@@ -604,7 +591,7 @@ nilfs_segctor_last_nongc_write_time_show(struct nilfs_segctor_attr *attr,
 	nongc_ctime = nilfs->ns_nongc_ctime;
 	up_read(&nilfs->ns_segctor_sem);
 
-	return NILFS_SHOW_TIME(nongc_ctime, buf);
+	return sysfs_emit(buf, "%ptTs\n", &nongc_ctime);
 }
 
 static ssize_t
@@ -724,7 +711,7 @@ nilfs_superblock_sb_write_time_show(struct nilfs_superblock_attr *attr,
 	sbwtime = nilfs->ns_sbwtime;
 	up_read(&nilfs->ns_sem);
 
-	return NILFS_SHOW_TIME(sbwtime, buf);
+	return sysfs_emit(buf, "%ptTs\n", &sbwtime);
 }
 
 static ssize_t
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
