Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD20A17ABE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jan 2025 10:58:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1taB1o-0006De-OI
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 21 Jan 2025 09:58:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1taB1n-0006DV-Jq
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 09:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZB9RJL67fY3IXYuhWAcAfCX1iP2OBdCmZWcj/TBJ5l0=; b=T+at8WKokq8WJfUZGpwTogD6kn
 tsaeyRDu/4G7r6W7DE29ythTBmYykMJOPbd6PvF3cvDbv7/xntFM966ou3OlWWwE6MpLzhGPpp5We
 EnTtFtJGYvwicX0t1tIj0IniFKtigWwCfeOEla8YTQKo5w2OVdMEt69IY1bz3S5aoeXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZB9RJL67fY3IXYuhWAcAfCX1iP2OBdCmZWcj/TBJ5l0=; b=QNW68JSDtS+D0FgDIPsxksC8vp
 b6mrKpoDrAq7DPWg557hoyvAL0U+WKQkPUM9unWfupyyJuHT3EviN1PCLrYSdsCSVMFwXJi4nhzal
 wx24rSzHMxXIQ1brPOdO8P92ifAK4mreH+71Idv6o7BWV03kztrP+a0ZZfuHPBvXZTbg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taB1n-0000wd-4w for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 09:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5009A41455;
 Tue, 21 Jan 2025 09:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7847CC4CEE1;
 Tue, 21 Jan 2025 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737453509;
 bh=5TNUX0A4O+m9E85yyca5tT89w2/MG3X3oJGKr3TQ7q4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i2CJg/RFVkyd01I+tKsR65B2nLlaGoT+SZZNbGN8AHZRBFIua6s9sSXEtZ1O+GkJM
 1Bwbgmo74LVOtkGo8kgNdfmH/YPDA755rddy6wrQqRoZ2iZ0sAU6FeuBKVvW8d5MI9
 AzP8FWkTN1RV2UPuDP2IbalaUSXpqR3Vvw5+HBCDzRyKn8FlS4ibtGrOcaZwVAkpV/
 JaT08Q8+quoKcoticQaCA2yrSeRDBqccYZdEI9BFw2L6R6VMV5OeacOGVf6MY+MBq7
 vQQc8mc7bM1BWjahF6Ieb3lVHs3S802dTX+VNxagNnRz5gsLYxtqnoIbX5ilHdWPos
 1qkVw19HN9A+A==
To: x86@kernel.org
Date: Tue, 21 Jan 2025 11:57:32 +0200
Message-ID: <20250121095739.986006-4-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250121095739.986006-1-rppt@kernel.org>
References: <20250121095739.986006-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
 Change of attributes of the pages may lead to fragmentation of direct mapping
 over time and performance degradation when these pages contain executable
 code. Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taB1n-0000wd-4w
Subject: [Kgdb-bugreport] [PATCH v2 03/10] x86/mm/pat: restore large ROX
 pages after fragmentation
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

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Change of attributes of the pages may lead to fragmentation of direct
mapping over time and performance degradation when these pages contain
executable code.

With current code it's one way road: kernel tries to avoid splitting
large pages, but it doesn't restore them back even if page attributes
got compatible again.

Any change to the mapping may potentially allow to restore large page.

Add a hook to cpa_flush() path that will check if the pages in the range
that were just touched can be mapped at PMD level. If the collapse at the
PMD level succeeded, also attempt to collapse PUD level.

The collapse logic runs only when a set_memory_ method explicitly sets
CPA_COLLAPSE flag, for now this is only enabled in set_memory_rox().

CPUs don't like[1] to have to have TLB entries of different size for the
same memory, but looks like it's okay as long as these entries have
matching attributes[2]. Therefore it's critical to flush TLB before any
following changes to the mapping.

Note that we already allow for multiple TLB entries of different sizes
for the same memory now in split_large_page() path. It's not a new
situation.

set_memory_4k() provides a way to use 4k pages on purpose. Kernel must
not remap such pages as large. Re-use one of software PTE bits to
indicate such pages.

[1] See Erratum 383 of AMD Family 10h Processors
[2] https://lore.kernel.org/linux-mm/1da1b025-cabc-6f04-bde5-e50830d1ecf0@amd.com/

[rppt@kernel.org:
 * s/restore/collapse/
 * update formatting per peterz
 * use 'struct ptdesc' instead of 'struct page' for list of page tables to
   be freed
 * try to collapse PMD first and if it succeeds move on to PUD as peterz
   suggested
 * flush TLB twice: for changes done in the original CPA call and after
   collapsing of large pages
 * update commit message
]

