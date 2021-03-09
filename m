Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC60332570
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Mar 2021 13:25:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lJbQe-0007WR-Gz
	for lists+kgdb-bugreport@lfdr.de; Tue, 09 Mar 2021 12:25:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lJbQc-0007WA-Qk
 for kgdb-bugreport@lists.sourceforge.net; Tue, 09 Mar 2021 12:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YMe1Reipq+pUMVMRE0+FPXbOWOU/b1ED4qcuTqK1ghc=; b=FFdzPAnAXKV7a5D5cl58yjdLyd
 DDRxLNrvoLruDyFoQntKXRsYbCBjpEI19h+WRcHsTQhIjLkhW80s6MORtC/fuiZpb9yzuE4fJRQ3w
 309k7UoI3FydC3jj3y+ngJ5uRK62XweKZcwOpW0TTfAIoigkjcpGFyzFR27rg6sCI7Ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YMe1Reipq+pUMVMRE0+FPXbOWOU/b1ED4qcuTqK1ghc=; b=U
 5u+l1RJ2nvxlrEJFLYBxWLqcUXogUIfbIgFsYhw4v1PgZlYN7MGLp8Y0j/8SEoKZBwEvy8JgCcpeq
 /BiVJ2zUX9UeyjU/8W6QOGo9I2RbZ0QY4hxnjkh9dHShFEV8xljhR8X5fXuz3DszCkEQGpLAizW2F
 u7cTWJ2TgDMn2ekw=;
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lJbQK-0041sQ-7e
 for kgdb-bugreport@lists.sourceforge.net; Tue, 09 Mar 2021 12:25:34 +0000
Received: by mail-oi1-f170.google.com with SMTP id u198so9755140oia.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Mar 2021 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YMe1Reipq+pUMVMRE0+FPXbOWOU/b1ED4qcuTqK1ghc=;
 b=Y19ZHseAo6Hf+XdFmH7G5u/kWcQ4ebnMvUX6r09EJ9aqY9k/NwFkPobPVlUCn5qOvI
 57C3uzWoJHrcbgUg9oWpAm25++WM7LFK9OZa1uubE8w7B+9YsoykbAHh2KYyMDds6n10
 oToGKC1wwGZm5EWe30wo9Szge/KP/0hthWBcYV1OVpfIxNpnzp7uZezHLPudJjw7wenP
 H5wdXe1ev44I3XyucVKdZwzIClnKqV5j300tqkUH3HDfot0I+tsov7UmBxp2sQg0B5QN
 mE9meH3F5f7YWhVeQDVCg1IOr2e2xPoZQtennF7irnxKXbLOTggXndXQElv0T3PxFNKr
 +1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YMe1Reipq+pUMVMRE0+FPXbOWOU/b1ED4qcuTqK1ghc=;
 b=C+rCFKVJgE2Jd/xNPiQvofdkwY+JehsLmYJggHt1oRkZzx2RoTkdU+LaU/iZT+BdPP
 Vg7xqXjntSrKz5DgbD31ZCf8Zx2w7//Tb60kuS/rwlx1uL75o1lDhHTdD8ss9QO0X5dM
 K9nalZW2tAuv6bgtKBHJmgOk3Cr+KqgOom4iba+s3Bh75o+VPbaVtwOdY2oHk5kqgcDC
 xc5ebkkuek2Yl2e6NW4pgvHFtxade4jkCk+sORUCZMTUvjgRwc1naf9ho5ulj0k0aDrq
 lksvO+SyRiMYjTYSyaGYP/r/Qpqc9rk8FW17bRxk0r/EhnZANYVCmkuoohedaFFPMl+4
 Anbg==
X-Gm-Message-State: AOAM531FKhdTepaIrDJM5XiwA6RlqUuO3klNyQ59WgvM3Nma3HaPKIgO
 dUYR+2ZpwsBFCyQmEwKUBfWnV3clNku+ug==
X-Google-Smtp-Source: ABdhPJyy5HCirQAKbPH84rJgbw/RcNuoEn37oDc5e3m8yWMb2Cy5JXXi3yOxfCIoRnM9B4hQacBZ3A==
X-Received: by 2002:a17:90a:4381:: with SMTP id
 r1mr4769515pjg.20.1615292284114; 
 Tue, 09 Mar 2021 04:18:04 -0800 (PST)
Received: from localhost.localdomain ([27.56.151.62])
 by smtp.gmail.com with ESMTPSA id x190sm13338787pfx.166.2021.03.09.04.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 04:18:03 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Tue,  9 Mar 2021 17:47:47 +0530
Message-Id: <20210309121747.859823-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.170 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lJbQK-0041sQ-7e
Subject: [Kgdb-bugreport] [PATCH] kdb: Refactor kdb_defcmd implementation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Switch to use kdbtab_t instead of separate struct defcmd_set since
now we have kdb_register_table() to register pre-allocated kdb commands.

