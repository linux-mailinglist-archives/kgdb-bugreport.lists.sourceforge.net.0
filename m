Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCD3C5DA2
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 15:47:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2wHF-00014k-BH
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 13:47:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1m2wH3-00014L-VK
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 13:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVA4RIwddIInyvljcC9awXaNo+KOHgwq2Y543zdH9qE=; b=e+YiQgYv05nCZtmTWz33jdNM6J
 nzIqjSfk9JjL+vn6DHDrK3heZ+PRQyOn4Uzdlt2VjOac/XrAFAqdpfHEXoQS82HRn1Hrr6tqyUHuq
 gRS7/qBkm8jp1EQgbhNAJuHNL3iLz3W/9kLrTJyUW6qXPLFJ3RqgopWsRHNLpk4o+38o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lVA4RIwddIInyvljcC9awXaNo+KOHgwq2Y543zdH9qE=; b=DlsL/YluKgJt1ba9gDIFCTfio9
 Dv1JYpqpBS9VML6xyS/jyRCiiOXISmSevU676EzdnrDp05ImwcB4E31YKRiMw/r3DoO3tSviMBmxi
 caXwMmWx1TcxVDA0fH0fl7VrIgIUcmGH0u4C+rueXMUZ+8o4muRDIW3KkOeF4xmhBCqI=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2wGo-0007pq-BH
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 13:46:59 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso14187pjp.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVA4RIwddIInyvljcC9awXaNo+KOHgwq2Y543zdH9qE=;
 b=EnYhOidupO3mexnBQ6v/6rHN/ritOgXUIJ2n23oA3qrg6MsI8E+sL+ZYvrhh+XPuaX
 R3Z4+ZsF7Ovom/3NPpswmS+gR84N61qCTp5XH/ekg0EBrtVH8N17xC2znb3Jt5dBEXWj
 rjzaL1kMGgjP47o4cSBUpqFRlMEDx377OmEohV3cCPL29uqiG0uYnNXTlBnlxe/OoNGX
 Pk905lp1Rq825DwZ4MmZ/5oWv4LqwMRmlxyC6YNeLgE0ZpFwxIsrrqEH6AjKSyFRpuDz
 7xutnpzkIVe3toPQYtH7MGFu98+3GcJndx8wR2vBoE2xpZrfO3OsCy+uryX14gP8X+Zt
 CT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVA4RIwddIInyvljcC9awXaNo+KOHgwq2Y543zdH9qE=;
 b=rbC28S8dOvqRIslcqLcWnoPmDPyk0bZTAT4yqP7bC820bnek1hEk/ZkJ3gx7aLuLzs
 X2qhA6QgsO69UHv+yV01Rl1mNTB8+uLy3kaDUkitUPPmb9Jr4iVY6Yx12gKlNCqzxwRK
 Z8TvEHb7KGfi6lbvfvv5NL37BQnmyKgm3EhphHgKDKClHHi66KLBMNDSGtGqkP3TfgKS
 rn2kamleE5qlY9capQ5/0yXrHMsLTL09gqngkgIuvmnZpJOdqnqss6ssK/+YjN5XLv4Z
 XImNG6Hz3/VxAU3dP6yphowDj1LGL7OvSvgwGmO1s216TdmcJS6SKTXif4axDOBRfJKG
 227w==
X-Gm-Message-State: AOAM531+xXr5/gizJ/iYGAr3EVbEXfF8SU2wv5LfW8mXh1rNB0kI3MpM
 hNhxMJPfxxJXVe4GyhtsXqz96zBjNCTBjQ==
X-Google-Smtp-Source: ABdhPJy2kSH6h6y9kkTcPgQWy0D7QzOanh5Co0AHDyoZrjssYOOafrgCTehrot5KsrApLFYbMOts4g==
X-Received: by 2002:a17:903:2c2:b029:101:9c88:d928 with SMTP id
 s2-20020a17090302c2b02901019c88d928mr43694689plk.62.1626097604364; 
 Mon, 12 Jul 2021 06:46:44 -0700 (PDT)
Received: from localhost.localdomain ([223.178.210.84])
 by smtp.gmail.com with ESMTPSA id z13sm835405pfn.94.2021.07.12.06.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 06:46:43 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Mon, 12 Jul 2021 19:16:17 +0530
Message-Id: <20210712134620.276667-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712134620.276667-1-sumit.garg@linaro.org>
References: <20210712134620.276667-1-sumit.garg@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.48 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m2wGo-0007pq-BH
Subject: [Kgdb-bugreport] [PATCH v5 1/4] kdb: Rename struct defcmd_set to
 struct kdb_macro
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

