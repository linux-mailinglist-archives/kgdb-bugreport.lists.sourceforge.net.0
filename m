Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6B35DE17
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Apr 2021 13:54:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lWHcS-0001va-RM
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Apr 2021 11:54:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lWHcQ-0001vT-TF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Apr 2021 11:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j0v9vkdQisceKLQtmMNnmqVJ4fWC6iAY2bssbYxN9Ok=; b=TVyhZiIFQmrvdu+xpZxsYwQh+Y
 BxGgKOzQcS35fbHicnhw9Gpr45fHyeIwLL9voDcFsNWh4FiiHK5TKCjyyiNozon0QCd9w+E0ZPM2r
 eCuqmFPD8UnQIiJdL4ZP0hDCCLgM+u7TWRDoCFR6Nh/zs7kCr2eWzMyD/rVgIVqNJk/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j0v9vkdQisceKLQtmMNnmqVJ4fWC6iAY2bssbYxN9Ok=; b=M
 R/eYT7tQQXjKVOgcKQ3jOV3zAR68RF0A0TssgXs9abmXkYqvIkSDq7AgXwuvBZr2NCXNU9DFahSsM
 pQeiOaIiQAtsvpfV6AYIzBtiGWL+TBmPyZuwJk8ungchYraDS6rMoTfZnkB9khM5fFay5q/Jno2M6
 VDqo3MM3Wj5Bk0jU=;
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lWHcE-0002UG-00
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Apr 2021 11:54:11 +0000
Received: by mail-oi1-f181.google.com with SMTP id k25so16727154oic.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Apr 2021 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j0v9vkdQisceKLQtmMNnmqVJ4fWC6iAY2bssbYxN9Ok=;
 b=A2kgz+9cyq+OQWyY5+2gLtvK4X0Zq7lmzI9Z0gblWuTP+AoDmgMn6YNXC4JoeZiGeo
 Zk8FsaI2Xr2pSWLQ1dhsJ9laV3yFvYw3AuQYVsNMl42bu8ciY4odrIfy9VocKvca7RAn
 SDS5YVNbafj9oZY3ARPT33biSUJeCRrftlqQZ+ML9zhWFRuyFkwYbkxgUDOPQV5LJrjE
 V4JM9xM6MVLn3SS3Og9cwg0Ciy0xpjREwpYponwXjLFxyi1+hCqCs9zIaOr6b6TQVNhD
 chxLgPBoVM4UbHTlzY5t7P7B82Ww1G0R7adxtAwV8vWQZQzb2XvK77VV98QtR0CWmiSC
 HA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j0v9vkdQisceKLQtmMNnmqVJ4fWC6iAY2bssbYxN9Ok=;
 b=X77aSdVuvCB58FDh4esycDIv63Rx/H6swfmSgr+CxrgoBX0QqNKSIdXqJb17ULiTA5
 KQrMWRLRLf/fnd1uY2zuXJRee9LtoDrku2pU7mVuLT/b/6EbN9swrPHYhGL9PUtgoogc
 H4biU2oGlX1HipzJNy/0EprtXFSdDjAZmP9A4JzB5zWSSaFEDWiRQlXQkE6uL72ScQ2T
 xlPfyh+qcbThWBNIheUkN4YcM25LJgxQx3ap9U57oUGHLpa/JIplOpCKlW8RLeFS+v+2
 kSoFl62k+CBh+BK9wo17OJ6c8O2+7IRWvWShFxDLj1bjDhjjp3jdpm5AOLQFeGONHXU0
 ho1A==
X-Gm-Message-State: AOAM531bGJwBGmWtEC5shslKv5bEpJPtyws+UNkLSwGpAWWPhBYuo5fF
 54NnkSbR2ZMdJAyHtUpZBg7hdqNVHGR1hg==
X-Google-Smtp-Source: ABdhPJzu2nMUyuKPkkCGENWLghsyv9+JG1AnnCojuhGAwY0n4nGYIT2Bmw+4BEVMU7k2KJ412rCCmQ==
X-Received: by 2002:a17:90b:4b87:: with SMTP id
 lr7mr4111611pjb.5.1618314327327; 
 Tue, 13 Apr 2021 04:45:27 -0700 (PDT)
Received: from localhost.localdomain ([223.236.131.131])
 by smtp.gmail.com with ESMTPSA id h6sm12328849pfb.157.2021.04.13.04.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:45:26 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Tue, 13 Apr 2021 17:14:57 +0530
Message-Id: <20210413114457.1525224-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.181 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.181 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lWHcE-0002UG-00
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Simplify kdb_defcmd macro logic
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
Cc: daniel.thompson@linaro.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Switch to use a linked list instead of dynamic array which makes
allocation of kdb macro and traversing the kdb macro commands list
simpler.

Also, rename defcmd_set struct to kdb_macro_t struct as it sounds more
appropriate given its purpose. Along with this directly embed kdbtab_t
struct instead of custom command fields in kdb_macro_t struct as its now
possible to register pre-allocated kdb commands via kdb_register_table().

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Define new structs: kdb_macro_t and kdb_macro_cmd_t instead of
  modifying existing kdb command struct and struct kdb_subcmd.
