Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1B30F03F
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Feb 2021 11:14:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7bf5-00041V-Uc
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Feb 2021 10:14:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l7bf5-00041J-6h
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 10:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihO1Bw9PZGVXNi4lRJ7ISn0OCRqLi6mJnCqOoIVfBhY=; b=ksPal0rrJuTMr5WF7rKvBEK+JK
 C4VpkHHbWGO4udHlAg6J8uhmZr0SVIegBi+Gs6U9DJ6lZS1FPbIU7LXECya0M3Ugel2iNN189lRxz
 Yh1feC/aY4VcaBbwUQ7TZv5zkg8qkJM3YIc6DHkHs53LUCzsvR6XulcmCH6ri/O3sQMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ihO1Bw9PZGVXNi4lRJ7ISn0OCRqLi6mJnCqOoIVfBhY=; b=XMoP7VdM9wmdOMx+7ls2Dhb4ii
 a2DEkEVbsD8/TX5YwxkjzOLA1d73nyKUj5iZuv8n3UZUZ/4/FCGqAx+I7EUPcNGL8eLgj1gbsAUSp
 YJPK9vqMqUCjwwPzFm8PC/7uExzhW8L+Eg06cImh5bz7jU1IbJXURVhqWFlHKRaIQRck=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l7bey-004XgU-Rm
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 10:14:55 +0000
Received: by mail-pf1-f178.google.com with SMTP id m6so1838016pfk.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ihO1Bw9PZGVXNi4lRJ7ISn0OCRqLi6mJnCqOoIVfBhY=;
 b=VA2luoRv4U/JwrdENGJD9ug/MP4yLZV8jDFJAh0T2PmjYRlgBEkJR+Jj0l/XqOh9lO
 FZWBjiGnj/tPjL2oL/6P+uM5w5djRVMwJoP1hnMbZP+x2ClE5h/YMPQ45+buvnDnsNG0
 wN12wjFVzhQ3fmbfKvaj0NfnGIICyYbhbpBRtR2zS3bcC0OlAny+F5PxJ6NM0KaIi4l1
 MY55bcDYbq/JSoTV9aAm6S79n/mTZf5WjbXnChF26nZJoulE03VfhOZCruHEzrsW0WJU
 B7CP+4fZrLrQ3YornOgHX8a/iWdju7LULoKzLT/F9by4sNfhKLxiHbVFKvz/q9znfCax
 3r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ihO1Bw9PZGVXNi4lRJ7ISn0OCRqLi6mJnCqOoIVfBhY=;
 b=Y/it9rTR5lYX+cTGB+F5ehBr3ZKzJ9maU1DpLDH1VLGe6o4WLShyQs7hs1yiMkDpOb
 kugm9rZcciM1C9fEoTCnr4HKNX9w1YNH/aJjRhSP14qJEpjkO3oI6T1/SfngVKbU8wSZ
 n5LI6AXHeMe0R4JkoxV9aoJw5Rfqhl16TqmXIfcsLPUY2xzY6BjaBQkC62ow4gcrjGwM
 DrKHEUi/lrOrBFnzEhvVdesXf3K9ZxFOvXRL3QNUgrE9BX8ts6COGu+uD8Z+Dnvi+607
 7+tqwtCK4SZNy4yFLNFNcwBl8FBIorP98uQIDGYm2d5o0dDHtFjMjCm1zyMIkWEpWF44
 +zgA==
X-Gm-Message-State: AOAM532nauIMYTydyxNBcR5dqHgfuhWEDVtjwaWCdSaZAtaQsdmdyAsR
 t29bgtfU8Hx/3bw1RzjIZ5Fdmw6GoMHhYA==
X-Google-Smtp-Source: ABdhPJzr4IVo1KRB0oUmKA8V+67C9Q6qvDs6ikyR9FHb4z/hb2cmdHr7cjgzRjXMyI0gcLTuHoiOYA==
X-Received: by 2002:a63:e50:: with SMTP id 16mr8213310pgo.74.1612433682594;
 Thu, 04 Feb 2021 02:14:42 -0800 (PST)
Received: from localhost.localdomain ([110.226.34.123])
 by smtp.gmail.com with ESMTPSA id g5sm5363771pfm.115.2021.02.04.02.14.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 02:14:41 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Thu,  4 Feb 2021 15:44:20 +0530
Message-Id: <1612433660-32661-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l7bey-004XgU-Rm
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Refactor env variables get/set code
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
Cc: linux-kernel@vger.kernel.org, daniel.thompson@linaro.org,
 jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Add two new kdb environment access methods as kdb_setenv() and
kdb_printenv() in order to abstract out environment access code
from kdb command functions.

