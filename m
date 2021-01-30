Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 055913094AE
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 30 Jan 2021 12:24:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l5oMm-0007uN-Tb
	for lists+kgdb-bugreport@lfdr.de; Sat, 30 Jan 2021 11:24:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l5oMi-0007t9-K1
 for kgdb-bugreport@lists.sourceforge.net; Sat, 30 Jan 2021 11:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fl6RQ7WSY02b+Iix5UTUs3UQEEz4GozFuGFCITkdTGg=; b=LESpKpTlOE8pyAYgPSR9aS7Fg2
 tmh/R8czncb+fV9aqbjBmLK1SDYcurDTstNrzCgSa3lAGmThjMszc/Nml5IRdjoGpPI6Re0IhrKz4
 p0nJEGyGuWf/Ui9Slo1U62nAjQ6kV8DJ8OMS+APupuEDXej4FjPFQRS48Im3h8LDW8Bc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fl6RQ7WSY02b+Iix5UTUs3UQEEz4GozFuGFCITkdTGg=; b=Lljd68DjiiLteohZGeonG3lqdm
 qsJtRFcxSFPuSG+uutcvEIh8rhq+iyZ+M0EflE5z3bl5WZBBCVadky1uR9OO63NcljL7fA5e0ghC9
 Ucluh/sR2sq/0JygiX31D8pxXge3sOHvUK9NDMNEuuP7Ja80jQa3UKBqcApsLivXjvEs=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l5oMT-0003Q7-Tj
 for kgdb-bugreport@lists.sourceforge.net; Sat, 30 Jan 2021 11:24:30 +0000
Received: by mail-pl1-f179.google.com with SMTP id x9so1059486plb.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 30 Jan 2021 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fl6RQ7WSY02b+Iix5UTUs3UQEEz4GozFuGFCITkdTGg=;
 b=YBOYHEizDP1M6mvMVE/VcdQMGzyl+BcF1ct4jewLHU27UYKg0n0tHmGS04XTTketX+
 EoVxRB0SDKBYpOz5qGmb4yV5J/eLs3lV2BIxLJU4Ti3TlhZ4Plf0zAMBXZgXQKxlQ1fT
 Nx9vQ3J3PYKBJCLEvzKzRgp+PssG4DTTOzoqhjFrMN9k/FCVRhMegfc1zwBmJV7FsU77
 OH6noseTsZBA+z4OWnofgKaaR7oBwEddlusaE9l/Q/Y0Bj7th6543+QdPwBpM7OhA74e
 zSYoHusELdtajxiaFzt3mfBjrvmmo+Y7hKBUTk68UbT818bufxTU/TzOgs9lvH1kawsK
 iQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fl6RQ7WSY02b+Iix5UTUs3UQEEz4GozFuGFCITkdTGg=;
 b=JfukrLHRXpkxWqGJ/yU19SP/eO4CD7fjJrMQsB+rTmJWqINZUyOdiC/3PF0LdKZdzW
 GB2mu0cAb6Hp/YXIIDFp8DUMXSn9ZLwXTEpcz4HpXQ3lvvHPDXsA9fvDJJLGka/hvxXU
 fNSawZs189WG0sDldoZ75b+jYpwbTdvU4hhEtUD2wR48w3MMZRfqUs2xxyprCsK2cwt4
 nCny0+0lLxuHxmtK8uSvWpmkCIEP7xaC/u1nb+8Wqmlu8HmQnX7LxXmuqXmv5kSZNMaK
 qud3OGo5EIJfKxcinrumq9GhQsjm74Wtpf3fka1cYQbqZlp2YDBqR63nPDU23R8C6jYr
 aFMQ==
X-Gm-Message-State: AOAM532HWLQM12YLtIzA/7MSmPfnLI8VcQa35f4LCB4Ru+XdNGwaY/xj
 3+SOMPkoCtuPtWDEfwmBIdI=
X-Google-Smtp-Source: ABdhPJyrHBNQf1zG5XY6QM8xUGdHu0RAlQtJRgsrBDfh9aHMy+iPg+JRRGXR/xrjPI9M4ILhYQvjhQ==
X-Received: by 2002:a17:90b:4c85:: with SMTP id
 my5mr8967401pjb.225.1612005852655; 
 Sat, 30 Jan 2021 03:24:12 -0800 (PST)
Received: from localhost.localdomain ([125.227.22.95])
 by smtp.gmail.com with ESMTPSA id gk2sm10487163pjb.6.2021.01.30.03.24.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 30 Jan 2021 03:24:12 -0800 (PST)
From: Stephen Zhang <stephenzhangzsd@gmail.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, gustavoars@kernel.org
Date: Sat, 30 Jan 2021 19:24:00 +0800
Message-Id: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l5oMT-0003Q7-Tj
Subject: [Kgdb-bugreport] [PATCH v3] kdb: kdb_support: Fix debugging
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

There are several common patterns.

0:
        kdb_printf("...",...);

which is the normal one.

1:
        kdb_printf("%s: "...,__func__,...)

