Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199A2FB57D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 Jan 2021 11:57:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l1ohI-0005Ch-M9
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 Jan 2021 10:57:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l1ohH-0005Ca-Oa
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 Jan 2021 10:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MdowI1spYzSZ783aBzUoan8uq2NdmnUHuCZElfPxqfQ=; b=Pw8Ek9jNR8JhkjLljVMK0pipNX
 vpQ/5k7lLAUDDdcgwIsGas39pLqf/xoDLO9lswbmnC+TzUlfcQHrGxLQNiHo5mqDD8dH+aEbVyUR1
 KYi13Y0hNqqVbmwtLm1XTCvzjxJlzqxtPXqaliduKU3SPzkXd3zk7CfcNLHyzjgfL40M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MdowI1spYzSZ783aBzUoan8uq2NdmnUHuCZElfPxqfQ=; b=WhYhkoZMxX0m62MPa3rPRAOHoG
 8BxVgG/TfP3tgE/2e2J6etuJGP+5X0ak0aOUlU6Xv0ALGBgxm6tSvCn7a/rwdprCkUEMZpP5xE0hE
 2vvhakQFAsV+1ghubniX9Hh7iJthaVN7jpX2WIcORK5oM5YTiJSyAmwiJTdaQPaAUgTw=;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l1oh7-007TFC-Hd
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 Jan 2021 10:57:15 +0000
Received: by mail-oi1-f171.google.com with SMTP id s2so20720137oij.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 Jan 2021 02:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=MdowI1spYzSZ783aBzUoan8uq2NdmnUHuCZElfPxqfQ=;
 b=Fx/tzeqor4dkEBrQ0EyMKi5UYinFCZNM+4m2iEiHgFjtaqmVm8MaDD8C4DMfirKXyU
 H5gAlRfQHzOM/5ghPHjfII8w+BN1O7fXQkhddHMAP/wAde5v1uvn14+cD29IIL+durT4
 h5pxtZ+oPR5/0Mr2BZONiO4fZ9jVg+B0pmf5QUUeY2K/1IjvhcQ2aTOpG7VCHg4s10kG
 0f+RczmVuu9aFkP3pYQiQQwxxweG/yhG1p37p+eBX84V6KxuP/o5d6VXVhXBVzkBttTK
 ACUL6DnJc6+255oBCQNY5VExJpM25oUrD3J+aVy4LCWpjQAKIXh+ndx2OC4S+5W+6ZOr
 lsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MdowI1spYzSZ783aBzUoan8uq2NdmnUHuCZElfPxqfQ=;
 b=QEqy5AI0Z067HUSAxa9Qu7PmMe2jssbZTBSk55fnAmQJ668oYdS5JNN0JAwnAuXgVf
 Wg6bbbiqM0kJyjuFJwUzsjwUI/krlbj6dxYuG0UUYkttxBRbZWhLHK1lK/IEpE7P5hkd
 UtED2QsjKC2PJrvTCbxILCURkCYSoFqEfjAGWBAz/983HTPUUdbUYu2u2LpEt2CJNB9M
 nD1XqcUWeDnQgYdWaw5cMrfWvNdpEHoXIAAeSggmWCy0c3DkQqpcOj8cL1QoiazsXIXK
 YjANYeTyZOr1o6EXZ0Dpdt13fR8TfviHJiwm7KAaiy/obvNYzalwkNRrfrRDCNeGYqFE
 V4qw==
X-Gm-Message-State: AOAM530TvkLWpZ7E/2Tddj1u6iWJ4EQqvVaUzNJxtu4yk63dghfVoCzH
 /QN8rCtmLHN9vOGaFd8cATRSaCaaFvupwQ==
X-Google-Smtp-Source: ABdhPJz6EoK9JnwYL1Qcj/o7CwQgRwQsXysqajEDUuSbbCkplLL+gfnG4gJ1U1PgzoWtncHHZFMJcQ==
X-Received: by 2002:a17:90a:bf88:: with SMTP id
 d8mr4764171pjs.102.1611053449104; 
 Tue, 19 Jan 2021 02:50:49 -0800 (PST)
