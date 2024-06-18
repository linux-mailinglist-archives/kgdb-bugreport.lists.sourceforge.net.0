Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC990C095
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 02:41:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJMv9-0007wg-1R
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 00:41:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJMv7-0007wV-4E
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQYuSB3bJKGmbINp6Hrk5oG47YXbeJRhUUPAWV3K+Mo=; b=V+jzyN2AwxLK4uPQMm7mvTphY6
 1MW49nDkH75fYcYdPJNpjsdsA0YTToG8/f2H4HBF4DuakLRUHUvC/kSn7nY4q7k27gPkxWasp5Cno
 mYKHqBd+U7X9Gnq84RtRmVBSp3w9Kj0NXbUzU0Es+YxQOEThMAYN8t7kzepwtckw5ZEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KQYuSB3bJKGmbINp6Hrk5oG47YXbeJRhUUPAWV3K+Mo=; b=mAlwtz0UHS3SDxdsFutqrtscZz
 aUvI8D1LLBIkS204TNLiuTPmWhg+9PLNKznqK6CcqeO05DukhnNAHSSrhS47pbwRl4BenPkhJXeBg
 w9FkWRe+41ZilArNQM7JsfgXlKcTiGkpGunTq0+uoG+2o4hymV1+ye1YkFLQ+jNOC85E=;
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJMv6-0004zC-D4 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:41:56 +0000
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b06f1f9a06so25228156d6.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 17:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718671305; x=1719276105;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQYuSB3bJKGmbINp6Hrk5oG47YXbeJRhUUPAWV3K+Mo=;
 b=FK3xff1GQu8KHpC13ew1AxQOofR4jOLxCZ8QxF/p15pyshDSA+A5h9G3k7NiGSxz25
 j6RZtJV8yD3VlboHtV1jOBz/MFY84cgA+6YUzOHq1Nh0RLxiU7ZWNJA5j8JJTQZPEi5n
 bd3EeMwIG6Qzf8cl0I05SduH+yDo2+ghFuvWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718671305; x=1719276105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQYuSB3bJKGmbINp6Hrk5oG47YXbeJRhUUPAWV3K+Mo=;
 b=ouwaHn4l4O8W4m2AQzSaLI1FJ0shoMFzeh50vjkBubE58Bxu9xe1dx+himCP/IBrtf
 XxuvPgkHfbA+ieKoSTKquyjgszjw5zT6cx9BXxIbMe/EFjNpoTYC5+00BWRjO1yJtsSa
 WYLp1J7jvTfVAVNh6dSlNJ0F7g4wjTAG2h7DS1MJS2hPP6V0G5lLhw+qjs3/a4Sjnu/l
 rTpEcNXJqIFS39cayJoXIkGm8j8/KR4teMCQ44cfFnMgP+SYaogelENuExMRV7KDGhM5
 klVeMQd7lgwWj5Bm4DWJytNwdSwl5Oauc7Q0H256Mth+AUlrqjmxP+E4WBRLlq/kyLhE
 +3PQ==
X-Gm-Message-State: AOJu0YyUvYQ0AAHhfOQTq0NQ0T9XXagbpx6syQinIiOW0W2SfUtEqUdK
 JAOEcmzpMuzdlxnpnEqI085zBIPOd0GHOTuOk4OiLWzjtqV7XS+7fO+wtvLX3UGSu+jZkYBwbnw
 =
X-Google-Smtp-Source: AGHT+IEeFrChFFKl6KwDuaajAmeP4HwLauX0HfkUNOPVlvxpRkkIIlBcTlhqDr0oERw4GC7UM86DHw==
X-Received: by 2002:a05:6a21:339f:b0:1b6:3fc5:d08b with SMTP id
 adf61e73a8af0-1bae823dbb8mr11068909637.40.1718670973958; 
 Mon, 17 Jun 2024 17:36:13 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:38 -0700
