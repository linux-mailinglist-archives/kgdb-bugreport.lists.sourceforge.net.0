Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D83604A06
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Oct 2022 16:56:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olAUZ-000865-U4
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Oct 2022 14:56:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1olAUW-00085b-Qe
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1RFx/v+hUfcDGQrJ2jjINSDPUuF1n3qxJyJC8w20Fo=; b=ePoA9v9BDQxgQEFRCoxj54F28I
 pp1neWw8vsNQvE7VT8pGAEaeok7fngq272zW4R3GuN2Uo1HOC/2qxfi5lfFZNuKbrJF+Dly+y85Yq
 eoeLJAHMdD+K1g9AHiSBU7T9c1hSejoZkT+jFS5QQoOfp/zE4szui0dYjfhPIVRlMVy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I1RFx/v+hUfcDGQrJ2jjINSDPUuF1n3qxJyJC8w20Fo=; b=Eaeb+tOE2Z0yR8enNyJEOzfSOe
 9+mqd7utCUJ5rCNMbEjEi6mY8vShZHDWuHuKTjKpE+nUrQIP2Ekqzu/PP96dfghHHh14TmSBPnW3J
 DD4orlDhMX4Gir2BH3St3jATlDOtbNHeUqkFeJZ2IYRykKPUr07vNzeEZ8ksaE4u7wkE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olAUU-00071w-U1 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:19 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1RFx/v+hUfcDGQrJ2jjINSDPUuF1n3qxJyJC8w20Fo=;
 b=Na76VoWVvHR8U/NeE5ZW4Qj/8y6x7pe9hXOgikZ8soMx+eMpjEC1D0Ljtsuf7gKOPi1SDV
 O3H/i2rcTIQgphMFvzlgRv/uQQZ/LEqst5WRZnTXPkWrOxFhCP0cC+X4xmwV9QwQt8kwca
 JYqIAB/VA0uqLjmgRGxiFV3y2r4MhAxXTUQjFEifIzKwTlsUDV55eIk4i97ma0O49fC/xv
 vZIf5vcZpREDTpUHMQcJcVIUftRDZvqEiNVhEF4yBmFJvpLY8XZrmnW3/QU04Bt97BGLkB
 AELofnWb5Zk+quDqxs23odjOpZ43C65y97abkXno++P/O3VWUEZmj6ZrHjrAFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1RFx/v+hUfcDGQrJ2jjINSDPUuF1n3qxJyJC8w20Fo=;
 b=bXJPsQ9Ibdzn9lP6cPILeOojpe35Hpu6UnYqHQ3BjsYI2l13B6GR71QgyJ9Uqh17/ObVif
 drEUXkAw21hR9pBg==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 19 Oct 2022 17:01:41 +0206
Message-Id: <20221019145600.1282823-20-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-1-john.ogness@linutronix.de>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Replace (console->flags & CON_ENABLED) usage with
 console_is_enabled().
 Signed-off-by: John Ogness <john.ogness@linutronix.de> ---
 kernel/debug/kdb/kdb_io.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1olAUU-00071w-U1
Subject: [Kgdb-bugreport] [PATCH printk v2 19/38] kdb: kdb_io: use
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
