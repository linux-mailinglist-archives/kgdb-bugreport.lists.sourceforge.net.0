Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F51EE200
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Jun 2020 12:01:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgmhB-0003fP-6L
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Jun 2020 10:01:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgmh9-0003fD-Ij
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 10:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=szaBEARcWdhYnGpzW+4OEptkrFUZ5UEa9ss6N8oVgrk=; b=TwJ+GqSD1TK1YJq/RZkEZLltyL
 kjqqwmrZ7lg4YHl43WbhMyMVhfBFeT0SHmCN9bmBHmJi8tEWnLij3wJ83fLD9MFUx7holebmVEHti
 cdn7bVGgUDEyvkHp4ZEL8aC0KtCKyM7zROOQVjCJqMf2DHajiQCoskDwWwTz+o4oGtvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=szaBEARcWdhYnGpzW+4OEptkrFUZ5UEa9ss6N8oVgrk=; b=LxXqoerPoot+me4PdHMVjNzPAC
 fCMoPtwWVlgsDQHa2i8bU8EnOeWhgZRdEAfeTKeRXpLuqPrzRTeECneE0sqY4fTIjpQ40YSRyHwxk
 uSriD5SwYvbePXsUhRPciB5sNnqQ/J2Qbw2iVsvXy84NS0rdo8SPtkAXI2U13Ee0z1n8=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgmh5-00BWJ3-6x
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 10:01:55 +0000
Received: by mail-pj1-f67.google.com with SMTP id h95so983187pje.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=szaBEARcWdhYnGpzW+4OEptkrFUZ5UEa9ss6N8oVgrk=;
 b=Cg/f1HJvu0Jm/TeqKUCyK+SdAsQFuo9p66YMZ1DFdsALkVnNz4A0GJoPXrkLOInh/e
 Rc02WahaxbmPUE3cAwfVesS7oVzpKIEjHwL7FYbFobxLK3aggBJhhadp7Ua8BaeDylZ0
 73BUs7w3zpwCZvPi8Haf8fPAXawF3qDy/heO4jnPsW5aAttEkYCf4kOzfnMDBJvq1gvy
 3Td5psKL6JqiIxvmAP9PH/MR5Pl2PubGVrSvZO4JfuEl2mUTC/GEdM7OdWITwz0MDhv+
 3fKj1ZDZoYypiNH4el5JV9WoLesXsyeYNxpgzaufpzak56bCnbSDuhwMADPFC+yEDDON
 5EVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=szaBEARcWdhYnGpzW+4OEptkrFUZ5UEa9ss6N8oVgrk=;
 b=DU9bUDg3AdWn66PtUmQaKmW7zmqK/oU24w2ZHR3LoTBBJDdMF/x25c2aCkn0k4eTta
 u/KyHG/afb49xZ1cjO1Ml0iDOpmKJzN3VR3LUFQeT2rgN112fWmgZoLHBuJuw46vtMHo
 k+vWme2TSzN+U+O0Yz/kC0k2wvVe9MTYV7QFYuJ8o5Fp65aSvvNSx9n282ke4W/fL8wR
 0AoMQMXKkJxNGp/7OTqc3W7Hitu3Cpq5RisFzJWDuotHDDPa02w+jgpIJkVHm6hZzWcF
 ndgfkZULNysVuTYKpVeQ+t5yU2RQb5s2pAoO5PL+N0ppK/qEKWSAhtngiEr8uvjUdlL/
 9qEg==
X-Gm-Message-State: AOAM531UQa36tsbf8i5aiqRHtPcFojbEyGGRzq7oxsXtssjboE3m9+Ge
 Zeam99KcfCNfobu4zXRS+aEIgw==
X-Google-Smtp-Source: ABdhPJz+kjDxKZqboJ0smOY5CJB2KU9tBGggUM40V1NuSMBNwyZlbSkz2UXWMnEhe/1HWYkmvPFj5A==
X-Received: by 2002:a17:90b:234c:: with SMTP id
 ms12mr5449967pjb.164.1591264905624; 
 Thu, 04 Jun 2020 03:01:45 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id np5sm5786992pjb.43.2020.06.04.03.01.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 03:01:44 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Thu,  4 Jun 2020 15:31:16 +0530
Message-Id: <1591264879-25920-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgmh5-00BWJ3-6x
Subject: [Kgdb-bugreport] [PATCH v6 1/4] kdb: Re-factor kdb_printf() message
 write code
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, gregkh@linuxfoundation.org, jslaby@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Re-factor kdb_printf() message write code in order to avoid duplication
of code and thereby increase readability.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Revieved-by: Petr Mladek <pmladek@suse.com>
---
 kernel/debug/kdb/kdb_io.c | 57 +++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 924bc92..2d42a02 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -542,6 +542,29 @@ static int kdb_search_string(char *searched, char *searchfor)
 	return 0;
 }
 
+static void kdb_msg_write(const char *msg, int msg_len)
+{
+	struct console *c;
+
+	if (msg_len == 0)
+		return;
+
+	if (dbg_io_ops && !dbg_io_ops->is_console) {
+		const char *cp = msg;
+		int len = msg_len;
+
+		while (len--) {
+			dbg_io_ops->write_char(*cp);
+			cp++;
+		}
+	}
+
+	for_each_console(c) {
+		c->write(c, msg, msg_len);
+		touch_nmi_watchdog();
+	}
+}
+
 int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 {
 	int diag;
@@ -553,7 +576,6 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 	int this_cpu, old_cpu;
 	char *cp, *cp2, *cphold = NULL, replaced_byte = ' ';
 	char *moreprompt = "more> ";
-	struct console *c;
 	unsigned long uninitialized_var(flags);
 
 	/* Serialize kdb_printf if multiple cpus try to write at once.
@@ -687,22 +709,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 	 */
 	retlen = strlen(kdb_buffer);
 	cp = (char *) printk_skip_headers(kdb_buffer);
-	if (!dbg_kdb_mode && kgdb_connected) {
+	if (!dbg_kdb_mode && kgdb_connected)
 		gdbstub_msg_write(cp, retlen - (cp - kdb_buffer));
-	} else {
-		if (dbg_io_ops && !dbg_io_ops->is_console) {
-			len = retlen - (cp - kdb_buffer);
-			cp2 = cp;
-			while (len--) {
-				dbg_io_ops->write_char(*cp2);
-				cp2++;
-			}
-		}
-		for_each_console(c) {
-			c->write(c, cp, retlen - (cp - kdb_buffer));
-			touch_nmi_watchdog();
-		}
-	}
+	else
+		kdb_msg_write(cp, retlen - (cp - kdb_buffer));
+
 	if (logging) {
 		saved_loglevel = console_loglevel;
 		console_loglevel = CONSOLE_LOGLEVEL_SILENT;
@@ -751,19 +762,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			moreprompt = "more> ";
 
 		kdb_input_flush();
-
-		if (dbg_io_ops && !dbg_io_ops->is_console) {
-			len = strlen(moreprompt);
-			cp = moreprompt;
-			while (len--) {
-				dbg_io_ops->write_char(*cp);
-				cp++;
-			}
-		}
-		for_each_console(c) {
-			c->write(c, moreprompt, strlen(moreprompt));
-			touch_nmi_watchdog();
-		}
+		kdb_msg_write(moreprompt, strlen(moreprompt));
 
 		if (logging)
 			printk("%s", moreprompt);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
