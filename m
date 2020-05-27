Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8611E3927
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 08:26:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdpWh-000696-SL
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 06:26:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdpWf-00068o-V5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P6+E4rNY0ShstrRFzP9aDE4erNTCDcdqGWfz1gGy5Tk=; b=lS2cw0nfLUUiYKloG+oSCF9uP0
 bk/mZTgEatxBMfWMtE4y6pkohSJguYVxf/XiSwhsJ9oCo4tBsAzfbRsvH1dvCIORD/vtCSCFS/OGh
 uw6leP+beervcc4tElVOSRxkMZdXgnMafQ4UZI7spqI0DFAVK9WP5t8+4eleTybLjN1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P6+E4rNY0ShstrRFzP9aDE4erNTCDcdqGWfz1gGy5Tk=; b=MMvkEAUiKi62lwbnS1LQm+yyOV
 9xG2UEOVo1pKz98v0ht4ZhRojR5PSG68MsT+88ueJC+jg9w6B0uPhbV3EichMZLq0xoPrYflZnVxD
 WC1zBOIxoUvGxYXHiCuAn0abGPZDdFb5mn4H+e2plIUo7IbJtu5f2dzY1L28x0G4+hDI=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdpWe-00EU7f-Jt
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:53 +0000
Received: by mail-pf1-f195.google.com with SMTP id y198so11399782pfb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 23:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P6+E4rNY0ShstrRFzP9aDE4erNTCDcdqGWfz1gGy5Tk=;
 b=Y2qtj4gOXZpv9dwe3B2zJCPgdSKOXjzqCeMNz05BE0iwci4zEu/+Ioc1p0l8L+4gFY
 9wAvOViH9oCexefyOKLWxf0WA3wO7YLSYW3Qk0EmSd1BjTbMnL5U8QB0/M0OAc5xZX6f
 Ow+J0GAwkQ8CLaO3rvY3tYUfRF4GxaDUl4bRfzfx3sUx3+KrIAhenB+xc8Lq1M1J0O1b
 Y3dgV/rxNbc9z/4J0reSgaH5Zlql1Js4NI//qzNSUxJKh4iYUeeYFz0I6bS/t5e27I20
 SSFic7ZPuO6XvlIvNCENVJGhg0DNIKNQxvXZu7ogZwdgG/FB+mhPoaOTfagNhwUtpMiF
 c8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P6+E4rNY0ShstrRFzP9aDE4erNTCDcdqGWfz1gGy5Tk=;
 b=el9FMZrLZUa99fokVwIIZoMID3VwI+3ypqpxy5ffw1AQSTHoHkyBiU+spotZEFKqFN
 +bAcdrFXsEZKDAM22XySNpY5+4bPO2Lkp7BNV4VOlmcCESL0NCM2Ew9bICLlhOMOSE0u
 GGcusBlAO2oT92wQJLKCiarr7Iea6MGk4rrJZ4avmpR7YRHTg4SLhgKG9LlbhnYT//vH
 dtxDx0V8aYz/T0DHhZOt73pGB/SLQ/Tx/xYYHuVOBHgEGFbnnm5a55Q818WN5rj1Hkq8
 jbiuvfGH28yGw7Hc22Rh6ncc6HQzi9ZUUv+xSzyivXHcVaVB4sc22q7e1NEgeJDAoeCZ
 Illw==
X-Gm-Message-State: AOAM531h2rcCjNDP0x2ee9hxQ3ynfeEihDGxNXrVT6EW4/26ewP+EyfW
 rKT6xXn5xGSwR/J/SphtVi6zNQ==
X-Google-Smtp-Source: ABdhPJxqCPtrwHLPLM5xjrsVjHkcD7z0w9QHjATmjWv28YaX6bX0C3nBxR6MF6ImTuiZvaT4qc0FJA==
X-Received: by 2002:a63:6604:: with SMTP id a4mr2568383pgc.12.1590560799838;
 Tue, 26 May 2020 23:26:39 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id m12sm1239121pjs.41.2020.05.26.23.26.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 23:26:39 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed, 27 May 2020 11:55:56 +0530
Message-Id: <1590560759-21453-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jdpWe-00EU7f-Jt
Subject: [Kgdb-bugreport] [PATCH v3 1/4] kdb: Re-factor kdb_printf() message
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
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
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
index 924bc92..f6b4d47 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -542,6 +542,33 @@ static int kdb_search_string(char *searched, char *searchfor)
 	return 0;
 }
 
+static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8 ch))
+{
+	if (len <= 0)
+		return;
+
+	while (len--) {
+		io_put_char(*cp);
+		cp++;
+	}
+}
+
+static void kdb_msg_write(char *msg, int msg_len)
+{
+	struct console *c;
+
+	if (msg_len <= 0)
+		return;
+
+	if (dbg_io_ops && !dbg_io_ops->is_console)
+		kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
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
