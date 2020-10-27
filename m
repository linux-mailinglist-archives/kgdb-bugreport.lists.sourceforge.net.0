Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FFC299D26
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 27 Oct 2020 01:04:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kXCTw-0004rJ-Q4
	for lists+kgdb-bugreport@lfdr.de; Tue, 27 Oct 2020 00:04:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kXCTu-0004rB-W5
 for kgdb-bugreport@lists.sourceforge.net; Tue, 27 Oct 2020 00:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lWtBB6GxJ1YYEY7c+3jxZm3B6jVzowJEV4idxFESB14=; b=BOmujkZjbaTzXX19nRC0oc7eib
 kYmdaZ2Qk7cj4M1LCTkFalOjfjas67gz/NgNWu2sbt4Wd6qjSYjGcGAefHFNmzQQXkV9G29zdSDEQ
 YJ1c4pCF+T8mPZfELsE7Y4zLDP9kn9X0YzlLNJtl17LQjmuK9LiXqgGB7c8Yq922OvrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lWtBB6GxJ1YYEY7c+3jxZm3B6jVzowJEV4idxFESB14=; b=iX0ukDWenxKSdfoll+CPxNCjcL
 U95QZ0FKGRdXH1NbAvAbE8wTLDbspGhrVriJHe0r3NxGnLywhUku12sJhH5ueVbOgRhA+JoKfTOu8
 ZElawOwUzG+rVYwu8xzSIWxsRE1zuMSH2ZDelw9TmlV7gy5EfSSGLg+0zQZFNJrHszIg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXCTt-008CpV-22
 for kgdb-bugreport@lists.sourceforge.net; Tue, 27 Oct 2020 00:04:54 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 116EB217A0;
 Tue, 27 Oct 2020 00:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757087;
 bh=Sog6csUjUgR2LJbLo3MJ6MPOEPBwnjRRvV+d/iW42WU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E6rFOm5QPk1MXt3hbKjDJJ5wFR4Z5CuVbm4oTLb+O3eOUJ415wBads1zPDsGO2K7q
 jVlGsv2dJ/B3q4PC/NsqruggdNMaSwQMNPSq8/WtQQ4m2LrDGt2J/w6OTrYpHZ4BZN
 HQPyeP0TKNEVg6e1R1wyJ0AWlwE/H85nQoqSegZ0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 26 Oct 2020 20:03:41 -0400
Message-Id: <20201027000415.1026364-26-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000415.1026364-1-sashal@kernel.org>
References: <20201027000415.1026364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kXCTt-008CpV-22
Subject: [Kgdb-bugreport] [PATCH AUTOSEL 4.19 26/60] kgdb: Make "kgdbcon"
 work properly with "kgdb_earlycon"
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
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit b18b099e04f450cdc77bec72acefcde7042bd1f3 ]

On my system the kernel processes the "kgdb_earlycon" parameter before
the "kgdbcon" parameter.  When we setup "kgdb_earlycon" we'll end up
in kgdb_register_callbacks() and "kgdb_use_con" won't have been set
yet so we'll never get around to starting "kgdbcon".  Let's remedy
this by detecting that the IO module was already registered when
setting "kgdb_use_con" and registering the console then.

As part of this, to avoid pre-declaring things, move the handling of
the "kgdbcon" further down in the file.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20200630151422.1.I4aa062751ff5e281f5116655c976dff545c09a46@changeid
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/debug/debug_core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index fbb1bfdd2fa53..8c76141c99c8c 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -95,14 +95,6 @@ int dbg_switch_cpu;
 /* Use kdb or gdbserver mode */
 int dbg_kdb_mode = 1;
 
-static int __init opt_kgdb_con(char *str)
-{
-	kgdb_use_con = 1;
-	return 0;
-}
-
-early_param("kgdbcon", opt_kgdb_con);
-
 module_param(kgdb_use_con, int, 0644);
 module_param(kgdbreboot, int, 0644);
 
@@ -820,6 +812,20 @@ static struct console kgdbcons = {
 	.index		= -1,
 };
 
+static int __init opt_kgdb_con(char *str)
+{
+	kgdb_use_con = 1;
+
+	if (kgdb_io_module_registered && !kgdb_con_registered) {
+		register_console(&kgdbcons);
+		kgdb_con_registered = 1;
+	}
+
+	return 0;
+}
+
+early_param("kgdbcon", opt_kgdb_con);
+
 #ifdef CONFIG_MAGIC_SYSRQ
 static void sysrq_handle_dbg(int key)
 {
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