Link: https://lore.kernel.org/all/20200416213229.19174-1-kirill.shutemov@linux.intel.com
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/pgtable_types.h |   2 +
 arch/x86/mm/pat/set_memory.c         | 217 ++++++++++++++++++++++++++-
 include/linux/vm_event_item.h        |   2 +
 mm/vmstat.c                          |   2 +
 4 files changed, 219 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 4b804531b03c..c90e9c51edb7 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -33,6 +33,7 @@
 #define _PAGE_BIT_CPA_TEST	_PAGE_BIT_SOFTW1
 #define _PAGE_BIT_UFFD_WP	_PAGE_BIT_SOFTW2 /* userfaultfd wrprotected */
 #define _PAGE_BIT_SOFT_DIRTY	_PAGE_BIT_SOFTW3 /* software dirty tracking */
+#define _PAGE_BIT_KERNEL_4K	_PAGE_BIT_SOFTW3 /* page must not be converted to large */
 #define _PAGE_BIT_DEVMAP	_PAGE_BIT_SOFTW4
 
 #ifdef CONFIG_X86_64
@@ -64,6 +65,7 @@
 #define _PAGE_PAT_LARGE (_AT(pteval_t, 1) << _PAGE_BIT_PAT_LARGE)
 #define _PAGE_SPECIAL	(_AT(pteval_t, 1) << _PAGE_BIT_SPECIAL)
 #define _PAGE_CPA_TEST	(_AT(pteval_t, 1) << _PAGE_BIT_CPA_TEST)
+#define _PAGE_KERNEL_4K	(_AT(pteval_t, 1) << _PAGE_BIT_KERNEL_4K)
 #ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
 #define _PAGE_PKEY_BIT0	(_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT0)
 #define _PAGE_PKEY_BIT1	(_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT1)
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index d43b919b11ae..18c233048706 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -75,6 +75,7 @@ static DEFINE_SPINLOCK(cpa_lock);
 #define CPA_ARRAY 2
 #define CPA_PAGES_ARRAY 4
 #define CPA_NO_CHECK_ALIAS 8 /* Do not search for aliases */
+#define CPA_COLLAPSE 16 /* try to collapse large pages */
 
 static inline pgprot_t cachemode2pgprot(enum page_cache_mode pcm)
 {
@@ -107,6 +108,18 @@ static void split_page_count(int level)
 	direct_pages_count[level - 1] += PTRS_PER_PTE;
 }
 
+static void collapse_page_count(int level)
+{
+	direct_pages_count[level]++;
+	if (system_state == SYSTEM_RUNNING) {
+		if (level == PG_LEVEL_2M)
+			count_vm_event(DIRECT_MAP_LEVEL2_COLLAPSE);
+		else if (level == PG_LEVEL_1G)
+			count_vm_event(DIRECT_MAP_LEVEL3_COLLAPSE);
+	}
+	direct_pages_count[level - 1] -= PTRS_PER_PTE;
+}
+
 void arch_report_meminfo(struct seq_file *m)
 {
 	seq_printf(m, "DirectMap4k:    %8lu kB\n",
@@ -124,6 +137,7 @@ void arch_report_meminfo(struct seq_file *m)
 }
 #else
 static inline void split_page_count(int level) { }
+static inline void collapse_page_count(int level) { }
 #endif
 
 #ifdef CONFIG_X86_CPA_STATISTICS
@@ -396,6 +410,40 @@ static void __cpa_flush_tlb(void *data)
 		flush_tlb_one_kernel(fix_addr(__cpa_addr(cpa, i)));
 }
 
