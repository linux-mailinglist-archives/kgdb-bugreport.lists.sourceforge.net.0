Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1E3C2274
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  9 Jul 2021 12:44:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1nzQ-0007Y3-Ej
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 10:44:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m1nzN-0007Xv-JJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 10:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHXBUu5eC6wZWYpwhsqB0JiIUWM07vx9lGh/1SjVYjg=; b=dbYwvlMZH+g9VldVYTW+XZ2Mir
 kaSAp+v76ZD/BBRuj5LvUBBGukRjpw45hqEBd7vqdW0R78nkLQ/0pMs3y6luAoX+PIzTm11KToHhr
 kTh4/hWoAXU7TLZzsd+Ai9rP0omnbwGzKsL3asSjdJMJ9QP+ZaQfe/wP5OtYmClwGhP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PHXBUu5eC6wZWYpwhsqB0JiIUWM07vx9lGh/1SjVYjg=; b=RxTn1n88+jEWyA3o6jdf1PqKhF
 918oh5kVZ55m0gB6445q+w3zPoGP25T7PdvJ85YtcUrw6FxOkfNMXFZCis5AO0xhPGL3EQ/FoIu7o
 PWIbmlkBcCgxVCuuaWWrKzdrJ5MBljULa6a6VXet2Bv8iolsoYNQ9WqpPIJ2NlCLherI=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1nzE-001edu-FX
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 10:44:09 +0000
Received: by mail-pg1-f169.google.com with SMTP id 62so9582064pgf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 03:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PHXBUu5eC6wZWYpwhsqB0JiIUWM07vx9lGh/1SjVYjg=;
 b=wbTykxNsEwOE7vaZM3EmJm3xHtkk38JCcMj9fPGeuM4UnD1+K3YRqojUP32sZWXb+G
 A68RH9Mhq+Ctoco0CQyezhbWq0DMZS2ok6FRW9jzcFxJtkePtBCqtLaF0A3+Ju2ffjNO
 0fd825zkdl6EjaH5kWNq3RIZ69/gwQ96KVBP8Bw5NsiiU5fb8rWIEDTrzy3HeKuY7Vyt
 JXoaMezgOcB1os5NzaZcNiqd/oFJvGHVS7toch2SuYk0c4P1IrYHr95fkP8MP7HF1NGg
 koVMICmTGHbTVCcmiB/67G71DYtbSX6mS6UW/aTrlvtBG2VovoHZ1rVrTsXzfmgAE+Tl
 9sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHXBUu5eC6wZWYpwhsqB0JiIUWM07vx9lGh/1SjVYjg=;
 b=O3FaoMFCicyg4cWWY0nIYCowGUKRtxr2H+FwUzWW0rMXl8YasZJ9LcY+iz4gC2YU7+
 TdQtCLEmALfvoYd4sNfHCiaULYkneIQw4ux5OR729HLHtPmxWib+gwjZAp9iBkud0J+P
 mLi3h/ShTFBtvu/SGj1TlYfaNff1IeqVteIU2lWz+81IIuZZ2lIpNlOSJZTWX+q0DgW8
 rIcai1XfddnXuyxivPNj9Nad7hW16X+ihmkgsVbD4B2+6/xpKt4RG/B8qpzFDwGfBKYB
 p0lmpw9c0bgfz2zdsZnCH5UjgakMXv/it3A10uuB7A/6uH//iFm8twdfmY5yYakJF9dq
 NVkQ==
X-Gm-Message-State: AOAM531te9zbCsOXvk5avvxw/AAlOznr+Mds55OQJrcUSevab1hq2GPx
 f9xqrz2t9+oZ4VtoxqACZE7X82xrSPR0OA==
X-Google-Smtp-Source: ABdhPJyTz3sqWHtamWBm4jB2QNNM0u84E9cgr/7iTS8Wg8uH361W3OTA7MN7Vi2j7LFvKisdJfpYTQ==
X-Received: by 2002:a65:638e:: with SMTP id h14mr37748349pgv.330.1625827434543; 
 Fri, 09 Jul 2021 03:43:54 -0700 (PDT)