Message-ID: <20240617173426.4.Ie746acb6e0908f2f3328878e4aba7661d3daad7c@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Every caller to kdbgetaddrarg() didn't care about the
 "offset"
 and "name" returned by the function. Some passed NULL and some passed the
 address of a bogus local variable that was never looked at. Dro [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.219.51 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.51 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.51 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJMv6-0004zC-D4
Subject: [Kgdb-bugreport] [PATCH 04/13] kdb: Drop "offset" and "name" args
 to kdbgetaddrarg()
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Every caller to kdbgetaddrarg() didn't care about the "offset" and
"name" returned by the function. Some passed NULL and some passed the
address of a bogus local variable that was never looked at. Drop the
arguments.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_bp.c      |  5 +----
 kernel/debug/kdb/kdb_bt.c      |  4 +---
 kernel/debug/kdb/kdb_main.c    | 37 ++++++++--------------------------
 kernel/debug/kdb/kdb_private.h |  4 ++--
 4 files changed, 12 insertions(+), 38 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index 372025cf1ca3..98659f7dd744 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -279,8 +279,6 @@ static int kdb_bp(int argc, const char **argv)
 	int i, bpno;
 	kdb_bp_t *bp, *bp_check;
 	int diag;
-	char *symname = NULL;
-	long offset = 0ul;
 	int nextarg;
 	kdb_bp_t template = {0};
 
@@ -299,8 +297,7 @@ static int kdb_bp(int argc, const char **argv)
 	}
 
 	nextarg = 1;
-	diag = kdbgetaddrarg(argc, argv, &nextarg, &template.bp_addr,
-			     &offset, &symname);
+	diag = kdbgetaddrarg(argc, argv, &nextarg, &template.bp_addr);
 	if (diag)
 		return diag;
 	if (!template.bp_addr)
diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 10b454554ab0..af86744c1e2f 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -130,7 +130,6 @@ kdb_bt(int argc, const char **argv)
 	int btaprompt = 1;
 	int nextarg;
 	unsigned long addr;
-	long offset;
 
 	/* Prompt after each proc in bta */
 	kdbgetintenv("BTAPROMPT", &btaprompt);
