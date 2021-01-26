Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A8303929
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 10:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4Koq-0008No-3O
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 09:39:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l4JCb-0003jq-Km
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 Jan 2021 07:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aqEN+2kNg6+1qKhKRRCyOQybkRCy9FCgQdCaQbEpq34=; b=WwFvE5baqgUtgWCU0dKspesNJF
 DQhlowyPJxbqbueowMNLPpeRqyv3rUnMn1JJgNGEV+1TP7pBnozo7sohIXdbPYeFIGURchscR4GV5
 K+tha/6lH1pEnKSOEVZM2wyNtaCpTSlyHWLM7T5mES/bz2sbhOnsa9X8wDSVkBVl7yt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aqEN+2kNg6+1qKhKRRCyOQybkRCy9FCgQdCaQbEpq34=; b=BnMwMFyBqtbT3WHv0b4DnNaacf
 rzJ4TnNraPOTqougMA8V0RKEj0X7lwUq8DP1as7G4p5DuazUQs1VyEBLLp3qwICDcIR+qXasHS76G
 Z9rr/QhJRehJg1QdTcqvNDdFnuRmme1xtnIqdZQBRRcYXPhc6tczxzIKBxlRgg2x5V6o=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4JCS-0062OL-2C
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 Jan 2021 07:55:53 +0000
Received: by mail-pj1-f41.google.com with SMTP id s24so218193pjp.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 23:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aqEN+2kNg6+1qKhKRRCyOQybkRCy9FCgQdCaQbEpq34=;
 b=D1L6fS5PwvMtgn5pw5jQZkspQNg+1twO5ryC1LXfJmzZS/swbbRapbrVf5eCw5MoEu
 DkFJnVBA0yIRWqe1QXjHNvZsOec1i10JHQTdWHbN3NYwDRD+bg6KKaSydQy6RA9YzCmR
 HDpC3GVn8iCYn8TtFqbQU0mfJpnc2yduCJFh7+8C/j7eehIe5/PphXXnjR6c98FdWda8
 C4OlKwrCM5T+9XFDDmtirGHfk474rOYlN+zAYiVfREIzHFfXqwoo8xsJkNOdJv33BeTc
 3fB7TrKEROnVWT1BbXUW38zFYp4qMPv0HPRaMZC9t4yGZsKNDjL6vbEiAK1PFp/8Dz0s
 uolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aqEN+2kNg6+1qKhKRRCyOQybkRCy9FCgQdCaQbEpq34=;
 b=SO2y0UmWnTnKwLarchHNk6cV+hUgiosyz7W129Xbe1NAT6kKW6KbCfO1SNhs1xJiYu
 yefY2qIt/mr6PQ1q3YtvFpYigfjus/ckkuue/UpbtpAJahW5uDTlwlymcjw6xwIg+5et
 jRdHxcQECqzjYzwc09wavMPf6qWuv6/2KVQANkbrLUiOLlw1kfmKmN/YImDE+Q33N2De
 n/jW1/PupJJKNjaUxtmt33EEPHfbv5DxVNAD691wJjjsiQzYYKfRXS/4vEpJ7MKegWyq
 iM9d6YBGSYzZAhoUB82CV3ClgSwg08elUOxWBvRMNdRD+7ezBwZWLP1CaOJBX6pwBd8G
 OvtQ==
X-Gm-Message-State: AOAM532O81EFyqwQgW1nxUj3wTj9He3OUirWI6eAQHZyhV/bWVQNnbJh
 NvEURrRmh/BUVci2jhagTi4=
X-Google-Smtp-Source: ABdhPJzlXoXVxsEVdQm0tsPC0UGdC2gM96o/tex2PZBID/M+HS1MKm8MdF5x032F0cZJKebIMVdDWg==
X-Received: by 2002:a17:90b:1483:: with SMTP id
 js3mr4848938pjb.121.1611647731303; 
 Mon, 25 Jan 2021 23:55:31 -0800 (PST)
Received: from localhost.localdomain ([2403:18c0:3:311::])
 by smtp.gmail.com with ESMTPSA id r15sm1671423pgh.39.2021.01.25.23.55.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 23:55:30 -0800 (PST)
From: Stephen Zhang <stephenzhangzsd@gmail.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, gustavoars@kernel.org
Date: Tue, 26 Jan 2021 15:55:09 +0800
Message-Id: <1611647709-35583-1-git-send-email-stephenzhangzsd@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l4JCS-0062OL-2C
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:39:25 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: kdb_support: Fix debugging
 information problem
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
Cc: Stephen Zhang <stephenzhangzsd@gmail.com>,
 kgdb-bugreport@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Since there are many debugging information with a
function name,it's better to replace them with %s.

Notice that there are many similar code patterns, so I
defined two macros. One is kdb_func_printf, which is used
for debugging information that requires function names.
As below:

-               kdb_printf("func_name: ...",args);

The other is kdb_ardbg_printf, which adds a conditional
statement to the former.This is used for:

-               if (KDB_DEBUG(AR))
-                       kdb_printf("func_name: ...",args);

In addition, I changed the format code of size_t to %zu.

Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
---
 kernel/debug/kdb/kdb_support.c | 64 ++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 6226502..d255003 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -27,6 +27,15 @@
 #include <linux/slab.h>
 #include "kdb_private.h"
 