Received: from localhost.localdomain ([223.178.210.84])
 by smtp.gmail.com with ESMTPSA id 1sm17479pfv.138.2021.07.09.03.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 03:43:53 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri,  9 Jul 2021 16:13:19 +0530
Message-Id: <20210709104320.101568-4-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709104320.101568-1-sumit.garg@linaro.org>
References: <20210709104320.101568-1-sumit.garg@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m1nzE-001edu-FX
Subject: [Kgdb-bugreport] [PATCH v4 3/4] kdb: Simplify kdb_defcmd macro logic
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
Cc: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Switch to use a linked list instead of dynamic array which makes
allocation of kdb macro and traversing the kdb macro commands list
simpler.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_main.c | 107 +++++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 49 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 6d9ff4048e7d..371983c03223 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -654,13 +654,16 @@ static void kdb_cmderror(int diag)
  *	zero for success, a kdb diagnostic if error
  */
 struct kdb_macro_t {
-	int count;
-	bool usable;
-	kdbtab_t cmd;
-	char **command;
+	kdbtab_t cmd;			/* Macro command */
+	struct list_head statements;	/* Associated statement list */
 };
+
+struct kdb_macro_statement_t {
+	char *statement;		/* Statement name */
+	struct list_head list_node;	/* Statement list node */
+};
+
 static struct kdb_macro_t *kdb_macro;
-static int kdb_macro_count;
 static bool defcmd_in_progress;
 
 /* Forward references */
@@ -668,34 +671,33 @@ static int kdb_exec_defcmd(int argc, const char **argv);
 
 static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 {
-	struct kdb_macro_t *s = kdb_macro + kdb_macro_count - 1;
-	char **save_command = s->command;
+	struct kdb_macro_statement_t *kmc;
+
+	if (!kdb_macro)
+		return KDB_NOTIMP;
+
 	if (strcmp(argv0, "endefcmd") == 0) {
 		defcmd_in_progress = false;
-		if (!s->count)
-			s->usable = false;
-		if (s->usable)
-			kdb_register(&s->cmd);
+		if (!list_empty(&kdb_macro->statements))
+			kdb_register(&kdb_macro->cmd);
 		return 0;
 	}
-	if (!s->usable)
-		return KDB_NOTIMP;
-	s->command = kcalloc(s->count + 1, sizeof(*(s->command)), GFP_KDB);
-	if (!s->command) {
-		kdb_printf("Could not allocate new kdb_defcmd table for %s\n",
+
+	kmc = kmalloc(sizeof(*kmc), GFP_KDB);
+	if (!kmc) {
+		kdb_printf("Could not allocate new kdb macro command: %s\n",
 			   cmdstr);
-		s->usable = false;
 		return KDB_NOTIMP;
 	}
-	memcpy(s->command, save_command, s->count * sizeof(*(s->command)));
-	s->command[s->count++] = kdb_strdup(cmdstr, GFP_KDB);
-	kfree(save_command);
+
+	kmc->statement = kdb_strdup(cmdstr, GFP_KDB);
+	list_add_tail(&kmc->list_node, &kdb_macro->statements);
+
 	return 0;
 }
 
 static int kdb_defcmd(int argc, const char **argv)
 {
-	struct kdb_macro_t *save_kdb_macro = kdb_macro, *s;
 	kdbtab_t *mp;
 
 	if (defcmd_in_progress) {
@@ -704,13 +706,21 @@ static int kdb_defcmd(int argc, const char **argv)
 		kdb_defcmd2("endefcmd", "endefcmd");
 	}
 	if (argc == 0) {
-		int i;
-		for (s = kdb_macro; s < kdb_macro + kdb_macro_count; ++s) {
-			kdb_printf("defcmd %s \"%s\" \"%s\"\n", s->cmd.cmd_name,
-				   s->cmd.cmd_usage, s->cmd.cmd_help);
-			for (i = 0; i < s->count; ++i)
-				kdb_printf("%s", s->command[i]);
-			kdb_printf("endefcmd\n");
+		kdbtab_t *kp;
+		struct kdb_macro_t *kmp;
+		struct kdb_macro_statement_t *kmc;
+
+		list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+			if (kp->cmd_func == kdb_exec_defcmd) {
+				kdb_printf("defcmd %s \"%s\" \"%s\"\n",
+					   kp->cmd_name, kp->cmd_usage,
+					   kp->cmd_help);
+				kmp = container_of(kp, struct kdb_macro_t, cmd);
+				list_for_each_entry(kmc, &kmp->statements,
+						    list_node)
+					kdb_printf("%s", kmc->statement);
+				kdb_printf("endefcmd\n");
+			}
 		}
 		return 0;
 	}
@@ -720,17 +730,11 @@ static int kdb_defcmd(int argc, const char **argv)
 		kdb_printf("Command only available during kdb_init()\n");
 		return KDB_NOTIMP;
 	}
-	kdb_macro = kmalloc_array(kdb_macro_count + 1, sizeof(*kdb_macro),
-				   GFP_KDB);
+	kdb_macro = kzalloc(sizeof(*kdb_macro), GFP_KDB);
 	if (!kdb_macro)
 		goto fail_defcmd;
-	memcpy(kdb_macro, save_kdb_macro,
-	       kdb_macro_count * sizeof(*kdb_macro));
-	s = kdb_macro + kdb_macro_count;
-	memset(s, 0, sizeof(*s));
-	s->usable = true;
 
-	mp = &s->cmd;
+	mp = &kdb_macro->cmd;
 	mp->cmd_func = kdb_exec_defcmd;
 	mp->cmd_minlen = 0;
 	mp->cmd_flags = KDB_ENABLE_ALWAYS_SAFE;
@@ -751,9 +755,9 @@ static int kdb_defcmd(int argc, const char **argv)
 		strcpy(mp->cmd_help, argv[3]+1);
 		mp->cmd_help[strlen(mp->cmd_help)-1] = '\0';
 	}
-	++kdb_macro_count;
+
+	INIT_LIST_HEAD(&kdb_macro->statements);
 	defcmd_in_progress = true;
-	kfree(save_kdb_macro);
 	return 0;
 fail_help:
 	kfree(mp->cmd_usage);
@@ -763,7 +767,6 @@ static int kdb_defcmd(int argc, const char **argv)
 	kfree(kdb_macro);
 fail_defcmd:
 	kdb_printf("Could not allocate new kdb_macro entry for %s\n", argv[1]);
-	kdb_macro = save_kdb_macro;
 	return KDB_NOTIMP;
 }
 
