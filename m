Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C190C0FE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:09:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNLo-0001Yx-Rl
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:09:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNLk-0001YR-Cr
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YgDlsk7tZBNWPt6L0xmtq7VcgKRlSUrj1CtdhLHj6YQ=; b=RHptOODtq7jUY/864dAhA4ASt5
 Vsy4L8J95lfxE2gNWFDaS34zG919nVDVoNTAkS5u93R9zxTAqmv90ggPXK+Bxd0ui+vvTKuDq/bly
 kvAbNmHw4xHMceDCpskIt+7yzjcFLvVSKumlAh4U7OYGZ0fcfAMhP8OvLcyjLsAPnqpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YgDlsk7tZBNWPt6L0xmtq7VcgKRlSUrj1CtdhLHj6YQ=; b=gBJRI0y7x6bZoPMG+kCf28nq7r
 SGfXQ5KlAEqnfPclP+Zxnx1JsP6Y1sT5FuCicHa0VylJsje92lYkxIvpUL54/oWxaMopzXeIvwb/G
 oGSsdcIuV1X05kPzGNaT5K/ep3WzNU1Y0ik+yZFYWRhVsG4tJ2RzuPY9DmjbqEWbMLxc=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNLi-0006Nv-N2 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:09:26 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f992388bbbso2198505ad.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672955; x=1719277755;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgDlsk7tZBNWPt6L0xmtq7VcgKRlSUrj1CtdhLHj6YQ=;
 b=iXNZSbTQQV7cJb1NWc5HQRyQyI1xgC78ZFza3s0Ed11uSyZp32EY4huF7S5MHpJTC+
 CAl9bBCcE85jSgxdSohKeNBpWT63kFHRroL4tWkPEgcxjfv4onswNngVXKFYwYtGhYbj
 0qwFtO027JpO6GlY2ny8vhlfw+r/n4AwVz3cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672955; x=1719277755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgDlsk7tZBNWPt6L0xmtq7VcgKRlSUrj1CtdhLHj6YQ=;
 b=ucKErCAChHFAVBFFtViAR/RrTynsGOiovi7Y40XCZcs2eB+B1b1bNnSPeXATtiyyBw
 DR3osAJf55N8bm3mQDyse4gZ1IZWM7L6Rj6cGJ4+5LLfHUfxDQ154m2tHilHYY4Rjix4
 nyTz/Mt96aCzKjRcSqr8otBLtvlPCXat5/iIg4+fyUkJ/Kyar2z/kFPWMULY2GB29/f1
 AVbRg6QSEX7UEDfjwPjpWQr82jBdr5x82V45b1cf7gCDTNj+BdZkAPadm5Eb7cWCA+Uh
 wxB7fVykAA6T5s/bZX9Soekh4+0qoMiRISsyc7wdxh9KseOFK63oXH9QEGe+M5tBK1do
 vUpA==
X-Gm-Message-State: AOJu0Yxh9+3Tc+EfAVi/jFb1HYB6vdJ3pGa1qeIzKq1QFFb7ZlJILGHk
 aE3SV95dizCk7fzPlNGnswTILZZnvk6P+q+CVdJ1smCeXwXtFQBI8hCHoeKh89S2SPl9R4h+Wco
 =
X-Google-Smtp-Source: AGHT+IHBWxdBBjKCENzeRWXMjIsVcQL3bPswzu6BTKXdBeNDJvIgqbkofEcyTd0R0111Lvl3ltUAiw==
X-Received: by 2002:a05:6a20:a123:b0:1b1:f7a1:df91 with SMTP id
 adf61e73a8af0-1bae8353db0mr11922437637.61.1718670971664; 
 Mon, 17 Jun 2024 17:36:11 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:37 -0700
