Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEE1E394D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 08:33:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdpdB-0007nX-Kd
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 06:33:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdpdA-0007nN-4E
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jVPZG9jgNnCMirif1b9T6UzaG8riJRfarxNSjPnmxro=; b=IvrhcJbQ0cGgEXAeQR1mNGzv+y
 F/2y0GiZJHCcFgIYSfTishGcTEuJkdlnzjLehSHunx1YvwwYIeklz29AV/Zs3Z4phrPul71TuwsJl
 xk6ngkyWDGg/advrL7q4m7kpcR3sz1ka4jldC/0WZwvsRS/I0SWZ5FE4zNit9YSoAg8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jVPZG9jgNnCMirif1b9T6UzaG8riJRfarxNSjPnmxro=; b=RC5rcVQ9nvD/u4/uvw0YxKnY9S
 OXlaAuimq7Ygov8gjmOQLlCw2Fk78qUExGRUIkK9TYc80HGeAs5RBX6IbS2D1AZQjjG0L8Qo0P1ux
 PFlOebXWLWh4Df/eYBLqx7W4OAKULxrNlg3QmmIPE2Tpb2oKGzl8M+F6PDXIs3wvetME=;
Received: from mail-vk1-f194.google.com ([209.85.221.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdpd7-008qEZ-H9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:33:36 +0000
Received: by mail-vk1-f194.google.com with SMTP id 21so5619482vkq.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 23:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jVPZG9jgNnCMirif1b9T6UzaG8riJRfarxNSjPnmxro=;
 b=EiqaFjvOtPYCTmBS9jhycj7q/HywmyjY/ekV02QlEJ8aiwWM3pNdtMad6m6HMpdnrG
 8uKqYmEp/Yh13X5wNZY1SjzS1gXK7T7xmipGfUjpBEo4QmvascfGcGSeWxby90oTZCrj
 h0qgjuWQeVMZjCBgHiS/bcAJ9Yi5XsC2JiOC2a2bYWdn8I66aupWBN/mCo3I99AWxuW+
 9c/oSSKKbioxQWna/QV5xl/wEpZ5u5icFfnhgdebjAZwM61hwiH20thX8otAAhj110r7
 VgHH57qqydumk/jXIa0tqK9616/WcN6akSyhBoh9f66x4mIErcRUFl0joS0VXqnwlWhU
 iHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jVPZG9jgNnCMirif1b9T6UzaG8riJRfarxNSjPnmxro=;
 b=PSj8Pio38p+R/MGoskFt8Gw/bfoXV1mQ4Hvu9Vbvh8x3UwbV/IQIhzkNtRCZK8jnUR
 yFVB8DpzrAbKVqMP+T2s3qbCtMAkV6B8AX99ZoflPFLRuah1khTF9sjsi5ejrJPw4606
 Oh3IvoVIyLZq3kVj7m07i4ep7qP7D5M0ZExZAlp28o0AegHG3i43fnPXA43OcMZcfEi8
 mHp9biQqWX8KhM/Vt9J2DEzJDs3MiiRJYl4Za7+RXbm22H6KXBLwfoMQtd7oTBz/FoBf
 PmWeN2wkPBKR/QmASBOOJF9VPChKuA7g+O65/5q5Ne8MpM3AzrGbb4Jz31i/gW6HRhnI
 FJ7A==
X-Gm-Message-State: AOAM5329C1H3Bs4p6SxQiUdpcpfIX/9/XINagi7lJkqGe7IpuvmgB7d3
 1YMIrekXODfmR8ydXeW40HU3CUa59Mo=
X-Google-Smtp-Source: ABdhPJwJBWr4ddu3j+dBU3VOt1sTNmEHN4o+MswK56sYgqF3/Y1uh3K2/FKo04DuY47pgmXQxnYcmA==
X-Received: by 2002:a17:902:694b:: with SMTP id
 k11mr4751139plt.59.1590560815149; 
 Tue, 26 May 2020 23:26:55 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id m12sm1239121pjs.41.2020.05.26.23.26.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 23:26:54 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed, 27 May 2020 11:55:59 +0530
Message-Id: <1590560759-21453-5-git-send-email-sumit.garg@linaro.org>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdpd7-008qEZ-H9
Subject: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Switch kdb_msg_write() to use
 safer polling I/O
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

In kgdb NMI context, calling console handlers isn't safe due to locks
used in those handlers which could lead to a deadlock. Although, using
oops_in_progress increases the chance to bypass locks in most console
handlers but it might not be sufficient enough in case a console uses
more locks (VT/TTY is good example).

Currently when a driver provides both polling I/O and a console then kdb
will output using the console. We can increase robustness by using the
currently active polling I/O driver (which should be lockless) instead
of the corresponding console. For several common cases (e.g. an
embedded system with a single serial port that is used both for console
output and debugger I/O) this will result in no console handler being
used.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/tty/serial/kgdboc.c | 17 ++++++++---------
 include/linux/kgdb.h        |  2 ++
 kernel/debug/kdb/kdb_io.c   | 46 +++++++++++++++++++++++++++++++--------------
 3 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index c9f94fa..6199fe1 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -35,7 +35,6 @@ static struct kparam_string kps = {
 };
 
 static int kgdboc_use_kms;  /* 1 if we use kernel mode switching */
-static struct tty_driver	*kgdb_tty_driver;
 static int			kgdb_tty_line;
 
 #ifdef CONFIG_KDB_KEYBOARD
@@ -154,7 +153,7 @@ static int configure_kgdboc(void)
 	}
 
 	kgdboc_io_ops.is_console = 0;
-	kgdb_tty_driver = NULL;
+	kgdboc_io_ops.tty_drv = NULL;
 
 	kgdboc_use_kms = 0;
 	if (strncmp(cptr, "kms,", 4) == 0) {
@@ -178,7 +177,7 @@ static int configure_kgdboc(void)
 		}
 	}
 