Also, switch to use a linked list for sub-commands instead of dynamic
array which makes traversing the sub-commands list simpler.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_main.c    | 136 +++++++++++++++------------------
 kernel/debug/kdb/kdb_private.h |   7 ++
 2 files changed, 70 insertions(+), 73 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 9d69169582c6..2f54e81fd9f7 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -33,7 +33,6 @@
 #include <linux/kallsyms.h>
 #include <linux/kgdb.h>
 #include <linux/kdb.h>
-#include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
@@ -678,16 +677,7 @@ static void kdb_cmderror(int diag)
  * Returns:
  *	zero for success, a kdb diagnostic if error
  */
-struct defcmd_set {
-	int count;
-	bool usable;
-	char *name;
-	char *usage;
-	char *help;
-	char **command;
-};
-static struct defcmd_set *defcmd_set;
-static int defcmd_set_count;
+static kdbtab_t *defcmd_set;
 static bool defcmd_in_progress;
 
 /* Forward references */
@@ -695,53 +685,52 @@ static int kdb_exec_defcmd(int argc, const char **argv);
 
 static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 {
-	struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
-	char **save_command = s->command;
+	struct kdb_subcmd *ks;
+
+	if (!defcmd_set)
+		return KDB_NOTIMP;
+
 	if (strcmp(argv0, "endefcmd") == 0) {
 		defcmd_in_progress = false;
-		if (!s->count)
-			s->usable = false;
-		if (s->usable)
-			/* macros are always safe because when executed each
-			 * internal command re-enters kdb_parse() and is
-			 * safety checked individually.
-			 */
-			kdb_register_flags(s->name, kdb_exec_defcmd, s->usage,
-					   s->help, 0,
-					   KDB_ENABLE_ALWAYS_SAFE);
+		if (!list_empty(&defcmd_set->kdb_scmds_head))
+			kdb_register_table(defcmd_set, 1);
 		return 0;
 	}
-	if (!s->usable)
-		return KDB_NOTIMP;
-	s->command = kcalloc(s->count + 1, sizeof(*(s->command)), GFP_KDB);
-	if (!s->command) {
+
+	ks = kmalloc(sizeof(*ks), GFP_KDB);
+	if (!ks) {
 		kdb_printf("Could not allocate new kdb_defcmd table for %s\n",
 			   cmdstr);
-		s->usable = false;
 		return KDB_NOTIMP;
 	}
-	memcpy(s->command, save_command, s->count * sizeof(*(s->command)));
-	s->command[s->count++] = kdb_strdup(cmdstr, GFP_KDB);
-	kfree(save_command);
+
+	ks->scmd_name = kdb_strdup(cmdstr, GFP_KDB);
+	list_add_tail(&ks->list_node, &defcmd_set->kdb_scmds_head);
+
 	return 0;
 }
 
 static int kdb_defcmd(int argc, const char **argv)
 {
-	struct defcmd_set *save_defcmd_set = defcmd_set, *s;
 	if (defcmd_in_progress) {
 		kdb_printf("kdb: nested defcmd detected, assuming missing "
 			   "endefcmd\n");
 		kdb_defcmd2("endefcmd", "endefcmd");
 	}
 	if (argc == 0) {
-		int i;
-		for (s = defcmd_set; s < defcmd_set + defcmd_set_count; ++s) {
-			kdb_printf("defcmd %s \"%s\" \"%s\"\n", s->name,
-				   s->usage, s->help);
-			for (i = 0; i < s->count; ++i)
-				kdb_printf("%s", s->command[i]);
-			kdb_printf("endefcmd\n");
+		kdbtab_t *kp;
+		struct kdb_subcmd *ks;
+
+		list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+			if (kp->cmd_func == kdb_exec_defcmd) {
+				kdb_printf("defcmd %s \"%s\" \"%s\"\n",
+					   kp->cmd_name, kp->cmd_usage,
+					   kp->cmd_help);
+				list_for_each_entry(ks, &kp->kdb_scmds_head,
+						    list_node)
+					kdb_printf("%s", ks->scmd_name);
+				kdb_printf("endefcmd\n");
+			}
 		}
 		return 0;
 	}
@@ -751,45 +740,42 @@ static int kdb_defcmd(int argc, const char **argv)
 		kdb_printf("Command only available during kdb_init()\n");
 		return KDB_NOTIMP;
 	}
-	defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
-				   GFP_KDB);
+	defcmd_set = kzalloc(sizeof(*defcmd_set), GFP_KDB);
 	if (!defcmd_set)
 		goto fail_defcmd;
-	memcpy(defcmd_set, save_defcmd_set,
-	       defcmd_set_count * sizeof(*defcmd_set));
-	s = defcmd_set + defcmd_set_count;
-	memset(s, 0, sizeof(*s));
-	s->usable = true;
-	s->name = kdb_strdup(argv[1], GFP_KDB);
-	if (!s->name)
+
+	defcmd_set->cmd_func = kdb_exec_defcmd;
+	defcmd_set->cmd_minlen = 0;
+	defcmd_set->cmd_flags = KDB_ENABLE_ALWAYS_SAFE;
+	defcmd_set->cmd_name = kdb_strdup(argv[1], GFP_KDB);
+	if (!defcmd_set->cmd_name)
 		goto fail_name;