Message-ID: <20240617173426.3.I0ca82391856da1ee8c1c10b7ecf62b4dc0405aa0@changeid>
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
 Content preview:  Like much of kdb, the "md" implementation used the "int" type
 to store boolean values and used 0 for false and 1 for true. While this worked
 (and used to be the only way to do things back in the day), [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.182 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.182 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNLi-0006Nv-N2
Subject: [Kgdb-bugreport] [PATCH 03/13] kdb: Use "bool" in "md"
 implementation where appropriate
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

Like much of kdb, the "md" implementation used the "int" type to store
boolean values and used 0 for false and 1 for true. While this worked
(and used to be the only way to do things back in the day), we've had
"bool" for a lot of years now. Move the "md" functions to use "bool".

While touching this, we touch a line next to a comment using a style
that's nonstandard for the kdb codebase. Update it in passing.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 47e037c3c002..88121334d189 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1521,8 +1521,8 @@ static int kdb_mdr(unsigned long addr, unsigned int count)
  * See the kdb help for syntax.
  */
 static void kdb_md_line(const char *fmtstr, unsigned long addr,
-			int symbolic, int nosect, int bytesperword,
-			int num, int repeat, int phys)
+			bool symbolic, bool nosect, int bytesperword,
+			int num, int repeat, bool phys)
 {
 	/* print just one line of data */
 	kdb_symtab_t symtab;
@@ -1590,15 +1590,15 @@ static int kdb_md(int argc, const char **argv)
 	static unsigned long last_addr;
 	static int last_radix, last_bytesperword, last_repeat;
 	int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat;
-	int nosect = 0;
 	char fmtchar, fmtstr[64];
 	unsigned long addr;
 	unsigned long word;
 	long offset = 0;
-	int symbolic = 0;
-	int valid = 0;
-	int phys = 0;
-	int raw = 0;
+	bool nosect = false;
+	bool symbolic = false;
+	bool valid = false;
+	bool phys = false;
+	bool raw = false;
 
 	kdbgetintenv("MDCOUNT", &mdcount);
 	kdbgetintenv("RADIX", &radix);
@@ -1609,7 +1609,7 @@ static int kdb_md(int argc, const char **argv)
 
 	if (strcmp(argv[0], "mdr") == 0) {
 		if (argc == 2 || (argc == 0 && last_addr != 0))
-			valid = raw = 1;
+			valid = raw = true;
 		else
 			return KDB_ARGCOUNT;
 	} else if (isdigit(argv[0][2])) {
@@ -1622,7 +1622,7 @@ static int kdb_md(int argc, const char **argv)
 		last_bytesperword = bytesperword;
 		repeat = mdcount * 16 / bytesperword;
 		if (!argv[0][3])
-			valid = 1;
+			valid = true;
 		else if (argv[0][3] == 'c' && argv[0][4]) {
 			char *p;
 			repeat = simple_strtoul(argv[0] + 4, &p, 10);
@@ -1631,11 +1631,11 @@ static int kdb_md(int argc, const char **argv)
 		}
 		last_repeat = repeat;
 	} else if (strcmp(argv[0], "md") == 0)
-		valid = 1;
+		valid = true;
 	else if (strcmp(argv[0], "mds") == 0)
-		valid = 1;
+		valid = true;
 	else if (strcmp(argv[0], "mdp") == 0) {
-		phys = valid = 1;
+		phys = valid = true;
 	}
 	if (!valid)
 		return KDB_NOTFOUND;
@@ -1730,13 +1730,19 @@ static int kdb_md(int argc, const char **argv)
 	last_bytesperword = bytesperword;
 
 	if (strcmp(argv[0], "mds") == 0) {
-		symbolic = 1;
-		/* Do not save these changes as last_*, they are temporary mds
+		int tmp;
+
+		symbolic = true;
+
+		/*
+		 * Do not save these changes as last_*, they are temporary mds
 		 * overrides.
 		 */
 		bytesperword = KDB_WORD_SIZE;
 		repeat = mdcount;
-		kdbgetintenv("NOSECT", &nosect);
+
+		if (!kdbgetintenv("NOSECT", &tmp))
+			nosect = tmp;
 	}
 
 	/* Round address down modulo BYTESPERWORD */
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