- Reword commit message.

 kernel/debug/kdb/kdb_main.c | 158 +++++++++++++++++++-----------------
 1 file changed, 83 insertions(+), 75 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 9d69169582c6..2f2c0e3b39a9 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -678,16 +678,17 @@ static void kdb_cmderror(int diag)
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
+struct kdb_macro_t {
+	kdbtab_t cmd;			/* Macro command name */
+	struct list_head commands;	/* Associated command list */
 };
-static struct defcmd_set *defcmd_set;
-static int defcmd_set_count;
+
+struct kdb_macro_cmd_t {
+	char *cmd;			/* Command name */
+	struct list_head list_node;	/* Command list node */
+};
+
+static struct kdb_macro_t *kdb_macro;
 static bool defcmd_in_progress;
 
 /* Forward references */
@@ -695,53 +696,56 @@ static int kdb_exec_defcmd(int argc, const char **argv);
 
 static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 {
-	struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
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
-			/* macros are always safe because when executed each
-			 * internal command re-enters kdb_parse() and is
-			 * safety checked individually.
-			 */
-			kdb_register_flags(s->name, kdb_exec_defcmd, s->usage,
-					   s->help, 0,
-					   KDB_ENABLE_ALWAYS_SAFE);
+		if (!list_empty(&kdb_macro->commands))
+			kdb_register_table(&kdb_macro->cmd, 1);
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
-	struct defcmd_set *save_defcmd_set = defcmd_set, *s;
+	kdbtab_t *mp;
+
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
@@ -751,45 +755,43 @@ static int kdb_defcmd(int argc, const char **argv)
 		kdb_printf("Command only available during kdb_init()\n");
 		return KDB_NOTIMP;
 	}
-	defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
-				   GFP_KDB);
-	if (!defcmd_set)
+	kdb_macro = kzalloc(sizeof(*kdb_macro), GFP_KDB);
+	if (!kdb_macro)
 		goto fail_defcmd;
-	memcpy(defcmd_set, save_defcmd_set,
-	       defcmd_set_count * sizeof(*defcmd_set));
-	s = defcmd_set + defcmd_set_count;
-	memset(s, 0, sizeof(*s));
-	s->usable = true;
-	s->name = kdb_strdup(argv[1], GFP_KDB);
-	if (!s->name)
+	mp = &kdb_macro->cmd;
+
+	mp->cmd_func = kdb_exec_defcmd;
+	mp->cmd_minlen = 0;
+	mp->cmd_flags = KDB_ENABLE_ALWAYS_SAFE;
+	mp->cmd_name = kdb_strdup(argv[1], GFP_KDB);
+	if (!mp->cmd_name)
 		goto fail_name;
-	s->usage = kdb_strdup(argv[2], GFP_KDB);
-	if (!s->usage)
+	mp->cmd_usage = kdb_strdup(argv[2], GFP_KDB);
+	if (!mp->cmd_usage)
 		goto fail_usage;
-	s->help = kdb_strdup(argv[3], GFP_KDB);
-	if (!s->help)
+	mp->cmd_help = kdb_strdup(argv[3], GFP_KDB);
+	if (!mp->cmd_help)
 		goto fail_help;
-	if (s->usage[0] == '"') {
-		strcpy(s->usage, argv[2]+1);
-		s->usage[strlen(s->usage)-1] = '\0';
+	if (mp->cmd_usage[0] == '"') {
+		strcpy(mp->cmd_usage, argv[2]+1);
+		mp->cmd_usage[strlen(mp->cmd_usage)-1] = '\0';
 	}
-	if (s->help[0] == '"') {
-		strcpy(s->help, argv[3]+1);
-		s->help[strlen(s->help)-1] = '\0';
+	if (mp->cmd_help[0] == '"') {
+		strcpy(mp->cmd_help, argv[3]+1);
+		mp->cmd_help[strlen(mp->cmd_help)-1] = '\0';
 	}
-	++defcmd_set_count;
+
+	INIT_LIST_HEAD(&kdb_macro->commands);
 	defcmd_in_progress = true;
-	kfree(save_defcmd_set);
 	return 0;
 fail_help:
-	kfree(s->usage);
+	kfree(mp->cmd_usage);
 fail_usage:
-	kfree(s->name);
+	kfree(mp->cmd_name);
 fail_name:
-	kfree(defcmd_set);
+	kfree(kdb_macro);
 fail_defcmd:
-	kdb_printf("Could not allocate new defcmd_set entry for %s\n", argv[1]);
-	defcmd_set = save_defcmd_set;
+	kdb_printf("Could not allocate new kdb_macro entry for %s\n", argv[1]);
 	return KDB_NOTIMP;
 }
 
@@ -804,25 +806,31 @@ static int kdb_defcmd(int argc, const char **argv)
  */
 static int kdb_exec_defcmd(int argc, const char **argv)
 {
-	int i, ret;
-	struct defcmd_set *s;
+	int ret;
+	kdbtab_t *kp;
+	struct kdb_macro_t *kmp;
+	struct kdb_macro_cmd_t *kmc;
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
+	kmp = container_of(kp, struct kdb_macro_t, cmd);
+	list_for_each_entry(kmc, &kmp->commands, list_node) {
+		/*
+		 * Recursive use of kdb_parse, do not use argv after this point.
+		 */
 		argv = NULL;
-		kdb_printf("[%s]kdb> %s\n", s->name, s->command[i]);
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