@@ -778,25 +781,31 @@ static int kdb_defcmd(int argc, const char **argv)
  */
 static int kdb_exec_defcmd(int argc, const char **argv)
 {
-	int i, ret;
-	struct kdb_macro_t *s;
+	int ret;
+	kdbtab_t *kp;
+	struct kdb_macro_t *kmp;
+	struct kdb_macro_statement_t *kmc;
+
 	if (argc != 0)
 		return KDB_ARGCOUNT;
-	for (s = kdb_macro, i = 0; i < kdb_macro_count; ++i, ++s) {
-		if (strcmp(s->cmd.cmd_name, argv[0]) == 0)
+
+	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+		if (strcmp(kp->cmd_name, argv[0]) == 0)
 			break;
 	}
-	if (i == kdb_macro_count) {
+	if (list_entry_is_head(kp, &kdb_cmds_head, list_node)) {
 		kdb_printf("kdb_exec_defcmd: could not find commands for %s\n",
 			   argv[0]);
 		return KDB_NOTIMP;
 	}
-	for (i = 0; i < s->count; ++i) {
-		/* Recursive use of kdb_parse, do not use argv after
-		 * this point */
+	kmp = container_of(kp, struct kdb_macro_t, cmd);
+	list_for_each_entry(kmc, &kmp->statements, list_node) {
+		/*
+		 * Recursive use of kdb_parse, do not use argv after this point.
+		 */
 		argv = NULL;
-		kdb_printf("[%s]kdb> %s\n", s->cmd.cmd_name, s->command[i]);
-		ret = kdb_parse(s->command[i]);
+		kdb_printf("[%s]kdb> %s\n", kmp->cmd.cmd_name, kmc->statement);
+		ret = kdb_parse(kmc->statement);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
