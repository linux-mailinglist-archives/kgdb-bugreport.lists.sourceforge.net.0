Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C407E9085
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Nov 2023 14:30:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1r2AXl-0000Te-Ku
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 12 Nov 2023 13:30:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1r2AXj-0000TV-VX
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 12 Nov 2023 13:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IQPPz4jxJwch01VTxO31F0KrRSvsMUSg/HSisS/6vm0=; b=bgVFHAQ4++/ISG69fSpMgwYLK9
 xrfjsrHCiRpKEGgfqJ/s2QsF2JOBPMVXbMjwpmWnrfi9R6RD19PIjbRgiP00QdQ6A99wF7SgWkagE
 giV05GbKQoE05vUOd9TFwQx+p79UFxHAqwvgnO50qSMvVTiXKGBji1Mn5XHbPDzNhSXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IQPPz4jxJwch01VTxO31F0KrRSvsMUSg/HSisS/6vm0=; b=c
 UjTLooBpbU81Hw5Uuu9qvkvT+0Swn18TFJ7n2NY4zYCxwe5gOyxHahJPIZNiUx8qLa1XY9W+ODRks
 HYEK2SoPY/HLY+WGGPzjwoLuCbRJv3+bWUkatUQDzzEWBOOSKvFMx1FPrhPZsE4hL8UmTlZD64MV7
 aXbxQtd/alqLfSMM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r2AXh-0003aH-OZ for kgdb-bugreport@lists.sourceforge.net;
 Sun, 12 Nov 2023 13:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D2469CE0ECD;
 Sun, 12 Nov 2023 13:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C5DC433BB;
 Sun, 12 Nov 2023 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699795814;
 bh=0ANct9uzWMSwze0AymbEtxpr/siGufLZfiZESREAaXE=;
 h=From:To:Cc:Subject:Date:From;
 b=Sjm7gLHRaxgMBb9HcZRLm1YCBe7cA5fMyAyJh+yK9krGN2O63bzsvc/TOfVfG+iF+
 TW50BJRYj9IBGY0iRFOzlsfSqJ9yRyFtHypXc3g7EwKDYAowS1wloWtZgFqEEOo9EG
 2T+ROdK+DNkwxk3jg4YD6LmoqE7SNkDqcH16te/39KDmGds4s76BqazzZR3Hxw3bYV
 aYD56VPX9OnxpF0a+5prTGJqXPwqgpb2+5kYIPRsffQ8ewuHp0Z4d+KXGq01yi9XWM
 6w7jZeNazUzdS0PMVUQI4zxHG00A6XP99f6eJPNiDRp3NzWL4BW7ZZU3biILpi/Kx0
 j7PkgZWgKaLPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 12 Nov 2023 08:30:11 -0500
Message-ID: <20231112133011.177297-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.200
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r2AXh-0003aH-OZ
Subject: [Kgdb-bugreport] [PATCH AUTOSEL 5.10] kgdb: Flush console before
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
index 0f31b22abe8d9..ef54254a5dd13 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1022,6 +1022,9 @@ void kgdb_panic(const char *msg)
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