Rename struct defcmd_set to struct kdb_macro as that sounds more
appropriate given its purpose.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_main.c | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index d8ee5647b732..5cf9867fa118 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -654,7 +654,7 @@ static void kdb_cmderror(int diag)
  * Returns:
  *	zero for success, a kdb diagnostic if error
  */
-struct defcmd_set {
+struct kdb_macro {
 	int count;
 	bool usable;
 	char *name;
@@ -662,8 +662,8 @@ struct defcmd_set {
 	char *help;
 	char **command;
 };
-static struct defcmd_set *defcmd_set;
-static int defcmd_set_count;
+static struct kdb_macro *kdb_macro;
+static int kdb_macro_count;
 static bool defcmd_in_progress;
 
 /* Forward references */
@@ -671,7 +671,7 @@ static int kdb_exec_defcmd(int argc, const char **argv);
 
 static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 {
-	struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
+	struct kdb_macro *s = kdb_macro + kdb_macro_count - 1;
 	char **save_command = s->command;
 	if (strcmp(argv0, "endefcmd") == 0) {
 		defcmd_in_progress = false;
@@ -704,7 +704,7 @@ static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 
 static int kdb_defcmd(int argc, const char **argv)
 {
-	struct defcmd_set *save_defcmd_set = defcmd_set, *s;
+	struct kdb_macro *save_kdb_macro = kdb_macro, *s;
 	if (defcmd_in_progress) {
 		kdb_printf("kdb: nested defcmd detected, assuming missing "
 			   "endefcmd\n");
@@ -712,7 +712,7 @@ static int kdb_defcmd(int argc, const char **argv)
 	}
 	if (argc == 0) {
 		int i;
-		for (s = defcmd_set; s < defcmd_set + defcmd_set_count; ++s) {
+		for (s = kdb_macro; s < kdb_macro + kdb_macro_count; ++s) {
 			kdb_printf("defcmd %s \"%s\" \"%s\"\n", s->name,
 				   s->usage, s->help);
 			for (i = 0; i < s->count; ++i)
@@ -727,13 +727,13 @@ static int kdb_defcmd(int argc, const char **argv)
 		kdb_printf("Command only available during kdb_init()\n");
 		return KDB_NOTIMP;
 	}
-	defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
-				   GFP_KDB);
-	if (!defcmd_set)
+	kdb_macro = kmalloc_array(kdb_macro_count + 1, sizeof(*kdb_macro),
+				  GFP_KDB);
+	if (!kdb_macro)
 		goto fail_defcmd;
-	memcpy(defcmd_set, save_defcmd_set,
-	       defcmd_set_count * sizeof(*defcmd_set));
-	s = defcmd_set + defcmd_set_count;
+	memcpy(kdb_macro, save_kdb_macro,
+	       kdb_macro_count * sizeof(*kdb_macro));
+	s = kdb_macro + kdb_macro_count;
 	memset(s, 0, sizeof(*s));
 	s->usable = true;
 	s->name = kdb_strdup(argv[1], GFP_KDB);
@@ -753,19 +753,19 @@ static int kdb_defcmd(int argc, const char **argv)
 		strcpy(s->help, argv[3]+1);
 		s->help[strlen(s->help)-1] = '\0';
 	}
-	++defcmd_set_count;
+	++kdb_macro_count;
 	defcmd_in_progress = true;
-	kfree(save_defcmd_set);
+	kfree(save_kdb_macro);
 	return 0;
 fail_help:
 	kfree(s->usage);
 fail_usage:
 	kfree(s->name);
 fail_name:
-	kfree(defcmd_set);
+	kfree(kdb_macro);
 fail_defcmd:
-	kdb_printf("Could not allocate new defcmd_set entry for %s\n", argv[1]);
-	defcmd_set = save_defcmd_set;
+	kdb_printf("Could not allocate new kdb_macro entry for %s\n", argv[1]);
+	kdb_macro = save_kdb_macro;
 	return KDB_NOTIMP;
 }
 
@@ -781,14 +781,14 @@ static int kdb_defcmd(int argc, const char **argv)
 static int kdb_exec_defcmd(int argc, const char **argv)
 {
 	int i, ret;
-	struct defcmd_set *s;
+	struct kdb_macro *s;
 	if (argc != 0)
 		return KDB_ARGCOUNT;
-	for (s = defcmd_set, i = 0; i < defcmd_set_count; ++i, ++s) {
+	for (s = kdb_macro, i = 0; i < kdb_macro_count; ++i, ++s) {
 		if (strcmp(s->name, argv[0]) == 0)
 			break;
 	}
-	if (i == defcmd_set_count) {
+	if (i == kdb_macro_count) {
 		kdb_printf("kdb_exec_defcmd: could not find commands for %s\n",
 			   argv[0]);
 		return KDB_NOTIMP;
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
