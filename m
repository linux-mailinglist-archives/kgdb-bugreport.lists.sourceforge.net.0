Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13F37F735
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 May 2021 13:54:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lh9up-000350-Fj
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 May 2021 11:54:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1lh9un-00034s-IV
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 11:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQmvefvqDAIM2m93Dqn+5OWuAmfoCSh4wprgQC9L5y4=; b=WLlbV8H9gfvC222OVSEm78F4Sx
 XO17EFV7/sJ1/GyPvcdFwFzXNO10dPU8BJ3fs/Mu5Dc4HdIrQPENrE26hsjj3VYSpLVX7JIdQ9uaO
 izyu8eJnNeE80xQ8Mj2ZOerUw1Z8ic7JatkwHAVFlHvdSJ7gkrKPLAZ1CDE2ECNeSBYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XQmvefvqDAIM2m93Dqn+5OWuAmfoCSh4wprgQC9L5y4=; b=FchVipvPIKLrRMJDG3MhyMbUZZ
 8+V+MbkEk1sQdaGRu4Ll8qTWNJDnw19sWarLsoMFsPLZCl8nFpRSxD8qFBBRXZPzaRJ3pe/EEn8Jz
 kv3hy9c/XqrwXmCKAgZFzTktpPJj9fKWzPtLMWR9sVUtV9dTg6qKISJk4Kj+/FlUXCII=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lh9ug-006g7K-75
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 May 2021 11:54:05 +0000
Received: by mail-pl1-f171.google.com with SMTP id t21so14241198plo.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 May 2021 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQmvefvqDAIM2m93Dqn+5OWuAmfoCSh4wprgQC9L5y4=;
 b=bARh98kdNIeWnUNdR7lZ7iMKaVe74TlDxAqQ501voh9Xfkfvy8QsAdaf6es4rUKVRW
 sjEsQcfLVAQci28C4at1ySWCbVLgBnjhGU6WaOa4THw/8gvJCGiO5FDCLEwgLigIW1cp
 KUFKEyF6MOBboBzIEKU+peJBkKRqd4/O7woaf79OlQLNxgOD2IvL2YUtSiCuko+ADUvZ
 tjSgrnERr6Su3OTdj+drqKzQrTt9B5639sivIa/acE3Yx39a95/IGeh6EjI66ybGixC/
 gl4SttTMS2KgcsWBFVDJ3IJ3yKGYHdEFbLdE72ci3In304zmbV9xUkpgS3IHNZvQPVMI
 Di8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQmvefvqDAIM2m93Dqn+5OWuAmfoCSh4wprgQC9L5y4=;
 b=QN+m07UAu9ltwIPGKbW0soiyzvYVVK0e5yRnwm2Y/VJxkhNzmlo2gqUhLTpvAKt3QI
 5q6Wz1pCrRvMbcj/LOz7qHP1tl+gFB4LmE28Lr0EhLodoIuquum2gT9hr/vjfHOjC1Qs
 dPfjkdfQeoGGkLllqlYWzPjDYHqMuRofJsT6YyiabTLSKYYC8wFtCMypnSSqpcU86qMS
 SOl32BRefiHEG93J8GG01BjgXwvuGLrrI7Wsy0zDxXHXPaqtP0tThVTCSoethXLkvR9F
 9onNR2G0slpJxiXvqJDm4NT5HJ9lVpBwysO/tPeAu7GzrV/TK10Jx8VCQFLGWaCGc8F9
 wT7w==
X-Gm-Message-State: AOAM531icDMe3grMrfDYvL0TJpxtjn05rPKHkyl9jK0/xmJ0RFcUltf3
 ekqcZThdM1HSj4jr2JRsKBErjG6zWr/JcA==
X-Google-Smtp-Source: ABdhPJzml5y1gkHqZOUNmAha0jFdJl552EWmqHBbPSYZeLlK6GGMVDhEbLVKy/tHPMM2dGpM3V0wfg==
X-Received: by 2002:a17:902:f203:b029:ee:e32f:2a28 with SMTP id
 m3-20020a170902f203b02900eee32f2a28mr38903392plc.45.1620905353950; 
 Thu, 13 May 2021 04:29:13 -0700 (PDT)
Received: from localhost.localdomain ([223.236.157.188])
 by smtp.gmail.com with ESMTPSA id p9sm6768807pjb.32.2021.05.13.04.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:29:13 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Thu, 13 May 2021 16:58:42 +0530
Message-Id: <20210513112842.707103-3-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513112842.707103-1-sumit.garg@linaro.org>
References: <20210513112842.707103-1-sumit.garg@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lh9ug-006g7K-75
Subject: [Kgdb-bugreport] [PATCH v3 2/2] kdb: Simplify kdb_defcmd macro logic
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
index de685b2a8ce7..ce7f4c71992d 100644
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
+	kdbtab_t cmd;			/* Macro command name */
+	struct list_head commands;	/* Associated command list */
 };
+
+struct kdb_macro_cmd_t {
+	char *cmd;			/* Command name */
+	struct list_head list_node;	/* Command list node */
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
+	struct kdb_macro_cmd_t *kmc;
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
+		if (!list_empty(&kdb_macro->commands))
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
+	kmc->cmd = kdb_strdup(cmdstr, GFP_KDB);
+	list_add_tail(&kmc->list_node, &kdb_macro->commands);
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
+		struct kdb_macro_cmd_t *kmc;
+
+		list_for_each_entry(kp, &kdb_cmds_head, list_node) {
+			if (kp->cmd_func == kdb_exec_defcmd) {
+				kdb_printf("defcmd %s \"%s\" \"%s\"\n",
+					   kp->cmd_name, kp->cmd_usage,
+					   kp->cmd_help);
+				kmp = container_of(kp, struct kdb_macro_t, cmd);
+				list_for_each_entry(kmc, &kmp->commands,
+						    list_node)
+					kdb_printf("%s", kmc->cmd);
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
+	INIT_LIST_HEAD(&kdb_macro->commands);
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
+	struct kdb_macro_cmd_t *kmc;
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
+	list_for_each_entry(kmc, &kmp->commands, list_node) {
+		/*
+		 * Recursive use of kdb_parse, do not use argv after this point.
+		 */
 		argv = NULL;
-		kdb_printf("[%s]kdb> %s\n", s->cmd.cmd_name, s->command[i]);
-		ret = kdb_parse(s->command[i]);
+		kdb_printf("[%s]kdb> %s\n", kmp->cmd.cmd_name, kmc->cmd);
+		ret = kdb_parse(kmc->cmd);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
