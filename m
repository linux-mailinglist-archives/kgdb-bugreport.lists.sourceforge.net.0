Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCE30264C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 15:30:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l42sp-0005jl-Ap
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 14:30:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l42so-0005jV-AH
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 14:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VIvgNr/3TDS9cbGmfKokKtxrzrky6ZigL9VXf0hpQY=; b=Wd7fObFxe+Cn/pt6jkQrKxqng3
 SJPqG97datGPGbw3FTUu48ZUy9UBkjgiEz374bLSTn3mOPpoMo+COJ6KUE16z11qxl+1rN9JWIsoe
 n+FPSsnBDlYxqPYH6mLYdyyUGQEo8g12+9e85xBJJp1m57Fsc8UcZw/UvAILzN0Xb03c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VIvgNr/3TDS9cbGmfKokKtxrzrky6ZigL9VXf0hpQY=; b=UZxi5ffBEKUqLYTKebOu1dhF6O
 99WFw7ItV6nX+XEELGPspYLpfGJh5XA+orpxcKM/7xujVa98KtiowaRk0AOUxyA+DZsLU3I5wpSFg
 HJv0n51YfXlx+UXqM6UesMR987C2LFbDJz+VjB4QWlSigRAjV5H4pYh//OlrqzoBXJhI=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l42sb-006pp9-CM
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 14:30:22 +0000
Received: by mail-pf1-f180.google.com with SMTP id u67so8489769pfb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 06:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=7VIvgNr/3TDS9cbGmfKokKtxrzrky6ZigL9VXf0hpQY=;
 b=LLOcwfpk8SsMD+jGwTVXcUZFzvSII3SnZ7JuIaWf5GFDo8wE3+HMDQP7kX0U3DlNqP
 /FSPgsgsaOTZ6tCJvrVN91bBJ4U7nPn3xlO5ND6kY6wfKrL+8GNYwbGVE0KDHRqcMj6R
 Utr4Urj99Q0WVzwFaYUG/V7nPC3fpetOuymxDUll07zJbOvG3TxSIkv45JDvP9kQVOuu
 uH2Q4tzUbf27iVAM+QDXARPl64UMV5DYDMbp+KhiRo5FB19wFLfqfkeCSn+Auru2yghZ
 VDEnNNdeyuQugdlTO0L1Wttx00aXa2ofNc/Ifbqrh4ot8qleUEtT59KLM9MXD0Or3fTG
 QYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7VIvgNr/3TDS9cbGmfKokKtxrzrky6ZigL9VXf0hpQY=;
 b=Qd5fH8e/AbTMaADB56b6SGZCjkLXncbB0g+B3/+2OqnLKr6cor760f0XPRBzhsh6+R
 sOiN+5TsoAUs6rruUk8XqPw6Jv0DMRfnkezEjHNrnq0wDrTxiVbejKNdDxz1Z0iP0pJ5
 pTA4BDzCwR4sj2kA5SlpWT1SBE2FJp/GNxITl2zYTVN2e6tsk02CpWCdlvQPH8GAhRSU
 mkFCyeikPWPIi4HbQ8hYSnANabkCls8aKHJ+VkGbb2PA3o4YBwdVO6wbOrOZFx88qFfe
 rwMGFZiapSlGlE9+iUuTswQJhgR1dtgwbI7N+hBNcHltcvl23/TaAhA7IbG0OJuyGFd5
 4TWg==
X-Gm-Message-State: AOAM532k/w5eFykk2E8U0I40dKvzHHKCvQRf+I4BN4KVAwbwuxTgDVkv
 wtI9LZvGTIwNCcdlfucyYRKLJZFR8HClvA==
X-Google-Smtp-Source: ABdhPJy+Fm+biMLRtTbC0N9Um764CVE2pIiu8+/UxZyouEAUslPrYPTvRda1co2k/3YfNFakytR9sg==
X-Received: by 2002:a05:6a00:1506:b029:1bc:6f53:8eb8 with SMTP id
 q6-20020a056a001506b02901bc6f538eb8mr841426pfu.36.1611585002972; 
 Mon, 25 Jan 2021 06:30:02 -0800 (PST)
