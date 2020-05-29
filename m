Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FA1E7BB5
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 May 2020 13:27:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jedAr-00010X-Lk
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 May 2020 11:27:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jedAq-00010K-6M
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ctBq+QFlLwI1QYopIw19U7dJqDOQ/tbZAKxzZCAns8=; b=a3+bTQSOjGAkwubmelVgW/OHWm
 iMLpdkQm1bzXC5hgGcGih+Dc+ajO8JWjHL/a0G/eGGqzLW8DKYYkfepfvl2BKPOQIuxHZjr4GAZuU
 1pansrLS2+uVnihJZ3iokbNeuxtF+w8xrZwdPtHbc9LKnBDa3d2+EkjJlcXVLGS3rAp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ctBq+QFlLwI1QYopIw19U7dJqDOQ/tbZAKxzZCAns8=; b=mMPXqLEeJDZ4C42qE8HCPItVPd
 IxMQK7urDF8Yd7Tu2iI9kXTQDtw+kTlIlJm3ydSM2b0LI78/4gHr/KG72OiDI1JG+x9+V6AESDPZr
 wvzdtOLfV0rRmLiyw48A0MH6Qe8nxhFgjegBJ+Mcy/iKI4dqKhMA1R36mBcZUByGD5PA=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jedAm-00HCf3-7i
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:39 +0000
Received: by mail-pg1-f194.google.com with SMTP id o6so545800pgh.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 May 2020 04:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6ctBq+QFlLwI1QYopIw19U7dJqDOQ/tbZAKxzZCAns8=;
 b=kzySAK8hODG2cYbJPTRthw/g8bz7SqzCixHZT8y2YFZkKrIJ6GBecBhOjAVtkZJM6Q
 112LqTSB86oh909HxSy7h2MQhm6ErbCF+VDmFqoFL5VsBuDuvMkxYrBRXJ/lJGyl1uxs
 NzCOwup3zZTYr0jEOGxwm45QIb0w/P0AYqRSJINqDfTD3/pn7hLt+S5Y09ykeiAoX0Ko
 gDPZNDFCOZMnYg/do+73Tt9GUggw4SNAUdIr7ql9H/1yLWnuqBb2tPPzTzljekmXMDPu
 Tl32j7DhBWMHOcNIXDm81RCftktTygtIhWvy9MaBIGfbZdE+n7wLD2qSCqBYpcza3zKO
 NvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6ctBq+QFlLwI1QYopIw19U7dJqDOQ/tbZAKxzZCAns8=;
 b=lL6V3HUoPiDc3niiGyDzlROt4R94Aus//rUA3uVLzQ44AGA9zsJqCltOE43J/EmEA9
 1UvI2+l5UpM3SpdNlUzGmfS+/6hZz6dDe50d8OvQX3TdVI5rRCul+EbPGjyxznOJ1sOA
 k0JeXzCKQUu/CNGDVoTMBNI+XERRok/tCRt2gb1wq9xiTIXBtwC+RSZ5DoyZLB3kotbw
 BfFuTzcg/iIhIu7skZczKK2cMdZT0IM1A/lTnNrFCzMeNhJLTBSt4EdbNCF+TVB9gkR2
 UrIO6aKszY/8Xx7nQjMPfTYFD4Fw0Cs035/HW1mg68zchSE7rC8CDy0qZKx8MLHXY/3a
 8brw==
X-Gm-Message-State: AOAM533H9XfbS5cuK6ZTa65eqvFrw7pfbz7Xb2EAD2TDTeE9qUIP55fd
 YmiOPtlHhldWAqrJjYXxFVpBrg==
X-Google-Smtp-Source: ABdhPJyZQD0j97uBCkvFSTJVeHWcc/hD1RgDKQB6l+K9JSBkI9QYvpFPoUPe31PoiWJtOhMnWWUhqA==
X-Received: by 2002:a63:33c6:: with SMTP id z189mr8093582pgz.426.1590751643548; 
 Fri, 29 May 2020 04:27:23 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id w190sm7016741pfw.35.2020.05.29.04.27.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:27:22 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Fri, 29 May 2020 16:56:44 +0530
Message-Id: <1590751607-29676-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jedAm-00HCf3-7i
Subject: [Kgdb-bugreport] [PATCH v4 1/4] kdb: Re-factor kdb_printf() message
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
---
 kernel/debug/kdb/kdb_io.c | 61 +++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 924bc92..e46f33e 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -542,6 +542,33 @@ static int kdb_search_string(char *searched, char *searchfor)
 	return 0;
 }
 
+static void kdb_io_write(char *cp, int len)
+{
+	if (len == 0)
+		return;
+
+	while (len--) {
+		dbg_io_ops->write_char(*cp);
+		cp++;
+	}
+}
+
+static void kdb_msg_write(char *msg, int msg_len)
+{
+	struct console *c;
+
+	if (msg_len == 0)
+		return;
+
+	if (dbg_io_ops && !dbg_io_ops->is_console)
+		kdb_io_write(msg, msg_len);
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
@@ -553,7 +580,6 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 	int this_cpu, old_cpu;
 	char *cp, *cp2, *cphold = NULL, replaced_byte = ' ';
 	char *moreprompt = "more> ";
-	struct console *c;
 	unsigned long uninitialized_var(flags);
 
 	/* Serialize kdb_printf if multiple cpus try to write at once.
@@ -687,22 +713,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
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
@@ -751,19 +766,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
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
