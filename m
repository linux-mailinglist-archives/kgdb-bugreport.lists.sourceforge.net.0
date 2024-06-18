Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD290C0D1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 02:58:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNAt-0000S5-Di
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 00:58:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNAs-0000Rr-4z
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sujWDpCzra7eIXbOVVbr0PMepNxb1U/8UIoM+bv67a4=; b=biA1Z0wOgAo5kBxUv8S/mkn6rO
 EPjhHxf6HByX8yeGgi2boo6C2lhFV1Ceg+crzlx7eyU7cYYsddHGijZPWIhiigS5dgxDxDxl+/xpJ
 WBG9aEtyHH8jkKUgKBgyXHu8agykbbTYJdnaK5vaSydSGJMNX+3mXPvYQRC1yX8568sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sujWDpCzra7eIXbOVVbr0PMepNxb1U/8UIoM+bv67a4=; b=gFQYLdHsy6d6Mr/3mMl/E0Ll2z
 D69p3JoryoniG2xfzloAbELu7EhpqEYekotDoJYinWj9sIqFOxopSfXB3kKrwX4WHfzCnmry4XZoN
 y81PjTpCTqLdYJA/Ei9YRMuNXaONK0BRQGcYCaqc7k2sh0TtHnj1GSthj7JUebCs7CoU=;
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNAs-0005sp-9J for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:58:14 +0000
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-80ba5416266so1279673241.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 17:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672287; x=1719277087;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sujWDpCzra7eIXbOVVbr0PMepNxb1U/8UIoM+bv67a4=;
 b=Si41WCNu96nTAHmwgz4DbZ2/9kyXpmE8QLHbM9ps6avDXDyUG0OQY5mW4ij5094t/h
 5pQ5d24OGxxIkQyT2KoMzF8+us5vikKxG5pdgV7rVm8fWsmnht2rNqYNhBDHHC9ySN5P
 eyNVsDjPITU3xIL1M44q6Y4dG1ddKfd8ZtU4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672287; x=1719277087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sujWDpCzra7eIXbOVVbr0PMepNxb1U/8UIoM+bv67a4=;
 b=a235TH96UGCxL5T0QONCYmNVpq6qS9p/653HhwfyTU8YfHJrtKFl+IPsE/v8IGjPIV
 Ton3EIxhBp3XrPVS3/8B81Onl1xS7yuXdzxGH+dSESszgfNluGDYMQstAjGlXVNwYRK6
 60kwT8WFmtJ9G3l0rECoJcdbieCK+YMU36Z00xu06JOjIsRr8YIkudNu7jrxMRy2KQbX
 nRvKiRow481mj8ovRvnO786cbH8HG42D7sfJt+vyB0UgA2XmWq0AfxTrZsQtYGTD2/65
 /fvmm7hsdQn+YrikTdPT20YXKj7+rT7uWKe+L0XoXZDq/6egaHHhjqqTCW5sgLcpziwz
 7/FA==
X-Gm-Message-State: AOJu0YzFnxtnotDyp2kPG/O2LZW1+rDMXUdDKRv5zu3iAwKEfYsyXHEO
 ilNVi4rzOsok253e9y+YnnfNQlNmxibg2ANkqVVT3LkkuxaHnlfgxF0nHRcGUk8CZQMim/xDD0w
 =
X-Google-Smtp-Source: AGHT+IEpLA4qgnpA8ZWxX9YCGcU2lRZ/Y4MNvcbNAa0jXwRiQQf5WO3er5XcyvNMnCp+sB+SFmxdkg==
X-Received: by 2002:a62:b50c:0:b0:705:94ac:4ab7 with SMTP id
 d2e1a72fcca58-705d71bd511mr12541879b3a.23.1718670982803; 
 Mon, 17 Jun 2024 17:36:22 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:42 -0700
Message-ID: <20240617173426.8.I542e6a7facc29bb6c13e1c39e002b92b643d6d42@changeid>
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
 Content preview:  In kdb_md(), the `mdcount` variable is the number of lines
 that the "md" command will output. In kdb_md(), the `repeat` variable is
 the number of "words" that the "md" command will output. The relationship
 between these two variables and how they are specified is a bit convoluted.
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.44 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.44 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.44 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.44 listed in wl.mailspike.net]
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
X-Headers-End: 1sJNAs-0005sp-9J
Subject: [Kgdb-bugreport] [PATCH 08/13] kdb: In kdb_md() make `repeat` and
 `mdcount` calculations more obvious
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

In kdb_md(), the `mdcount` variable is the number of lines that the
"md" command will output.

