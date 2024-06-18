Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B767690C0EA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:05:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNHU-00026p-4x
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:05:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNHS-00025x-ES
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9UVS8jw65Qz1/+IKa1gxs23pkU4dvWn+yfPVR/mXAo=; b=Q/Jats98zlHwgrojqLlExG07vH
 OdZWZTK4H9xKs7BDD2kU3tdXbxrYgp6S80zyDonVdCovdt6B4Fz5QDR9tM0nxhWciQ+2y+xdViPil
 GNdUKCXdMsWxd4e+HKahNNAgxsVduiTeAxhneuZhPz77QXlFc/roA4pxCgbtN9Hszb1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y9UVS8jw65Qz1/+IKa1gxs23pkU4dvWn+yfPVR/mXAo=; b=Pna0Lfewk3Gtn81AFYM9GVYtyr
 +xWmshEoWxKIwkyJeZ/O8DhQvFjz3xdMAcUyq3O4QFA0hYoO9ejjEa6W/9hhD4ppdYw5uSlKl1SXc
 0XZ2GaO1hfHYrOttB2LWe+sUFckRpy7O3/oF1tOID2+He7L+Zu+x+8sczwexkiolGUbI=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNHQ-00069M-7G for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:00 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70109d34a16so4335806b3a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672689; x=1719277489;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9UVS8jw65Qz1/+IKa1gxs23pkU4dvWn+yfPVR/mXAo=;
 b=AjFrvHMfiA2gfqAegBpDjjPeREpoR14oN6in1s9zoOeqamUfZWYtT+P9KyfqsAxEdo
 cQkZB8Axl3qTPAfjxn1lz5MjRHhbkw3wa7lUxNM2S04F6SsMsaEsukYtDVC9oTFr+tsE
 xoKrCJIS2HrGRIjNLxmRi5Yb5JND6TKxvacOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672689; x=1719277489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9UVS8jw65Qz1/+IKa1gxs23pkU4dvWn+yfPVR/mXAo=;
 b=pdNs44deHvUXOOlnr3irtejlJYspOvOp+zWqNOxopbx+JYMl5J+LWus28vknM9dV4N
 qwnaWb6kB90VItB/4WjRy3sSmKcXeu7kZ5hMIRDSSPSCp0GEcOeiPpEI9DVAfTuCYh/9
 d9lERJv1ZkpEpRDUOrfSo+ljdCYOulhvMQeQQVj2Vr1DORhOZoOO/d0yIeHejy/0MOoG
 w6NVX6TsHAXGn9iMe3oXHjQum1KHH+5pXBwm9Y1zBLHJrmNBYfDKRBu3zPlBO4jaaNpV
 PgrvNXcUyHfaaG0nOvBM5Yyw7ZlpQAEIvUUygmJ01bFLS5wUrrtDLIoLPtsFd1KD+6Jv
 ag6g==
X-Gm-Message-State: AOJu0YwNLC2LPMVavDUzEW8NuCKCJp6e/aeuqA+xGMFHL/MkKjbJE4Em
 8KVGMF8pkpanRMscp+SdoKj1PK+ZEQuP/hE21Iiloj3cExIvsfC2qurVCJsomULPicRzfjdEKdc
 =
X-Google-Smtp-Source: AGHT+IFNSXKhTjNPopEgrBnDWo98qLA1DR2sonPJKag3KcUKtT0bl/mkZiZsBPqQEuWwT7WklHnpPA==
X-Received: by 2002:a05:6a20:3d84:b0:1b6:e885:1bb4 with SMTP id
 adf61e73a8af0-1bae7f30cd4mr12933946637.37.1718670976149; 
 Mon, 17 Jun 2024 17:36:16 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:39 -0700
