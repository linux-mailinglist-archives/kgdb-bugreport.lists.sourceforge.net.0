Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E03087B6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 Jan 2021 11:17:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l5Qqk-0007VV-D8
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 Jan 2021 10:17:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l5Qqj-0007VP-La
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 Jan 2021 10:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jI4qdAGwJ5B37Etb6OWJgXVQ+UkNIp1rfBZ931XxLjU=; b=SqBd5LKP0hwjkzigwzPBUGbWUt
 5GzaXw+VJd4YcYhmOasaud4ydl9luEge0FnQo0O9KEtNyg7cFdrGqu2pb0jUcI5Z9hutA7TgLWKhy
 rOAcr9YuNtfWS3xm6VKWT0OmdZugC72IL63eqDZCP8G4r3Z6XhJVQUnfZUE5XtM1W9xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jI4qdAGwJ5B37Etb6OWJgXVQ+UkNIp1rfBZ931XxLjU=; b=JN/v0Wp8VwbI4B6I25gxdjtVv0
 FjjwX7xbJX7KAl00DzD5X26TyaSovWzvg9mlG5JuXzMe8lTeSF57/TrC4+QmAApDPt7jVlR9VcA2M
 mtJGBTSEXH4NloQhQ7KY+HQlDaNwyxZWx879iY8RxkjzR6w7O2s7xgF2Wq0KUAe7C80s=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l5QqR-0004qZ-BF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 Jan 2021 10:17:57 +0000
Received: by mail-pf1-f172.google.com with SMTP id y205so5944523pfc.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 Jan 2021 02:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=jI4qdAGwJ5B37Etb6OWJgXVQ+UkNIp1rfBZ931XxLjU=;
 b=c9AT2XMTMcPPvN4W4FwMmi8p3OyTl+QSLdeK2JGn8+JOc5ocYSPWUghs/3uCMI6c28
 5lm57M1s5WD72KCWOAleBduj3DGvNNJuyOjWG2rSnyOC5Gs1QpAjDSc+wQ1Q1q9E/CsB
 qTcxE8s6zoWJSms0asLBhfL/0FzunZbnoCu7aN/OlIi8zIvaiu+2EoL8eSqUhaAj/vjQ
 8njRBLwJSPJFeoVT3vyK8pKegVLp14jUlQYHqWJ3hwdDlsjtB8lQiRbj0njtDSPZvu72
 RnFhbgN3qSIWXlnBxTDt6uFomuudfRrWcSfL+dO0YROPVfUNXgy2zcYKiQa8Y0co9ZBR
 +p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jI4qdAGwJ5B37Etb6OWJgXVQ+UkNIp1rfBZ931XxLjU=;
 b=j/LRzllS7fNbZXJRRJ1VVkamjX9YxDi37Go+ZaGJG1H5SnUxk+vMqcKzvpV6qPL4IJ
 tSV2D8gyBxEUZlPDxvxCjMVZ4we7HL2vZkdo0f6GUvSsrBj9Fau8q9LmAdgcpKTEEH3P
 E45UtLO62S2sXMg+UhRIaWkiErkMHfXVpC9vnGh7sP+om0yYQb7fArKTi7RqpOEdX28U
 vWuLYmQEIKwd27wLzJhqTcH1twiUYoGwxNeDycFd76JJb0MYnBHgRiZtqVn9pM9gzohY
 GmHzOaKziYGOd3O5PUToTwWkwcxBzU6mjsBRXB6nietYFz22dDmO3+SX3bXrw1itflfW
 oIGQ==
X-Gm-Message-State: AOAM532JLI/fiWY81BvIHeebyYd9XpQO3CZ01cB2XlZpuzyluKmrCh9P
 SRWC6fveC0pLLMj9Zu1RK74lcjAwx5g1GA==
X-Google-Smtp-Source: ABdhPJxLhuhUNdVePnk0JKTHfxLhh1uiibZC1FKb+8p42mYFJ88v9McPVZYwn3ZR64C8KaV//cvFgA==
X-Received: by 2002:a62:ac18:0:b029:1c0:4398:33b5 with SMTP id
 v24-20020a62ac180000b02901c0439833b5mr3902856pfe.10.1611915453375; 
 Fri, 29 Jan 2021 02:17:33 -0800 (PST)
Received: from localhost.localdomain ([110.225.229.81])
 by smtp.gmail.com with ESMTPSA id x81sm8709821pfc.46.2021.01.29.02.17.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:17:32 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 29 Jan 2021 15:47:07 +0530
Message-Id: <1611915427-3196-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1l5QqR-0004qZ-BF
Subject: [Kgdb-bugreport] [PATCH v3] kdb: Simplify kdb commands registration
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Remove redundant "if" check.
- Pick up review tag from Doug.

