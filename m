Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CAB7E9082
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Nov 2023 14:30:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1r2AXb-0002sI-B9
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 12 Nov 2023 13:30:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1r2AXa-0002sC-1m
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 12 Nov 2023 13:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LwCoi2/hBcr1zKH1YE3Abh0B2ICkPke+vw/dc8rtRDY=; b=OLAmYPLXrQPsGlXZibLkJDO8Fb
 hAu4e78EFhzkRHirWDc6IEiO52AwVkrIWl6PtjDET5Ep/yaTB2FPnyoyp8Lh8d7I8zqcgbq0CaZFL
 HnE2B3W+C3t19wHFq4FTa9cueTxPvqWzDydXFd/t9N4RtTextLmkmJhMmpPB133dzSgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LwCoi2/hBcr1zKH1YE3Abh0B2ICkPke+vw/dc8rtRDY=; b=g
 dhgkHu1602uelj3Tu8XD2rgGRM4bLSmypmk4h+cz3gOuWJFwn7jXGCkkw23U6vSdEOKiIa5Xiyz6p
 pJzCRNyA3c0JXsQwaod8xNKKJbbyS9VVhgbj4CeF5fuBrfo8RlHnKf/Y84n0g9kw8RiaPR7MAehJa
 pBZ+5llvhu9OAqZ0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r2AXY-003Hc3-B8 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 12 Nov 2023 13:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DB9D9B808CD;
 Sun, 12 Nov 2023 13:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6832C43391;
 Sun, 12 Nov 2023 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699795807;
 bh=tNC/DsCjLvIyEu8EYISzzrl6+JlkcbjlQUsWvWqeMGM=;
 h=From:To:Cc:Subject:Date:From;
 b=Qzd4OfTQ3qtpvrDWH/qllCR4nfFbh2+JJXxgpe/1Fh7Bm8TRunpgqviXK+zOONA25
 mYmWIPf8tmOKr8Ovz2YAs6nFQlXJsy6bjz7AG4csQgXeC71jkAndO8iBaUs/l0rOKW
 iyxX4L4UruCxl+VLKASnWVTN/B7uJXgLUPExbsT8WYX+d3lkCpHkPg00E5hUfyZnkU
 9szUGFycTlAxUoOuffsawMQMqdBZTmtik5B74dJV/txS+OnNBuGUUVSAyhlEMEHFS9
 8blMaZ4vbMeTehsnBNMlAMUh4pte/xkcvw4tOkggiU6B8qaIgk/ZnvmmEwIbLjLPYS
 p6syiwBVsU97g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 12 Nov 2023 08:30:04 -0500
Message-ID: <20231112133005.177227-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.62
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Douglas Anderson <dianders@chromium.org> [ Upstream
 commit dd712d3d45807db9fcae28a522deee85c1f2fde6 ] When entering kdb/kgdb on
 a kernel panic, it was be observed that the console isn't flushed before
 the `kdb` prompt came up. Specifically, when using the buddy lockup detector
 on arm64 and running: ec [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r2AXY-003Hc3-B8
Subject: [Kgdb-bugreport] [PATCH AUTOSEL 6.1] kgdb: Flush console before
 entering kgdb on panic
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
Cc: Sasha Levin <sashal@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit dd712d3d45807db9fcae28a522deee85c1f2fde6 ]

When entering kdb/kgdb on a kernel panic, it was be observed that the
console isn't flushed before the `kdb` prompt came up. Specifically,
when using the buddy lockup detector on arm64 and running:
  echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT

I could see:
  [   26.161099] lkdtm: Performing direct entry HARDLOCKUP
  [   32.499881] watchdog: Watchdog detected hard LOCKUP on cpu 6
  [   32.552865] Sending NMI from CPU 5 to CPUs 6:
  [   32.557359] NMI backtrace for cpu 6
  ... [backtrace for cpu 6] ...
  [   32.558353] NMI backtrace for cpu 5
  ... [backtrace for cpu 5] ...
  [   32.867471] Sending NMI from CPU 5 to CPUs 0-4,7:
  [   32.872321] NMI backtrace forP cpuANC: Hard LOCKUP

  Entering kdb (current=..., pid 0) on processor 5 due to Keyboard Entry
  [5]kdb>

As you can see, backtraces for the other CPUs start printing and get
interleaved with the kdb PANIC print.

Let's replicate the commands to flush the console in the kdb panic
entry point to avoid this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/debug/debug_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index d5e9ccde3ab8e..3a904d8697c8f 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1006,6 +1006,9 @@ void kgdb_panic(const char *msg)
 	if (panic_timeout)
 		return;
 
+	debug_locks_off();
+	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
+
 	if (dbg_kdb_mode)
 		kdb_printf("PANIC: %s\n", msg);
 
-- 
2.42.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