-	s->usage = kdb_strdup(argv[2], GFP_KDB);
-	if (!s->usage)
+	defcmd_set->cmd_usage = kdb_strdup(argv[2], GFP_KDB);
+	if (!defcmd_set->cmd_usage)
 		goto fail_usage;
-	s->help = kdb_strdup(argv[3], GFP_KDB);
-	if (!s->help)
+	defcmd_set->cmd_help = kdb_strdup(argv[3], GFP_KDB);
+	if (!defcmd_set->cmd_help)
 		goto fail_help;
-	if (s->usage[0] == '"') {
-		strcpy(s->usage, argv[2]+1);
-		s->usage[strlen(s->usage)-1] = '\0';
+	if (defcmd_set->cmd_usage[0] == '"') {
+		strcpy(defcmd_set->cmd_usage, argv[2]+1);
+		defcmd_set->cmd_usage[strlen(defcmd_set->cmd_usage)-1] = '\0';
 	}
-	if (s->help[0] == '"') {
-		strcpy(s->help, argv[3]+1);
-		s->help[strlen(s->help)-1] = '\0';
+	if (defcmd_set->cmd_help[0] == '"') {
+		strcpy(defcmd_set->cmd_help, argv[3]+1);
+		defcmd_set->cmd_help[strlen(defcmd_set->cmd_help)-1] = '\0';
 	}
-	++defcmd_set_count;
+
+	INIT_LIST_HEAD(&defcmd_set->kdb_scmds_head);
 	defcmd_in_progress = true;
-	kfree(save_defcmd_set);
 	return 0;
 fail_help:
-	kfree(s->usage);
+	kfree(defcmd_set->cmd_usage);
 fail_usage:
-	kfree(s->name);
+	kfree(defcmd_set->cmd_name);
 fail_name:
 	kfree(defcmd_set);
 fail_defcmd:
 	kdb_printf("Could not allocate new defcmd_set entry for %s\n", argv[1]);
-	defcmd_set = save_defcmd_set;
 	return KDB_NOTIMP;
 }
 
@@ -804,25 +790,29 @@ static int kdb_defcmd(int argc, const char **argv)
  */
 static int kdb_exec_defcmd(int argc, const char **argv)
 {
-	int i, ret;
-	struct defcmd_set *s;
+	int ret;
+	kdbtab_t *kp;
+	struct kdb_subcmd *ks;
+
 	if (argc != 0)
 		return KDB_ARGCOUNT;
-	for (s = defcmd_set, i = 0; i < defcmd_set_count; ++i, ++s) {
-		if (strcmp(s->name, argv[0]) == 0)
+
+	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+		if (strcmp(kp->cmd_name, argv[0]) == 0)
 			break;
 	}
-	if (i == defcmd_set_count) {
+	if (list_entry_is_head(kp, &kdb_cmds_head, list_node)) {
 		kdb_printf("kdb_exec_defcmd: could not find commands for %s\n",
 			   argv[0]);
 		return KDB_NOTIMP;
 	}
-	for (i = 0; i < s->count; ++i) {
-		/* Recursive use of kdb_parse, do not use argv after
-		 * this point */
+	list_for_each_entry(ks, &kp->kdb_scmds_head, list_node) {
+		/*
+		 * Recursive use of kdb_parse, do not use argv after this point.
+		 */
 		argv = NULL;
-		kdb_printf("[%s]kdb> %s\n", s->name, s->command[i]);
-		ret = kdb_parse(s->command[i]);
+		kdb_printf("[%s]kdb> %s\n", kp->cmd_name, ks->scmd_name);
+		ret = kdb_parse(ks->scmd_name);
 		if (ret)
 			return ret;
 	}
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index ec91d7e02334..a8bda278c9c1 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -13,6 +13,7 @@
  */
 
 #include <linux/kgdb.h>
+#include <linux/list.h>
 #include "../debug_core.h"
 
 /* Kernel Debugger Command codes.  Must not overlap with error codes. */
@@ -164,6 +165,11 @@ typedef struct _kdb_bp {
 #ifdef CONFIG_KGDB_KDB
 extern kdb_bp_t kdb_breakpoints[/* KDB_MAXBPT */];
 
+struct kdb_subcmd {
+	char    *scmd_name;		/* Sub-command name */
+	struct  list_head list_node;	/* Sub-command node */
+};
+
 /* The KDB shell command table */
 typedef struct _kdbtab {
 	char    *cmd_name;		/* Command name */
@@ -175,6 +181,7 @@ typedef struct _kdbtab {
 	kdb_cmdflags_t cmd_flags;	/* Command behaviour flags */
 	struct list_head list_node;	/* Command list */
 	bool    is_dynamic;		/* Command table allocation type */
+	struct list_head kdb_scmds_head; /* Sub-commands list */
 } kdbtab_t;
 
 extern void kdb_register_table(kdbtab_t *kp, size_t len);
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