+static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
+
+static void cpa_collapse_large_pages(struct cpa_data *cpa)
+{
+	unsigned long start, addr, end;
+	struct ptdesc *ptdesc, *tmp;
+	LIST_HEAD(pgtables);
+	int collapsed = 0;
+	int i;
+
+	if (cpa->flags & (CPA_PAGES_ARRAY | CPA_ARRAY)) {
+		for (i = 0; i < cpa->numpages; i++)
+			collapsed += collapse_large_pages(__cpa_addr(cpa, i),
+							  &pgtables);
+	} else {
+		addr = __cpa_addr(cpa, 0);
+		start = addr & PMD_MASK;
+		end = addr + PAGE_SIZE * cpa->numpages;
+
+		for (addr = start; within(addr, start, end); addr += PMD_SIZE)
+			collapsed += collapse_large_pages(addr, &pgtables);
+	}
+
+	if (!collapsed)
+		return;
+
+	flush_tlb_all();
+
+	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
+		list_del(&ptdesc->pt_list);
+		__free_page(ptdesc_page(ptdesc));
+	}
+}
+
 static void cpa_flush(struct cpa_data *cpa, int cache)
 {
 	unsigned int i;
@@ -404,7 +452,7 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 
 	if (cache && !static_cpu_has(X86_FEATURE_CLFLUSH)) {
 		cpa_flush_all(cache);
-		return;
+		goto collapse_large_pages;
 	}
 
 	if (cpa->force_flush_all || cpa->numpages > tlb_single_page_flush_ceiling)
@@ -413,7 +461,7 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 		on_each_cpu(__cpa_flush_tlb, cpa, 1);
 
 	if (!cache)
-		return;
+		goto collapse_large_pages;
 
 	mb();
 	for (i = 0; i < cpa->numpages; i++) {
@@ -429,6 +477,10 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 			clflush_cache_range_opt((void *)fix_addr(addr), PAGE_SIZE);
 	}
 	mb();
+
+collapse_large_pages:
+	if (cpa->flags & CPA_COLLAPSE)
+		cpa_collapse_large_pages(cpa);
 }
 
 static bool overlaps(unsigned long r1_start, unsigned long r1_end,
@@ -1198,6 +1250,161 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 	return 0;
 }
 
