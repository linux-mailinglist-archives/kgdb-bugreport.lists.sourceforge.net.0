Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C17AFCFB84
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Oct 2019 15:44:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHpmv-0007nc-ED
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 13:44:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iHpmu-0007nV-7b
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NMLYLlRd8vaGiF3jciw9wbZQHk5ZOlFvcl94Sy7qkg4=; b=b13Cjd8mtCAgiPwdUSw9nQAgK4
 lOtwv8ECZiNilblOV5c3EKEICsCRqgwcdFk3cyHIcEgz1H60lZiENEolZLjkvN3D+pexsdJZuinSR
 pYlWZk/9Nbj/fCzIf9h8FZ4OIFUvvSijoMIe5imoN9P8ELGrP2yTrMecALxRX9trzsFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NMLYLlRd8vaGiF3jciw9wbZQHk5ZOlFvcl94Sy7qkg4=; b=K0NTC9f4kga4tiEHMWpxhG+Z5R
 hLXosHVyg4487WKfQZBSYt/o1GHRHY7poBaqsAr5iOSMeaGCDaUfWxtg0UdimYjwV11POPtraFWUk
 n695zXwNc9Jq2350TqBYZDwIX9bIPep7c89ZC3KM7qb6m4sEv6zS0wvxazOqvxYKr+9o=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHpmp-002yLf-O6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:44:28 +0000
Received: by mail-wr1-f68.google.com with SMTP id v8so19501448wrt.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NMLYLlRd8vaGiF3jciw9wbZQHk5ZOlFvcl94Sy7qkg4=;
 b=Xri8FTarDkqF/+gVzxi8Z1C8t3l+cY/LBwvDd8AM/lD01TIBPh2Ax8Ye7jrUK5VjUD
 gJC5tdWhaPPdZCcLfRW4CZjYLAnT17YFEKMw87Q7uUF1i+q1YxE4v/dYeiTh+QgIoNYx
 FtHyVPPWVXtJH1xRusubfoHJoCZyPBJtES89DoUpdmyV4NlUqRPmurRCMPfoivfs3UhZ
 GmzFrQZbbXuODOak2XTTxp4GSNJl+ua5nuNUN8sIKKpQvj1XCnArikM/DyMzeVeLej6R
 J37LpQfeb276fZwkABKDadNJslLGV9TQA3JlBV4xAPaiIRfLytvGobHmf9dMgWBbiIyj
 WW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMLYLlRd8vaGiF3jciw9wbZQHk5ZOlFvcl94Sy7qkg4=;
 b=gMZj1SDkUpaSVPThz8WzXn57W714QIRJtbwZuL6AZ7ECcNFiCaeZDZOIC3UDac5i5b
 0vI+NyQA31jnhpf57ed203MmaBhjuEel4UXiFDczKkqPQ2+Dy5yVLyhD8QoC6TmnxhWY
 FReal5nuVL4FgbyuvdkQ5lo8FQmDpCH32xEQszDFvmNcwJ3d/VZAFFWforjLbvtPusuE
 dsaPgK8juY6nXyrkMGFDxzcPrPqdT+VJZj+fhHfcBGAYUkjPraIggLRb6p3LBvoqvWVq
 yq7BET7MxkEXynS2BpUj29eq6p1u6iiK/KNAec0BNV3ZREWwW/pofjsgDrDS1H7bajL1
 PwqQ==
X-Gm-Message-State: APjAAAW6sK8Ic8ReGhezMWlR47b4DO3o2qZmhpm/t7E4167IGLpGNXjJ
 6IIHAQtdxjaj3+HD+JTT1dyye9n5vGHXGA==
X-Google-Smtp-Source: APXvYqwg7jDYE8hDC+1bJHrrQK5xqAb2IY7xmf6UM3OWEdgwCAq2KjDkHpqihKJYblsyf4uaAwuHvw==
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr28074897wrg.13.1570540862771; 
 Tue, 08 Oct 2019 06:21:02 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t8sm18237214wrx.76.2019.10.08.06.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 06:21:01 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Tue,  8 Oct 2019 14:20:41 +0100
Message-Id: <20191008132043.7966-4-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008132043.7966-1-daniel.thompson@linaro.org>
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHpmp-002yLf-O6
Subject: [Kgdb-bugreport] [PATCH v2 3/5] kdb: Remove special case logic from
 kdb_read()
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

kdb_read() contains special case logic to force it exit after reading
a single character. We can remove all the special case logic by directly
calling the function to read a single character instead. This also
allows us to tidy up the function prototype which, because it now matches
getchar(), we can also rename in order to make its role clearer.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 56 ++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 78cb6e339408..a9e73bc9d1c3 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -106,7 +106,19 @@ static int kdb_read_handle_escape(char *buf, size_t sz)
 	return -1;
 }
 