Changes in v2:
- Remove redundant NULL check for "cmd_name".
- Incorporate misc. comment.

 kernel/debug/kdb/kdb_main.c    | 120 ++++++++++++-----------------------------
 kernel/debug/kdb/kdb_private.h |   1 +
 2 files changed, 34 insertions(+), 87 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930ac1b..588062a 100644
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
@@ -1011,25 +1005,17 @@ int kdb_parse(const char *cmdstr)
 		++argv[0];
 	}
 
-	for_each_kdbcmd(tp, i) {
-		if (tp->cmd_name) {
-			/*
-			 * If this command is allowed to be abbreviated,
-			 * check to see if this is it.
-			 */
-
-			if (tp->cmd_minlen
-			 && (strlen(argv[0]) <= tp->cmd_minlen)) {
-				if (strncmp(argv[0],
-					    tp->cmd_name,
-					    tp->cmd_minlen) == 0) {
-					break;
-				}
-			}
-
-			if (strcmp(argv[0], tp->cmd_name) == 0)
+	list_for_each_entry(tp, &kdb_cmds_head, list_node) {
+		/*
+		 * If this command is allowed to be abbreviated,
+		 * check to see if this is it.
+		 */
+		if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
+		    (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
 				break;
-		}
+
+		if (strcmp(argv[0], tp->cmd_name) == 0)
+			break;
 	}
 
 	/*
@@ -1037,19 +1023,15 @@ int kdb_parse(const char *cmdstr)
 	 * few characters of this match any of the known commands.
 	 * e.g., md1c20 should match md.
 	 */
-	if (i == kdb_max_commands) {
-		for_each_kdbcmd(tp, i) {
-			if (tp->cmd_name) {
-				if (strncmp(argv[0],
-					    tp->cmd_name,
-					    strlen(tp->cmd_name)) == 0) {
-					break;
-				}
-			}
+	if (list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
+		list_for_each_entry(tp, &kdb_cmds_head, list_node) {
+			if (strncmp(argv[0], tp->cmd_name,
+				    strlen(tp->cmd_name)) == 0)
+				break;
 		}
 	}
 
-	if (i < kdb_max_commands) {
+	if (!list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
 		int result;
 
 		if (!kdb_check_flags(tp->cmd_flags, kdb_cmd_enabled, argc <= 1))
@@ -2428,17 +2410,14 @@ static int kdb_kgdb(int argc, const char **argv)
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
-		if (!kt->cmd_name)
-			continue;
 		if (!kdb_check_flags(kt->cmd_flags, kdb_cmd_enabled, true))
 			continue;
 		if (strlen(kt->cmd_usage) > 20)
@@ -2667,49 +2646,20 @@ int kdb_register_flags(char *cmd,
 		       short minlen,
 		       kdb_cmdflags_t flags)
 {
-	int i;
 	kdbtab_t *kp;
 
-	/*
-	 *  Brute force method to determine duplicates
-	 */
-	for_each_kdbcmd(kp, i) {
-		if (kp->cmd_name && (strcmp(kp->cmd_name, cmd) == 0)) {
+	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+		if (strcmp(kp->cmd_name, cmd) == 0) {
 			kdb_printf("Duplicate kdb command registered: "
 				"%s, func %px help %s\n", cmd, func, help);
 			return 1;
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
@@ -2719,6 +2669,8 @@ int kdb_register_flags(char *cmd,
 	kp->cmd_minlen = minlen;
 	kp->cmd_flags  = flags;
 
+	list_add_tail(&kp->list_node, &kdb_cmds_head);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(kdb_register_flags);
@@ -2757,15 +2709,15 @@ EXPORT_SYMBOL_GPL(kdb_register);
  */
 int kdb_unregister(char *cmd)
 {
-	int i;
 	kdbtab_t *kp;
 
 	/*
 	 *  find the command.
 	 */
-	for_each_kdbcmd(kp, i) {
-		if (kp->cmd_name && (strcmp(kp->cmd_name, cmd) == 0)) {
-			kp->cmd_name = NULL;
+	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+		if (strcmp(kp->cmd_name, cmd) == 0) {
+			list_del(&kp->list_node);
+			kfree(kp);
 			return 0;
 		}
 	}
@@ -2778,12 +2730,6 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
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
index a4281fb..75ceafa 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -174,6 +174,7 @@ typedef struct _kdbtab {
 	short    cmd_minlen;		/* Minimum legal # command
 					 * chars required */
 	kdb_cmdflags_t cmd_flags;	/* Command behaviour flags */
+	struct list_head list_node;	/* Command list */
 } kdbtab_t;
 
 extern int kdb_bt(int, const char **);	/* KDB display back trace */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
