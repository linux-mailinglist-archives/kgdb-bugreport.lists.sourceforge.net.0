Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480A303924
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 10:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4Kop-0008Mu-PU
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 09:39:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l3Gs7-00028U-1O
 for kgdb-bugreport@lists.sourceforge.net; Sat, 23 Jan 2021 11:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8lH4R1lbbIR+YSmkCDBsRYgqOAryX2xEGqanOkSYuVU=; b=En3xXEGycmwFv8okqM0dC5Vj4M
 nL5FBLdAW40z3+28evEo2u4RjbBRlZfdY10BFsJyzsX/MReXl/Nk7umLrvOtlM9HkZMDUcR2I48W1
 ZgiFnCcZ0hlrR2azn+/SyZvJKNyp0DMLm+JM+x4BxS0gIapZoQYHf8DLjNBTfo4Y7rms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8lH4R1lbbIR+YSmkCDBsRYgqOAryX2xEGqanOkSYuVU=; b=CSEmQk8h2+GuRXGo2yKvTIGZwD
 rgoifXZDMi5AiT+YGmy3d5ZexHtgK4kYPbCxh01xBXnHe9NyZs9DhnLoIaTlj4V1sIanBrVxbYgKj
 xTmJYbbINNEig/utNTts12H6Qxrg97LT49HWrKHJzfpBX42iOtvhVxEF8V+faZXZm+nY=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3Gs2-002YLl-CD
 for kgdb-bugreport@lists.sourceforge.net; Sat, 23 Jan 2021 11:14:26 +0000
Received: by mail-pf1-f176.google.com with SMTP id t29so5492586pfg.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 23 Jan 2021 03:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8lH4R1lbbIR+YSmkCDBsRYgqOAryX2xEGqanOkSYuVU=;
 b=JQv+cRjydQH+swdbb+J0PrXPtVhi64zeCLSMxyd9vZajxqWOtcGnAjBt58A7I61Dhg
 yoAiZBEpUGxQzJJ8/pCLYotUEeJNLS5mULGmDGQCUMzl2xqveJxmg76YmZnSlOUjqRbv
 pGCJXFEl17usUtfcphNZANM1jwUqWgw4z6RhmygWe2um3A+gzWDs6fCpfEKrCo6rIwyj
 x2tAYFoPZx2imTw/5XZHRD9oyVnxnNuzFzugbQWfdpmSuSwiGgrtE4+Edkvr06TVCd95
 QNHE1YLBfNYiiw87Y2MuXyMyuSj5ARlfkb7rWIluxjAc38cd76ceApXW4AAuEgKgb/3H
 iv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8lH4R1lbbIR+YSmkCDBsRYgqOAryX2xEGqanOkSYuVU=;
 b=SPUa+N9tbPB2sMl1fSJZ0njGCblqo7ooHouYOdK7s4tjWX45Lox7vQTajBZVcBJLLY
 Y5zJn6vhdPWtWx9wADNi+zO9qWnuJsIYORXeVJhbbpevzOV1y+LODt0aRrRyRjFbc1KM
 p7lUXro0VzUwGZue7qAe5sZEflrPtz7zxNwzVTAAmDikwNfm5Xben/Rvnqoh8u1MhiBq
 DDdRQCU/KnedK1BSgKUGZUVubji8YXBN0PtlMrkL6smI0G8fuNdAUv+QNesPIN2LedVq
 Jbo6vEnKUzq5IBMLEIhURfe9CHWPxTFoMAJVKyoVCTyZ0/LWtvjtiUQxstNSc6BeD0rh
 T8VQ==
X-Gm-Message-State: AOAM532G8knd4B3spUb6enXAhHFkiM9z76M/PubJZy46gJwNTcOaKO6C
 hajCfaLByZe3RIJYpbVNQYY=
X-Google-Smtp-Source: ABdhPJyEcPSy3RB0DlOFCz3bGGa96Cyl57p20HuDuJOAkEvE+d4YmoHXGJHBvvM61sitckuH1ltueg==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr1688264pgh.39.1611400449803; 
 Sat, 23 Jan 2021 03:14:09 -0800 (PST)
Received: from localhost.localdomain ([125.227.22.95])
 by smtp.gmail.com with ESMTPSA id j123sm12292111pfg.36.2021.01.23.03.14.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 23 Jan 2021 03:14:09 -0800 (PST)
