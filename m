Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021A31E980
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 18 Feb 2021 13:10:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lCi93-0000nf-T9
	for lists+kgdb-bugreport@lfdr.de; Thu, 18 Feb 2021 12:10:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lCi8i-0000mj-Bs
 for kgdb-bugreport@lists.sourceforge.net; Thu, 18 Feb 2021 12:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyXPn6tY0vq5dxBTZ3O8QAETE7cABhqacxx+g75wB8w=; b=hwRhJui3oJJAsVfi2A2a1nLKcM
 AQSa3+3Ergc/+bEO9DLwckQodFiG4cX3rNMkFQl8svLNQ5n39ER1pUiqlSgLQ14I2H7+nAzKc5ba8
 Qn9Z2kyMahVnwNn1boj8xsnHrBPVEt9S38bGf6aorqFLBDo0KvnAVynJBlZB5JFPR5js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyXPn6tY0vq5dxBTZ3O8QAETE7cABhqacxx+g75wB8w=; b=I72HufCqnOIti66TPY7m94n4Pf
 nP3paYRI2lhPGFgMj/rzH6GwVvb/ePtL8RrLhWzjUta64S7Yqc5JIRrk9fdIOCyosR7qLnRdAoT9s
 xKCr5n8rg/AUo7Bi6Oc5/qto4MtF5ad5NTJGcDYOQwCCxYbIefH4T/pFdXUKmfDXxGF0=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lCi8a-00DvyM-A0
 for kgdb-bugreport@lists.sourceforge.net; Thu, 18 Feb 2021 12:10:36 +0000
Received: by mail-pf1-f178.google.com with SMTP id j12so1142229pfj.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 18 Feb 2021 04:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=xyXPn6tY0vq5dxBTZ3O8QAETE7cABhqacxx+g75wB8w=;
 b=CutVTw7uYhIpp5cmmTIC1QFr6S3NW0wxXqNOqnLDnxROFygpNA9XxZj8+urr8mtD6q
 bDewKsleQo2S3Gd+PUg5EhYxtToNofrAT7cI/XtOtdfHzAq9SEY0vnUecpgQ1Z1uAUVM
 ppiH7mpZ8MEcpqZ/AzX3hr2pAPSyU47g1C0LT436IsKiONJXR2ujyiyd1sBy97c4f6Sw
 kavYG8BoT34WxR2noDnT4QETpps1oQMEijTXl77EnHmK9Vl8IRRdRWaj6l1E4PI0OcLB
 oZ6IvjzlBNy4O17dl42ujCFD6/l7/qWcQe7JGdALtszUqDago4/fSJ0bt2izYL+yFdMN
 MunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xyXPn6tY0vq5dxBTZ3O8QAETE7cABhqacxx+g75wB8w=;
 b=K6mDETguznbd7GetBIG51tn2jGf8EunqI/tOJigawleNpD6IIUvBboYFswiOZC5INV
 qvQRKrp9Jv+WRcp/in5AOD8yz1oY7+Z3oUAhbdvvY4AEZXbHg5KznnIM0FlMcVGOMUn1
 4bglJJ3hxjdJ8xAhQ9EqBZ186QkQnY56QmuUhOWNKCdxJG/+uJmUVlRlAPIaROFMPHAx
 aUAEqh3wF3skpOrxEjDcl6gOFd/LhQRXNSEoriitHGH5eEvigk2fiyvHO7KVPzo6ncnB
 +jWcqvR19c+g6GLuHQHJvWZrUoxQqqJoHDfrvb9no7kDScjjay1KyxsOFpJlg/fRPB6G
 4z/w==
X-Gm-Message-State: AOAM5303SDkjin/hfBV82uZagQW+jCXL/v+cHkbnaG/+IUIU7LceRghc
 qDuuDj09VbUvirJZtFbrmTZmY72k9SE5vw==
X-Google-Smtp-Source: ABdhPJyh83uozKsCEperNTWXPgRoSFCUMn2kYX66sfhher9Vjsn/U1r/3gdwoAiYDAlhlwErGE5LfA==
X-Received: by 2002:a63:3404:: with SMTP id b4mr1146124pga.105.1613650221684; 
 Thu, 18 Feb 2021 04:10:21 -0800 (PST)
Received: from localhost.localdomain ([122.173.196.104])
 by smtp.gmail.com with ESMTPSA id w196sm6124277pfd.23.2021.02.18.04.10.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Feb 2021 04:10:20 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Thu, 18 Feb 2021 17:39:58 +0530