Message-ID: <20240617173426.5.I2d17f61d496641d28c778be587b36d138a211e50@changeid>
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
 Content preview: Though the "mdr" has a similar purpose to the other "md"
 commands
 in that they all display memory, the actual code to implement it has almost
 nothing in common with the rest of the commands. Separate [...] 
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
 for more information. [209.85.210.176 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.176 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.176 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNHQ-00069M-7G
Subject: [Kgdb-bugreport] [PATCH 05/13] kdb: Separate out "mdr" handling
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

Though the "mdr" has a similar purpose to the other "md" commands in
that they all display memory, the actual code to implement it has
almost nothing in common with the rest of the commands. Separate
things out.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 65 ++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 74db5c0cc5ad..c013b014a7d3 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1480,23 +1480,42 @@ int kdb_main_loop(kdb_reason_t reason, kdb_reason_t reason2, int error,
 /*
  * kdb_mdr - This function implements the guts of the 'mdr', memory
  * read command.
- *	mdr  <addr arg>,<byte count>
- * Inputs:
- *	addr	Start address
- *	count	Number of bytes
- * Returns:
- *	Always 0.  Any errors are detected and printed by kdb_getarea.
+ *	mdr  <addr arg> <byte count>
  */
-static int kdb_mdr(unsigned long addr, unsigned int count)
+static int kdb_mdr(int argc, const char **argv)
 {
+	static unsigned long addr;
+	static unsigned long count;
 	unsigned char c;
-	while (count--) {
+	unsigned long i;
+	int diag;
+
+	/*
+	 * Parse args. The only valid options are argc == 2 (both address and
+	 * byte_count provided) and argc == 0 ("repeat" AKA continue previous
+	 * display).
+	 */
+	if (argc == 2) {
+		int nextarg = 1;
+
+		diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
+		if (diag)
+			return diag;
+		diag = kdbgetularg(argv[nextarg], &count);
+		if (diag)
+			return diag;
+	} else if (argc != 0) {
+		return KDB_ARGCOUNT;
+	}
+
+	for (i = 0; i < count; i++) {
 		if (kdb_getarea(c, addr))
 			return 0;
 		kdb_printf("%02x", c);
 		addr++;
 	}
 	kdb_printf("\n");
+
 	return 0;
 }
 
@@ -1582,7 +1601,6 @@ static int kdb_md(int argc, const char **argv)
 	bool symbolic = false;
 	bool valid = false;
 	bool phys = false;
-	bool raw = false;
 
 	kdbgetintenv("MDCOUNT", &mdcount);
 	kdbgetintenv("RADIX", &radix);
@@ -1591,12 +1609,7 @@ static int kdb_md(int argc, const char **argv)
 	/* Assume 'md <addr>' and start with environment values */
 	repeat = mdcount * 16 / bytesperword;
 
-	if (strcmp(argv[0], "mdr") == 0) {
-		if (argc == 2 || (argc == 0 && last_addr != 0))
-			valid = raw = true;
-		else
-			return KDB_ARGCOUNT;
-	} else if (isdigit(argv[0][2])) {
+	if (isdigit(argv[0][2])) {
 		bytesperword = (int)(argv[0][2] - '0');
 		if (bytesperword == 0) {
 			bytesperword = last_bytesperword;
@@ -1631,10 +1644,7 @@ static int kdb_md(int argc, const char **argv)
 		radix = last_radix;
 		bytesperword = last_bytesperword;
 		repeat = last_repeat;
-		if (raw)
-			mdcount = repeat;
-		else
-			mdcount = ((repeat * bytesperword) + 15) / 16;
+		mdcount = ((repeat * bytesperword) + 15) / 16;
 	}
 
 	if (argc) {
@@ -1650,10 +1660,7 @@ static int kdb_md(int argc, const char **argv)
 			diag = kdbgetularg(argv[nextarg], &val);
 			if (!diag) {
 				mdcount = (int) val;
-				if (raw)
-					repeat = mdcount;
-				else
-					repeat = mdcount * 16 / bytesperword;
+				repeat = mdcount * 16 / bytesperword;
 			}
 		}
 		if (argc >= nextarg+1) {
@@ -1663,16 +1670,6 @@ static int kdb_md(int argc, const char **argv)
 		}
 	}
 
-	if (strcmp(argv[0], "mdr") == 0) {
-		int ret;
-		last_addr = addr;
-		ret = kdb_mdr(addr, mdcount);
-		last_addr += mdcount;
-		last_repeat = mdcount;
-		last_bytesperword = bytesperword; // to make REPEAT happy
-		return ret;
-	}
-
 	switch (radix) {
 	case 10:
 		fmtchar = 'd';
@@ -2680,7 +2677,7 @@ static kdbtab_t maintab[] = {
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
 	{	.name = "mdr",
-		.func = kdb_md,
+		.func = kdb_mdr,
 		.usage = "<vaddr> <bytes>",
 		.help = "Display RAM as a stream of raw bytes",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
