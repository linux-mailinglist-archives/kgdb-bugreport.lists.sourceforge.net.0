Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF3590C0DA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:00:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNCl-00020F-PK
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:00:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNCj-000207-In
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lAce2BbpEK1CBNaRWM54Pp5Bl8/PNgc1s0HraY4ZUrU=; b=GlAnyM8SrcTlzdvHL4VlQaLB7o
 52qCF7/mOerVLKcKH5YyR0MXXL4qX9d763304Isz//LeGn/JX2rP1UDRumcaA7XjUR37UMuu4hGXd
 HQwSKVi+rK9nvphkx2zICeNRGlnJ18YeLDgiibpFVS02hQFCoT+cW1xy2K5cJDpdgfCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lAce2BbpEK1CBNaRWM54Pp5Bl8/PNgc1s0HraY4ZUrU=; b=T4yVq2nBOCBZ2BoWHHpYclLCcy
 qF+ucnAUUyZ47YFChhKFeKm7aDUoh4ktVVSkGuybFYeAJ49uSMLqLG0wU32x6VIzHJvi4xS74RwRi
 JzB82uTSCydefAgLAQ5sA/bVBhMAS1iXTBpultP3GHfL0/rZqcqV0tBKv+tO761ymSTk=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNCj-0005za-PZ for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:00:09 +0000
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-441567d352bso31886461cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672398; x=1719277198;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAce2BbpEK1CBNaRWM54Pp5Bl8/PNgc1s0HraY4ZUrU=;
 b=ap0BTCtiUrHH62ZoAmezxcb8F8UjH1XGqUFNRYhaANNjqVDDC6414JbA8O/ipwtFL0
 elvFnuayQMiPT94ih+jDUS0uZZ4cqm5eFkMAAv1gzLRmcBi4WQ4FYEyFCPqJnqPfLbP9
 Lz3d2KfgyieMm6m4IiEPOmAMJpar6IRPmqxiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672398; x=1719277198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAce2BbpEK1CBNaRWM54Pp5Bl8/PNgc1s0HraY4ZUrU=;
 b=rLVVuKk4dUeyi9wRSqngkXiDjFGrmf0g7/INof0yrY6j48bWqC5Xr+53GJ/Q5Vhfvr
 vCRus39plWs8FSS3JVgBrKjag03GH1LY7gks4sX/AiA70y6n9MhHsmq+2FmKZL/3l7iJ
 Dcyvwh1q6wjrHykYKGrHIryn5B11cgWBm8ST5/xMPtMlX3CfOtI/y2zf6p3QbctJ2nxh
 mmoUKvZDVyg3N3mZpCWKxch/Cuu+8Cib8Ut98qykyvzCghIdboy/jI6LMHWD0sJy2d9r
 SADq70qqDeiPPdMiwDA/6/FJc8OYkyVOjKs0FKIseZgoHN+lgiG2BesKD/ncF091PeQ4
 ffCQ==
X-Gm-Message-State: AOJu0Yw6nDetwtzxgP/NnhnFJiJwQO4VVGhaRa8B9IEHNnQexMqaJw7U
 57id6UDed1C+QEQqRb9GQ6HkIt8wlHllKcplRgjucdDyQLcBrchVA7HVFQk9bRlpLZiDX4dbFXQ
 =
X-Google-Smtp-Source: AGHT+IGV9Py1qvucdwShLmpkRill7ZM+6U+g604nrmUu9QEAjDhM7zyjCzMTElgpRp32hmQUjdKn0Q==
X-Received: by 2002:a05:6a20:d488:b0:1b5:d10a:1b65 with SMTP id
 adf61e73a8af0-1bae8224fa0mr12214380637.49.1718670992951; 
 Mon, 17 Jun 2024 17:36:32 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:47 -0700
