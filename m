Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619237926C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 May 2021 17:19:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lg7h9-0006f4-9Q
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 May 2021 15:19:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lg7h6-0006er-HC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 May 2021 15:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BC2GSXHk6PHUwj0JYTEZ6Y2qfFay8GkilUHRjcodHqA=; b=WesEf+5W63lLwB5HYcTbbVr+zn
 s/EbkyErT/tn9wKR2wqFw73YJTGWI7abb2I1s+Sj165+SkDWFq+VLh4sKaYZYpve90iWpPXLmlRgd
 CHs4gbG8XIhIeLorYDghDFHydiPTuf8akRjmPOQNhKPiV+OHarkhVV8/rU134ZbCvWO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BC2GSXHk6PHUwj0JYTEZ6Y2qfFay8GkilUHRjcodHqA=; b=muQaWS73SmfXsX89BugZdVOylr
 /NTwsEiae1SbuLFN+QI9gfnWIyEdTCIjfgQ37OL0xr/Mvhm1RqC4MYTfEg0aRWzTuKsXG0/qUKUN0
 Np7wmZAyY4XkYdkUf7NDlmoRFz/TIQN8698Cu7MAlXFvG2bCEVbASHNXQZq36AwpFHjQ=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg7h0-0005hO-AA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 May 2021 15:19:41 +0000
IronPort-SDR: ya1Vlz5PPEYXg9tkqW9V2hdNK/wzjsg3Gxz1GVaX+IqK7WlWm5tfYzwMIM/y4Vq7uUASWJ34kj
 HgQgvr9S+baQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="198891288"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="198891288"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 08:04:01 -0700
IronPort-SDR: vtCioZJlQQudEsVBPUFAdiRcXz8hr8ByH7nkY/1QzNUsTgRdwzS673eAs+6b+hMtXD267On8EP
 QquePXuHOn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="536448298"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 10 May 2021 08:03:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7EA3F147; Mon, 10 May 2021 18:04:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
 Joe Perches <joe@perches.com>, Sumit Garg <sumit.garg@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-nilfs@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Date: Mon, 10 May 2021 18:04:12 +0300
Message-Id: <20210510150413.59356-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lg7h0-0005hO-AA
Subject: [Kgdb-bugreport] [PATCH v1 3/4] nilfs2: Switch to use %ptTs
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
---
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
