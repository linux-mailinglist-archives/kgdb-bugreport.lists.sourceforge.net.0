Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01F1ECA75
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 09:23:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgNjy-0003op-73
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 07:23:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgNjw-0003oT-Hi
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZZiPsh1/1zA6921CY7D2bWjWgixKjYO5KIMajFrFQ8=; b=Z1lOuEkNg0I7KvW1bKqER7+TB3
 vs++xeS4NP2pKwzVHPejqfPxMiwjADiZ7l6xEAoAGQJkbG/tpcPgh5Qo5v0R8e3ZQPB4WX4QrJtDY
 XrHZwbv4fP+83h8/VgCP7G4SSIXA5C1njB+/POacbdPOe4rWVzFfKJ/T2u+W6kNMPIKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jZZiPsh1/1zA6921CY7D2bWjWgixKjYO5KIMajFrFQ8=; b=CC7CE1AMzURlyp/57ZKU9gFgBP
 4xTfLLRMBhXTAEDLXoyE1dYHYXUvLF1Ko942Z3qEEfqbVawjkqyDFnPEH9doNixs5taNklAu5c0jt
 5eQVqCjhrRTzOkBnOLaWLJCK+k7WGDNsk3bxLv3dlrbU7Iro1YmNcPeVxfthUQTO6ki8=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgNjs-003bDA-V0
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:23:08 +0000
Received: by mail-pf1-f195.google.com with SMTP id 64so1017599pfg.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jZZiPsh1/1zA6921CY7D2bWjWgixKjYO5KIMajFrFQ8=;
 b=DDKk6u1fPNb/T0ZtwX3dMrmOO5bXn9bW/74ghMD/pXRmyCkw7jHbkdxMetszKJfWtK
 veXD6gwYd4eg1cWIEvLDloPzbUZaYGBSDa+Re77ULD/sE8UNM1yQnk5bSSUyDMwpVy0T
 Y7/j995qyxR8dwC/OLtn2FZ/EM4qAtf/zb/7k5oZco0ZQ9nkQ7WZKn7LYnnaj6Pb7F+0
 M+ufUnZY6LcZTwV9NRv33/1uMEfH8VN+TfqVcRO9atsUTTAg8vCmPmZx5ULTBcffYe/w
 8UTxAfx3zUaZYcK2HxYcqge/Iahepaoo71EcX3albVDPYSOZDayyVb0cDQJgK8dhIluc
 M8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jZZiPsh1/1zA6921CY7D2bWjWgixKjYO5KIMajFrFQ8=;
 b=hXvg8xNv1GL+jeJ5x3XBG9XAAUxZSMptTLbyo90RZb/04ri7h4nL/xcXtGLqhXM1xs
 n5Psx56B9pPqG01YTLKXthb2o4Omji/VrVIP41LLR6yPM8bSNxpURe9QCHW+AS45AfOD
 60fQecv1Fen0G9UZ6xKQnLpNfWtDcNXCWRE0+q4b8FYIUUboAYfM14zK9Ino7Lsbx6vB
 cQ0+PVdaHRcxuQSLv71as40KIB7Pi61ZRsrIVyhNpXlmDnCEGkc/8mgw8lBlE7r2wIBo
 JTnSTF46uRBETQAjfg6kBEUK38bF+5F+n/8PjwbbCFqFFryMAc9Kme0Xz1q7twmsEV2Z
 O2Dw==
X-Gm-Message-State: AOAM530LN+RFmKp5MEecM64KYmweI3r+8AbT3e3wUxaC64p8jVwCklBq
 RNO7AxiSB4auVzbeF8b8XI7rwxw+BgM=
X-Google-Smtp-Source: ABdhPJxe75iTddF1frjRbkTFjkRx0tyZwI/mCeAnINWyuHqzShSQl2ELt84iMQB4pkOjXgqZEA/mqw==
X-Received: by 2002:a05:6a00:14d4:: with SMTP id
 w20mr15187904pfu.279.1591168979274; 
 Wed, 03 Jun 2020 00:22:59 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id j17sm1407272pjy.22.2020.06.03.00.22.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 00:22:58 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed,  3 Jun 2020 12:52:15 +0530
Message-Id: <1591168935-6382-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgNjs-003bDA-V0
Subject: [Kgdb-bugreport] [PATCH v5 4/4] kdb: Switch to use safer dbg_io_ops
 over console APIs
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

In kgdb context, calling console handlers aren't safe due to locks used
in those handlers which could in turn lead to a deadlock. Although, using
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