Message-ID: <20240617173426.13.I572fb3cf62fae1e728dd154081101ae264dc3670@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add commands that are like the other "md" commands but that
 allow you to read memory that's in the IO space. Signed-off-by: Douglas
 Anderson
 <dianders@chromium.org> --- kernel/debug/kdb/kdb_main.c | 38
 +++++++++++++++++++++++----
 kernel/debug/kdb/kdb_private.h | 1 + kernel/debug/kdb/kdb_support.c | 48
 ++++++++++++++++++++++++++++++++++ 3 files changed, 82 insertions [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.160.172 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.172 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.172 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.172 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNCj-0005za-PZ
Subject: [Kgdb-bugreport] [PATCH 13/13] kdb: Add mdi,
 mdiW / mdiWcN commands to show iomapped memory
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

Add commands that are like the other "md" commands but that allow you
to read memory that's in the IO space.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c    | 38 +++++++++++++++++++++++----
 kernel/debug/kdb/kdb_private.h |  1 +
 kernel/debug/kdb/kdb_support.c | 48 ++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index be72657741a5..a90d1e1482c2 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1526,7 +1526,7 @@ static int kdb_mdr(int argc, const char **argv)
  */
 static void kdb_md_line(const char *fmtstr, unsigned long addr,
 			bool symbolic, bool nosect, int bytesperword,
-			int num, int repeat, bool phys)
+			int num, int repeat, bool phys, bool do_iomap)
 {
 	/* print just one line of data */
 	kdb_symtab_t symtab;
@@ -1543,7 +1543,10 @@ static void kdb_md_line(const char *fmtstr, unsigned long addr,
 		kdb_printf(kdb_machreg_fmt0 " ", addr);
 
 	for (i = 0; i < num && repeat--; i++) {
-		if (phys) {
+		if (do_iomap) {
+			if (kdb_getioword(&word, addr, bytesperword))
+				break;
+		} else if (phys) {
 			if (kdb_getphysword(&word, addr, bytesperword))
 				break;
 		} else if (kdb_getword(&word, addr, bytesperword))
@@ -1646,6 +1649,7 @@ static int kdb_md(int argc, const char **argv)
 	bool symbolic = false;
 	bool valid = false;
 	bool phys = false;
+	bool do_iomap = false;
 
 	kdbgetintenv("MDCOUNT", &mdcount);
 	kdbgetintenv("RADIX", &radix);
@@ -1655,6 +1659,8 @@ static int kdb_md(int argc, const char **argv)
 		valid = true;
 	else if (kdb_md_parse_arg0("mdp", argv[0], &repeat, &bytesperword))
 		phys = valid = true;
+	else if (kdb_md_parse_arg0("mdi", argv[0], &repeat, &bytesperword))
+		do_iomap = valid = true;
 	else if (strcmp(argv[0], "mds") == 0)
 		valid = true;
 
@@ -1765,7 +1771,11 @@ static int kdb_md(int argc, const char **argv)
 		if (KDB_FLAG(CMD_INTERRUPT))
 			return 0;
 		for (a = addr, z = 0; z < repeat; a += bytesperword, ++z) {
-			if (phys) {
+			if (do_iomap) {
+				if (kdb_getioword(&word, a, bytesperword)
+						|| word)
+					break;
+			} else if (phys) {
 				if (kdb_getphysword(&word, a, bytesperword)
 						|| word)
 					break;
@@ -1774,7 +1784,7 @@ static int kdb_md(int argc, const char **argv)
 		}
 		n = min(num, repeat);
 		kdb_md_line(fmtstr, addr, symbolic, nosect, bytesperword,
-			    num, repeat, phys);
+			    num, repeat, phys, do_iomap);
 		addr += bytesperword * n;
 		repeat -= n;
 		z = (z + num - 1) / num;
@@ -2604,7 +2614,7 @@ static int kdb_per_cpu(int argc, const char **argv)
 		kdb_printf("%5d ", cpu);
 		kdb_md_line(fmtstr, addr,
 			bytesperword == KDB_WORD_SIZE,
-			1, bytesperword, 1, 1, 0);
+			true, bytesperword, 1, 1, false, false);
 	}
 #undef KDB_PCU
 	return 0;
@@ -2717,6 +2727,24 @@ static kdbtab_t maintab[] = {
 		.help = "Display RAM given a PA using word size (W); show N words",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
+	{	.name = "mdi",
+		.func = kdb_md,
+		.usage = "<paddr> <bytes>",
+		.help = "Display IO Memory",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
+	{	.name = "mdiW",
+		.func = kdb_md,
+		.usage = "<paddr> <bytes>",
+		.help = "Display IO Memory using word size (W)",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
+	{	.name = "mdiWcN",
+		.func = kdb_md,
+		.usage = "<paddr> <bytes>",
+		.help = "Display IO Memory using word size (W); show N words",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
 	{	.name = "mdr",
 		.func = kdb_mdr,
 		.usage = "<vaddr> <bytes>",
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 1f685d9f16f9..caece6240140 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -97,6 +97,7 @@ extern int kdb_putarea_size(unsigned long, void *, size_t);
 #define kdb_getarea(x, addr) kdb_getarea_size(&(x), addr, sizeof((x)))
 #define kdb_putarea(addr, x) kdb_putarea_size(addr, &(x), sizeof((x)))
 
+extern int kdb_getioword(unsigned long *word, unsigned long addr, size_t size);
 extern int kdb_getphysword(unsigned long *word,
 			unsigned long addr, size_t size);
 extern int kdb_getword(unsigned long *, unsigned long, size_t);
diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 0a39497140bf..5a4e3a0e96a5 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -19,6 +19,7 @@
 #include <linux/ptrace.h>
 #include <linux/highmem.h>
 #include <linux/hardirq.h>
+#include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/uaccess.h>
 #include <linux/kdb.h>
@@ -331,6 +332,53 @@ static int kdb_getphys(void *res, unsigned long addr, size_t size)
 	return 0;
 }
 
+/*
+ * kdb_getioword
+ * Inputs:
+ *	word	Pointer to the word to receive the result.
+ *	addr	Address of the area to copy.
+ *	size	Size of the area.
+ * Returns:
+ *	0 for success, < 0 for error.
+ */
+int kdb_getioword(unsigned long *word, unsigned long addr, size_t size)
+{
+	void __iomem *mapped = ioremap(addr, size);
+	int diag = 0;
+
+	*word = 0;	/* Default value if addr or size is invalid */
+
+	if (!mapped)
+		return KDB_BADADDR;
+
+	switch (size) {
+	case 1:
+		*word = readb(mapped);
+		break;
+	case 2:
+		*word = readw(mapped);
+		break;
+	case 4:
+		*word = readl(mapped);
+		break;
+	case 8:
+#ifdef CONFIG_64BIT
+		if (size <= sizeof(*word)) {
+			*word = readq(mapped);
+			break;
+		}
+#endif
+		fallthrough;
+	default:
+		kdb_func_printf("bad width %zu\n", size);
+		diag = KDB_BADWIDTH;
+	}
+
+	iounmap(mapped);
+
+	return diag;
+}
+
 /*
  * kdb_getphysword
  * Inputs:
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