-static int kdb_read_get_key(char *buffer, size_t bufsize)
+/*
+ * kdb_getchar
+ *
+ * Read a single character from kdb console (or consoles).
+ *
+ * An escape key could be the start of a vt100 control sequence such as \e[D
+ * (left arrow) or it could be a character in its own right.  The standard
+ * method for detecting the difference is to wait for 2 seconds to see if there
+ * are any other characters.  kdb is complicated by the lack of a timer service
+ * (interrupts are off), by multiple input sources. Escape sequence processing
+ * has to be done as states in the polling loop.
+ */
+static int kdb_getchar(void)
 {
 #define ESCAPE_UDELAY 1000
 #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
@@ -124,7 +136,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 		}
 
 		key = (*f)();
-
 		if (key == -1) {
 			if (escape_delay) {
 				udelay(ESCAPE_UDELAY);
@@ -134,14 +145,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 			continue;
 		}
 
-		if (bufsize <= 2) {
-			if (key == '\r')
-				key = '\n';
-			*buffer++ = key;
-			*buffer = '\0';
-			return -1;
-		}
-
 		if (escape_delay == 0 && key == '\e') {
 			escape_delay = ESCAPE_DELAY;
 			ped = escape_data;
@@ -183,17 +186,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
  *	function.  It is not reentrant - it relies on the fact
  *	that while kdb is running on only one "master debug" cpu.
  * Remarks:
- *
- * The buffer size must be >= 2.  A buffer size of 2 means that the caller only
- * wants a single key.
- *
- * An escape key could be the start of a vt100 control sequence such as \e[D
- * (left arrow) or it could be a character in its own right.  The standard
- * method for detecting the difference is to wait for 2 seconds to see if there
- * are any other characters.  kdb is complicated by the lack of a timer service
- * (interrupts are off), by multiple input sources and by the need to sometimes
- * return after just one key.  Escape sequence processing has to be done as
- * states in the polling loop.
+ *	The buffer size must be >= 2.
  */
 
 static char *kdb_read(char *buffer, size_t bufsize)
@@ -228,9 +221,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	*cp = '\0';
 	kdb_printf("%s", buffer);
 poll_again:
-	key = kdb_read_get_key(buffer, bufsize);
-	if (key == -1)
-		return buffer;
+	key = kdb_getchar();
 	if (key != 9)
 		tab = 0;
 	switch (key) {
@@ -741,7 +732,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 
 	/* check for having reached the LINES number of printed lines */
 	if (kdb_nextline >= linecount) {
-		char buf1[16] = "";
+		char ch;
 
 		/* Watch out for recursion here.  Any routine that calls
 		 * kdb_printf will come back through here.  And kdb_read
@@ -776,39 +767,38 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 		if (logging)
 			printk("%s", moreprompt);
 
-		kdb_read(buf1, 2); /* '2' indicates to return
-				    * immediately after getting one key. */
+		ch = kdb_getchar();
 		kdb_nextline = 1;	/* Really set output line 1 */
 
 		/* empty and reset the buffer: */
 		kdb_buffer[0] = '\0';
 		next_avail = kdb_buffer;
 		size_avail = sizeof(kdb_buffer);
-		if ((buf1[0] == 'q') || (buf1[0] == 'Q')) {
+		if ((ch == 'q') || (ch == 'Q')) {
 			/* user hit q or Q */
 			KDB_FLAG_SET(CMD_INTERRUPT); /* command interrupted */
 			KDB_STATE_CLEAR(PAGER);
 			/* end of command output; back to normal mode */
 			kdb_grepping_flag = 0;
 			kdb_printf("\n");
-		} else if (buf1[0] == ' ') {
+		} else if (ch == ' ') {
 			kdb_printf("\r");
 			suspend_grep = 1; /* for this recursion */
-		} else if (buf1[0] == '\n') {
+		} else if (ch == '\n' || ch == '\r') {
 			kdb_nextline = linecount - 1;
 			kdb_printf("\r");
 			suspend_grep = 1; /* for this recursion */
-		} else if (buf1[0] == '/' && !kdb_grepping_flag) {
+		} else if (ch == '/' && !kdb_grepping_flag) {
 			kdb_printf("\r");
 			kdb_getstr(kdb_grep_string, KDB_GREP_STRLEN,
 				   kdbgetenv("SEARCHPROMPT") ?: "search> ");
 			*strchrnul(kdb_grep_string, '\n') = '\0';
 			kdb_grepping_flag += KDB_GREPPING_FLAG_SEARCH;
 			suspend_grep = 1; /* for this recursion */
-		} else if (buf1[0] && buf1[0] != '\n') {
+		} else if (ch && ch != '\n') {
 			/* user hit something other than enter */
 			suspend_grep = 1; /* for this recursion */
-			if (buf1[0] != '/')
+			if (ch != '/')
 				kdb_printf(
 				    "\nOnly 'q', 'Q' or '/' are processed at "
 				    "more prompt, input ignored\n");
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
