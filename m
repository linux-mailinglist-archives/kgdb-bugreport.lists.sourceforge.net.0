Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B17696A8A0C
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  2 Mar 2023 21:14:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pXpKI-0007qt-Da
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 02 Mar 2023 20:14:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1pXpKC-0007qm-N0
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 02 Mar 2023 20:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bn4hK/pc8yfuTHf2lVQ6K39OCmfHLmDwBEQ4LD+VvX8=; b=WQ7pDVeeiBxuMNMjzGQdLh5euP
 EAXb43m+ta50LgsZtN0e/AgJjC/q5QxqcAycLZNxYWUUa1j7mdT2R62OPOmqlLA1NogKTLTLAdVBs
 uN3hhJayDhYa9UN1akQks+Qj1bWra+J+NBs3Besk5sAKCGDBIEsLdNLcc6fDIzSJv878=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bn4hK/pc8yfuTHf2lVQ6K39OCmfHLmDwBEQ4LD+VvX8=; b=fHOT0CEiPGFO5KLan63zR6LCfQ
 JeU5zB8TPeM1lvqEgJBUrscYpeQ3slLoaO6wG4/VIFraIYWsj4IjOaDVo3Tcn+JCyB06FUQ5d0lNX
 9BmR5EXpaFw+g8Ikz6EOwBf+d2Mctl9HGjpqa9LlJnSuVREynHW5ZFitwqBAjroroxOE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pXpK5-00DvJ8-Ih for kgdb-bugreport@lists.sourceforge.net;
 Thu, 02 Mar 2023 20:14:46 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1677787062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn4hK/pc8yfuTHf2lVQ6K39OCmfHLmDwBEQ4LD+VvX8=;
 b=sVHSx/LE7UqM7m9QqJqsI82I3YhkAegnS1wj0KV1SpI9PJKxnb/I07juk3E23hRkXfc2D6
 E93VCEpd5hBOfkTcqtKMqdM9Bqq4/eZi6MzoPvWe4psYtIkpoQu60kDH0sLmcaiU7QkY0X
 oDq5R/XP1V0TGr6dCS4tfdp9e3DMGiTaUD1jcFG32b1bHe9GxpBVT+NeVHY6xsi7tXZV5h
 z81xAF0OvvZ4rAgVg7Rm83bheDM1no0axFc4D6eWG0otXxz5IZgHm1Xf85D/23B5Hs4Njo
 BlNGym9rw1vlZ2oDc+dInihAYTmNb2UuXy5Ssxs8wXPTFtkEMuf3GwXXZdlUQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1677787062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn4hK/pc8yfuTHf2lVQ6K39OCmfHLmDwBEQ4LD+VvX8=;
 b=95Ms7ku4PtEVQkCu9sJ1bRajCtfp7nzS53jwqnhi/CkI9LIirtg2epuND9iUDCiYb5LQd8
 TSNC5vetA4XLnrDA==
To: Petr Mladek <pmladek@suse.com>
Date: Thu,  2 Mar 2023 21:02:01 +0106
Message-Id: <20230302195618.156940-2-john.ogness@linutronix.de>
In-Reply-To: <20230302195618.156940-1-john.ogness@linutronix.de>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It is allowed for consoles to provide no write() callback.
 For example ttynull does this. Check if a write() callback is available before
 using it. Signed-off-by: John Ogness <john.ogness@linutronix.de> ---
 kernel/debug/kdb/kdb_io.c
 | 2 ++ 1 file changed, 2 insertions(+) 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pXpK5-00DvJ8-Ih
Subject: [Kgdb-bugreport] [PATCH printk v1 01/18] kdb: do not assume write()
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
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

It is allowed for consoles to provide no write() callback. For
example ttynull does this.

Check if a write() callback is available before using it.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
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
