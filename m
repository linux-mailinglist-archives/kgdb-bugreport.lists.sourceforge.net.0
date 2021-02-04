Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD0C30F2D6
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Feb 2021 13:07:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7dQI-00018x-RD
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Feb 2021 12:07:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l7dQG-00018g-H0
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 12:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3mzpu0qu4PFpcQF0n9tQIBukqG1c/oqU6m6iIUEtS+I=; b=TWlM/ykCGUtEVGBacHfxVBEct4
 QfF2+h/LYECXNhYwfilBtNYZ+TbP0q35F0AzNpm65S2uhbCpUJfUwjElEhiiMAPZ/baZVbln7EIjf
 6lwBq9NXk8r/bV+Q0PABQILhuFXiY28OPDnWuLZcHVk3MpUUeFRTYYxeVxhlyB9Riits=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3mzpu0qu4PFpcQF0n9tQIBukqG1c/oqU6m6iIUEtS+I=; b=ThHOXesZXLrIQmEzb+Y+eWVFiJ
 aoCZpd/yezHqOIO0v7PxST1hLKmdSI5fC6atEqNAL08KXOIgaTFgBSxq2dQWomvBYCTXCUYChOFOq
 Iy4oVeFKvQLah85GgnqzTp6z+3iKP42cCd0MTF4zVxADfe1jxdCIXWCx+cpmm9nsaKzQ=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l7dQ4-004p2z-Lh
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 12:07:44 +0000
Received: by mail-pj1-f51.google.com with SMTP id l18so1670287pji.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 04:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3mzpu0qu4PFpcQF0n9tQIBukqG1c/oqU6m6iIUEtS+I=;
 b=Z9OFmDwFxcXtdJ63nGzqgA17+GGUGj9uv4d0QCGfKLCYH6NvGOrSTMS13RalK1U9Go
 O8EJY4+ugocryYThjoKa0wubNNBpfAl8hDo79mqK7C1fjXsUfWJF5UIYtTaXqz3j0nVv
 plnWIGCQTTtP6jEatWslZhYHXC3IcSh4Lc9SmplsXNPdqX2CtN4e8o21VnOjD+9ONlLr
 NKgLY4ViLvCcUb7/xxBLCf49bQ6bVL66RGU+IigWI/j9ABkru8gz5mEfVdGDSIdPT7F+
 SoAyXy13JvrUWhMUbGZlBGJECBIdLcxlgodYgs6L4sqZZN8XLlb1uwwhB4POsKi6xRjz
 B2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3mzpu0qu4PFpcQF0n9tQIBukqG1c/oqU6m6iIUEtS+I=;
 b=VW6T/PZP4L9U8W0/by7sFk8Qz3lUB45o/M40BfCPuxsiFmp9sx1iEHnlfVnPltkQvh
 X3cS2mgtDh/XmxlDfpv7nOIkps9eMbk9IV3zzfwy9qQvE8TS2tCe9bWJ55uSwzrAyKsu
 QfN9QIOePIXtMyrvMWEeY9BbDGHl8865iTN0l44i87YdBSdtoDTodBcDZsZW4eRBLbfO
 RFLliJJppx2K7Ks7QHXh4B2I3tftZPnrW+fy1ihqmL2T5l7uyJbc2Jx0ES3du2pCTg7j
 +IhtZ7v0a9gXPDD2r280Vi8uQniG4jnhUvHjLk38jhktUAsZ6jtO5yVA7qTyXDyLxnux
 Pkbg==
X-Gm-Message-State: AOAM530tKfZ884KUcjejrr+H0slnP/lsEZfDjtGJOkCCvHW8c67MmllS
 hLkKJaGjOa2v68Qmp9OzYkI=
X-Google-Smtp-Source: ABdhPJyssyf5i6PAJV+qqqOURlKAEXm7dt+uDWFmRmJF1qKSamfPaUoQ02f4yz4gNbhVHmZI9dT/hw==
X-Received: by 2002:a17:90a:53:: with SMTP id 19mr8090330pjb.29.1612440446081; 
 Thu, 04 Feb 2021 04:07:26 -0800 (PST)
Received: from localhost.localdomain ([125.227.22.95])
 by smtp.gmail.com with ESMTPSA id mv14sm9059079pjb.0.2021.02.04.04.07.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 04:07:25 -0800 (PST)
From: Stephen Zhang <stephenzhangzsd@gmail.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, gustavoars@kernel.org
Date: Thu,  4 Feb 2021 20:07:09 +0800
Message-Id: <1612440429-6391-1-git-send-email-stephenzhangzsd@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l7dQ4-004p2z-Lh
Subject: [Kgdb-bugreport] [PATCH v4] kdb: kdb_support: Fix debugging
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