In order to achieve this we need to reverse the order of preference to
use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
store "struct console" that represents debugger I/O in dbg_io_ops and
while emitting kdb messages, skip console that matches dbg_io_ops
console in order to avoid duplicate messages. After this change,
"is_console" param becomes redundant and hence removed.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/tty/serial/kgdb_nmi.c | 2 +-
 drivers/tty/serial/kgdboc.c   | 6 +++---
 drivers/usb/early/ehci-dbgp.c | 3 ++-
 include/linux/kgdb.h          | 5 ++---
 kernel/debug/kdb/kdb_io.c     | 4 +++-
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
index 5022447..6004c0c 100644
--- a/drivers/tty/serial/kgdb_nmi.c
+++ b/drivers/tty/serial/kgdb_nmi.c
@@ -50,7 +50,7 @@ static int kgdb_nmi_console_setup(struct console *co, char *options)
 	 * I/O utilities that messages sent to the console will automatically
 	 * be displayed on the dbg_io.
 	 */
-	dbg_io_ops->is_console = true;
+	dbg_io_ops->cons = co;
 
 	return 0;
 }
diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 4139698..6e182aa 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -178,7 +178,7 @@ static int configure_kgdboc(void)
 		goto noconfig;
 	}
 
-	kgdboc_io_ops.is_console = 0;
+	kgdboc_io_ops.cons = NULL;
 	kgdb_tty_driver = NULL;
 
 	kgdboc_use_kms = 0;
@@ -198,7 +198,7 @@ static int configure_kgdboc(void)
 		int idx;
 		if (cons->device && cons->device(cons, &idx) == p &&
 		    idx == tty_line) {
-			kgdboc_io_ops.is_console = 1;
+			kgdboc_io_ops.cons = cons;
 			break;
 		}
 	}
@@ -511,7 +511,6 @@ static struct kgdb_io kgdboc_earlycon_io_ops = {
 	.write_char		= kgdboc_earlycon_put_char,
 	.pre_exception		= kgdboc_earlycon_pre_exp_handler,
 	.deinit			= kgdboc_earlycon_deinit,
-	.is_console		= true,
 };
 
 #define MAX_CONSOLE_NAME_LEN (sizeof((struct console *) 0)->name)
@@ -558,6 +557,7 @@ static int __init kgdboc_earlycon_init(char *opt)
 	}
 
 	earlycon = con;
+	kgdboc_earlycon_io_ops.cons = con;
 	pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
 	if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
 		earlycon = NULL;
diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
index ea0d531..775cf70 100644
--- a/drivers/usb/early/ehci-dbgp.c
+++ b/drivers/usb/early/ehci-dbgp.c
@@ -1058,7 +1058,8 @@ static int __init kgdbdbgp_parse_config(char *str)
 		kgdbdbgp_wait_time = simple_strtoul(ptr, &ptr, 10);
 	}
 	kgdb_register_io_module(&kgdbdbgp_io_ops);
-	kgdbdbgp_io_ops.is_console = early_dbgp_console.index != -1;
+	if (early_dbgp_console.index != -1)
+		kgdbdbgp_io_ops.cons = &early_dbgp_console;
 
 	return 0;
 }
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index c62d764..529116b 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -276,8 +276,7 @@ struct kgdb_arch {
  * the I/O driver.
  * @post_exception: Pointer to a function that will do any cleanup work
  * for the I/O driver.
- * @is_console: 1 if the end device is a console 0 if the I/O device is
- * not a console
+ * @cons: valid if the I/O device is a console; else NULL.
  */
 struct kgdb_io {
 	const char		*name;
@@ -288,7 +287,7 @@ struct kgdb_io {
 	void			(*deinit) (void);
 	void			(*pre_exception) (void);
 	void			(*post_exception) (void);
-	int			is_console;
+	struct console		*cons;
 };
 
 extern const struct kgdb_arch		arch_kgdb_ops;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 0e4f2ed..683a799 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -549,7 +549,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	if (msg_len == 0)
 		return;
 
-	if (dbg_io_ops && !dbg_io_ops->is_console) {
+	if (dbg_io_ops) {
 		const char *cp = msg;
 		int len = msg_len;
 
@@ -562,6 +562,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	for_each_console(c) {
 		if (!(c->flags & CON_ENABLED))
 			continue;
+		if (c == dbg_io_ops->cons)
+			continue;
 		/*
 		 * Set oops_in_progress to encourage the console drivers to
 		 * disregard their internal spin locks: in the current calling
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
