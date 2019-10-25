Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ACEE448E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Oct 2019 09:34:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNu6m-0002LU-1I
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Oct 2019 07:34:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iNu6e-0002Jw-L7
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HkL33ZCV1mwKrZNMBrW/BScRmTTWu1ZVGldNocshZY4=; b=DKXhdcOLGr9u50DIQqbM5mDjmt
 8i4eZ/e66rAiED4lvHhuIDeMV1Vyd4MiiOtPj6YbL5UBv7CgT/0S7me1hV/ABP00Mp0ZuF8cyr5LG
 RjBk/Zu7LpIep4aGaxAg6S54ipPX22pFeRrtTlZcuS0fDN1DT9Gru8s0pupKSUdJFaRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HkL33ZCV1mwKrZNMBrW/BScRmTTWu1ZVGldNocshZY4=; b=kepphGKKleUsfZTZwm2/tfW4H0
 8cYd4Zdul7shrnEVjGuAgUBo0x1YS6Zb9pOImB5KGu+cCpO+1WaJnInvZuIH4TLR9F+aGI8mKrhhF
 GJU2xpoQwo32Q6FuKhzbih2SXDlXmsw73Cix2pKlQwWnIC/7q7tQKPLda9k5fCJUkEAk=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNu6a-00355l-KF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:56 +0000
Received: by mail-wm1-f66.google.com with SMTP id 11so931667wmk.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2019 00:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HkL33ZCV1mwKrZNMBrW/BScRmTTWu1ZVGldNocshZY4=;
 b=wTszrqKWv+gNXBfniMy1FiAztN7YCmh7vDjZqdoxpIOFlLqeGluOHlfbzgddFxUzEY
 B9fRk06+mdvGqQU2oHc2mGxcZQ47gdLNRXb5yhNDDBNviXIjlG/X17F0hpWt2sTnK4Wq
 vzvWARAEOiyKoX+RiSVtyUePPoKtOL2cyS/Zrno0AdPhBwE3kVG+d4vlrr81n6ygvYDV
 EyVioP88omrz607h9AAE5+DqdCMR9ULnYDhoGxqV5GENf+WC9XoZ0DbKzFDQClcqQMdA
 ROpdcqIBcbMd1vsYt+7/lJIO4jDcJCpPjMDDAr3SSlJ9MlK4v48adsMsQKaJ1wfvguNt
 h3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HkL33ZCV1mwKrZNMBrW/BScRmTTWu1ZVGldNocshZY4=;
 b=NdERmhEYib95EfM/JJvOkvknbts8Vl0eeY7bcWNe58IUTXjw+3MjNn8DvVcy8Tf4FM
 EUU/j5dvFF/hz/7JkIXkZ4+Z3/XPOPPVPWiTdNfvGgw5vUo8S2dNcZWABrbHAk71Ch4J
 akpC8XYpEgHUch8oSqIHSA6hNZwOwHq+DpW2ky/Ya1d2sdMGl4nXVWgh1KxUd/HvNGTg
 jbyDfgghReBfxjlCd3TNI0uOuC7fonnTiEFdDynoKQlyiEkWcVj0NdUzw9+Kob83tShZ
 mjw8IFfTzIS5dee4A665lINOAlkxF3aGacmU7yrS0WrFNvWXQU9u+v4GOaa0poSRfts9
 gSLA==
X-Gm-Message-State: APjAAAXDJYfZN0YH1EuVWD0ZwaAmFJn4hx3w1/h37lN+u496Lg096HRd
 xe/gS12+dh51Yq73UcDPVweTkw==
X-Google-Smtp-Source: APXvYqzQxgiLXS8gY18v0RCvqJDLb12Q1/CRObgkbL362pcH8m+Npf1+Al+yGV7+h05MQImtvA/Vfg==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr2005976wma.57.1571988825822; 
 Fri, 25 Oct 2019 00:33:45 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm1586602wmh.40.2019.10.25.00.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:33:45 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 25 Oct 2019 08:33:26 +0100
Message-Id: <20191025073328.643-4-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025073328.643-1-daniel.thompson@linaro.org>
References: <20191025073328.643-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNu6a-00355l-KF
Subject: [Kgdb-bugreport] [PATCH v4 3/5] kdb: Remove special case logic from
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