We could improve '1' to this :

        #define kdb_func_printf(format, args...) \
                   kdb_printf("%s: " format, __func__, ## args)

2:
        if(KDB_DEBUG(AR))
                kdb_printf("%s "...,__func__,...);

We could improve '2' to this :
        #define kdb_dbg_printf(mask, format, args...) \
                           do { \
                                        if (KDB_DEBUG(mask)) \
                                                kdb_func_printf(format, ## args); \
                           } while (0)

In additon, we changed the format code of size_t to %zu.

Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
---
v1->v2 Changelog:
- Add 'mask' parameter in kdb_dbg_printf()

Thanks to Daniel and Doug's suggestions and review.

v2->v3 Changelog:
- Adjust alignment for some lines.

Suggested by Douglas Anderson.

 kernel/debug/kdb/kdb_private.h | 10 ++++++++
 kernel/debug/kdb/kdb_support.c | 53 ++++++++++++++++++------------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index a4281fb..0a56d35 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -254,4 +254,14 @@ extern unsigned long kdb_task_state(const struct task_struct *p,
 #define	KDB_WORD_SIZE	((int)sizeof(unsigned long))
 
 #endif /* CONFIG_KGDB_KDB */
+
+#define kdb_func_printf(format, args...) \
+	kdb_printf("%s: " format, __func__, ## args)
+
+#define kdb_dbg_printf(mask, format, args...) \
+	do { \
+		if (KDB_DEBUG(mask)) \
+			kdb_func_printf(format, ## args); \
+	} while (0)
+
 #endif	/* !_KDBPRIVATE_H */
diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 6226502..99a6232 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -39,20 +39,15 @@
  */
 int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
 {
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
-			   symtab);
+	kdb_dbg_printf(AR, "symname=%s, symtab=%px\n", symname, symtab);
 	memset(symtab, 0, sizeof(*symtab));
 	symtab->sym_start = kallsyms_lookup_name(symname);
 	if (symtab->sym_start) {
-		if (KDB_DEBUG(AR))
-			kdb_printf("kdbgetsymval: returns 1, "
-				   "symtab->sym_start=0x%lx\n",
-				   symtab->sym_start);
+		kdb_dbg_printf(AR, "returns 1,symtab->sym_start=0x%lx\n",
+			      symtab->sym_start);
 		return 1;
 	}
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: returns 0\n");
+	kdb_dbg_printf(AR, "returns 0\n");
 	return 0;
 }
 EXPORT_SYMBOL(kdbgetsymval);
@@ -87,15 +82,14 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 #define knt1_size 128		/* must be >= kallsyms table size */
 	char *knt1 = NULL;
 
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: addr=0x%lx, symtab=%px\n", addr, symtab);
+	kdb_dbg_printf(AR, "addr=0x%lx, symtab=%px\n", addr, symtab);
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
@@ -147,11 +141,10 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 
 	if (symtab->mod_name == NULL)
 		symtab->mod_name = "kernel";
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: returns %d symtab->sym_start=0x%lx, "
-		   "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
-		   symtab->sym_start, symtab->mod_name, symtab->sym_name,
-		   symtab->sym_name);
+	kdb_dbg_printf(AR, "returns %d symtab->sym_start=0x%lx, "
+		"symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
+		symtab->sym_start, symtab->mod_name, symtab->sym_name,
+		symtab->sym_name);
 
 out:
 	debug_kfree(knt1);
@@ -328,7 +321,7 @@ int kdb_getarea_size(void *res, unsigned long addr, size_t size)
 	int ret = copy_from_kernel_nofault((char *)res, (char *)addr, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_getarea: Bad address 0x%lx\n", addr);
+			kdb_func_printf("Bad address 0x%lx\n", addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -353,7 +346,7 @@ int kdb_putarea_size(unsigned long addr, void *res, size_t size)
 	int ret = copy_from_kernel_nofault((char *)addr, (char *)res, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_putarea: Bad address 0x%lx\n", addr);
+			kdb_func_printf("Bad address 0x%lx\n", addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -435,7 +428,7 @@ int kdb_getphysword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getphysword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -484,7 +477,7 @@ int kdb_getword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -528,7 +521,7 @@ int kdb_putword(unsigned long addr, unsigned long word, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_putword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -602,8 +595,7 @@ unsigned long kdb_task_state_string(const char *s)
 			res = ~0UL;
 			break;
 		default:
-			  kdb_printf("%s: unknown flag '%c' ignored\n",
-				     __func__, *s);
+			  kdb_func_printf("unknown flag '%c' ignored\n", *s);
 			  break;
 		}
 		++s;
@@ -884,18 +876,17 @@ void debug_kusage(void)
 	if (!debug_kusage_one_time)
 		goto out;
 	debug_kusage_one_time = 0;
-	kdb_printf("%s: debug_kmalloc memory leak dah_first %d\n",
-		   __func__, dah_first);
+	kdb_func_printf("debug_kmalloc memory leak dah_first %d\n", dah_first);
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
+			  h_used, h_used->size, h_used->caller);
 		h_free = (struct debug_alloc_header *)
 			  (debug_alloc_pool + h_free->next);
 	} while (h_free->next);
@@ -903,8 +894,8 @@ void debug_kusage(void)
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
