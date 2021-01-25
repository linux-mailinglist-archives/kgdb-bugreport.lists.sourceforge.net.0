Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 581FA30224E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 08:06:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l3vxh-0007v0-2G
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 07:06:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l3vxf-0007ua-2s
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 07:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DWDAUrWBRTDtOb8FK3clfU17c1Lzn1ORQKVu1tXRuWU=; b=LrgDfVyXRpwpZxXgZitHyD/q5M
 2uWRDvjOzGLaY1PXG3K+cq7qf4ybmxEQtKu9GvjmgrXgkGLN5FK9aeK14WA7LaWqlH7O30zUZiSVa
 ToCinMvXUyrZKYmv7XCwG2x9JeO6IuDm8xz1XEY2WYSfXjVUDHetxlnNn5tmnTZ/u0Ho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DWDAUrWBRTDtOb8FK3clfU17c1Lzn1ORQKVu1tXRuWU=; b=AY3WYpKzBl4QJo9yE7kYykZUCA
 Z/Bal3uNmcppDmUiFNANw3TFLd/jewBBSn/6gBeUGB4KpIBsIaeO06oLFpEC149bmz7KmtMQQQzFu
 obUO67dI1iVOaLmCBye9NKFfVL6uob7k3L40l/G7V18cZ6vMLxaKvqCsqdu8HcJFJD4c=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3vxP-001suC-Gr
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 07:06:55 +0000
Received: by mail-pg1-f170.google.com with SMTP id n25so8317892pgb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 24 Jan 2021 23:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=DWDAUrWBRTDtOb8FK3clfU17c1Lzn1ORQKVu1tXRuWU=;
 b=wjNyurSd3jPbZHQo2GP3CshjIr4SPceJV/qhZ4yeNE6rOf0u71eepojrsQi9NrPz8h
 ZWyuwhZkquAcruIKAov4tfBA8luJhPoD/fi/9qV10pmCD6hQSiQBtK0MJ7WCjE1xampq
 NX5OWKg5BkI5cqP9RKAD31YJQCpMZxRBQDyAgVG26l0FU3tY3cUZVeGwcPu1yXoxkttE
 XEIUtJlkSFBcuugJbsnMTFsC1EpuKnpdR4bjfkBMmZ+/2jbB5AET7mxDgbu1j4RFlqBB
 1LJ4Jy5xpNrxZGeZAW6zvz8SD4YZNXM9iW3o+JZV/94RFUpxUgT2fl3cmlxHzRVtB7rK
 fXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DWDAUrWBRTDtOb8FK3clfU17c1Lzn1ORQKVu1tXRuWU=;
 b=LqraaaXHPegJXSyN7EgdLdbGAgup8n1mBV16+fPwavreZcocCnQi8C+EbF4hGSpHWZ
 FBrz4eHxUd+kuyU+6ChSB52lEb8rQpdYuwbJVCqLckbeL5yjFbW/cT4m+ezR3VSDipe5
 EaBdQhMXd4wRzxKPw5VJMyKFIvllmcQZJDN5tZgQCtDbsoykX7c3PEjljMJhu7z6DPwG
 gq9qXh9OUVMDSyYDkZd9V3aD2pUlOrvatGApsHHGNELyGTHaXu1/v8NV7rkzFKL+EwFO
 g5J7ivJ9Y5QvlkOWsD16O9dyXoSyaoRvRsy/qfVmYiEY1fBxTR9kkzun6OQ4H2+GSqLQ
 h7RA==
X-Gm-Message-State: AOAM5314UOpAFUAZNxiyWMJuG3DnmSi0DIhk1zrliKkqBo7Aio/SEEJz
 FcKJRZmMyXk4uRP9ory+d7Dp1GtKoa5Org==
X-Google-Smtp-Source: ABdhPJw/DTLqzH1jb+2c7nZx98NYv49xavXdJw/fpxYZkNQajyq4sds5snIJQMxmQF3tZhlxD3eRhQ==
X-Received: by 2002:a62:88cf:0:b029:1c0:d4fb:1e62 with SMTP id
 l198-20020a6288cf0000b02901c0d4fb1e62mr3109583pfd.58.1611558393374; 
 Sun, 24 Jan 2021 23:06:33 -0800 (PST)
Received: from localhost.localdomain ([110.225.229.81])
 by smtp.gmail.com with ESMTPSA id b18sm16013039pfi.173.2021.01.24.23.06.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Jan 2021 23:06:32 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Mon, 25 Jan 2021 12:36:11 +0530
Message-Id: <1611558371-14414-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l3vxP-001suC-Gr
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Simplify kdb commands registration
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

Changes in v2:
- Remove redundant NULL check for "cmd_name".
- Incorporate misc. comment.

 kernel/debug/kdb/kdb_main.c    | 119 ++++++++++++-----------------------------
 kernel/debug/kdb/kdb_private.h |   1 +
 2 files changed, 34 insertions(+), 86 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930ac1b..a0989a0 100644
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
@@ -1011,25 +1005,18 @@ int kdb_parse(const char *cmdstr)
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
+		if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen)) {
+			if (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0)
 				break;
 		}
+
+		if (strcmp(argv[0], tp->cmd_name) == 0)
+			break;
 	}
 
 	/*
@@ -1037,19 +1024,15 @@ int kdb_parse(const char *cmdstr)
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
@@ -2428,17 +2411,14 @@ static int kdb_kgdb(int argc, const char **argv)
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
@@ -2667,49 +2647,20 @@ int kdb_register_flags(char *cmd,
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
@@ -2719,6 +2670,8 @@ int kdb_register_flags(char *cmd,
 	kp->cmd_minlen = minlen;
 	kp->cmd_flags  = flags;
 
+	list_add_tail(&kp->list_node, &kdb_cmds_head);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(kdb_register_flags);
@@ -2757,15 +2710,15 @@ EXPORT_SYMBOL_GPL(kdb_register);
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
@@ -2778,12 +2731,6 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
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