-	kgdb_tty_driver = p;
+	kgdboc_io_ops.tty_drv = p;
 	kgdb_tty_line = tty_line;
 
 do_register:
@@ -216,18 +215,18 @@ static int __init init_kgdboc(void)
 
 static int kgdboc_get_char(void)
 {
-	if (!kgdb_tty_driver)
+	if (!kgdboc_io_ops.tty_drv)
 		return -1;
-	return kgdb_tty_driver->ops->poll_get_char(kgdb_tty_driver,
-						kgdb_tty_line);
+	return kgdboc_io_ops.tty_drv->ops->poll_get_char(kgdboc_io_ops.tty_drv,
+							 kgdb_tty_line);
 }
 
 static void kgdboc_put_char(u8 chr)
 {
-	if (!kgdb_tty_driver)
+	if (!kgdboc_io_ops.tty_drv)
 		return;
-	kgdb_tty_driver->ops->poll_put_char(kgdb_tty_driver,
-					kgdb_tty_line, chr);
+	kgdboc_io_ops.tty_drv->ops->poll_put_char(kgdboc_io_ops.tty_drv,
+						  kgdb_tty_line, chr);
 }
 
 static int param_set_kgdboc_var(const char *kmessage,
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb..05d165d 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -275,6 +275,7 @@ struct kgdb_arch {
  * for the I/O driver.
  * @is_console: 1 if the end device is a console 0 if the I/O device is
  * not a console
+ * @tty_drv: Pointer to polling tty driver.
  */
 struct kgdb_io {
 	const char		*name;
@@ -285,6 +286,7 @@ struct kgdb_io {
 	void			(*pre_exception) (void);
 	void			(*post_exception) (void);
 	int			is_console;
+	struct tty_driver	*tty_drv;
 };
 
 extern const struct kgdb_arch		arch_kgdb_ops;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index f848482..c2efa52 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -24,6 +24,7 @@
 #include <linux/kgdb.h>
 #include <linux/kdb.h>
 #include <linux/kallsyms.h>
+#include <linux/tty_driver.h>
 #include "kdb_private.h"
 
 #define CMD_BUFLEN 256
@@ -542,13 +543,18 @@ static int kdb_search_string(char *searched, char *searchfor)
 	return 0;
 }
 
-static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8 ch))
+static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8),
+			 struct tty_driver *p, int line,
+			 void (*poll_put_char)(struct tty_driver *, int, char))
 {
 	if (len <= 0)
 		return;
 
 	while (len--) {
-		io_put_char(*cp);
+		if (io_put_char)
+			io_put_char(*cp);
+		if (poll_put_char)
+			poll_put_char(p, line, *cp);
 		cp++;
 	}
 }
@@ -561,22 +567,34 @@ static void kdb_msg_write(char *msg, int msg_len)
 		return;
 
 	if (dbg_io_ops && !dbg_io_ops->is_console)
-		kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
+		kdb_io_write(msg, msg_len, dbg_io_ops->write_char,
+			     NULL, 0, NULL);
 
 	for_each_console(c) {
+		int line;
+		struct tty_driver *p;
+
 		if (!(c->flags & CON_ENABLED))
 			continue;
-		/*
-		 * While rounding up CPUs via NMIs, its possible that
-		 * a rounded up CPU maybe holding a console port lock
-		 * leading to kgdb master CPU stuck in a deadlock during
-		 * invocation of console write operations. So in order
-		 * to avoid such a deadlock, enable oops_in_progress
-		 * prior to invocation of console handlers.
-		 */
-		++oops_in_progress;
-		c->write(c, msg, msg_len);
-		--oops_in_progress;
+
+		p = c->device ? c->device(c, &line) : NULL;
+		if (p && dbg_io_ops && p == dbg_io_ops->tty_drv && p->ops &&
+		    p->ops->poll_put_char) {
+			kdb_io_write(msg, msg_len, NULL, p, line,
+				     p->ops->poll_put_char);
+		} else {
+			/*
+			 * While rounding up CPUs via NMIs, its possible that
+			 * a rounded up CPU maybe holding a console port lock
+			 * leading to kgdb master CPU stuck in a deadlock during
+			 * invocation of console write operations. So in order
+			 * to avoid such a deadlock, enable oops_in_progress
+			 * prior to invocation of console handlers.
+			 */
+			++oops_in_progress;
+			c->write(c, msg, msg_len);
+			--oops_in_progress;
+		}
 		touch_nmi_watchdog();
 	}
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
