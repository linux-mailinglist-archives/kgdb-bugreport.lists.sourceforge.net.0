Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA913237C5
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 08:17:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEoQD-0003mX-MJ
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 07:17:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEoQB-0003mL-Gt
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 07:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QWrzEO3vpVCf5FK/cLz+7/4GrMfblEPP8ih2ftpKZGo=; b=mgxoxhIToZteomNP7nR796zXRU
 7Gyxm9ABUCxZYjaUiO4XrW32brZ59+CRVJBEvtuF54Ly5gmX65ikD5tWKbhSkEKM0HqWKfBt37540
 shml3cyP/M2VbIOHg+gfxh6cjSnBB8PVU7Y+a4xbOCQqGYugcujWW9dK1nEGCtSpfIvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QWrzEO3vpVCf5FK/cLz+7/4GrMfblEPP8ih2ftpKZGo=; b=e
 y6n1EE5QVSM5KjAcqajNnefInLZNvZgHj0NQXFh8lQPQYZJLJ2N6YyjsnpEYbkXIbZBtgvajz/NSy
 mTBEgRgXH0Cff68JflU7TZoWcptYJ4GlHRoDg6OLAj58O4b08E1kqHJWdaR+Z1R6UpaicuycMZHbR
 VW9DQ/zYkLt/qp44=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEoQ4-0003zq-Ox
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 07:17:19 +0000
Received: by mail-pf1-f169.google.com with SMTP id u26so757161pfn.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 23:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QWrzEO3vpVCf5FK/cLz+7/4GrMfblEPP8ih2ftpKZGo=;
 b=YW9ffG57wFa5TpHjzfIMGUpi3ZaxjBFGnW0u6piVOCt/qdVsn8PMkIjZ4oNr/fPMKz
 ZcexCRjXxW01Mj9sgGyqlTVym0BwpiJNw8DK6j6eZI8zUWwgU9UVERN57tWaDfRrkfie
 5y2KIfKaKTuTqTwL8kBjgydZybLCaOxCQxLIVKSiNuq2s8klGIUBZA9RE+1Fks3Rw+AV
 eDGUNZW+be/Z+1EGnkAEFYU4ZNoP7s0tdiOgZ63DckEbGoPRMVJAIIA8xNRXiPXQAhtg
 P93UGYDAx6IU4+rkkNEN+2vQUhDEDQtAY2Vu3O11VJ1rGs7EqQEWkpS2/6cpKOD+yCok
 rM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QWrzEO3vpVCf5FK/cLz+7/4GrMfblEPP8ih2ftpKZGo=;
 b=eM4+eSgjk2wmPeyZG44U2BQ75ir3aXN8anrfiF0e+qMS5wGjox6CfObZCGPh3tf1+5
 HvcuNVCQkpeYb++XA7aQcbYO9V8J0mqXkBkI/KSj8C9RomoVwx7o+FJO5R9Frwo7T+1l
 T0JAb9M1ZvWsXZMNiM23bFhOTVdwlH56yVUNM89IF72qCNgJORfrr5RuRZQJCGbbtDaN
 e67oQzAyCJu4dkocGbHxvFBB/ph53X0jzNAazffeh/kQQDMmj6mz2jY4ZsWY9TCzr7/V
 WtcRAzVvdl374TWqmJH1gaciZ/qgeU2rzAau6kipTr+tk+j/9LjuX9jv80zhi0R1ldbs
 oIxw==
X-Gm-Message-State: AOAM5322UH8M4SgK2Mh84vmi6tynZCyzgx7FamDxQI8A2c8EaKLzL5s0
 PfrXEyjPCC/RFDr8/BpUWCkcsdctvtk8Nw==
X-Google-Smtp-Source: ABdhPJy3sPqLQXBn1Xlw856Q+THVhqkHroWqwIm50WHXVhRz1KbHgdbl8AMJYpSBgpFQpw7asJQpYA==
X-Received: by 2002:a65:5b43:: with SMTP id y3mr28298302pgr.415.1614151026770; 
 Tue, 23 Feb 2021 23:17:06 -0800 (PST)
Received: from localhost.localdomain ([122.173.196.104])
 by smtp.gmail.com with ESMTPSA id p1sm1488619pjf.2.2021.02.23.23.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 23:17:06 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Wed, 24 Feb 2021 12:46:53 +0530
Message-Id: <20210224071653.409150-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.169 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lEoQ4-0003zq-Ox
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Remove redundant function
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

Changes in v2:
- Keep kdbgetu64arg() the way it was.

 kernel/debug/kdb/kdb_private.h |  2 --
 kernel/debug/kdb/kdb_support.c | 18 ------------------
 2 files changed, 20 deletions(-)

diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 3cf8d9e47939..b857a84de3b5 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -210,9 +210,7 @@ extern unsigned long kdb_task_state(const struct task_struct *p,
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