This does involve some extra code to handle btaprompt properly but we
don't mind the new lines of code here because the old code had some
interesting problems (bad newline handling, treating unexpected
characters like <cr>).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_bt.c      | 22 +++++++-----
 kernel/debug/kdb/kdb_io.c      | 61 +++++++++++++++-------------------
 kernel/debug/kdb/kdb_private.h |  1 +
 3 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 7e2379aa0a1e..900187bd666a 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -81,9 +81,10 @@ static int
 kdb_bt1(struct task_struct *p, unsigned long mask,
 	int argcount, int btaprompt)
 {
-	char buffer[2];
-	if (kdb_getarea(buffer[0], (unsigned long)p) ||
-	    kdb_getarea(buffer[0], (unsigned long)(p+1)-1))
+	char ch;
+
+	if (kdb_getarea(ch, (unsigned long)p) ||
+	    kdb_getarea(ch, (unsigned long)(p+1)-1))
 		return KDB_BADADDR;
 	if (!kdb_task_state(p, mask))
 		return 0;
@@ -91,12 +92,17 @@ kdb_bt1(struct task_struct *p, unsigned long mask,
 	kdb_ps1(p);
 	kdb_show_stack(p, NULL);
 	if (btaprompt) {
-		kdb_getstr(buffer, sizeof(buffer),
-			   "Enter <q> to end, <cr> to continue:");
-		if (buffer[0] == 'q') {
-			kdb_printf("\n");
+		kdb_printf("Enter <q> to end, <cr> or <space> to continue:");
+		do {
+			ch = kdb_getchar();
+		} while (!strchr("\r\n q", ch));
+		kdb_printf("\n");
+
+		/* reset the pager */
+		kdb_nextline = 1;
+
+		if (ch == 'q')
 			return 1;
-		}
 	}
 	touch_nmi_watchdog();
 	return 0;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index a92ceca29637..9b6933d585b5 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -108,7 +108,22 @@ static int kdb_handle_escape(char *buf, size_t sz)
 	return -1;
 }
 
-static int kdb_read_get_key(char *buffer, size_t bufsize)
+/**
+ * kdb_getchar() - Read a single character from a kdb console (or consoles).
+ *
+ * Other than polling the various consoles that are currently enabled,
+ * most of the work done in this function is dealing with escape sequences.
+ *
+ * An escape key could be the start of a vt100 control sequence such as \e[D
+ * (left arrow) or it could be a character in its own right.  The standard
+ * method for detecting the difference is to wait for 2 seconds to see if there
+ * are any other characters.  kdb is complicated by the lack of a timer service
+ * (interrupts are off), by multiple input sources. Escape sequence processing
+ * has to be done as states in the polling loop.
+ *
+ * Return: The key pressed or a control code derived from an escape sequence.
+ */
+char kdb_getchar(void)
 {
 #define ESCAPE_UDELAY 1000
 #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
@@ -126,7 +141,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 		}
 
 		key = (*f)();
-
 		if (key == -1) {
 			if (escape_delay) {
 				udelay(ESCAPE_UDELAY);
@@ -136,14 +150,6 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
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
@@ -184,17 +190,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
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
@@ -229,9 +225,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
@@ -742,7 +736,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 
 	/* check for having reached the LINES number of printed lines */
 	if (kdb_nextline >= linecount) {
-		char buf1[16] = "";
+		char ch;
 
 		/* Watch out for recursion here.  Any routine that calls
 		 * kdb_printf will come back through here.  And kdb_read
@@ -777,39 +771,38 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
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
-			/* user hit something other than enter */
+		} else if (ch) {
+			/* user hit something unexpected */
 			suspend_grep = 1; /* for this recursion */
-			if (buf1[0] != '/')
+			if (ch != '/')
 				kdb_printf(
 				    "\nOnly 'q', 'Q' or '/' are processed at "
 				    "more prompt, input ignored\n");
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 2118d8258b7c..55d052061ef9 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -210,6 +210,7 @@ extern void kdb_ps1(const struct task_struct *p);
 extern void kdb_print_nameval(const char *name, unsigned long val);
 extern void kdb_send_sig(struct task_struct *p, int sig);
 extern void kdb_meminfo_proc_show(void);
+extern char kdb_getchar(void);
 extern char *kdb_getstr(char *, size_t, const char *);
 extern void kdb_gdb_state_pass(char *buf);
 
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
