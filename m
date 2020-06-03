Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F241ECA6C
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 09:22:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgNjg-0003lc-3D
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 07:22:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgNjb-0003l5-OZ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nS87rNXwinnHDsGB1oC64mLmKOn8axqbhCBxaNZelVE=; b=CEqYF/jIiIfdzHbMPv+RZRWLfg
 Bk1GrLAEqKvFCIGjzWEVbZ2UPKUvT8MD3vAmn3BE+WoO8Xd05+oMHZBIcMSndZCdnOPT3H2WoPA0k
 lzNSw4HUpWBuNQpE5Jv69pTcVWB7LvBX9uWgVNsggsvV1yMCG82kcZwqhQKyFd8l2vjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nS87rNXwinnHDsGB1oC64mLmKOn8axqbhCBxaNZelVE=; b=jPeLuW3cyQ8MY/TK10nqO/eY+g
 UINIPJyiYYixQfDelr3wlzxVEQbsgXXndFtUhcjVh00+BldBAsah8rDjzjWY7rUGMHZfsqZMgifjJ
 NM+TUmUjF8cOSLemDQNDzG5wHGLSDa4r0But2L8ddSm5xUzNSQiZNF2p3XOlqiuIH0bU=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgNjZ-003bCE-P5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:22:47 +0000
Received: by mail-pf1-f194.google.com with SMTP id a127so1003318pfa.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nS87rNXwinnHDsGB1oC64mLmKOn8axqbhCBxaNZelVE=;
 b=bUg/amR6dUGFEel35oo/78r5Yt5+WBc6ZWXun66sFPubpQg6pHyd3IcxzKPe139OrB
 00IAwmsdkfpsic3xI7r7pVSqJ5zkop0ag9pKt1ZR98hL8SaiyFMZg+aunIdAlnYiAApH
 W8zgHMe/XNv1qlr3EzsOoA8NT7IPxKbsanzhFVkj1nWuycfvcQAUvRJSpwVUTj+XGdRd
 YaoBvmPoQhRcVi6IHElQXrazKZa/2YztF9rM2FA6ea+BET5gHz+tT216iVm7aWut4+PE
 xBXtZhTgy9xaPCsrvfLsBd1PZocQI1357oPPjGgaoMJKZCXMhNgsYMzhiHkVYrqNjdb4
 nOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nS87rNXwinnHDsGB1oC64mLmKOn8axqbhCBxaNZelVE=;
 b=A0vVZEVowADsAlalDzku021feWw/fRQpfGjMg3jAD7sJkqX348Vvqhln14KRDlSOz/
 HO8sGDz2wYQnGFbsr1SnvrbduKOKgKCHIRO8CBTiliNTW4TZX0ZnDFP/+jHV8ZMW+f86
 soK8VteJWORyCOV6DitJ5NXq7HdxSPIgGImHMHnAdG3xW4A17U/qEQhuLQHqqkfYjSWL
 Y/xWEQ5KwV60oM0lE3bKY+Pww2E/UDk1CmLfsrKygaGYqgKHilLD7C1eHKwlZkqS+JVQ
 p7RntLB7G7xrsTUUk8Z1Ww9/hCdM60DpHVf5Od1Y2GgkErMkwrhLdaeL94+l0+BgTUJC
 FNkg==
X-Gm-Message-State: AOAM532T3+Vu+OKNlnJgN/1al3bKwN4FqGmlryDJ3mQOwyyG5RhQ00wz
 wuEdQ6iW0imkj8SOlwc/ZwcybA==
X-Google-Smtp-Source: ABdhPJxcYCJw8NIGR/pP1ssdZ6dnNo4HHzOY2wq0rXT4XquUDuO/aanzpIG61NaJdmTMUrYjzlKuGg==
X-Received: by 2002:a62:7e8d:: with SMTP id z135mr6428446pfc.251.1591168960181; 
 Wed, 03 Jun 2020 00:22:40 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id j17sm1407272pjy.22.2020.06.03.00.22.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 00:22:39 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed,  3 Jun 2020 12:52:12 +0530
Message-Id: <1591168935-6382-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgNjZ-003bCE-P5
Subject: [Kgdb-bugreport] [PATCH v5 1/4] kdb: Re-factor kdb_printf() message
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
