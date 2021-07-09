Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E67083C2270
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  9 Jul 2021 12:43:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1nzB-0007X4-7o
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 10:43:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m1nzA-0007Wu-0Q
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 10:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4GQqJQ0D7DHcpMP89v1aKCiN7Kt8bURDgsrEepvgmL8=; b=FO+FkKvmAhnyOTQ1Q8f0kOj0yh
 MjQ7Bk4AInLE/DrlQ3qt7Af/88ABeG+Xfr6SQ4xI6DbAfYD5GX0t0R7CZZrQy4sJjD1LjbdRvJjzD
 X9Yt4RVL3r17gO65tnl+1GalOMsUd/CtMyOhHAsLEjKMWjjwhemcUV/Ws8j1mCI8wlSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4GQqJQ0D7DHcpMP89v1aKCiN7Kt8bURDgsrEepvgmL8=; b=TX40EPtf6jr04R61sxaGD16oET
 5UzSjgPFZXQHJSTOm4DslX1z20tEcnKzwJVqrDaKTFiH132LMXOaTjOMQIFbZDomvmhIOfOk/BIgC
 jm26hT52N4o9fr+BJG7qgU28VEjB47eQFy0S+iFibhMesy3g47JEvifTu2veLrKdvUjI=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1nz6-0000hj-7W
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 10:43:55 +0000
Received: by mail-pf1-f173.google.com with SMTP id d12so8385106pfj.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GQqJQ0D7DHcpMP89v1aKCiN7Kt8bURDgsrEepvgmL8=;
 b=u/LwrYY0Has6wwCc22UF5AJhQhXhY63JprqAqTWwuew1jkc5u2Ku4UgXNoPVRn3ykg
 Mq0PtzpHm/FVTmbXmK4tkcFap0WgDRg1AxFh8iUDw1eVMsFwG/UKnufajQw5N3J3amUs
 WjfjPuAmsjRerERs/suvtLWxT94Y2kr+8PtbafQqnLi5H0knxDmSYmkz08MBbNb1CYdq
 6melT7DJZWoiH/7Zj9jOCudpkvy7CBq2COZN2UpJ4yCBTHwNNrTuqta4TVf8q2nPsASI
 3eTHrxhDUQ/MurWJFAhty+cAK3Tm+RZqokzloRQwLK3Agb5czJ7woOfHxf/XWGZCREW8
 lkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4GQqJQ0D7DHcpMP89v1aKCiN7Kt8bURDgsrEepvgmL8=;
 b=r3SUMgvKLFZ08OJFCnnaAy5k2svYKo+511VU8E0fVy3doBkAWIZeat3bOpYwCpcVfj
 HiB3HGljVaEZ8Hy5tU1Ea6W6uBZGV5xbi7ZXlzRMpcYzZqZwQLnhtRRKo/r4skkp6sCu
 alusY3Qmryocc/+ZiyzL9qbXQDo5aIB1mQoqwX7XxuJdDYndkNzWK88WWyNwgaW0phxT
 +tdPco6xBbOgb9ZIHOzg+4v6bglZGr3+7vZvvmY5DhRfLeoIAf4E/ttjVkBx2KecemzI
 PMztS4CdKSGFFuacBwtS1kCnlDrfpdNkeUtZc2BRMSBWmbMxJ6fT1r3uMtxJCtfFIF+e
 o84g==
X-Gm-Message-State: AOAM532Ubasc4CffNO3CRim2tlA//KW8YUDp1qR9doSLEcol/FVy+Uyc
 qcV/vyKLyaCFSXMEd9nKVjroTdhMyOhVdA==
X-Google-Smtp-Source: ABdhPJxlzG6kwP0QNJvnQDReEJ+f1E+J7JLpoQ6+s0pmlbk7rCwXLCkWu0RdhSKOvucDRjtNOpoi2Q==
X-Received: by 2002:a63:ed0d:: with SMTP id d13mr37943499pgi.258.1625827426249; 
 Fri, 09 Jul 2021 03:43:46 -0700 (PDT)
Received: from localhost.localdomain ([223.178.210.84])
 by smtp.gmail.com with ESMTPSA id 1sm17479pfv.138.2021.07.09.03.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 03:43:45 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri,  9 Jul 2021 16:13:17 +0530
Message-Id: <20210709104320.101568-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709104320.101568-1-sumit.garg@linaro.org>
References: <20210709104320.101568-1-sumit.garg@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.173 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m1nz6-0000hj-7W
Subject: [Kgdb-bugreport] [PATCH v4 1/4] kdb: Rename struct defcmd_set to
 struct kdb_macro_t
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

as that sounds more appropriate given its purpose.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_main.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index d8ee5647b732..d4897fbc9d2e 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -654,7 +654,7 @@ static void kdb_cmderror(int diag)
  * Returns:
  *	zero for success, a kdb diagnostic if error
  */
-struct defcmd_set {
+struct kdb_macro_t {
 	int count;
 	bool usable;
 	char *name;
@@ -662,8 +662,8 @@ struct defcmd_set {
 	char *help;
 	char **command;
 };
-static struct defcmd_set *defcmd_set;
-static int defcmd_set_count;
+static struct kdb_macro_t *kdb_macro;
+static int kdb_macro_count;
 static bool defcmd_in_progress;
 
 /* Forward references */
@@ -671,7 +671,7 @@ static int kdb_exec_defcmd(int argc, const char **argv);
 
 static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 {
-	struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
+	struct kdb_macro_t *s = kdb_macro + kdb_macro_count - 1;
 	char **save_command = s->command;
 	if (strcmp(argv0, "endefcmd") == 0) {
 		defcmd_in_progress = false;
@@ -704,7 +704,7 @@ static int kdb_defcmd2(const char *cmdstr, const char *argv0)
 
 static int kdb_defcmd(int argc, const char **argv)
 {
-	struct defcmd_set *save_defcmd_set = defcmd_set, *s;
+	struct kdb_macro_t *save_kdb_macro = kdb_macro, *s;
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
+	kdb_macro = kmalloc_array(kdb_macro_count + 1, sizeof(*kdb_macro),
 				   GFP_KDB);
-	if (!defcmd_set)
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
+	struct kdb_macro_t *s;
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
