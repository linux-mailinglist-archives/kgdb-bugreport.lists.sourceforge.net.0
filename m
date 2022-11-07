Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B05EE61F52C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 15:17:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1os2vz-0002Z6-Di
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 14:17:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1os2vu-0002XN-A9
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q25D/fbee4emclBCuLkXnvDp43ljaWTdETeJZi0ldYg=; b=igRpCZtdGcVaxRjEzvr+J8t/3b
 Pe0EVMNEDjXGFpL9j0prifZZrdj/61YdFbF3G3Kgq1xlNO4NWFXsrCrGhy495HnHgVuSnsreiQpMY
 5vrJeTREegA+eYafcr9IqczY6w0zS0lR4QZ0unLBvghNGCrS75TlAermhXDZsyTOHGz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q25D/fbee4emclBCuLkXnvDp43ljaWTdETeJZi0ldYg=; b=FM5thOI4EiGCIEjyw6zLfKoj0n
 5zCRUYsKRYqqNCllvR/HqrLvaL955c2P3LqMpmErUjVG9XmA6ShUXtDGCgcL9g+21q7RdIT3rtcjc
 ExvY6YL7hUXpoU4Nx/RbDqjiBA+ZqDSGOhabWjhALqoH8r95C/P1nvc2miwb4wG4LuWE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os2vl-00F6pq-Q1 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:16:54 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667830607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q25D/fbee4emclBCuLkXnvDp43ljaWTdETeJZi0ldYg=;
 b=O454Lsiiz5kJngn+Di+jISdQqtthm9fMBo/qd09UHoJIP7fLkelSV+ixhOpLNJXHV7Mttq
 4TLbFkmtL0Veo/xxWJ2Bmrg4+CnHd17YN8fNg8mNLvgdi/6EhGHArF+ZhnRQzr3fEE7Nmm
 GbTzv8SCm7paAxm0xNbxBqgHL/zrwCwfEdB1FVlcstzlumqZSXfwBX3uFiNjKqRqQDl3L2
 vzay5KqNRDePj6PPYPtFXCOQFV5nRiemPTvZQ5XQ3F/2xXpq9zrCm18mG3kr5/w8GEsPMV
 DcZoEV0ZuTMkTu2GPrrzuDLeIZNuK6d3H3h3F1LtgkaRT/U/vnGhM9IYpHGuGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667830607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q25D/fbee4emclBCuLkXnvDp43ljaWTdETeJZi0ldYg=;
 b=SK8wtl/kZYl5l8mJdOCBSFTMjd4QjXMFsXwUjuDGL17ezsD45pR6VKM5rHUjSYtgNFT7We
 be38PD4HSzVHtJDQ==
To: Petr Mladek <pmladek@suse.com>
Date: Mon,  7 Nov 2022 15:22:13 +0106
Message-Id: <20221107141638.3790965-16-john.ogness@linutronix.de>
In-Reply-To: <20221107141638.3790965-1-john.ogness@linutronix.de>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Guarantee safe iteration of the console list by using SRCU.
 Signed-off-by: John Ogness <john.ogness@linutronix.de> ---
 kernel/debug/kdb/kdb_io.c
 | 12 +++++++++++- 1 file changed, 11 insertions(+), 1 deletion(-) 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1os2vl-00F6pq-Q1
Subject: [Kgdb-bugreport] [PATCH printk v3 15/40] kdb: use srcu console list
 iterator
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
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Guarantee safe iteration of the console list by using SRCU.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/debug/kdb/kdb_io.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 550fe8b456ec..ed8289ce4fcb 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 {
 	struct console *c;
 	const char *cp;
+	int cookie;
 	int len;
 
 	if (msg_len == 0)
@@ -558,7 +559,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		cp++;
 	}
 
-	for_each_console(c) {
+	/*
+	 * The console_srcu_read_lock() only provides safe console list
+	 * traversal. The use of the ->write() callback relies on all other
+	 * CPUs being stopped at the moment and console drivers being able to
+	 * handle reentrance when @oops_in_progress is set. (Note that there
+	 * is no guarantee for either criteria.)
+	 */
+	cookie = console_srcu_read_lock();
+	for_each_console_srcu(c) {
 		if (!console_is_enabled(c))
 			continue;
 		if (c == dbg_io_ops->cons)
@@ -577,6 +586,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		--oops_in_progress;
 		touch_nmi_watchdog();
 	}
+	console_srcu_read_unlock(cookie);
 }
 
 int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
