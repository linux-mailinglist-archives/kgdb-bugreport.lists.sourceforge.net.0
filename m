Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB01E7BBA
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 May 2020 13:27:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jedB6-0005fV-E0
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 May 2020 11:27:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jedB1-0005e2-GQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmVANo270ZVKU00Ntn1LhIr6gWxMXan2SJfCFjNoHEo=; b=CCqkc1HeRJdNaRyf2HNQBJLyc3
 9B2CZs+J9rOJlaYdhLdDlmQSDC5rgPT8q5UoS4uA+mlciBZPcTmmyQ694JpBdkKdy8I+qSZxUcXzo
 Jj+5Jx3b8OmGtYDcs/3gaxFP31EHf2TaUzlbiGiMDUJoCh088I4EDw9HKr/a9SgAcydY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mmVANo270ZVKU00Ntn1LhIr6gWxMXan2SJfCFjNoHEo=; b=OVUQfu/S/8Rp0yo/MDCQ3sCZiL
 a4NmyRCiDwTmLDYsWRxroLcwNBwskuQSKEqCLPbZfQVDaNNcny/zjgMHapNcjd4V5ythtG7tYry0A
 MCOG2Oxm+gEZFr6q9zRWBkVTtKwE8gYZ3W/I27Kyr4B8rMiZZHTO70gYcHPsZWYDkCOI=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jedAy-002d2y-3b
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:49 +0000
Received: by mail-pf1-f196.google.com with SMTP id 131so1235301pfv.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 May 2020 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mmVANo270ZVKU00Ntn1LhIr6gWxMXan2SJfCFjNoHEo=;
 b=aZK2+XXMoRhPCXVUxsDPkb9kSqkhrNLxdLS+VK2l0Him6ssCZoZ21SrepRXjgt/lH1
 wPjs4bZldxfBqAaXCCEOgOuDzZIo90LTmU1RT/71D8xO0wPNCIUzGGSYGdQ/YlanXpD5
 tymc4udXM1EAeCFRdG9SjmTIW5McowgBQ5xdltp87Mjr/9ZLzv6N3NqTBvAjgtCeoxsu
 v4PFPvGPqrYUCHiSh9M2l/R3XrNtZKY6OAI+2/ACo4+9Duzf3wYHSifzOX1jZu6qukFL
 /EKSR23Jf8Bwkh8PskSWU0NwhMmi3NCwCZz4IMTmvf/+sWcAWs4bWG8i+OfY2epqOy06
 S+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mmVANo270ZVKU00Ntn1LhIr6gWxMXan2SJfCFjNoHEo=;
 b=Q08nAzAv5CrEhh48cs6i56Z/SYnGf9d6BuBM89LgAmabB+oeNjlN6W0E2XbA7Aa2rP
 0r0F4w4EFPeWb+XkU/44apuzNfKruX/L8JfGYGda/5dveik3s4rLAxhfQU3I0y3Ihetw
 1O5BaxoFcQjHtfEg2xaBU2b6v192+Lu2o5BuMtvfCYfOlRiI/a4AXMb9yR9qUp32AFgb
 C81DWpXOKWX0QUCiJe3w6k2cQsHGA+oWQOY3HPCIzZ4fjG4BYw7TuqxaWq7KtSYXJO/U
 sn2ylXAopn9h8lIbeBlr6qIzm1o9ho66e6enKITzA72P6f8ozEP++8VA9Kpz834niyqs
 rMyQ==
X-Gm-Message-State: AOAM533zETqB1I4xnsLLyvyc2cUxL0cQlBGnropCNhSl4GaPWPAQiekr
 iCqscmAx/jvpmGVduppgqGnqEg==
X-Google-Smtp-Source: ABdhPJzS/gqMxxiyYyZH1I3fTV851M9JRdWhE5v8GMU+1CdSJsblvJLl+ZsTF6SL8JmpR+LIeAWx2w==
X-Received: by 2002:a62:2ad1:: with SMTP id q200mr8012952pfq.225.1590751661689; 
 Fri, 29 May 2020 04:27:41 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id w190sm7016741pfw.35.2020.05.29.04.27.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:27:40 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Fri, 29 May 2020 16:56:47 +0530
Message-Id: <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jedAy-002d2y-3b
Subject: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer dbg_io_ops
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
---
 drivers/tty/serial/kgdb_nmi.c | 2 +-
 drivers/tty/serial/kgdboc.c   | 4 ++--
 drivers/usb/early/ehci-dbgp.c | 3 ++-
 include/linux/kgdb.h          | 5 ++---
 kernel/debug/kdb/kdb_io.c     | 4 +++-
 5 files changed, 10 insertions(+), 8 deletions(-)

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
index c9f94fa..c7ffa87 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -153,7 +153,7 @@ static int configure_kgdboc(void)
 		goto noconfig;
 	}
 
-	kgdboc_io_ops.is_console = 0;
+	kgdboc_io_ops.cons = NULL;
 	kgdb_tty_driver = NULL;
 
 	kgdboc_use_kms = 0;
@@ -173,7 +173,7 @@ static int configure_kgdboc(void)
 		int idx;
 		if (cons->device && cons->device(cons, &idx) == p &&
 		    idx == tty_line) {
-			kgdboc_io_ops.is_console = 1;
+			kgdboc_io_ops.cons = cons;
 			break;
 		}
 	}
diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
index ea0d531..8c32d1a 100644
--- a/drivers/usb/early/ehci-dbgp.c
+++ b/drivers/usb/early/ehci-dbgp.c
@@ -1058,7 +1058,8 @@ static int __init kgdbdbgp_parse_config(char *str)
 		kgdbdbgp_wait_time = simple_strtoul(ptr, &ptr, 10);
 	}
 	kgdb_register_io_module(&kgdbdbgp_io_ops);
-	kgdbdbgp_io_ops.is_console = early_dbgp_console.index != -1;
+	if (early_dbgp_console.index != -1)
+		kgdbdbgp_io_ops.cons = early_dbgp_console;
 
 	return 0;
 }
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb..bc0face3 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -273,8 +273,7 @@ struct kgdb_arch {
  * the I/O driver.
  * @post_exception: Pointer to a function that will do any cleanup work
  * for the I/O driver.
- * @is_console: 1 if the end device is a console 0 if the I/O device is
- * not a console
+ * @cons: valid if the I/O device is a console.
  */
 struct kgdb_io {
 	const char		*name;
@@ -284,7 +283,7 @@ struct kgdb_io {
 	int			(*init) (void);
 	void			(*pre_exception) (void);
 	void			(*post_exception) (void);
-	int			is_console;
+	struct console		*cons;
 };
 
 extern const struct kgdb_arch		arch_kgdb_ops;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9e5a40d..5e00bc8 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -560,12 +560,14 @@ static void kdb_msg_write(char *msg, int msg_len)
 	if (msg_len == 0)
 		return;
 
-	if (dbg_io_ops && !dbg_io_ops->is_console)
+	if (dbg_io_ops)
 		kdb_io_write(msg, msg_len);
 
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
