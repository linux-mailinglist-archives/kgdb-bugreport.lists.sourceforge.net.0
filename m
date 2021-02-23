Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19E3229F1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Feb 2021 13:01:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEWNX-0001wU-TW
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Feb 2021 12:01:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEWNV-0001wD-Jq
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 12:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F7VAQChhyRdzHQZeRZYrhZFLlVoxDoMdKmK4VaSa46c=; b=bCij0oRIc2PS9akmYWORganMfB
 DhAfqwHJ54Lt8ot60PsXSXhIrGAjFvGVh5GrtnNmLqkiJNNyNRCzbAidUutV5bpepEb5GEKPAnAI0
 0JkybEm+PB2Y5IMn57egCQZkL1rYUHnzMpIJg9cAvkeypgMug2Wg/qPu6myg1jk3g5Eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F7VAQChhyRdzHQZeRZYrhZFLlVoxDoMdKmK4VaSa46c=; b=Z
 bOzoLT+ZLkMRo7xOExW2swxKOVNl/08U/Lu+TGmTOUUxVh9tHP7GQ+vAt6qCoAiQUX1tiG4cJGmhJ
 deDM+9kMbMOKv7aNzKj2Wn988RHmh1LIr6NEFX9OiLF2za3b3+vsuiqZH1zjhUYLVx2bUBUqgKKcV
 7zm+aNjE673b7wUM=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEWNI-0002hj-77
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 12:01:21 +0000
Received: by mail-pl1-f171.google.com with SMTP id d11so4731587plo.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 04:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7VAQChhyRdzHQZeRZYrhZFLlVoxDoMdKmK4VaSa46c=;
 b=fdFJek4WxVN8fA8cQBiI59rKJ3FEwD/pBnuk2rsyiEJ3nppIPe14lYGIT5AscuqVWI
 7ee6tiSPX4vut1Lp0MOrUSUx/q4Jn7jEV0IYGkpLMcznJsW+p+1sxuENkRhC4u1GvdRR
 pjR0ycAVuSzlkSM/CrbGAPLNZ2FBzCGKUSMax9sBgsTW+wQSkbgKp907UQ/T1u5p93NO
 sF4djevOM9nFtBZ7fXJGRzYij2PySPiuJXmDRkbwxclbj5SDOTv2UGCT8YB1SAwjvRrC
 vP1neEWh8uG6e4Pfj+09Wg7tynJY3hrUwmGQAmwCgGxuTJ0ibDxQd5XJRQP56Qj8BugM
 wjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F7VAQChhyRdzHQZeRZYrhZFLlVoxDoMdKmK4VaSa46c=;
 b=o9ks3EpX/414fqr9Aw14lnwYqSNfwSyCEBvLttoHBsCXb+xtoU9L/v+T4IT6+x9QJL
 mZuX3r7VL2QXP8hkxeLIUViERjtWJmVhsk8taxas2fp3VTj/uF2mn/Mb2P1aXfefssnF
 TYug3CWvNYdCL9Z90dMc9vaYZdovV/eawYq0SD22EylEZP80/41fx80b98l/kxmxbUcn
 xjWg3wCkKM4Rlo75F822B9iJN797Vtj418PpQ6f6j4pgg0usDiZhG0YqHDYfENfZjTT+
 fuQZqz+KWITKBv8C7g52uMDoCLKl+lXWHzfSI/Y8h7qKa0NWI07jIpxUWUU2VaN2XFtZ
 QYKg==
X-Gm-Message-State: AOAM533ab36YcKwz++s6ujLcMPHOTyVv8ir/KIKZpF4CXYiBHZTTqZtJ
 XxOXiKpncaD9ec6wcix51aNJMSmWzMY3Kg==
X-Google-Smtp-Source: ABdhPJzqR78TU+4ycFQRa54C6Gm0zUOePm0Wck15JRagUJdy2BdFjZyVAW6bwVCW05WjhPx93JsbeQ==
X-Received: by 2002:a17:902:7592:b029:e2:e80f:6893 with SMTP id
 j18-20020a1709027592b02900e2e80f6893mr27417060pll.61.1614081662147; 
 Tue, 23 Feb 2021 04:01:02 -0800 (PST)
Received: from localhost.localdomain ([122.173.196.104])
 by smtp.gmail.com with ESMTPSA id o127sm15730412pfg.202.2021.02.23.04.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:01:01 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Tue, 23 Feb 2021 17:30:45 +0530
Message-Id: <20210223120045.153208-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEWNI-0002hj-77
Subject: [Kgdb-bugreport] [PATCH] kdb: Remove redundant function
 definitions/prototypes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Cleanup kdb code to get rid of unused function definitions/prototypes.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_main.c    |  2 +-
 kernel/debug/kdb/kdb_private.h |  3 ---
 kernel/debug/kdb/kdb_support.c | 18 ------------------
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index b29f7f375afb..2b9f0bb3542e 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -410,7 +410,7 @@ int kdbgetularg(const char *arg, unsigned long *value)
 	return 0;
 }
 
-int kdbgetu64arg(const char *arg, u64 *value)
+static int kdbgetu64arg(const char *arg, u64 *value)
 {
 	char *endp;
 	u64 val;
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 12d0abab73ee..99ec64cfe791 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -103,7 +103,6 @@ extern int kdb_getword(unsigned long *, unsigned long, size_t);
 extern int kdb_putword(unsigned long, unsigned long, size_t);
 
 extern int kdbgetularg(const char *, unsigned long *);
-extern int kdbgetu64arg(const char *, u64 *);
 extern char *kdbgetenv(const char *);
 extern int kdbgetaddrarg(int, const char **, int*, unsigned long *,
 			 long *, char **);
@@ -209,9 +208,7 @@ extern unsigned long kdb_task_state(const struct task_struct *p,
 				    unsigned long mask);
 extern void kdb_ps_suppressed(void);
 extern void kdb_ps1(const struct task_struct *p);
-extern void kdb_print_nameval(const char *name, unsigned long val);
 extern void kdb_send_sig(struct task_struct *p, int sig);
-extern void kdb_meminfo_proc_show(void);
 extern char kdb_getchar(void);
 extern char *kdb_getstr(char *, size_t, const char *);
 extern void kdb_gdb_state_pass(char *buf);
diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 6226502ce049..b59aad1f0b55 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -665,24 +665,6 @@ unsigned long kdb_task_state(const struct task_struct *p, unsigned long mask)
 	return (mask & kdb_task_state_string(state)) != 0;
 }
 
-/*
- * kdb_print_nameval - Print a name and its value, converting the
- *	value to a symbol lookup if possible.
- * Inputs:
- *	name	field name to print
- *	val	value of field
- */
-void kdb_print_nameval(const char *name, unsigned long val)
-{
-	kdb_symtab_t symtab;
-	kdb_printf("  %-11.11s ", name);
-	if (kdbnearsym(val, &symtab))
-		kdb_symbol_print(val, &symtab,
-				 KDB_SP_VALUE|KDB_SP_SYMSIZE|KDB_SP_NEWLINE);
-	else
-		kdb_printf("0x%lx\n", val);
-}
-
 /* Last ditch allocator for debugging, so we can still debug even when
  * the GFP_ATOMIC pool has been exhausted.  The algorithms are tuned
  * for space usage, not for speed.  One smallish memory pool, the free
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
