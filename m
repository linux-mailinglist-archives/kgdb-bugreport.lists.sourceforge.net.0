Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED1312B62
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Feb 2021 09:03:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l91Vf-0003jZ-7j
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Feb 2021 08:03:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l91Vc-0003jE-Ru
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 08:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fQMr/aWmvkb1F5+ZUar0gqCKuXntBn/7P21Qz1XhdU=; b=hPkQgG2ZjFPrAqR7YPP6i/bwgF
 D/wKbFFf2GgBmOemB64JTN8Ji+RH2xwQVReF22d5TDe0PDY2u6rQTmpYFiRjyERNbWji8b2msYUPf
 Wb7evWgZJWPxeBof42YoChlpGktC1xRPGVv/8TimFrOeAnTR/Loiq/vkdRxHinx4ucXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+fQMr/aWmvkb1F5+ZUar0gqCKuXntBn/7P21Qz1XhdU=; b=HxCdXSNXHCK+AQff3/OJZpc/+x
 aOrmjNCOy2dlrHcKhU4HAFYnY81wr77YKCyAhdoHb3N5Hq4d2+awulnf1NAsVydxj5ON5504QK7b6
 9x2ML3jxPKP17doUKdx421L+K3pAmn2ONmt5N3S368nrdoSc5/3bSshDG8fkd81H11W4=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l91VR-00F1RW-Np
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 08:03:00 +0000
Received: by mail-pf1-f170.google.com with SMTP id m6so9223299pfk.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Feb 2021 00:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+fQMr/aWmvkb1F5+ZUar0gqCKuXntBn/7P21Qz1XhdU=;
 b=XL5pl6h6S5sdi7FHBEN9AblYYdRHALT5fKHT4cBqeoMBNsqGg0pKWRUgEO5UZvA2Mu
 lTOqFaa2yAwLSPDb8dd4WgxDWDhsO2KiEVkRU8QT4UhNtt0OlxXfp84BUxbLT4XqoSEJ
 3e/fBrruIFZhBD0Ma7Rwn1/airOkq8KC4IRv39pEJ6kYBJnX0eQlM2mJef7uz5fy1Evw
 N1SQhSg8/KdTsduBl/BCadKwJfbCnG5P2iUv3w+16xvbxo1yMRYxyhCnbu3h1qfdlTwU
 ovGaJ6Vu0RZOQhhkU45zv9wSm59UniGToTd6U/1GcOiV4IJ94SXKq4jDogRe9ufD4JWq
 /6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+fQMr/aWmvkb1F5+ZUar0gqCKuXntBn/7P21Qz1XhdU=;
 b=hJlz9EQBEl+9kShkfCJNjq3PwPn0/QlPJ4332/JfawHPs0zKk3LubXFWvNKV2o2kKq
 jWxIVbt0C25SL7DOCt7mQx9aXPbjmBV9xzLtCFiQCB6UENos0KVpmKHoPL7oLmqjtJCs
 EpZbvu5HSMuXEuuZZ1+8v4op0UqGrwZ0IcJvNAFkTBeB4kvuSYMP1I/nJAMDjo5gWiGp
 BA1yWCn/fZAGobAiyRJ74nzZsUTgJaHrq4NTVIiEs7bK1V29AYbfHiCm7zA4DTBwycVe
 6KCrH/uO36CgTcLq5SwTEK62Eywwkk7n50SnaWfp3R5AC6NlG3pVyw1SXBKSHTxXoMk2
 80UA==
X-Gm-Message-State: AOAM532ZIJ82pyn3HeETpD9xO/ZLHpA8vsKpEK3jyLczA/l2vcA8Jd7f
 ZTSkgEsZ8SjqSibiT53YlAEImH7+CX0rTQ==
X-Google-Smtp-Source: ABdhPJxMW+K+z4Xvhnqd+px5TwsN/RVFGfV86Uy014rjXfgrS9M5BnwSQ0HfsnLvFyB4P8WwdRCsJQ==
X-Received: by 2002:a63:505d:: with SMTP id q29mr15785019pgl.89.1612771363525; 
 Mon, 08 Feb 2021 00:02:43 -0800 (PST)
Received: from localhost.localdomain ([110.226.34.123])
 by smtp.gmail.com with ESMTPSA id 62sm16029223pfg.160.2021.02.08.00.02.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 00:02:42 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Mon,  8 Feb 2021 13:32:22 +0530
Message-Id: <1612771342-16883-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l91VR-00F1RW-Np
Subject: [Kgdb-bugreport] [PATCH v3] kdb: Refactor env variables get/set code
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Remove redundant '\0' char assignment.
- Pick up Doug's review tag.

Changes in v2:
- Get rid of code motion to separate kdb_env.c file.
- Replace (char *)0 with NULL.
- Use kernel-doc style function comments.
- s/kdb_prienv/kdb_printenv/

 kernel/debug/kdb/kdb_main.c | 164 ++++++++++++++++++++++++--------------------
 1 file changed, 91 insertions(+), 73 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 588062a..69b8f55 100644
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
@@ -318,6 +318,63 @@ int kdbgetintenv(const char *match, int *value)
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
@@ -374,10 +431,6 @@ int kdbgetu64arg(const char *arg, u64 *value)
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
@@ -422,37 +475,7 @@ int kdb_set(int argc, const char **argv)
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
@@ -2055,12 +2078,7 @@ static int kdb_lsmod(int argc, const char **argv)
 
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