In kdb_md(), the `repeat` variable is the number of "words" that the
"md" command will output.

The relationship between these two variables and how they are
specified is a bit convoluted.

You can adjust `mdcount` via the MDCOUNT environment variable. You can
then override the MDCOUNT environment variable by passing a number of
<lines> as an argument to the command.

You can adjust `repeat` using the `mdWcN` variant of the command where
"N" is the number of words to output.

The rules for how these get applied right now:
* By default, we'll the MDCOUNT environment variable.
* If `mdWcN` is used, the repeat will override.
* If <lines> is specified, the mdcount will override.
* When we're "repeating" a previous command (AKA argc is 0) then we'll
  load in the last_repeat.

If you've specified `repeat` then the `mdcount` can be calculated as:
  mdcount = DIV_ROUND_UP(repeat * bytes_per_word, bytes_per_line)

In other words, if you want to display 9 words, each word is 2 bytes,
and you want 16 bytes per line then you'll take up 2 lines. This would
look like:
  [1]kdb> md2c9 0xffffff80e000c340
  0xffffff80e000c340 0204 0000 0000 0000 e000 8235 0000 0000
  0xffffff80e000c350 0003

If you've specified `mdcount` then `repeat` is simply:
  repeat = mdcount * bytes_per_line / bytes_per_word

Let's make all this logic more obvious by initializing `repeat` to 0
and then setting it to non-zero when it should override. Then we can
do all the math at once.

While changing this, use the proper DIV_ROUND_UP() macro and introcue
a constant for KDB_MD_BYTES_PER_LINE. We'll also make and "if else"
more obvious so we know things always get initialized.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 3c6fffa8509a..fcd5292351a7 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1589,11 +1589,13 @@ static void kdb_md_line(const char *fmtstr, unsigned long addr,
 		   " ", cbuf);
 }
 
+#define KDB_MD_BYTES_PER_LINE	16
+
 static int kdb_md(int argc, const char **argv)
 {
 	static unsigned long last_addr;
 	static int last_radix, last_bytesperword, last_repeat;
-	int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat;
+	int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat = 0;
 	char fmtchar, fmtstr[64];
 	unsigned long addr;
 	unsigned long word;
@@ -1606,18 +1608,13 @@ static int kdb_md(int argc, const char **argv)
 	kdbgetintenv("RADIX", &radix);
 	kdbgetintenv("BYTESPERWORD", &bytesperword);
 
-	/* Assume 'md <addr>' and start with environment values */
-	repeat = mdcount * 16 / bytesperword;
-
 	if (isdigit(argv[0][2])) {
 		bytesperword = (int)(argv[0][2] - '0');
-		repeat = mdcount * 16 / bytesperword;
 		if (!argv[0][3])
 			valid = true;
 		else if (argv[0][3] == 'c' && argv[0][4]) {
 			char *p;
 			repeat = simple_strtoul(argv[0] + 4, &p, 10);
-			mdcount = ((repeat * bytesperword) + 15) / 16;
 			valid = !*p;
 		}
 	} else if (strcmp(argv[0], "md") == 0)
@@ -1637,10 +1634,7 @@ static int kdb_md(int argc, const char **argv)
 		radix = last_radix;
 		bytesperword = last_bytesperword;
 		repeat = last_repeat;
-		mdcount = ((repeat * bytesperword) + 15) / 16;
-	}
-
-	if (argc) {
+	} else {
 		unsigned long val;
 		int diag, nextarg = 1;
 		diag = kdbgetaddrarg(argc, argv, &nextarg, &addr);
@@ -1652,8 +1646,9 @@ static int kdb_md(int argc, const char **argv)
 		if (argc >= nextarg) {
 			diag = kdbgetularg(argv[nextarg], &val);
 			if (!diag) {
-				mdcount = (int) val;
-				repeat = mdcount * 16 / bytesperword;
+				mdcount = val;
+				/* Specifying <lines> overrides repeat count. */
+				repeat = 0;
 			}
 		}
 		if (argc >= nextarg+1) {
@@ -1699,6 +1694,13 @@ static int kdb_md(int argc, const char **argv)
 		return KDB_BADWIDTH;
 	}
 
+	/* If repeat is non-zero then it overrides */
+	if (repeat)
+		mdcount = DIV_ROUND_UP(repeat * bytesperword, KDB_MD_BYTES_PER_LINE);
+	else
+		repeat = mdcount * 16 / bytesperword;
+
+	/* Always just save `repeat` since `mdcount` can be calculated from it */
 	last_repeat = repeat;
 	last_bytesperword = bytesperword;
 
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