v2->v4 Changelog:
- Adjust alignment for some lines.

Suggested by Douglas Anderson.

 kernel/debug/kdb/kdb_private.h | 10 ++++++++
 kernel/debug/kdb/kdb_support.c | 53 ++++++++++++++++--------------------------
 2 files changed, 30 insertions(+), 33 deletions(-)

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
index 6226502..f7c1885 100644
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
+		kdb_dbg_printf(AR, "returns 1, symtab->sym_start=0x%lx\n",
+			       symtab->sym_start);
 		return 1;
 	}
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: returns 0\n");
+	kdb_dbg_printf(AR, "returns 0\n");
 	return 0;
 }
 EXPORT_SYMBOL(kdbgetsymval);
@@ -87,16 +82,14 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
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
-			   addr);
+		kdb_func_printf("addr=0x%lx cannot kmalloc knt1\n", addr);
 		goto out;
 	}
 	symtab->sym_name = kallsyms_lookup(addr, &symbolsize , &offset,
@@ -147,11 +140,8 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 
 	if (symtab->mod_name == NULL)
 		symtab->mod_name = "kernel";
-	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: returns %d symtab->sym_start=0x%lx, "
-		   "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
-		   symtab->sym_start, symtab->mod_name, symtab->sym_name,
-		   symtab->sym_name);
+	kdb_dbg_printf(AR, "returns %d symtab->sym_start=0x%lx, symtab->mod_name=%px, symtab->sym_name=%px (%s)\n",
+		       ret, symtab->sym_start, symtab->mod_name, symtab->sym_name, symtab->sym_name);
 
 out:
 	debug_kfree(knt1);
@@ -328,7 +318,7 @@ int kdb_getarea_size(void *res, unsigned long addr, size_t size)
 	int ret = copy_from_kernel_nofault((char *)res, (char *)addr, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_getarea: Bad address 0x%lx\n", addr);
+			kdb_func_printf("Bad address 0x%lx\n", addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -353,7 +343,7 @@ int kdb_putarea_size(unsigned long addr, void *res, size_t size)
 	int ret = copy_from_kernel_nofault((char *)addr, (char *)res, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_putarea: Bad address 0x%lx\n", addr);
+			kdb_func_printf("Bad address 0x%lx\n", addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -435,7 +425,7 @@ int kdb_getphysword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getphysword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -484,7 +474,7 @@ int kdb_getword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -528,7 +518,7 @@ int kdb_putword(unsigned long addr, unsigned long word, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_putword: bad width %ld\n", (long) size);
+		kdb_func_printf("bad width %zu\n", size);
 	}
 	return diag;
 }
@@ -602,8 +592,7 @@ unsigned long kdb_task_state_string(const char *s)
 			res = ~0UL;
 			break;
 		default:
-			  kdb_printf("%s: unknown flag '%c' ignored\n",
-				     __func__, *s);
+			  kdb_func_printf("unknown flag '%c' ignored\n", *s);
 			  break;
 		}
 		++s;
@@ -884,18 +873,16 @@ void debug_kusage(void)
 	if (!debug_kusage_one_time)
 		goto out;
 	debug_kusage_one_time = 0;
-	kdb_printf("%s: debug_kmalloc memory leak dah_first %d\n",
-		   __func__, dah_first);
+	kdb_func_printf("debug_kmalloc memory leak dah_first %d\n", dah_first);
 	if (dah_first) {
 		h_used = (struct debug_alloc_header *)debug_alloc_pool;
-		kdb_printf("%s: h_used %px size %d\n", __func__, h_used,
-			   h_used->size);
+		kdb_func_printf("h_used %px size %d\n", h_used, h_used->size);
 	}
 	do {
 		h_used = (struct debug_alloc_header *)
 			  ((char *)h_free + dah_overhead + h_free->size);
-		kdb_printf("%s: h_used %px size %d caller %px\n",
-			   __func__, h_used, h_used->size, h_used->caller);
+		kdb_func_printf("h_used %px size %d caller %px\n",
+				h_used, h_used->size, h_used->caller);
 		h_free = (struct debug_alloc_header *)
 			  (debug_alloc_pool + h_free->next);
 	} while (h_free->next);
@@ -903,8 +890,8 @@ void debug_kusage(void)
 		  ((char *)h_free + dah_overhead + h_free->size);
 	if ((char *)h_used - debug_alloc_pool !=
 	    sizeof(debug_alloc_pool_aligned))
-		kdb_printf("%s: h_used %px size %d caller %px\n",
-			   __func__, h_used, h_used->size, h_used->caller);
+		kdb_func_printf("h_used %px size %d caller %px\n",
+				h_used, h_used->size, h_used->caller);
 out:
 	spin_unlock(&dap_lock);
 }
-- 
1.8.3.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