+static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
+			     struct list_head *pgtables)
+{
+	pmd_t _pmd, old_pmd;
+	pte_t *pte, first;
+	unsigned long pfn;
+	pgprot_t pgprot;
+	int i = 0;
+
+	addr &= PMD_MASK;
+	pte = pte_offset_kernel(pmd, addr);
+	first = *pte;
+	pfn = pte_pfn(first);
+
+	/* Make sure alignment is suitable */
+	if (PFN_PHYS(pfn) & ~PMD_MASK)
+		return 0;
+
+	/* The page is 4k intentionally */
+	if (pte_flags(first) & _PAGE_KERNEL_4K)
+		return 0;
+
+	/* Check that the rest of PTEs are compatible with the first one */
+	for (i = 1, pte++; i < PTRS_PER_PTE; i++, pte++) {
+		pte_t entry = *pte;
+
+		if (!pte_present(entry))
+			return 0;
+		if (pte_flags(entry) != pte_flags(first))
+			return 0;
+		if (pte_pfn(entry) != pte_pfn(first) + i)
+			return 0;
+	}
+
+	old_pmd = *pmd;
+
+	/* Success: set up a large page */
+	pgprot = pgprot_4k_2_large(pte_pgprot(first));
+	pgprot_val(pgprot) |= _PAGE_PSE;
+	_pmd = pfn_pmd(pfn, pgprot);
+	set_pmd(pmd, _pmd);
+
+	/* Queue the page table to be freed after TLB flush */
+	list_add(&page_ptdesc(pmd_page(old_pmd))->pt_list, pgtables);
+
+	if (IS_ENABLED(CONFIG_X86_32) && !SHARED_KERNEL_PMD) {
+		struct page *page;
+
+		/* Update all PGD tables to use the same large page */
+		list_for_each_entry(page, &pgd_list, lru) {
+			pgd_t *pgd = (pgd_t *)page_address(page) + pgd_index(addr);
+			p4d_t *p4d = p4d_offset(pgd, addr);
+			pud_t *pud = pud_offset(p4d, addr);
+			pmd_t *pmd = pmd_offset(pud, addr);
+			/* Something is wrong if entries doesn't match */
+			if (WARN_ON(pmd_val(old_pmd) != pmd_val(*pmd)))
+				continue;
+			set_pmd(pmd, _pmd);
+		}
+	}
+
+	if (virt_addr_valid(addr) && pfn_range_is_mapped(pfn, pfn + 1))
+		collapse_page_count(PG_LEVEL_2M);
+
+	return 1;
+}
+
+static int collapse_pud_page(pud_t *pud, unsigned long addr,
+			     struct list_head *pgtables)
+{
+	unsigned long pfn;
+	pmd_t *pmd, first;
+	int i;
+
+	if (!direct_gbpages)
+		return 0;
+
+	addr &= PUD_MASK;
+	pmd = pmd_offset(pud, addr);
+	first = *pmd;
+
+	/*
+	 * To restore PUD page all PMD entries must be large and
+	 * have suitable alignment
+	 */
+	pfn = pmd_pfn(first);
+	if (!pmd_leaf(first) || (PFN_PHYS(pfn) & ~PUD_MASK))
+		return 0;
+
+	/*
+	 * To restore PUD page, all following PMDs must be compatible with the
+	 * first one.
+	 */
+	for (i = 1, pmd++; i < PTRS_PER_PMD; i++, pmd++) {
+		pmd_t entry = *pmd;
+
+		if (!pmd_present(entry) || !pmd_leaf(entry))
+			return 0;
+		if (pmd_flags(entry) != pmd_flags(first))
+			return 0;
+		if (pmd_pfn(entry) != pmd_pfn(first) + i * PTRS_PER_PTE)
+			return 0;
+	}
+
+	/* Restore PUD page and queue page table to be freed after TLB flush */
+	list_add(&page_ptdesc(pud_page(*pud))->pt_list, pgtables);
+	set_pud(pud, pfn_pud(pfn, pmd_pgprot(first)));
+
+	if (virt_addr_valid(addr) && pfn_range_is_mapped(pfn, pfn + 1))
+		collapse_page_count(PG_LEVEL_1G);
+
+	return 1;
+}
+
+/*
+ * Collapse PMD and PUD pages in the kernel mapping around the address where
+ * possible.
+ *
+ * Caller must flush TLB and free page tables queued on the list before
+ * touching the new entries. CPU must not see TLB entries of different size
+ * with different attributes.
+ */
+static int collapse_large_pages(unsigned long addr, struct list_head *pgtables)
+{
+	int collapsed = 0;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	addr &= PMD_MASK;
+
+	spin_lock(&pgd_lock);
+	pgd = pgd_offset_k(addr);
+	if (pgd_none(*pgd))
+		goto out;
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d))
+		goto out;
+	pud = pud_offset(p4d, addr);
+	if (!pud_present(*pud) || pud_leaf(*pud))
+		goto out;
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(*pmd) || pmd_leaf(*pmd))
+		goto out;
+
+	collapsed = collapse_pmd_page(pmd, addr, pgtables);
+	if (collapsed)
+		collapsed += collapse_pud_page(pud, addr, pgtables);
+
+out:
+	spin_unlock(&pgd_lock);
+	return collapsed;
+}
+
 static bool try_to_free_pte_page(pte_t *pte)
 {
 	int i;
@@ -2121,7 +2328,8 @@ int set_memory_rox(unsigned long addr, int numpages)
 	if (__supported_pte_mask & _PAGE_NX)
 		clr.pgprot |= _PAGE_NX;
 
-	return change_page_attr_clear(&addr, numpages, clr, 0);
+	return change_page_attr_set_clr(&addr, numpages, __pgprot(0), clr, 0,
+					CPA_COLLAPSE, NULL);
 }
 
 int set_memory_rw(unsigned long addr, int numpages)
@@ -2148,7 +2356,8 @@ int set_memory_p(unsigned long addr, int numpages)
 
 int set_memory_4k(unsigned long addr, int numpages)
 {
-	return change_page_attr_set_clr(&addr, numpages, __pgprot(0),
+	return change_page_attr_set_clr(&addr, numpages,
+					__pgprot(_PAGE_KERNEL_4K),
 					__pgprot(0), 1, 0, NULL);
 }
 
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index f70d0958095c..5a37cb2b6f93 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -151,6 +151,8 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 #ifdef CONFIG_X86
 		DIRECT_MAP_LEVEL2_SPLIT,
 		DIRECT_MAP_LEVEL3_SPLIT,
+		DIRECT_MAP_LEVEL2_COLLAPSE,
+		DIRECT_MAP_LEVEL3_COLLAPSE,
 #endif
 #ifdef CONFIG_PER_VMA_LOCK_STATS
 		VMA_LOCK_SUCCESS,
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 16bfe1c694dd..88998725f1c5 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1435,6 +1435,8 @@ const char * const vmstat_text[] = {
 #ifdef CONFIG_X86
 	"direct_map_level2_splits",
 	"direct_map_level3_splits",
+	"direct_map_level2_collapses",
+	"direct_map_level3_collapses",
 #endif
 #ifdef CONFIG_PER_VMA_LOCK_STATS
 	"vma_lock_success",
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
