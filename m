Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA361F528
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 15:17:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1os2vw-0007CL-FZ
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 14:17:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1os2vk-0007Bq-4X
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vshPUjs+tNn2er+3l3r7gbH9xPovLwtdpxV7dKrVCmE=; b=SIDL70IOiJl52M7OZZhvCsXhpk
 xk+WVyTQDktgzZwlqbir0dKv34D2bbbIgcXxC1y2mzv2xrxN1ZSJZy7G4j5GI/dbmyDaY5Qjt5BOg
 Vw5XVkVck44WS6jFzTdjG75nu5rkxz8YngxPe2VNBMWvaund/oiR9ARUZKKCelivxILk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vshPUjs+tNn2er+3l3r7gbH9xPovLwtdpxV7dKrVCmE=; b=XFPowWst+bgG3uwAK9QHzfZnlI
 OsHEwtG03F/v41fCMMY9u/sdC5k/euXrnFKz42rvHeZM015NoCvgDGeSeYuFZmzgsche97S2UqB6e
 Ji00jg0g2M5s6RdzbFfU8Qaif/qOc/ZynfWvSvo+xXsAGWZHgYAPMgZGdZZ2rIk3KY9k=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os2vj-00F6pm-Fw for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:16:52 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667830605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vshPUjs+tNn2er+3l3r7gbH9xPovLwtdpxV7dKrVCmE=;
 b=zb1YAY8yix2bhnE9pEpra80m87LTA6TzAm/0q2w3BOf6hMO2dBz7XVLtQC4AWi7Rx/T9Rq
 Aapv50ZZ4tgM5ZXneMvSzyhKYN5TLNn9FaVKB4bgNTg1txoIlhp1zXkvNt8eIksoMJEDk6
 p5qPCcq4LL6MerdYTjAdkNHfjKLalhZ6aZNE9mYD43rhaqBSposGNpPQn1pQwvZS7sONZC
 Ul1tEqaeZGzVsQG81yIVl/TBsS8XEodDUC6fikF5eK9zJOjk1oHRNx4V+ZXNIDODyKjxv9
 HCtzgOwxyP33M3cRS/eG/Bcp9S7W4kg1DWu74crGl0WGtsOpNvke0+xprx9CDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667830605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vshPUjs+tNn2er+3l3r7gbH9xPovLwtdpxV7dKrVCmE=;
 b=ZL1s3YfcydPxFz4H6XCS1dV85J+S6JAdu8CXSSZE4dwbrB21amSpVdsz60/p/XSVKBlY8m
 fXkhjhG8i2JCSECA==
To: Petr Mladek <pmladek@suse.com>
Date: Mon,  7 Nov 2022 15:22:08 +0106
Message-Id: <20221107141638.3790965-11-john.ogness@linutronix.de>
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
 Content preview: Replace (console->flags & CON_ENABLED) usage with
 console_is_enabled().
 Signed-off-by: John Ogness <john.ogness@linutronix.de> Reviewed-by: Petr
 Mladek <pmladek@suse.com> Reviewed-by: Douglas Anderson
 <dianders@chromium.org>
 --- kernel/debug/kdb/kdb_io.c | 2 +- 1 file cha [...] 
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
X-Headers-End: 1os2vj-00F6pm-Fw
Subject: [Kgdb-bugreport] [PATCH printk v3 10/40] kdb: kdb_io: use
 console_is_enabled()
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

Replace (console->flags & CON_ENABLED) usage with console_is_enabled().

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 67d3c48a1522..550fe8b456ec 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -559,7 +559,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	}
 
 	for_each_console(c) {
-		if (!(c->flags & CON_ENABLED))
+		if (!console_is_enabled(c))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