Received: from localhost.localdomain ([110.225.229.81])
 by smtp.gmail.com with ESMTPSA id y11sm15352225pfo.121.2021.01.25.06.29.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 06:30:02 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Mon, 25 Jan 2021 19:59:45 +0530
Message-Id: <1611584985-12479-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l42sb-006pp9-CM
Subject: [Kgdb-bugreport] [PATCH] kdb: Refactor env variables get/set code
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

Move kdb environment related get/set APIs to a separate file in order
to provide an abstraction for environment variables access and hence
enhances code readability.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/Makefile      |   2 +-
 kernel/debug/kdb/kdb_env.c     | 229 +++++++++++++++++++++++++++++++++++++++++
 kernel/debug/kdb/kdb_main.c    | 201 +-----------------------------------
 kernel/debug/kdb/kdb_private.h |   3 +
 4 files changed, 235 insertions(+), 200 deletions(-)
 create mode 100644 kernel/debug/kdb/kdb_env.c

diff --git a/kernel/debug/kdb/Makefile b/kernel/debug/kdb/Makefile
index efac857..b76aebe 100644
--- a/kernel/debug/kdb/Makefile
+++ b/kernel/debug/kdb/Makefile
@@ -6,7 +6,7 @@
 # Copyright (c) 2009 Wind River Systems, Inc. All Rights Reserved.
 #
 
-obj-y := kdb_io.o kdb_main.o kdb_support.o kdb_bt.o gen-kdb_cmds.o kdb_bp.o kdb_debugger.o
+obj-y := kdb_io.o kdb_main.o kdb_support.o kdb_bt.o gen-kdb_cmds.o kdb_bp.o kdb_debugger.o kdb_env.o
 obj-$(CONFIG_KDB_KEYBOARD)    += kdb_keyboard.o
 
 clean-files := gen-kdb_cmds.c
