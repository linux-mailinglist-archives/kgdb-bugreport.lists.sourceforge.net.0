Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA86A1C6D7
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 26 Jan 2025 08:49:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbxOX-0002ku-CN
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 26 Jan 2025 07:49:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tbxOP-0002jx-B0
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 26 Jan 2025 07:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KIFxGxnvBKihw4fTbFCPK+DYQ7uljyxljs0IBYR0gFM=; b=YuqavzjnKQyn4GIHaLDJt8E9zE
 Py8F7/k4hfY7pUXCHI8gm/6UlqOJba7kXBITuLfY/Z5sPV8jXBXilwYdZ+4sV4RVfL5zqMoDe3dsd
 9ceUBGN1T8BvlnV5aVrNYldSGndsXuJ0Thl/Nz2Nl3ibtcV8DkYU/Mrqudz2P7KDpDvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KIFxGxnvBKihw4fTbFCPK+DYQ7uljyxljs0IBYR0gFM=; b=HBrwazNNftWUW21I/azXUtM0gW
 uCu3OFzzcuxmQkIEcZzFHmuOxN8EfAreQf553IrBZvOvmX/mM3Cqn/U/r7FvNP5Gsxv2/wE2Nys5E
 rCJupNnYNQ60WtNdXcU+AKgwzmEB6zvBwHWZ4a0M/CvozOvCnf4hwUODEAfscvz8kdIM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbxNs-0001wB-44 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 26 Jan 2025 07:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C36F5C4B70;
 Sun, 26 Jan 2025 07:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68E5C4CED3;
 Sun, 26 Jan 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737877713;
 bh=WqNu22Xx50tarZUt/SmRrxy/7e4ez9U96yWXlx51zT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IL59FVJxiCVgMaLJ03jJ6YzpD01XNIwi0gBNBKK07c1A9UrVVp+DeEZ2rkk7RHr1N
 3eCIN13xm6EvJVgb+JieAsSB1dycOK5Wu4U/lIDmwOBa+Ay/gXeb3XbE5qlN4n3kAN
 G1IlICvvFL6lbfPBKeM4SUCMyOE/tFMGD4lfJ/zOBMWVcstXeVBL860ETBQnFLlBvf
 Jyf0FcnNBGdRU/dR1FtpOF0iGnFBcVUFKQg9B0G1UEXNo0SXlQqdzGtBgyE3i8oivO
 FhaZajQrYx2jRx1ihqabOGFmS9UJ4kFAH+SMbk13mmJb7Tlj7vJokgTrtOiuhYSown
 5p9cUgf6XD/Eg==
To: x86@kernel.org
Date: Sun, 26 Jan 2025 09:47:28 +0200
Message-ID: <20250126074733.1384926-5-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250126074733.1384926-1-rppt@kernel.org>
References: <20250126074733.1384926-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> The
 memory
 allocated for the ROX cache was removed from the direct map to reduce amount
 of direct map updates, however this cannot be tolerated by /proc/kcore that
 accesses module memory using vread_i [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbxNs-0001wB-44
Subject: [Kgdb-bugreport] [PATCH v3 4/9] execmem: don't remove ROX cache
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
