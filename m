Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C2F5E8675
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 24 Sep 2022 02:05:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1obsfO-0001Rh-Ta
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 24 Sep 2022 00:05:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1obsfM-0001Ra-IK
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 00:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z4lcvDU/MemQOUY1h+3uqj4PoL4kor3zog3zDG/QSnM=; b=mo4CJHj705+uf0mZMTgoZe/4FH
 gBThjZUmIa/rPajNKdw347mM8HxOwZ8P22I1eZzATVTy+O8+kr+yfzlGB94AOG5jcV24y25wAcCc0
 idPnNoQtT0DWgJ0J4hj/pJdwwoVpe1dYocGaNH5DGv++X6Aow3QFS740F3MZtMru2Dcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z4lcvDU/MemQOUY1h+3uqj4PoL4kor3zog3zDG/QSnM=; b=jTnIQtNdWAs5HKv6WlS/1g7bPs
 TgbzAby7zBbiJ7GZVyQ/t4zMBpQxRj51M9lvPRvbo2HybGpw4Q9lQ9mFLA1QzPFYuSCR2ONAKfLQK
 szHWJ5h5qhZz+nb3PMbHxSeuH2JGjYB2vnJ//EN/9JzmxvjVj8q7jsocqVRbWZo8xPFk=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obsfL-000XCN-Nf for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 00:05:08 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1663977901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4lcvDU/MemQOUY1h+3uqj4PoL4kor3zog3zDG/QSnM=;
 b=R2t99lC/EqCbqaf4XF8cFgE7FcfLjsAb+kOQ1Wfu6XGekrw/NG4KpclPNhRdYDcMjxba9S
 78wtU8Ef2nRNsdoPjknjYM97lBHcPccJzPh241MNm5DeUXghIbK2Jp/Ezbmtgg/FZpwuE2
 AVMTTTn5/Oprhvg3BBwZ7ddjTB23kOCIegspaNmHwvknTV2/n9FuEI/tTNP97VY3G3G9gq
 QtgvZF1bWUY91LCrfZ1ohbqtKc/gAfCur1rGkbJ6bVKnf+WVlnZC6mQuvsw5P7HPWEPWI2
 2fuY49WOYSv6DT7AQUzsTYH1uDNqC86UTmVNkaxH7WnCSrp84o4SwlY4WIzd9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1663977901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4lcvDU/MemQOUY1h+3uqj4PoL4kor3zog3zDG/QSnM=;
 b=q7Tw6vty0oiILbyIcxbEZIBR6eTBTnRqhvzIU7ymOMavEnHnaBtUi5gMC7dJEYydCUR6Uj
 CRe60J2Koibhy6BQ==
To: Petr Mladek <pmladek@suse.com>
Date: Sat, 24 Sep 2022 02:10:45 +0206
Message-Id: <20220924000454.3319186-10-john.ogness@linutronix.de>
In-Reply-To: <20220924000454.3319186-1-john.ogness@linutronix.de>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Thomas Gleixner <tglx@linutronix.de> Unprotected list
 walks are not necessarily safe. Signed-off-by: Thomas Gleixner
 <tglx@linutronix.de>
 Signed-off-by: John Ogness <john.ogness@linutronix.de> Reviewed-by: Sergey
 Senozhatsky <senozhatsky@chromium.org> --- drivers/tty/serial/kgdboc.c |
 [...] Content analysis details:   (-1.9 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1obsfL-000XCN-Nf
Subject: [Kgdb-bugreport] [PATCH printk 09/18] serial: kgdboc: Lock console
 list in probe function
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

From: Thomas Gleixner <tglx@linutronix.de>

Unprotected list walks are not necessarily safe.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/tty/serial/kgdboc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 79b7db8580e0..af2aa76bae15 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -193,7 +193,8 @@ static int configure_kgdboc(void)
 	if (!p)
 		goto noconfig;
 
-	for_each_console(cons) {
+	console_list_lock();
+	for_each_registered_console(cons) {
 		int idx;
 		if (cons->device && cons->device(cons, &idx) == p &&
 		    idx == tty_line) {
@@ -201,6 +202,7 @@ static int configure_kgdboc(void)
 			break;
 		}
 	}
+	console_list_unlock();
 
 	kgdb_tty_driver = p;
 	kgdb_tty_line = tty_line;
-- 
2.30.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