Also, replace (char *)0 with NULL as an initializer for environment
variables array.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Get rid of code motion to separate kdb_env.c file.
- Replace (char *)0 with NULL.
- Use kernel-doc style function comments.
- s/kdb_prienv/kdb_printenv/

 kernel/debug/kdb/kdb_main.c | 166 +++++++++++++++++++++++++-------------------
 1 file changed, 93 insertions(+), 73 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 588062a..b257d35 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -142,40 +142,40 @@ static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
 
 static char *__env[] = {
 #if defined(CONFIG_SMP)
- "PROMPT=[%d]kdb> ",
+	"PROMPT=[%d]kdb> ",
 #else
- "PROMPT=kdb> ",
+	"PROMPT=kdb> ",
 #endif
- "MOREPROMPT=more> ",
- "RADIX=16",
- "MDCOUNT=8",			/* lines of md output */
- KDB_PLATFORM_ENV,
- "DTABCOUNT=30",
- "NOSECT=1",
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
- (char *)0,
+	"MOREPROMPT=more> ",
+	"RADIX=16",
+	"MDCOUNT=8",		/* lines of md output */
+	KDB_PLATFORM_ENV,
+	"DTABCOUNT=30",
+	"NOSECT=1",
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
 };
 
 static const int __nenv = ARRAY_SIZE(__env);
@@ -318,6 +318,65 @@ int kdbgetintenv(const char *match, int *value)
 }
 
 /*
+ * kdb_setenv() - Alter an existing environment variable or create a new one.
+ * @var: Name of the variable
+ * @val: Value of the variable
+ *
+ * Return: Zero on success, a kdb diagnostic on failure.
+ */
+static int kdb_setenv(const char *var, const char *val)
+{
+	int i;
+	char *ep;
+	size_t varlen, vallen;
+
+	varlen = strlen(var);
+	vallen = strlen(val);
+	ep = kdballocenv(varlen + vallen + 2);
+	if (ep == (char *)0)
+		return KDB_ENVBUFFULL;
+
+	sprintf(ep, "%s=%s", var, val);
+
+	ep[varlen+vallen+1] = '\0';
+
+	for (i = 0; i < __nenv; i++) {
+		if (__env[i]
+		 && ((strncmp(__env[i], var, varlen) == 0)
+		   && ((__env[i][varlen] == '\0')
+		    || (__env[i][varlen] == '=')))) {
+			__env[i] = ep;
+			return 0;
+		}
+	}
+
+	/*
+	 * Wasn't existing variable.  Fit into slot.
+	 */
+	for (i = 0; i < __nenv-1; i++) {
+		if (__env[i] == (char *)0) {
+			__env[i] = ep;
+			return 0;
+		}
+	}
+
+	return KDB_ENVFULL;
+}
+
+/*
+ * kdb_printenv() - Display the current environment variables.
+ */
+static void kdb_printenv(void)
+{
+	int i;
+
+	for (i = 0; i < __nenv; i++) {
+		if (__env[i])
+			kdb_printf("%s\n", __env[i]);
+	}
+}
+
+/*
  * kdbgetularg - This function will convert a numeric string into an
  *	unsigned long value.
  * Parameters:
@@ -374,10 +433,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
  */
 int kdb_set(int argc, const char **argv)
 {
-	int i;
-	char *ep;
-	size_t varlen, vallen;
-
 	/*
 	 * we can be invoked two ways:
 	 *   set var=value    argv[1]="var", argv[2]="value"
@@ -422,37 +477,7 @@ int kdb_set(int argc, const char **argv)
 	 * Tokenizer squashed the '=' sign.  argv[1] is variable
 	 * name, argv[2] = value.
 	 */
-	varlen = strlen(argv[1]);
-	vallen = strlen(argv[2]);
-	ep = kdballocenv(varlen + vallen + 2);
-	if (ep == (char *)0)
-		return KDB_ENVBUFFULL;
-
-	sprintf(ep, "%s=%s", argv[1], argv[2]);
-
-	ep[varlen+vallen+1] = '\0';
-
-	for (i = 0; i < __nenv; i++) {
-		if (__env[i]
-		 && ((strncmp(__env[i], argv[1], varlen) == 0)
-		   && ((__env[i][varlen] == '\0')
-		    || (__env[i][varlen] == '=')))) {
-			__env[i] = ep;
-			return 0;
-		}
-	}
-
-	/*
-	 * Wasn't existing variable.  Fit into slot.
-	 */
-	for (i = 0; i < __nenv-1; i++) {
-		if (__env[i] == (char *)0) {
-			__env[i] = ep;
-			return 0;
-		}
-	}
-
-	return KDB_ENVFULL;
+	return kdb_setenv(argv[1], argv[2]);
 }
 
 static int kdb_check_regs(void)
@@ -2055,12 +2080,7 @@ static int kdb_lsmod(int argc, const char **argv)
 
 static int kdb_env(int argc, const char **argv)
 {
-	int i;
-
-	for (i = 0; i < __nenv; i++) {
-		if (__env[i])
-			kdb_printf("%s\n", __env[i]);
-	}
+	kdb_printenv();
 
 	if (KDB_DEBUG(MASK))
 		kdb_printf("KDBDEBUG=0x%x\n",
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