diff --git a/kernel/debug/kdb/kdb_env.c b/kernel/debug/kdb/kdb_env.c
new file mode 100644
index 0000000..33ab5e6
--- /dev/null
+++ b/kernel/debug/kdb/kdb_env.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kernel Debugger Architecture Independent Environment Functions
+ *
+ * Copyright (c) 1999-2004 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
+ * 03/02/13    added new 2.5 kallsyms <xavier.bru@bull.net>
+ */
+
+#include <linux/kdb.h>
+#include <linux/string.h>
+#include "kdb_private.h"
+
+/*
+ * Initial environment.   This is all kept static and local to
+ * this file.   We don't want to rely on the memory allocation
+ * mechanisms in the kernel, so we use a very limited allocate-only
+ * heap for new and altered environment variables.  The entire
+ * environment is limited to a fixed number of entries (add more
+ * to __env[] if required) and a fixed amount of heap (add more to
+ * KDB_ENVBUFSIZE if required).
+ */
+static char *__env[] = {
+#if defined(CONFIG_SMP)
+	"PROMPT=[%d]kdb> ",
+#else
+	"PROMPT=kdb> ",
+#endif
+	"MOREPROMPT=more> ",
+	"RADIX=16",
+	"MDCOUNT=8",		/* lines of md output */
+	KDB_PLATFORM_ENV,
+	"DTABCOUNT=30",
+	"NOSECT=1",
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+	(char *)0,
+};
+
+static const int __nenv = ARRAY_SIZE(__env);
+
+/*
+ * kdbgetenv - This function will return the character string value of
+ *	an environment variable.
+ * Parameters:
+ *	match	A character string representing an environment variable.
+ * Returns:
+ *	NULL	No environment variable matches 'match'
+ *	char*	Pointer to string value of environment variable.
+ */
+char *kdbgetenv(const char *match)
+{
+	char **ep = __env;
+	int matchlen = strlen(match);
+	int i;
+
+	for (i = 0; i < __nenv; i++) {
+		char *e = *ep++;
+
+		if (!e)
+			continue;
+
+		if ((strncmp(match, e, matchlen) == 0)
+		 && ((e[matchlen] == '\0')
+		   || (e[matchlen] == '='))) {
+			char *cp = strchr(e, '=');
+
+			return cp ? ++cp : "";
+		}
+	}
+	return NULL;
+}
+
+/*
+ * kdballocenv - This function is used to allocate bytes for
+ *	environment entries.
+ * Parameters:
+ *	match	A character string representing a numeric value
+ * Outputs:
+ *	*value  the unsigned long representation of the env variable 'match'
+ * Returns:
+ *	Zero on success, a kdb diagnostic on failure.
+ * Remarks:
+ *	We use a static environment buffer (envbuffer) to hold the values
+ *	of dynamically generated environment variables (see kdb_set).  Buffer
+ *	space once allocated is never free'd, so over time, the amount of space
+ *	(currently 512 bytes) will be exhausted if env variables are changed
+ *	frequently.
+ */
+static char *kdballocenv(size_t bytes)
+{
+#define	KDB_ENVBUFSIZE	512
+	static char envbuffer[KDB_ENVBUFSIZE];
+	static int envbufsize;
+	char *ep = NULL;
+
+	if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
+		ep = &envbuffer[envbufsize];
+		envbufsize += bytes;
+	}
+	return ep;
+}
+
+/*
+ * kdbgetulenv - This function will return the value of an unsigned
+ *	long-valued environment variable.
+ * Parameters:
+ *	match	A character string representing a numeric value
+ * Outputs:
+ *	*value  the unsigned long represntation of the env variable 'match'
+ * Returns:
+ *	Zero on success, a kdb diagnostic on failure.
+ */
+int kdbgetulenv(const char *match, unsigned long *value)
+{
+	char *ep;
+
+	ep = kdbgetenv(match);
+	if (!ep)
+		return KDB_NOTENV;
+	if (strlen(ep) == 0)
+		return KDB_NOENVVALUE;
+
+	*value = simple_strtoul(ep, NULL, 0);
+
+	return 0;
+}
+
+/*
+ * kdbgetintenv - This function will return the value of an
+ *	integer-valued environment variable.
+ * Parameters:
+ *	match	A character string representing an integer-valued env variable
+ * Outputs:
+ *	*value  the integer representation of the environment variable 'match'
+ * Returns:
+ *	Zero on success, a kdb diagnostic on failure.
+ */
+int kdbgetintenv(const char *match, int *value)
+{
+	unsigned long val;
+	int diag;
+
+	diag = kdbgetulenv(match, &val);
+	if (!diag)
+		*value = (int) val;
+	return diag;
+}
+
+/*
+ * kdb_setenv - Alter an existing environment variable or create a new one.
+ * Parameters:
+ *	var	name of the variable
+ *	val	value of the variable
+ * Returns:
+ *	Zero on success, a kdb diagnostic on failure.
+ */
+int kdb_setenv(const char *var, const char *val)
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
+ * kdb_prienv - Display the current environment variables.
+ */
+void kdb_prienv(void)
+{
+	int i;
+
+	for (i = 0; i < __nenv; i++) {
+		if (__env[i])
+			kdb_printf("%s\n", __env[i]);
+	}
+}
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index a0989a0..03ba161 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -129,57 +129,6 @@ static kdbmsg_t kdbmsgs[] = {
 
 static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
 
-
-/*
- * Initial environment.   This is all kept static and local to
- * this file.   We don't want to rely on the memory allocation
- * mechanisms in the kernel, so we use a very limited allocate-only
- * heap for new and altered environment variables.  The entire
- * environment is limited to a fixed number of entries (add more
- * to __env[] if required) and a fixed amount of heap (add more to
- * KDB_ENVBUFSIZE if required).
- */
-
-static char *__env[] = {
-#if defined(CONFIG_SMP)
- "PROMPT=[%d]kdb> ",
-#else
- "PROMPT=kdb> ",
-#endif
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
-};
-
-static const int __nenv = ARRAY_SIZE(__env);
-
 struct task_struct *kdb_curr_task(int cpu)
 {
 	struct task_struct *p = curr_task(cpu);
@@ -211,113 +160,6 @@ static inline bool kdb_check_flags(kdb_cmdflags_t flags, int permissions,
 }
 
 /*
- * kdbgetenv - This function will return the character string value of
- *	an environment variable.
- * Parameters:
- *	match	A character string representing an environment variable.
- * Returns:
- *	NULL	No environment variable matches 'match'
- *	char*	Pointer to string value of environment variable.
- */
-char *kdbgetenv(const char *match)
-{
-	char **ep = __env;
-	int matchlen = strlen(match);
-	int i;
-
-	for (i = 0; i < __nenv; i++) {
-		char *e = *ep++;
-
-		if (!e)
-			continue;
-
-		if ((strncmp(match, e, matchlen) == 0)
-		 && ((e[matchlen] == '\0')
-		   || (e[matchlen] == '='))) {
-			char *cp = strchr(e, '=');
-			return cp ? ++cp : "";
-		}
-	}
-	return NULL;
-}
-
-/*
- * kdballocenv - This function is used to allocate bytes for
- *	environment entries.
- * Parameters:
- *	match	A character string representing a numeric value
- * Outputs:
- *	*value  the unsigned long representation of the env variable 'match'
- * Returns:
- *	Zero on success, a kdb diagnostic on failure.
- * Remarks:
- *	We use a static environment buffer (envbuffer) to hold the values
- *	of dynamically generated environment variables (see kdb_set).  Buffer
- *	space once allocated is never free'd, so over time, the amount of space
- *	(currently 512 bytes) will be exhausted if env variables are changed
- *	frequently.
- */
-static char *kdballocenv(size_t bytes)
-{
-#define	KDB_ENVBUFSIZE	512
-	static char envbuffer[KDB_ENVBUFSIZE];
-	static int envbufsize;
-	char *ep = NULL;
-
-	if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
-		ep = &envbuffer[envbufsize];
-		envbufsize += bytes;
-	}
-	return ep;
-}
-
-/*
- * kdbgetulenv - This function will return the value of an unsigned
- *	long-valued environment variable.
- * Parameters:
- *	match	A character string representing a numeric value
- * Outputs:
- *	*value  the unsigned long represntation of the env variable 'match'
- * Returns:
- *	Zero on success, a kdb diagnostic on failure.
- */
-static int kdbgetulenv(const char *match, unsigned long *value)
-{
-	char *ep;
-
-	ep = kdbgetenv(match);
-	if (!ep)
-		return KDB_NOTENV;
-	if (strlen(ep) == 0)
-		return KDB_NOENVVALUE;
-
-	*value = simple_strtoul(ep, NULL, 0);
-
-	return 0;
-}
-
-/*
- * kdbgetintenv - This function will return the value of an
- *	integer-valued environment variable.
- * Parameters:
- *	match	A character string representing an integer-valued env variable
- * Outputs:
- *	*value  the integer representation of the environment variable 'match'
- * Returns:
- *	Zero on success, a kdb diagnostic on failure.
- */
-int kdbgetintenv(const char *match, int *value)
-{
-	unsigned long val;
-	int diag;
-
-	diag = kdbgetulenv(match, &val);
-	if (!diag)
-		*value = (int) val;
-	return diag;
-}
-
-/*
  * kdbgetularg - This function will convert a numeric string into an
  *	unsigned long value.
  * Parameters:
@@ -374,10 +216,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
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
@@ -422,37 +260,7 @@ int kdb_set(int argc, const char **argv)
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
@@ -2056,12 +1864,7 @@ static int kdb_lsmod(int argc, const char **argv)
 
 static int kdb_env(int argc, const char **argv)
 {
-	int i;
-
-	for (i = 0; i < __nenv; i++) {
-		if (__env[i])
-			kdb_printf("%s\n", __env[i]);
-	}
+	kdb_prienv();
 
 	if (KDB_DEBUG(MASK))
 		kdb_printf("KDBDEBUG=0x%x\n",
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 4b2f79e..ae43a13 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -105,6 +105,9 @@ extern int kdb_putword(unsigned long, unsigned long, size_t);
 extern int kdbgetularg(const char *, unsigned long *);
 extern int kdbgetu64arg(const char *, u64 *);
 extern char *kdbgetenv(const char *);
+extern int kdbgetulenv(const char *match, unsigned long *value);
+extern int kdb_setenv(const char *var, const char *val);
+extern void kdb_prienv(void);
 extern int kdbgetaddrarg(int, const char **, int*, unsigned long *,
 			 long *, char **);
 extern int kdbgetsymval(const char *, kdb_symtab_t *);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