@@ -205,8 +204,7 @@ kdb_bt(int argc, const char **argv)
 	} else {
 		if (argc) {
 			nextarg = 1;
-			diag = kdbgetaddrarg(argc, argv, &nextarg, &addr,
-					     &offset, NULL);
+			diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
 			if (diag)
 				return diag;
 			kdb_show_stack(kdb_current_task, (void *)addr);
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 88121334d189..74db5c0cc5ad 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -532,16 +532,12 @@ static int kdb_check_regs(void)
  *	regs	- Register state at time of KDB entry
  * Outputs:
  *	*value	- receives the value of the address-expression
- *	*offset - receives the offset specified, if any
- *	*name   - receives the symbol name, if any
  *	*nextarg - index to next unparsed argument in argv[]
  * Returns:
  *	zero is returned on success, a kdb diagnostic code is
  *      returned on error.
  */
-int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
-		  unsigned long *value,  long *offset,
-		  char **name)
+int kdbgetaddrarg(int argc, const char **argv, int *nextarg, unsigned long *value)
 {
 	unsigned long addr;
 	unsigned long off = 0;
@@ -615,12 +611,8 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
 
 	(*nextarg)++;
 
-	if (name)
-		*name = symname;
 	if (value)
 		*value = addr;
-	if (offset && name && *name)
-		*offset = addr - symtab.sym_start;
 
 	if ((*nextarg > argc)
 	 && (symbol == '\0'))
@@ -664,9 +656,6 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
 	if (!positive)
 		off = -off;
 
-	if (offset)
-		*offset += off;
-
 	if (value)
 		*value += off;
 
@@ -1116,14 +1105,10 @@ int kdb_parse(const char *cmdstr)
 	 */
 	{
 		unsigned long value;
-		char *name = NULL;
-		long offset;
 		int nextarg = 0;
 
-		if (kdbgetaddrarg(0, (const char **)argv, &nextarg,
-				  &value, &offset, &name)) {
+		if (kdbgetaddrarg(0, (const char **)argv, &nextarg, &value))
 			return KDB_NOTFOUND;
-		}
 
 		kdb_printf("%s = ", argv[0]);
 		kdb_symbol_print(value, NULL, KDB_SP_DEFAULT);
@@ -1593,7 +1578,6 @@ static int kdb_md(int argc, const char **argv)
 	char fmtchar, fmtstr[64];
 	unsigned long addr;
 	unsigned long word;
-	long offset = 0;
 	bool nosect = false;
 	bool symbolic = false;
 	bool valid = false;
@@ -1656,8 +1640,7 @@ static int kdb_md(int argc, const char **argv)
 	if (argc) {
 		unsigned long val;
 		int diag, nextarg = 1;
-		diag = kdbgetaddrarg(argc, argv, &nextarg, &addr,
-				     &offset, NULL);
+		diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
 		if (diag)
 			return diag;
 		if (argc > nextarg+2)
@@ -1793,7 +1776,6 @@ static int kdb_mm(int argc, const char **argv)
 {
 	int diag;
 	unsigned long addr;
-	long offset = 0;
 	unsigned long contents;
 	int nextarg;
 	int width;
@@ -1805,13 +1787,13 @@ static int kdb_mm(int argc, const char **argv)
 		return KDB_ARGCOUNT;
 
 	nextarg = 1;
-	diag = kdbgetaddrarg(argc, argv, &nextarg, &addr, &offset, NULL);
+	diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
 	if (diag)
 		return diag;
 
 	if (nextarg > argc)
 		return KDB_ARGCOUNT;
-	diag = kdbgetaddrarg(argc, argv, &nextarg, &contents, NULL, NULL);
+	diag = kdbgetaddrarg(argc, argv, &nextarg, &contents);
 	if (diag)
 		return diag;
 
@@ -1837,7 +1819,6 @@ static int kdb_go(int argc, const char **argv)
 	unsigned long addr;
 	int diag;
 	int nextarg;
-	long offset;
 
 	if (raw_smp_processor_id() != kdb_initial_cpu) {
 		kdb_printf("go must execute on the entry cpu, "
@@ -1847,8 +1828,7 @@ static int kdb_go(int argc, const char **argv)
 	}
 	if (argc == 1) {
 		nextarg = 1;
-		diag = kdbgetaddrarg(argc, argv, &nextarg,
-				     &addr, &offset, NULL);
+		diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
 		if (diag)
 			return diag;
 	} else if (argc) {
@@ -2043,14 +2023,13 @@ static int kdb_ef(int argc, const char **argv)
 {
 	int diag;
 	unsigned long addr;
-	long offset;
 	int nextarg;
 
 	if (argc != 1)
 		return KDB_ARGCOUNT;
 
 	nextarg = 1;
-	diag = kdbgetaddrarg(argc, argv, &nextarg, &addr, &offset, NULL);
+	diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
 	if (diag)
 		return diag;
 	show_regs((struct pt_regs *)addr);
@@ -2547,7 +2526,7 @@ static int kdb_per_cpu(int argc, const char **argv)
 	if (argc < 1 || argc > 3)
 		return KDB_ARGCOUNT;
 
-	diag = kdbgetaddrarg(argc, argv, &nextarg, &symaddr, NULL, NULL);
+	diag = kdbgetaddrarg(argc, argv, &nextarg, &symaddr);
 	if (diag)
 		return diag;
 
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 548fd4059bf9..1f685d9f16f9 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -105,8 +105,8 @@ extern int kdb_putword(unsigned long, unsigned long, size_t);
 extern int kdbgetularg(const char *, unsigned long *);
 extern int kdbgetu64arg(const char *, u64 *);
 extern char *kdbgetenv(const char *);
-extern int kdbgetaddrarg(int, const char **, int*, unsigned long *,
-			 long *, char **);
+extern int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
+			 unsigned long *value);
 extern int kdbgetsymval(const char *, kdb_symtab_t *);
 extern int kdbnearsym(unsigned long, kdb_symtab_t *);
 extern char *kdb_strdup(const char *str, gfp_t type);
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