From: Stephen Zhang <stephenzhangzsd@gmail.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, gustavoars@kernel.org
Date: Sat, 23 Jan 2021 19:14:01 +0800
Message-Id: <1611400441-7178-1-git-send-email-stephenzhangzsd@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.176 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l3Gs2-002YLl-CD
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:39:25 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: kdb_support: replace function name by
 %s
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

Better to replace function name by %s in case of changes.

Signed-off-by: Stephen Zhang <stephenzhangzsd@gmail.com>
---
 kernel/debug/kdb/kdb_support.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 6226502..7a536fc 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -40,19 +40,19 @@
 int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
 {
 	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
+		kdb_printf("%s: symname=%s, symtab=%px\n", __func__, symname,
 			   symtab);
 	memset(symtab, 0, sizeof(*symtab));
 	symtab->sym_start = kallsyms_lookup_name(symname);
 	if (symtab->sym_start) {
 		if (KDB_DEBUG(AR))
-			kdb_printf("kdbgetsymval: returns 1, "
+			kdb_printf("%s: returns 1, "
 				   "symtab->sym_start=0x%lx\n",
-				   symtab->sym_start);
+				    __func__, symtab->sym_start);
 		return 1;
 	}
 	if (KDB_DEBUG(AR))
-		kdb_printf("kdbgetsymval: returns 0\n");
+		kdb_printf("%s: returns 0\n", __func__);
 	return 0;
 }
 EXPORT_SYMBOL(kdbgetsymval);
@@ -88,15 +88,15 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 	char *knt1 = NULL;
 
 	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: addr=0x%lx, symtab=%px\n", addr, symtab);
+		kdb_printf("%s: addr=0x%lx, symtab=%px\n", __func__, addr, symtab);
 	memset(symtab, 0, sizeof(*symtab));
 
 	if (addr < 4096)
 		goto out;
 	knt1 = debug_kmalloc(knt1_size, GFP_ATOMIC);
 	if (!knt1) {
-		kdb_printf("kdbnearsym: addr=0x%lx cannot kmalloc knt1\n",
-			   addr);
+		kdb_printf("%s: addr=0x%lx cannot kmalloc knt1\n",
+			    __func__, addr);
 		goto out;
 	}
 	symtab->sym_name = kallsyms_lookup(addr, &symbolsize , &offset,
@@ -148,10 +148,10 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
 	if (symtab->mod_name == NULL)
 		symtab->mod_name = "kernel";
 	if (KDB_DEBUG(AR))
-		kdb_printf("kdbnearsym: returns %d symtab->sym_start=0x%lx, "
-		   "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
-		   symtab->sym_start, symtab->mod_name, symtab->sym_name,
-		   symtab->sym_name);
+		kdb_printf("%s: returns %d symtab->sym_start=0x%lx, "
+		   "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n",
+		    __func__, ret, symtab->sym_start, symtab->mod_name,
+		   symtab->sym_name, symtab->sym_name);
 
 out:
 	debug_kfree(knt1);
@@ -328,7 +328,7 @@ int kdb_getarea_size(void *res, unsigned long addr, size_t size)
 	int ret = copy_from_kernel_nofault((char *)res, (char *)addr, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_getarea: Bad address 0x%lx\n", addr);
+			kdb_printf("%s: Bad address 0x%lx\n", __func__, addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -353,7 +353,7 @@ int kdb_putarea_size(unsigned long addr, void *res, size_t size)
 	int ret = copy_from_kernel_nofault((char *)addr, (char *)res, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
-			kdb_printf("kdb_putarea: Bad address 0x%lx\n", addr);
+			kdb_printf("%s: Bad address 0x%lx\n", __func__, addr);
 			KDB_STATE_SET(SUPPRESS);
 		}
 		ret = KDB_BADADDR;
@@ -435,7 +435,7 @@ int kdb_getphysword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getphysword: bad width %ld\n", (long) size);
+		kdb_printf("%s: bad width %ld\n", __func__, (long) size);
 	}
 	return diag;
 }
@@ -484,7 +484,7 @@ int kdb_getword(unsigned long *word, unsigned long addr, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_getword: bad width %ld\n", (long) size);
+		kdb_printf("%s: bad width %ld\n", __func__, (long) size);
 	}
 	return diag;
 }
@@ -528,7 +528,7 @@ int kdb_putword(unsigned long addr, unsigned long word, size_t size)
 		fallthrough;
 	default:
 		diag = KDB_BADWIDTH;
-		kdb_printf("kdb_putword: bad width %ld\n", (long) size);
+		kdb_printf("%s: bad width %ld\n", __func__, (long) size);
 	}
 	return diag;
 }
-- 
1.8.3.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
