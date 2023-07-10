Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B874D866
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Jul 2023 16:04:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qIrVZ-0004D1-Vc
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 10 Jul 2023 14:04:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1qIrVW-0004Ca-5S
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 10 Jul 2023 14:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B9NLpZDV0rDJscklMexuqubYAOrVOVFP5G0SfhKaC40=; b=cT+ABEb/Tn8XszSu4+Rchlqcfh
 Ysulukz5tSWlDTXFy7HSma7rWNO0z7BLKPyMLZcy165xHEfOatFPnzzhJ1ZM6JYpUXFjjUkppe/eE
 BO2LViHu0I/Qo20/azPVGVGYsdscWwBcRPR88N/RpTSh5pQWhtwzxGuAyuKZtQkwXUmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B9NLpZDV0rDJscklMexuqubYAOrVOVFP5G0SfhKaC40=; b=XrLmbks5y3arT041esUZDtJmg1
 THxFDjg1Kp2hsoA92n/mOqgPi6jTumRLr+voC86ue11zkiEWVLnrBhHvWLmqwzLXmOoGIGkjz1dYp
 qMGUzWeF1Rm4E/AohrFXOAmHasqF9tuMj8MbfYneLB425JdQ7tbng2ZJL2VEjlmQhu50=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIrVV-0005CK-Jr for kgdb-bugreport@lists.sourceforge.net;
 Mon, 10 Jul 2023 14:04:52 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1688996727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9NLpZDV0rDJscklMexuqubYAOrVOVFP5G0SfhKaC40=;
 b=mPH34seK6EKd96789117404thhQ8iF13OLpNr8Rr4KlkQwNJABW99gTYK+7HnIjltRHnN+
 2yJBLZcArEG9Xrwkd0d3MiWAydDpHP2tGyam99KieBiEmInY5CgsIn9vHkwsUk48Ee7eTR
 zNXJ3sN2/CVr6hYmUfI8t+JcrOZTuJDijmKzFRqMq5CrrEl6NacvXqO8OgPDyAx+LvFEt1
 ubf3eSzQxZ1WFEW5moucTAYNP/I+xcORGxd3pkhprECltFA9rFynae9SUdxlVFYQRNtgXP
 7eZX3/eMHsZSZlnvQUf8ctTN32aOL3r+d9aTnkOWLj0gjRn2yIF/TpORQgS1FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1688996727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9NLpZDV0rDJscklMexuqubYAOrVOVFP5G0SfhKaC40=;
 b=MimllhStnyB8UVIm3i7qxoahyZlF7eOmcJSKU+Xf2Frp7wMCiRdG+vr3tcFXyKXVdnFhAQ
 reR+NH86j4GeIbDw==
To: Petr Mladek <pmladek@suse.com>
Date: Mon, 10 Jul 2023 15:51:20 +0206
Message-Id: <20230710134524.25232-2-john.ogness@linutronix.de>
In-Reply-To: <20230710134524.25232-1-john.ogness@linutronix.de>
References: <20230710134524.25232-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It is allowed for consoles to provide no write() callback.
 For example ttynull does this. Check if a write() callback is available before
 using it. Signed-off-by: John Ogness <john.ogness@linutronix.de> Reviewed-by:
 Petr Mladek <pmladek@suse.com> Reviewed-by: Douglas Anderson
 <dianders@chromium.org>
 Reviewed-by: Daniel Thompson <daniel.thompson@l [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qIrVV-0005CK-Jr
Subject: [Kgdb-bugreport] [PATCH printk v2 1/5] kdb: do not assume write()
 callback available
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

It is allowed for consoles to provide no write() callback. For
example ttynull does this.

Check if a write() callback is available before using it.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 5c7e9ba7cd6b..e9139dfc1f0a 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -576,6 +576,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
+		if (!c->write)
+			continue;
 		/*
 		 * Set oops_in_progress to encourage the console drivers to
 		 * disregard their internal spin locks: in the current calling
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