Message-Id: <1613650198-27437-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.178 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lCi8a-00DvyM-A0
Subject: [Kgdb-bugreport] [PATCH v4] kdb: Simplify kdb commands registration
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

Changes in v4:
- Fix kdb commands memory allocation issue prior to slab being available
  with an array of statically allocated commands. Now it works fine with
  kgdbwait.
- Fix a misc checkpatch warning.
- I have dropped Doug's review tag as I think this version includes a
  major fix that should be reviewed again.

Changes in v3:
- Remove redundant "if" check.
- Pick up review tag from Doug.

Changes in v2:
- Remove redundant NULL check for "cmd_name".
- Incorporate misc. comment.

 kernel/debug/kdb/kdb_main.c    | 129 ++++++++++++++---------------------------
 kernel/debug/kdb/kdb_private.h |   2 +
 2 files changed, 47 insertions(+), 84 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930ac1b..5215e04 100644
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
@@ -84,15 +85,12 @@ static unsigned int kdb_continue_catastrophic =
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
+
+#define KDB_CMD_INIT_MAX	50
+static int kdb_cmd_init_idx;
+static kdbtab_t kdb_commands_init[KDB_CMD_INIT_MAX];
 
 typedef struct _kdbmsg {
 	int	km_diag;	/* kdb diagnostic */
@@ -921,7 +919,7 @@ int kdb_parse(const char *cmdstr)
 	char *cp;
 	char *cpp, quoted;
 	kdbtab_t *tp;
-	int i, escaped, ignore_errors = 0, check_grep = 0;
+	int escaped, ignore_errors = 0, check_grep = 0;
 
 	/*
 	 * First tokenize the command string.
@@ -1011,25 +1009,17 @@ int kdb_parse(const char *cmdstr)
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
+	list_for_each_entry(tp, &kdb_cmds_head, list_node) {
+		/*
+		 * If this command is allowed to be abbreviated,
+		 * check to see if this is it.
+		 */
+		if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
+		    (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
+			break;
 
-			if (strcmp(argv[0], tp->cmd_name) == 0)
-				break;
-		}
+		if (strcmp(argv[0], tp->cmd_name) == 0)
+			break;
 	}
 
 	/*
@@ -1037,19 +1027,15 @@ int kdb_parse(const char *cmdstr)
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
@@ -2428,17 +2414,14 @@ static int kdb_kgdb(int argc, const char **argv)
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
@@ -2667,49 +2650,30 @@ int kdb_register_flags(char *cmd,
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
+	if (slab_is_available()) {
+		kp = kmalloc(sizeof(*kp), GFP_KDB);
+		if (!kp) {
+			kdb_printf("Could not allocate new kdb_command table\n");
 			return 1;
 		}
-		if (kdb_commands) {
-			memcpy(new, kdb_commands,
-			  (kdb_max_commands - KDB_BASE_CMD_MAX) * sizeof(*new));
-			kfree(kdb_commands);
+		kp->is_dynamic = true;
+	} else {
+		if (kdb_cmd_init_idx >= KDB_CMD_INIT_MAX) {
+			kdb_printf("Could not allocate init kdb_command table\n");
+			return 1;
 		}
-		memset(new + kdb_max_commands - KDB_BASE_CMD_MAX, 0,
-		       kdb_command_extend * sizeof(*new));
-		kdb_commands = new;
-		kp = kdb_commands + kdb_max_commands - KDB_BASE_CMD_MAX;
-		kdb_max_commands += kdb_command_extend;
+		kp = &kdb_commands_init[kdb_cmd_init_idx];
+		kdb_cmd_init_idx++;
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
@@ -2757,15 +2723,16 @@ EXPORT_SYMBOL_GPL(kdb_register);
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
+			if (kp->is_dynamic)
+				kfree(kp);
 			return 0;
 		}
 	}
@@ -2778,12 +2745,6 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
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
index a4281fb..f969a6a 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -174,6 +174,8 @@ typedef struct _kdbtab {
 	short    cmd_minlen;		/* Minimum legal # command
 					 * chars required */
 	kdb_cmdflags_t cmd_flags;	/* Command behaviour flags */
+	struct list_head list_node;	/* Command list */
+	bool    is_dynamic;		/* Command table allocation type */
 } kdbtab_t;
 
 extern int kdb_bt(int, const char **);	/* KDB display back trace */
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
