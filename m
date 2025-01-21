Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37DA17AC3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jan 2025 10:58:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1taB24-0004Lu-MS
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 21 Jan 2025 09:58:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1taB23-0004Lm-7D
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 09:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KIFxGxnvBKihw4fTbFCPK+DYQ7uljyxljs0IBYR0gFM=; b=fRPCnt4TzTZzuCnBteLrVsfpOv
 3byVej/AiCvp0s1Q5fu4hsGByflvt9khzZ435UPfN5xRHzp88OhFWzmsI+mq59gx1ydBzuuhuFPLL
 ShqbslHzlXnSWtkC+10FJJs6xIWCMDlZgsy9z1GMEllg4jHNb1Q4cNb4DIASXUHojRkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KIFxGxnvBKihw4fTbFCPK+DYQ7uljyxljs0IBYR0gFM=; b=Ph3yEWxavhXlxcb3iWbXtWEPp3
 MK6D1OQo5hMnUTe6l20FgcB39EyQgSPsupUmHtyKf9ALm28IXtuISMlLVjslSSMwVPp7ISABtLApt
 kgFtPfRJNpYcrZTlWjZRmuVE7+lVwUIFvNusQqAikcf0c84rTezwCVaIMHPIFiOUHigI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taB21-0000yE-NV for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 09:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C80885C5542;
 Tue, 21 Jan 2025 09:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77818C4CEEB;
 Tue, 21 Jan 2025 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737453519;
 bh=WqNu22Xx50tarZUt/SmRrxy/7e4ez9U96yWXlx51zT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FoJDZOnleAZwQIodwpQ5Ij7X645HWLirwOfQ0PhgbtrAeGgWm0F1BXmNxBMxNOwHb
 BDgECe3T1RZ/O+9XVPcSbALd53EQ/PlnqBfdQBdMhcXcZ+XXMzcLKMhHhdcZtfJpkQ
 lvZ+7uhS8+o8oy4nUgdHZsuP0yWdBRXAQZqs+NOswDcGekMvmFjYb/p3oM9oZLjscE
 ODzHCzjWAHlUfeWSzGBEWwQ7S2LmdR+XTiDwEsXBXcAVr05ZGnWSHBHO5NprCQ7JQH
 9e0Wc/fjy9kaqfaasO/7S8ssSjD4RHcmUTWiXWg8YtQu/ZrYdH7nv7nO1DVVQfGz7j
 awdEEf3waopQw==
To: x86@kernel.org
Date: Tue, 21 Jan 2025 11:57:33 +0200
Message-ID: <20250121095739.986006-5-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250121095739.986006-1-rppt@kernel.org>
References: <20250121095739.986006-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> The
 memory
 allocated for the ROX cache was removed from the direct map to reduce amount
 of direct map updates, however this cannot be tolerated by /proc/kcore that
 accesses module memory using vread_i [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taB21-0000yE-NV
Subject: [Kgdb-bugreport] [PATCH v2 04/10] execmem: don't remove ROX cache
 from the direct map
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
From: Mike Rapoport via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Rae Moar <rmoar@google.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, Shuah Khan <shuah@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>,
 Daniel Thompson <danielt@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-trace-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Jiri Kosina <jikos@kernel.org>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Gomez <da.gomez@samsung.com>, Borislav Petkov <bp@alien8.de>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, kunit-dev@googlegroups.com,
 Song Liu <song@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

The memory allocated for the ROX cache was removed from the direct map to
reduce amount of direct map updates, however this cannot be tolerated by
/proc/kcore that accesses module memory using vread_iter() and the latter
does vmalloc_to_page() and copy_page_to_iter_nofault().

Instead of removing ROX cache memory from the direct map and mapping it as
ROX in vmalloc space, simply call set_memory_rox() that will take care of
proper permissions on both vmalloc and in the direct map.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/execmem.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index 317b6a8d35be..04b0bf1b5025 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -257,7 +257,6 @@ static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
 static int execmem_cache_populate(struct execmem_range *range, size_t size)
 {
 	unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
-	unsigned long start, end;
 	struct vm_struct *vm;
 	size_t alloc_size;
 	int err = -ENOMEM;
@@ -275,26 +274,18 @@ static int execmem_cache_populate(struct execmem_range *range, size_t size)
 	/* fill memory with instructions that will trap */
 	execmem_fill_trapping_insns(p, alloc_size, /* writable = */ true);
 
-	start = (unsigned long)p;
-	end = start + alloc_size;
-
-	vunmap_range(start, end);
-
-	err = execmem_set_direct_map_valid(vm, false);
-	if (err)
-		goto err_free_mem;
-
-	err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
-				       PMD_SHIFT);
+	err = set_memory_rox((unsigned long)p, vm->nr_pages);
 	if (err)
 		goto err_free_mem;
 
 	err = execmem_cache_add(p, alloc_size);
 	if (err)
-		goto err_free_mem;
+		goto err_reset_direct_map;
 
 	return 0;
 
+err_reset_direct_map:
+	execmem_set_direct_map_valid(vm, true);
 err_free_mem:
 	vfree(p);
 	return err;
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