Received: from localhost.localdomain ([122.181.110.213])
 by smtp.gmail.com with ESMTPSA id a136sm19619797pfd.149.2021.01.19.02.50.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 02:50:48 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Tue, 19 Jan 2021 16:20:18 +0530
Message-Id: <1611053418-29283-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l1oh7-007TFC-Hd
Subject: [Kgdb-bugreport] [PATCH] kdb: Simplify kdb commands registration
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
Cc: linux-kernel@vger.kernel.org, daniel.thompson@linaro.org,
 jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Simplify kdb commands registration via using linked list instead of
static array for commands storage.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_main.c    | 78 ++++++++++--------------------------------
 kernel/debug/kdb/kdb_private.h |  1 +
 2 files changed, 20 insertions(+), 59 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930ac1b..93ac0f5 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -33,6 +33,7 @@
 #include <linux/kallsyms.h>
 #include <linux/kgdb.h>
 #include <linux/kdb.h>
+#include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
@@ -84,15 +85,8 @@ static unsigned int kdb_continue_catastrophic =
 static unsigned int kdb_continue_catastrophic;
 #endif
 
-/* kdb_commands describes the available commands. */
-static kdbtab_t *kdb_commands;
-#define KDB_BASE_CMD_MAX 50
-static int kdb_max_commands = KDB_BASE_CMD_MAX;
-static kdbtab_t kdb_base_commands[KDB_BASE_CMD_MAX];
-#define for_each_kdbcmd(cmd, num)					\
-	for ((cmd) = kdb_base_commands, (num) = 0;			\
-	     num < kdb_max_commands;					\
-	     num++, num == KDB_BASE_CMD_MAX ? cmd = kdb_commands : cmd++)
+/* kdb_cmds_head describes the available commands. */
+static LIST_HEAD(kdb_cmds_head);
 
 typedef struct _kdbmsg {
 	int	km_diag;	/* kdb diagnostic */
@@ -921,7 +915,7 @@ int kdb_parse(const char *cmdstr)
 	char *cp;
 	char *cpp, quoted;
 	kdbtab_t *tp;
-	int i, escaped, ignore_errors = 0, check_grep = 0;
+	int escaped, ignore_errors = 0, check_grep = 0;
 
 	/*
 	 * First tokenize the command string.
@@ -1011,7 +1005,7 @@ int kdb_parse(const char *cmdstr)
 		++argv[0];
 	}
 
-	for_each_kdbcmd(tp, i) {
+	list_for_each_entry(tp, &kdb_cmds_head, list_node) {
 		if (tp->cmd_name) {
 			/*
 			 * If this command is allowed to be abbreviated,
@@ -1037,8 +1031,8 @@ int kdb_parse(const char *cmdstr)
 	 * few characters of this match any of the known commands.
 	 * e.g., md1c20 should match md.
 	 */
-	if (i == kdb_max_commands) {
-		for_each_kdbcmd(tp, i) {
+	if (list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
+		list_for_each_entry(tp, &kdb_cmds_head, list_node) {
 			if (tp->cmd_name) {
 				if (strncmp(argv[0],
 					    tp->cmd_name,
@@ -1049,7 +1043,7 @@ int kdb_parse(const char *cmdstr)
 		}
 	}
 
-	if (i < kdb_max_commands) {
+	if (!list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
 		int result;
 
 		if (!kdb_check_flags(tp->cmd_flags, kdb_cmd_enabled, argc <= 1))
@@ -2428,12 +2422,11 @@ static int kdb_kgdb(int argc, const char **argv)
 static int kdb_help(int argc, const char **argv)
 {
 	kdbtab_t *kt;
-	int i;
 
 	kdb_printf("%-15.15s %-20.20s %s\n", "Command", "Usage", "Description");
 	kdb_printf("-----------------------------"
 		   "-----------------------------\n");
-	for_each_kdbcmd(kt, i) {
+	list_for_each_entry(kt, &kdb_cmds_head, list_node) {
 		char *space = "";
 		if (KDB_FLAG(CMD_INTERRUPT))
 			return 0;
@@ -2667,13 +2660,9 @@ int kdb_register_flags(char *cmd,
 		       short minlen,
 		       kdb_cmdflags_t flags)
 {
-	int i;
 	kdbtab_t *kp;
 
-	/*
-	 *  Brute force method to determine duplicates
-	 */
-	for_each_kdbcmd(kp, i) {
+	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
 		if (kp->cmd_name && (strcmp(kp->cmd_name, cmd) == 0)) {
 			kdb_printf("Duplicate kdb command registered: "
 				"%s, func %px help %s\n", cmd, func, help);
@@ -2681,35 +2670,10 @@ int kdb_register_flags(char *cmd,
 		}
 	}
 
-	/*
-	 * Insert command into first available location in table
-	 */
-	for_each_kdbcmd(kp, i) {
-		if (kp->cmd_name == NULL)
-			break;
-	}
-
-	if (i >= kdb_max_commands) {
-		kdbtab_t *new = kmalloc_array(kdb_max_commands -
-						KDB_BASE_CMD_MAX +
-						kdb_command_extend,
-					      sizeof(*new),
-					      GFP_KDB);
-		if (!new) {
-			kdb_printf("Could not allocate new kdb_command "
-				   "table\n");
-			return 1;
-		}
-		if (kdb_commands) {
-			memcpy(new, kdb_commands,
-			  (kdb_max_commands - KDB_BASE_CMD_MAX) * sizeof(*new));
-			kfree(kdb_commands);
-		}
-		memset(new + kdb_max_commands - KDB_BASE_CMD_MAX, 0,
-		       kdb_command_extend * sizeof(*new));
-		kdb_commands = new;
-		kp = kdb_commands + kdb_max_commands - KDB_BASE_CMD_MAX;
-		kdb_max_commands += kdb_command_extend;
+	kp = kmalloc(sizeof(*kp), GFP_KDB);
+	if (!kp) {
+		kdb_printf("Could not allocate new kdb_command table\n");
+		return 1;
 	}
 
 	kp->cmd_name   = cmd;
@@ -2719,6 +2683,8 @@ int kdb_register_flags(char *cmd,
 	kp->cmd_minlen = minlen;
 	kp->cmd_flags  = flags;
 
+	list_add_tail(&kp->list_node, &kdb_cmds_head);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(kdb_register_flags);
@@ -2757,15 +2723,15 @@ EXPORT_SYMBOL_GPL(kdb_register);
  */
 int kdb_unregister(char *cmd)
 {
-	int i;
 	kdbtab_t *kp;
 
 	/*
 	 *  find the command.
 	 */
-	for_each_kdbcmd(kp, i) {
+	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
 		if (kp->cmd_name && (strcmp(kp->cmd_name, cmd) == 0)) {
-			kp->cmd_name = NULL;
+			list_del(&kp->list_node);
+			kfree(kp);
 			return 0;
 		}
 	}
@@ -2778,12 +2744,6 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
 /* Initialize the kdb command table. */
 static void __init kdb_inittab(void)
 {
-	int i;
-	kdbtab_t *kp;
-
-	for_each_kdbcmd(kp, i)
-		kp->cmd_name = NULL;
-
 	kdb_register_flags("md", kdb_md, "<vaddr>",
 	  "Display Memory Contents, also mdWcN, e.g. md8c1", 1,
 	  KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS);
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index a4281fb..7a4a181 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -174,6 +174,7 @@ typedef struct _kdbtab {
 	short    cmd_minlen;		/* Minimum legal # command
 					 * chars required */
 	kdb_cmdflags_t cmd_flags;	/* Command behaviour flags */
+	struct list_head list_node;
 } kdbtab_t;
 
 extern int kdb_bt(int, const char **);	/* KDB display back trace */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