+#define kdb_func_printf(format, args...) \
+	kdb_printf("%s: " format, __func__, ##args)
+
+#define kdb_ardbg_printf(format, args...) \
+	do { \
+		if (KDB_DEBUG(AR)) \
+			kdb_func_printf(format, ##args); \
+	} while (0)
+
 /*
  * kdbgetsymval - Return the address of the given symbol.
  *
@@ -39,20 +48,16 @@
  */
 int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
 {
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
-			   symtab);
+	kdb_ardbg_printf("symname=%s, symtab=%px\n", symname, symtab);
 	memset(symtab, 0, sizeof(*symtab));
 	symtab->sym_start = kallsyms_lookup_name(symname);
 	if (symtab->sym_start) {
-		if (KDB_DEBUG(AR))
-			kdb_printf("kdbgetsymval: returns 1, "
-				   "symtab->sym_start=0x%lx\n",
-				   symtab->sym_start);
+		kdb_ardbg_printf("returns 1, "
+				 "symtab->sym_start=0x%lx\n",
+				 symtab->sym_start);
 		return 1;
 	}
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: returns 0\n");
+	kdb_ardbg_printf("returns 0\n");
 	return 0;
 }
 EXPORT_SYMBOL(kdbgetsymval);
@@ -87,15 +92,14 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 #define knt1_size 128		/* must be >= kallsyms table size */
 	char *knt1 = NULL;
 
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: addr=0x%lx, symtab=%px\n", addr, symtab);
+	kdb_ardbg_printf("addr=0x%lx, symtab=%px\n", addr, symtab);
 	memset(symtab, 0, sizeof(*symtab));
 
 	if (addr < 4096)
 		goto out;
 	knt1 = debug_kmalloc(knt1_size, GFP_ATOMIC);
 	if (!knt1) {
-		kdb_printf("kdbnearsym: addr=0x%lx cannot kmalloc knt1\n",
+		kdb_func_printf("addr=0x%lx cannot kmalloc knt1\n",
 			   addr);
 		goto out;
 	}
@@ -147,11 +151,10 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 
 	if (symtab->mod_name == NULL)
 		symtab->mod_name = "kernel";
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: returns %d symtab->sym_start=0x%lx, "
-		   "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
-		   symtab->sym_start, symtab->mod_name, symtab->sym_name,
-		   symtab->sym_name);
+	kdb_ardbg_printf("returns %d symtab->sym_start=0x%lx, "
+	   "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
+	   symtab->sym_start, symtab->mod_name, symtab->sym_name,
+	   symtab->sym_name);
 
 out:
 	debug_kfree(knt1);
@@ -328,7 +331,7 @@ int kdb_getarea_size(void *res, unsigned long addr, size_t size)
 	int ret = copy_from_kernel_nofault((char *)res, (char *)addr, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_getarea: Bad address 0x%lx\n", addr);
+			kdb_func_printf("Bad address 0x%lx\n", addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -353,7 +356,7 @@ int kdb_putarea_size(unsigned long addr, void *res, size_t size)
 	int ret = copy_from_kernel_nofault((char *)addr, (char *)res, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_putarea: Bad address 0x%lx\n", addr);
+			kdb_func_printf("Bad address 0x%lx\n", addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -435,7 +438,7 @@ int kdb_getphysword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getphysword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -484,7 +487,7 @@ int kdb_getword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -528,7 +531,7 @@ int kdb_putword(unsigned long addr, unsigned long word, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_putword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -602,8 +605,7 @@ unsigned long kdb_task_state_string(const char *s)
 			res = ~0UL;
 			break;
 		default:
-			  kdb_printf("%s: unknown flag '%c' ignored\n",
-				     __func__, *s);
+			  kdb_func_printf("unknown flag '%c' ignored\n", *s);
 			  break;
 		}
 		++s;
@@ -884,18 +886,18 @@ void debug_kusage(void)
 	if (!debug_kusage_one_time)
 		goto out;
 	debug_kusage_one_time = 0;
-	kdb_printf("%s: debug_kmalloc memory leak dah_first %d\n",
-		   __func__, dah_first);
+	kdb_func_printf("debug_kmalloc memory leak dah_first %d\n",
+		    dah_first);
 	if (dah_first) {
 		h_used = (struct debug_alloc_header *)debug_alloc_pool;
-		kdb_printf("%s: h_used %px size %d\n", __func__, h_used,
+		kdb_func_printf("h_used %px size %d\n", h_used,
 			   h_used->size);
 	}
 	do {
 		h_used = (struct debug_alloc_header *)
 			  ((char *)h_free + dah_overhead + h_free->size);
-		kdb_printf("%s: h_used %px size %d caller %px\n",
-			   __func__, h_used, h_used->size, h_used->caller);
+		kdb_func_printf("h_used %px size %d caller %px\n",
+			   h_used, h_used->size, h_used->caller);
 		h_free = (struct debug_alloc_header *)
 			  (debug_alloc_pool + h_free->next);
 	} while (h_free->next);
@@ -903,8 +905,8 @@ void debug_kusage(void)
 		  ((char *)h_free + dah_overhead + h_free->size);
 	if ((char *)h_used - debug_alloc_pool !=
 	    sizeof(debug_alloc_pool_aligned))
-		kdb_printf("%s: h_used %px size %d caller %px\n",
-			   __func__, h_used, h_used->size, h_used->caller);
+		kdb_func_printf("h_used %px size %d caller %px\n",
+			   h_used, h_used->size, h_used->caller);
 out:
 	spin_unlock(&dap_lock);
 }
-- 
1.8.3.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
