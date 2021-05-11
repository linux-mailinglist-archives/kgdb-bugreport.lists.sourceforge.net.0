Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD837AAEF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 17:40:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgUUX-0002x4-Ki
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 15:40:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgUUL-0002v6-CE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 15:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JUJz9ua0UCwm27hDGgm9Y4cqow//P5kgDv109NLO3T4=; b=QF3wC8gUAEz67LktmDkRbvE2Qk
 l3NQbut6eZj8j1XVdZA+g5HkWuxNgmxdnrQ1B5Tv0i7bZjr5WYljl1M1ReDG1lxuBrBkP2RVPUX/S
 u+h+oTv84NHnMWW5h8J9egeZ2mTTRRcJ9mBFvUHcjIL/4tklofm+h8lEjPVEhGV2RrFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JUJz9ua0UCwm27hDGgm9Y4cqow//P5kgDv109NLO3T4=; b=Q7779KsDiP361+fRLJDxE0Nk+k
 ESGcrBuCRQ7rqqGxQqOaF9tBBXMHXo7r5XHOD2wTg5q8fRnEK98vebg/zOAUiF3Jx042r5d7LeQvI
 1+DHo9spz43A9rzVedvr9+2w7F6YWa93CSvJm5lFNd0OcWnbxQ+AVtYDJr8WH21KV328=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgUUI-0006dG-5h
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 15:40:01 +0000
IronPort-SDR: h7S76D7N4HqE/etjGweJ6M2jnk+p4ejWtY66618tAhSy1oO7wIkeeufcpmnp0mcIxvS8ojOnyr
 MkDmhJoQledQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196377016"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="196377016"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 08:39:45 -0700
IronPort-SDR: sLP3qUCam69dXxLCBSz/8ZlJdIgbpLY4sMvgUT0yRXe1Fga2ANFRGVLCfv7Gn7pm2jPjT5o8Bd
 Qrgqnd9cArVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="434604792"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 08:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 30C4093; Tue, 11 May 2021 18:40:01 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
 Joe Perches <joe@perches.com>, Sumit Garg <sumit.garg@linaro.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-nilfs@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Date: Tue, 11 May 2021 18:39:56 +0300
Message-Id: <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lgUUI-0006dG-5h
Subject: [Kgdb-bugreport] [PATCH v2 2/4] kdb: Switch to use %ptTs
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

Use %ptTs instead of open-coded variant to print contents
of time64_t type in human readable form.

Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v2: collected tags
 kernel/debug/kdb/kdb_main.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 1baa96a2ecb8..622410c45da1 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2488,7 +2488,6 @@ static void kdb_sysinfo(struct sysinfo *val)
 static int kdb_summary(int argc, const char **argv)
 {
 	time64_t now;
-	struct tm tm;
 	struct sysinfo val;
 
 	if (argc)
@@ -2502,13 +2501,7 @@ static int kdb_summary(int argc, const char **argv)
 	kdb_printf("domainname %s\n", init_uts_ns.name.domainname);
 
 	now = __ktime_get_real_seconds();
-	time64_to_tm(now, 0, &tm);
-	kdb_printf("date       %04ld-%02d-%02d %02d:%02d:%02d "
-		   "tz_minuteswest %d\n",
-		1900+tm.tm_year, tm.tm_mon+1, tm.tm_mday,
-		tm.tm_hour, tm.tm_min, tm.tm_sec,
-		sys_tz.tz_minuteswest);
-
+	kdb_printf("date       %ptTs tz_minuteswest %d\n", &now, sys_tz.tz_minuteswest);
 	kdb_sysinfo(&val);
 	kdb_printf("uptime     ");
 	if (val.uptime > (24*60*60)) {
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
