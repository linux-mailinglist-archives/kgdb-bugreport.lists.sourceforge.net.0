Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DD604A05
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Oct 2022 16:56:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olAUZ-0002Ug-CC
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Oct 2022 14:56:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1olAUS-0002Tt-Eu
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jlKWc1Grue9kQfYwJIiewArVOaAkhAK4uRE7V4DMseI=; b=CSPLaVQS09w5OoVkypUOhtNM+Y
 L4t6Aijel+bAARIqV8w/W/RyKz3AlDbSSiwRw13hN/mJEqBg13JbD4v/OXgtISuv7l2gdQOOkZUIH
 lNmNVCNQijZycJ8FZAUnNm3twDTZ3BDUCd1QqJbWUVQWmS3/eH3f+TmEexW6X2I4bl+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jlKWc1Grue9kQfYwJIiewArVOaAkhAK4uRE7V4DMseI=; b=e9Cy6ap0JmYT5fwPcQgSlExUaQ
 0RITPm6uUut1HZu+P1KULIazd26qYtdTFJ2EudHJ6ISXXhMUSOLuaHBVYKWYNiQDSkdM5HUBVTyfx
 PQJGCvqds2PP1pTWTChUvZoNZEXbDwczZCnI7C+IhHa1pEKVuTL5ZSuSjFZ+cC2Wwvrk=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olAUQ-009mmX-UR for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 14:56:16 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlKWc1Grue9kQfYwJIiewArVOaAkhAK4uRE7V4DMseI=;
 b=Kk2lnB0DeVDuCcQ2SWcnH8R0PgShB2CZwwsounOmf0c7TAxDw35ZfqSbSJ1PexWKje9a+0
 NMoma2X+T0p0buJRG2CD0IdcQ3ox2o2rPGrDdFrPUj49Z35+fPcKgQeojLLcyw6shd+JZ9
 7r6p+CtHoY10o8YGBeUNnQ0FJ053rbDPZzoW8bfvOwNdxeAh5JUrxV2//iLX8tpfhO5B/d
 l3lLWkkazcGkc6qDO/d6aqqwdZkfKULXqPgH+kzjyq67FPhYBElPgpY4K3E1YW+mL8gUT4
 aXnp3oFg8O4sBrVcA7QxClrsqr+RzG3dLrE+NIR5PRiZa07ARtMvihKFdcmmsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlKWc1Grue9kQfYwJIiewArVOaAkhAK4uRE7V4DMseI=;
 b=Hrgpan7bNf/oEJbZZM6hsAcz+zCVZiCrz6fuzTkbXs/R1ESYYwgaiON5lh57jBdACO27c+
 UT3EpQHIZr7qOrCg==
To: Petr Mladek <pmladek@suse.com>
Date: Wed, 19 Oct 2022 17:01:34 +0206
Message-Id: <20221019145600.1282823-13-john.ogness@linutronix.de>
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
 drivers/tty/serial/kgdboc.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1olAUQ-009mmX-UR
Subject: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc: use
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Replace (console->flags & CON_ENABLED) usage with console_is_enabled().

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/serial/kgdboc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index e76f0186c335..b17aa7e49894 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -533,7 +533,7 @@ static int __init kgdboc_earlycon_init(char *opt)
 	console_lock();
 	for_each_console(con) {
 		if (con->write && con->read &&
-		    (con->flags & (CON_BOOT | CON_ENABLED)) &&
+		    (console_is_enabled(con) || (con->flags & CON_BOOT)) &&
 		    (!opt || !opt[0] || strcmp(con->name, opt) == 0))
 			break;
 	}
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
