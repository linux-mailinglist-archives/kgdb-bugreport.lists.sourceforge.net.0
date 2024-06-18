Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE52090C0F3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:07:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNJb-0002A8-5q
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:07:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNJZ-0002A0-KO
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VEWmDPoMo12cykcHwih1ojhthH/uwWR5UXgthNb4I/w=; b=XJiTO0RILcJFUHjrbP4IBgQT0S
 uSlkB10TZKCtL/7N4kcj1/Ky6KHMN9lDWeMjd52rm6Xb3BJ4moem0yd4Td4AzPS5W4BX95ckt2LkH
 xqaDO7LyHgUs580fHAyeAH4vCe7LRwZh8tUP857bogW7l5aKGnJnh5tudD1PMIwK5K/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VEWmDPoMo12cykcHwih1ojhthH/uwWR5UXgthNb4I/w=; b=Fqu/UC49ch0ocRXZpT8A+L7/YW
 IYJWW18Xuu5r7sg4fe2Uu8PYnLg1rwCRlxAj7fSF+w69v2NmG27h67TL0kEuLPsyA9jyLMymjwj/f
 mNIsmb988zfuUlpLGWj2DngENdZ2Bs+wjoKNBZ82OYARoxcmMyQEpH6H6XgKjcTpvLXg=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNJZ-0006Gd-Va for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:07:13 +0000
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dfab4779d95so4920447276.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672822; x=1719277622;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEWmDPoMo12cykcHwih1ojhthH/uwWR5UXgthNb4I/w=;
 b=e4XZw3RpR6fO2+nEQHYecXgVS4Z+PbBzENa+ngb+0+Knu9W/BlvPWyiRqBMhLwJQOm
 Bovv/feqLQqOV21g4//PaOCe5ovt1XN4saSC6jiX8BFKOlib2xkWSahQkBvlzyJ5VwvM
 q05RAhoi7qrkNqBTLGY+Nwl3ZxK4rsh1IXK7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672822; x=1719277622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEWmDPoMo12cykcHwih1ojhthH/uwWR5UXgthNb4I/w=;
 b=eQTbBMxL4710owyiJvKXS+/PQAJiWsd1NR95q4Uw0vCqRo5nOEg7zBP6lNNw2kN1oB
 VYSCs4Rf4yKJq0LSaayWAGT2SN65FdASIEjHuIBYJENC+qtjfyVji6dThD1ZtofzeBC1
 gX60sIxpKPi2iXDYWrat1J8rujK5XegtXZfmfP34cAHeYtKHdXgUs1ssP/CD+yTLED/4
 tTizR4toxHSi00KsFVB+lsWEqSskITkbqe5Wzf60bO8RuipcdTypFE099vzLp/W8AK3a
 xYMleSdBfVqmA8njm3HMzLjDam0tetKMGA6jqSMShYQgXaXLaAAqHT7+tFxyQk2C2vYX
 BYjQ==
X-Gm-Message-State: AOJu0Yy6h9YlD6OV/sZI5ffxYmGsza9psF0v9zjjrwhuFjVbhyKHsp6x
 IUU8JDMnwAGvKV4OjugQexcA4bMmC7gA+DQa3bdVhYVRhUbolewvd/KvQop7fFTiK30q7E5IMK8
 =
X-Google-Smtp-Source: AGHT+IHcS+Hse/fJJg1O9IV26jv3bMpCYWdJyd26Kg1l0YGDItSyEj7040XhsBUs2Hwl7q8TAGgYhg==
X-Received: by 2002:a62:e70c:0:b0:704:3aca:7833 with SMTP id
 d2e1a72fcca58-705d71d26bemr13591059b3a.31.1718670988500; 
 Mon, 17 Jun 2024 17:36:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:45 -0700
Message-ID: <20240617173426.11.I899d035485269f5110a3323fbb1680fbba718e4c@changeid>
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
 Content preview: We'd like to use the "WcN" parsing for some other "md"
 variants.
 Abstract it out. Signed-off-by: Douglas Anderson <dianders@chromium.org>
 --- kernel/debug/kdb/kdb_main.c | 55 +++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.172 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.172 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.219.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNJZ-0006Gd-Va
Subject: [Kgdb-bugreport] [PATCH 11/13] kdb: Abstract out parsing for mdWcN
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

We'd like to use the "WcN" parsing for some other "md"
variants. Abstract it out.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 55 +++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 6dcbf4ea4bcd..1a37c9bb505c 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1591,6 +1591,49 @@ static void kdb_md_line(const char *fmtstr, unsigned long addr,
 
 #define KDB_MD_BYTES_PER_LINE	16
 
+/**
+ * kdb_md_parse_arg0() - Parse argv[0] for "md" command
+ *
+ * @cmd:         The name of the command, like "md"
+ * @arg0:        The value of argv[0].
+ * @repeat:      If argv0 modifies repeat count we'll adjust here.
+ * @bytesperword Ifargv0 modifies bytesperword we'll adjust here.
+ *
+ * Return: true if this was a valid cmd; false otherwise.
+ */
+static bool kdb_md_parse_arg0(const char *cmd, const char *arg0,
+			      int *repeat, int *bytesperword)
+{
+	int cmdlen = strlen(cmd);
+
+	/* arg0 must _start_ with the command string or it's a no-go. */
+	if (strncmp(cmd, arg0, cmdlen) != 0)
+		return false;
+
+	/* If it's just the base command, we're done and it's good. */
+	if (arg0[cmdlen] == '\0')
+		return true;
+
+	/*
+	 * The first byte after the base command must be bytes per word, a
+	 * digit. The actual value of bytesperword will be validated later.
+	 */
+	if (!isdigit(arg0[cmdlen]))
+		return false;
+	*bytesperword = (int)(arg0[cmdlen] - '0');
+	cmdlen++;
+
+	/* After the bytes per word must be end of string or a 'c'. */
+	if (arg0[cmdlen] == '\0')
+		return true;
+	if (arg0[cmdlen] != 'c')
+		return false;
+	cmdlen++;
+
+	/* After the "c" is the repeat. */
+	return kstrtouint(arg0 + cmdlen, 10, repeat) == 0;
+}
+
 static int kdb_md(int argc, const char **argv)
 {
 	static unsigned long last_addr;
@@ -1608,19 +1651,13 @@ static int kdb_md(int argc, const char **argv)
 	kdbgetintenv("RADIX", &radix);
 	kdbgetintenv("BYTESPERWORD", &bytesperword);
 
-	if (isdigit(argv[0][2])) {
-		bytesperword = (int)(argv[0][2] - '0');
-		if (!argv[0][3])
-			valid = true;
-		else if (argv[0][3] == 'c' && argv[0][4])
-			valid = kstrtouint(argv[0] + 4, 10, &repeat) == 0;
-	} else if (strcmp(argv[0], "md") == 0)
+	if (kdb_md_parse_arg0("md", argv[0], &repeat, &bytesperword))
 		valid = true;
 	else if (strcmp(argv[0], "mds") == 0)
 		valid = true;
-	else if (strcmp(argv[0], "mdp") == 0) {
+	else if (strcmp(argv[0], "mdp") == 0)
 		phys = valid = true;
-	}
+
 	if (!valid)
 		return KDB_NOTFOUND;
 
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
