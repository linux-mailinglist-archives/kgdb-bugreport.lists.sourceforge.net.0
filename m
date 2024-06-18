Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9FB90C0D5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 02:58:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNBW-0008Ip-AI
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 00:58:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNBV-0008Ih-Fy
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L0tcgH7kpPYZmXgjENARI8PNR8N6oeoNW3iiLkQ8n4E=; b=R4iInVWBCsEwg8W40vsEKVjQ/z
 ROu8ocyqFce+YHQSXmzlIJUmMNGuPQbo3q7S4rWbmVqv0ZQH4Cq/yTa4Wv7a00X6afL+3nqQAMvA7
 woJhQNuo5peJgnTOO2Q19iNvYfbJB1MimlES4cCoFm7ODD8gezJ4X6N3FcVlnOhAOwmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L0tcgH7kpPYZmXgjENARI8PNR8N6oeoNW3iiLkQ8n4E=; b=Oda5YeHb4R/EpLK4qIbVX1Ynda
 HQING31o2Xtbjh2BcGfjGVb7R4dobNIDDl9BzZCn2UZHoPODDKuC/qa59EeKD1vHuk2boH7ad0e7z
 g21LHZ/c9qUhOzAkC8e45qtWs5gtJYJzA2ooz4qhO6FLhgojgmGYH1rAHkFjz5GQWiJ0=;
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNBR-0005tc-KT for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:58:49 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6316253dc52so37450617b3.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 17:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672318; x=1719277118;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0tcgH7kpPYZmXgjENARI8PNR8N6oeoNW3iiLkQ8n4E=;
 b=Mr/0tWS20uvlvM8d+9qzEhvJRl2YpQMx04gMBqyvg48OEB4tRGR8gz4T+mVYRq4DiP
 3kfd0zR+7exPfKBshesPH2rrBbNqS4FSZvfhwX79+DTjeyxFE8sGf54CjCtAr+CRzoXC
 9hMMZNe/wQJzknz0lcPJkC38izgEc3LXDKsYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672318; x=1719277118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0tcgH7kpPYZmXgjENARI8PNR8N6oeoNW3iiLkQ8n4E=;
 b=RGYYuJlZFn5db1xRd4XtiEGDdAu6tahL2CGKLWqqBGnWW6W7CyAcskMZ/MMJywWC7c
 x9ia+WNUjEGOe/O3Gd0SxuniiD/uynlFyqe/o/hHpCox3iIsCN4BNcG/oiiIo9xk0Mgc
 bAR6O1ezsB2aRsF0ssOSG49QJeHCbe/PuX0898PGJjHrOakdDY5URszxtKN3tH1J5kns
 wDWPZE0iDS5DESYojm5+L+hFGgEe7k9C972GcooLhoiFwzbGBn30EjABiufM9sWdv89V
 E6awOAtobBWtO2jrNednyN/qzRrcC9/75S3JgwQ7PTXgjjprDqjCSdLtsHtZMGOKDj8A
 PK+Q==
X-Gm-Message-State: AOJu0YzlY/b1+q18HOH2n0SsZ6NrXaGyD4jKgwCrfc1X6+9Hx46/NHQd
 f7YpgI7RoDTzfpwgSH8wPOEy84jTObfzc2mawuiSh2nEOVgH4wSEpHJt/BEgrwrrO+7anjbFnR8
 =
X-Google-Smtp-Source: AGHT+IGR/2hsrBcVwXjJ7Pu9pelpErIPRe0m0tZzxRGHYhOk7GL1fAIfHh6yZw2WMj3KWaF7++N/yg==
X-Received: by 2002:a05:6a20:394a:b0:1b4:5d12:63f1 with SMTP id
 adf61e73a8af0-1bae7eff86fmr14042814637.26.1718670969545; 
 Mon, 17 Jun 2024 17:36:09 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:36 -0700
Message-ID: <20240617173426.2.I5621f286f5131c84ac71a212508ba1467ac443f2@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The documentation for the variouis "md" commands was
 inconsistent
 about documenting the command arguments. It was also hard to figure out what
 the differences between the "phys", "raw", and "symbolic" [...] 
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
 for more information. [209.85.128.176 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.176 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.176 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.176 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNBR-0005tc-KT
Subject: [Kgdb-bugreport] [PATCH 02/13] kdb: Document the various "md"
 commands better
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

The documentation for the variouis "md" commands was inconsistent
about documenting the command arguments. It was also hard to figure
out what the differences between the "phys", "raw", and "symbolic"
versions was.

Update the help strings to make things more obvious.

As part of this, add "bogus" commands to the table for "mdW" and
"mdWcN" so we don't have to obscurely reference them in the normal
"md" help. These bogus commands don't really hurt since kdb_md()
validates argv[0] enough.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 39 ++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index cbeb203785b4..47e037c3c002 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1516,14 +1516,9 @@ static int kdb_mdr(unsigned long addr, unsigned int count)
 }
 
 /*
- * kdb_md - This function implements the 'md', 'md1', 'md2', 'md4',
- *	'md8' 'mdr' and 'mds' commands.
+ * kdb_md - This function implements the guts of the various 'md' commands.
  *
- *	md|mds  [<addr arg> [<line count> [<radix>]]]
- *	mdWcN	[<addr arg> [<line count> [<radix>]]]
- *		where W = is the width (1, 2, 4 or 8) and N is the count.
- *		for eg., md1c20 reads 20 bytes, 1 at a time.
- *	mdr  <addr arg>,<byte count>
+ * See the kdb help for syntax.
  */
 static void kdb_md_line(const char *fmtstr, unsigned long addr,
 			int symbolic, int nosect, int bytesperword,
@@ -2677,26 +2672,38 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
 static kdbtab_t maintab[] = {
 	{	.name = "md",
 		.func = kdb_md,
-		.usage = "<vaddr>",
-		.help = "Display Memory Contents, also mdWcN, e.g. md8c1",
+		.usage = "<vaddr> [<lines> [<radix>]]",
+		.help = "Display RAM using BYTESPERWORD; show MDCOUNT lines",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
-	{	.name = "mdr",
+	{	.name = "mdW",
 		.func = kdb_md,
-		.usage = "<vaddr> <bytes>",
-		.help = "Display Raw Memory",
+		.usage = "<vaddr> [<lines> [<radix>]]",
+		.help = "Display RAM using word size (W) of 1, 2, 4, or 8",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
+	{	.name = "mdWcN",
+		.func = kdb_md,
+		.usage = "<vaddr> [<lines> [<radix>]]",
+		.help = "Display RAM using word size (W); show N words",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
 	{	.name = "mdp",
 		.func = kdb_md,
-		.usage = "<paddr> <bytes>",
-		.help = "Display Physical Memory",
+		.usage = "<paddr> [<lines> [<radix>]]",
+		.help = "Display RAM given a physical address",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
+	{	.name = "mdr",
+		.func = kdb_md,
+		.usage = "<vaddr> <bytes>",
+		.help = "Display RAM as a stream of raw bytes",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
 	{	.name = "mds",
 		.func = kdb_md,
-		.usage = "<vaddr>",
-		.help = "Display Memory Symbolically",
+		.usage = "<vaddr> [<lines>]",
+		.help = "Display RAM 1 native word/line; find words in kallsyms",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
 	{	.name = "mm",
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
