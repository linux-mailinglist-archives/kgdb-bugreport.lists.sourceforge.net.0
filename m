Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 666899FD144
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 27 Dec 2024 08:29:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tR4mt-0006BH-Fy
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 27 Dec 2024 07:29:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tR4mr-0006B9-4q
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2g+SxczDYlrf43JjC8UJiDwBf+Z9UmJvZ80gCTVUkgY=; b=fj6YSc+kY3GTuwgE31Rq80bV6o
 w/jbdJOjcmIPToJjf5bjbfE3nO7mySLWlzpFPE+lrRHsxndPV3F1GFhtwyLFjtyq+RkySajgQb84M
 XfEGo6E3KKCF2MVL9YfZ0zxpybeKUBLbwzuRbJPm/BzBQE3HdiUVVjVN+6HvJZt2hhVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2g+SxczDYlrf43JjC8UJiDwBf+Z9UmJvZ80gCTVUkgY=; b=mkB8HOBvZXBxuEijE43Gzg532u
 B4bVFxUftTafoNqJIzL6voH9HtUkiHrM6G8CuGNJSnOM7at9xufB4p/INqMVSVnV43ebDwvzkHTR6
 st39QLlj1Y3Y2jlW1Y5+Jieuu6GH0eqDiDQpoIb/ENeiw4wZT5Ru5+7G+N32m3wNlj7Q=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tR4mq-0007HB-LY for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EAFEDA41216;
 Fri, 27 Dec 2024 07:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41ABC4CED7;
 Fri, 27 Dec 2024 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735284566;
 bh=eadd2fhesnrBbYUtyPuDOjZKluNBdPkoQ6My17z11ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V7rL/1CgjCZvQAHg7NIcED5Na02EGjDigmzncnfAGdsE4oPXN9GFMNUqOgGKcIAxK
 hSznXGjRdJakuaXWQ8k1hzlFSbmpLCpkjLNAHE9LAlkf8Pyn2im17Lax3zToCNnlDO
 sF35OhD0vR+mDq6BWIXP/rORjFkoB2OmxqrXTUnH03R297ViXYi/DxGzjgG/PiNdu0
 UHjn6xvvqWwhXwUiJ2EvGaz72tB1oOF/eaVLHsZ/Slq/nm9qigaXwYR1thVtB6yGTd
 HfkagPFgCDXBJAQttID2sWzOm9fw+FJoE9uewLZw8sH2jQV7a2Ah68AXl/hMetNBpC
 0CKPg/BqE8lzg==
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 27 Dec 2024 09:28:21 +0200
Message-ID: <20241227072825.1288491-5-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241227072825.1288491-1-rppt@kernel.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> Using
 a writable copy for ROX memory is cumbersome and error prone. Add API that
 allow temporarily remapping of ranges in the ROX cache as writable and then
 restoring their read-only-execute permissions. 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tR4mq-0007HB-LY
Subject: [Kgdb-bugreport] [PATCH 4/8] execmem: add API for temporal
 remapping as RW and restoring ROX afterwards
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
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Daniel Thompson <danielt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-trace-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Jiri Kosina <jikos@kernel.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Daniel Gomez <da.gomez@samsung.com>,
 Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 kunit-dev@googlegroups.com, Song Liu <song@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Using a writable copy for ROX memory is cumbersome and error prone.

Add API that allow temporarily remapping of ranges in the ROX cache as
writable  and then restoring their read-only-execute permissions.

This API will be later used in modules code and will allow removing nasty
games with writable copy in alternatives patching on x86.

The restoring of the ROX permissions relies on the ability of architecture
to reconstruct large pages in its set_memory_rox() method.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/execmem.h |  31 +++++++++++
 mm/execmem.c            | 118 +++++++++++++++++++++++++++++++++-------
 2 files changed, 130 insertions(+), 19 deletions(-)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 64130ae19690..65655a5d1be2 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -65,6 +65,37 @@ enum execmem_range_flags {
  * Architectures that use EXECMEM_ROX_CACHE must implement this.
  */
 void execmem_fill_trapping_insns(void *ptr, size_t size, bool writable);
+
+/**
+ * execmem_make_temp_rw - temporarily remap region with read-write
+ *			  permissions
+ * @ptr:	address of the region to remap
+ * @size:	size of the region to remap
+ *
+ * Remaps a part of the cached large page in the ROX cache in the range
+ * [@ptr, @ptr + @size) as writable and not executable. The caller must
+ * have exclusive ownership of this range and ensure nothing will try to
+ * execute code in this range.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int execmem_make_temp_rw(void *ptr, size_t size);
+
+/**
+ * execmem_restore_rox - restore read-only-execute permissions
+ * @ptr:	address of the region to remap
+ * @size:	size of the region to remap
+ *
+ * Restores read-only-execute permissions on a range [@ptr, @ptr + @size)
+ * after it was temporarily remapped as writable. Relies on architecture
+ * implementation of set_memory_rox() to restore mapping using large pages.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int execmem_restore_rox(void *ptr, size_t size);
+#else
+static inline int execmem_make_temp_rw(void *ptr, size_t size) { return 0; }
+static inline int execmem_restore_rox(void *ptr, size_t size) { return 0; }
 #endif
 
 /**
diff --git a/mm/execmem.c b/mm/execmem.c
index 317b6a8d35be..be6b234c032e 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -89,6 +89,12 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
 #endif /* CONFIG_MMU */
 
 #ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
+struct execmem_area {
+	struct vm_struct *vm;
+	unsigned int rw_mappings;
+	size_t size;
+};
+
 struct execmem_cache {
 	struct mutex mutex;
 	struct maple_tree busy_areas;
@@ -135,7 +141,7 @@ static void execmem_cache_clean(struct work_struct *work)
 	struct maple_tree *free_areas = &execmem_cache.free_areas;
 	struct mutex *mutex = &execmem_cache.mutex;
 	MA_STATE(mas, free_areas, 0, ULONG_MAX);
-	void *area;
+	struct execmem_area *area;
 
 	mutex_lock(mutex);
 	mas_for_each(&mas, area, ULONG_MAX) {
@@ -143,11 +149,12 @@ static void execmem_cache_clean(struct work_struct *work)
 
 		if (IS_ALIGNED(size, PMD_SIZE) &&
 		    IS_ALIGNED(mas.index, PMD_SIZE)) {
-			struct vm_struct *vm = find_vm_area(area);
+			struct vm_struct *vm = area->vm;
 
 			execmem_set_direct_map_valid(vm, true);
 			mas_store_gfp(&mas, NULL, GFP_KERNEL);
-			vfree(area);
+			vfree(vm->addr);
+			kfree(area);
 		}
 	}
 	mutex_unlock(mutex);
@@ -155,30 +162,31 @@ static void execmem_cache_clean(struct work_struct *work)
 
 static DECLARE_WORK(execmem_cache_clean_work, execmem_cache_clean);
 
-static int execmem_cache_add(void *ptr, size_t size)
+static int execmem_cache_add(void *ptr, size_t size, struct execmem_area *area)
 {
 	struct maple_tree *free_areas = &execmem_cache.free_areas;
 	struct mutex *mutex = &execmem_cache.mutex;
 	unsigned long addr = (unsigned long)ptr;
 	MA_STATE(mas, free_areas, addr - 1, addr + 1);
+	struct execmem_area *lower_area = NULL;
+	struct execmem_area *upper_area = NULL;
 	unsigned long lower, upper;
-	void *area = NULL;
 	int err;
 
 	lower = addr;
 	upper = addr + size - 1;
 
 	mutex_lock(mutex);
-	area = mas_walk(&mas);
-	if (area && mas.last == addr - 1)
+	lower_area = mas_walk(&mas);
+	if (lower_area && lower_area == area && mas.last == addr - 1)
 		lower = mas.index;
 
-	area = mas_next(&mas, ULONG_MAX);
-	if (area && mas.index == addr + size)
+	upper_area = mas_next(&mas, ULONG_MAX);
+	if (upper_area && upper_area == area && mas.index == addr + size)
 		upper = mas.last;
 
 	mas_set_range(&mas, lower, upper);
-	err = mas_store_gfp(&mas, (void *)lower, GFP_KERNEL);
+	err = mas_store_gfp(&mas, area, GFP_KERNEL);
 	mutex_unlock(mutex);
 	if (err)
 		return err;
@@ -209,7 +217,8 @@ static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
 	MA_STATE(mas_busy, busy_areas, 0, ULONG_MAX);
 	struct mutex *mutex = &execmem_cache.mutex;
 	unsigned long addr, last, area_size = 0;
-	void *area, *ptr = NULL;
+	struct execmem_area *area;
+	void *ptr = NULL;
 	int err;
 
 	mutex_lock(mutex);
@@ -228,20 +237,18 @@ static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
 
 	/* insert allocated size to busy_areas at range [addr, addr + size) */
 	mas_set_range(&mas_busy, addr, addr + size - 1);
-	err = mas_store_gfp(&mas_busy, (void *)addr, GFP_KERNEL);
+	err = mas_store_gfp(&mas_busy, area, GFP_KERNEL);
 	if (err)
 		goto out_unlock;
 
 	mas_store_gfp(&mas_free, NULL, GFP_KERNEL);
 	if (area_size > size) {
-		void *ptr = (void *)(addr + size);
-
 		/*
 		 * re-insert remaining free size to free_areas at range
 		 * [addr + size, last]
 		 */
 		mas_set_range(&mas_free, addr + size, last);
-		err = mas_store_gfp(&mas_free, ptr, GFP_KERNEL);
+		err = mas_store_gfp(&mas_free, area, GFP_KERNEL);
 		if (err) {
 			mas_store_gfp(&mas_busy, NULL, GFP_KERNEL);
 			goto out_unlock;
@@ -257,16 +264,21 @@ static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
 static int execmem_cache_populate(struct execmem_range *range, size_t size)
 {
 	unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
+	struct execmem_area *area;
 	unsigned long start, end;
 	struct vm_struct *vm;
 	size_t alloc_size;
 	int err = -ENOMEM;
 	void *p;
 
+	area = kzalloc(sizeof(*area), GFP_KERNEL);
+	if (!area)
+		return err;
+
 	alloc_size = round_up(size, PMD_SIZE);
 	p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
 	if (!p)
-		return err;
+		goto err_free_area;
 
 	vm = find_vm_area(p);
 	if (!vm)
@@ -289,7 +301,9 @@ static int execmem_cache_populate(struct execmem_range *range, size_t size)
 	if (err)
 		goto err_free_mem;
 
-	err = execmem_cache_add(p, alloc_size);
+	area->size = alloc_size;
+	area->vm = vm;
+	err = execmem_cache_add(p, alloc_size, area);
 	if (err)
 		goto err_free_mem;
 
@@ -297,6 +311,8 @@ static int execmem_cache_populate(struct execmem_range *range, size_t size)
 
 err_free_mem:
 	vfree(p);
+err_free_area:
+	kfree(area);
 	return err;
 }
 
@@ -305,6 +321,9 @@ static void *execmem_cache_alloc(struct execmem_range *range, size_t size)
 	void *p;
 	int err;
 
+	/* make sure everything in the cache is page aligned */
+	size = PAGE_ALIGN(size);
+
 	p = __execmem_cache_alloc(range, size);
 	if (p)
 		return p;
@@ -322,8 +341,8 @@ static bool execmem_cache_free(void *ptr)
 	struct mutex *mutex = &execmem_cache.mutex;
 	unsigned long addr = (unsigned long)ptr;
 	MA_STATE(mas, busy_areas, addr, addr);
+	struct execmem_area *area;
 	size_t size;
-	void *area;
 
 	mutex_lock(mutex);
 	area = mas_walk(&mas);
@@ -338,12 +357,73 @@ static bool execmem_cache_free(void *ptr)
 
 	execmem_fill_trapping_insns(ptr, size, /* writable = */ false);
 
-	execmem_cache_add(ptr, size);
+	execmem_cache_add(ptr, size, area);
 
 	schedule_work(&execmem_cache_clean_work);
 
 	return true;
 }
+
+int execmem_make_temp_rw(void *ptr, size_t size)
+{
+	struct maple_tree *busy_areas = &execmem_cache.busy_areas;
+	unsigned int nr = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	struct mutex *mutex = &execmem_cache.mutex;
+	unsigned long addr = (unsigned long)ptr;
+	MA_STATE(mas, busy_areas, addr, addr);
+	struct execmem_area *area;
+	int ret = -ENOMEM;
+
+	mutex_lock(mutex);
+	area = mas_walk(&mas);
+	if (!area)
+		goto out;
+
+	ret = set_memory_nx(addr, nr);
+	if (ret)
+		goto out;
+
+	/*
+	 * If a split of large page was required, it already happened when
+	 * we marked the pages NX which guarantees that this call won't
+	 * fail
+	 */
+	set_memory_rw(addr, nr);
+	area->rw_mappings++;
+
+out:
+	mutex_unlock(mutex);
+	return ret;
+}
+
+int execmem_restore_rox(void *ptr, size_t size)
+{
+	struct maple_tree *busy_areas = &execmem_cache.busy_areas;
+	struct mutex *mutex = &execmem_cache.mutex;
+	unsigned long addr = (unsigned long)ptr;
+	MA_STATE(mas, busy_areas, addr, addr);
+	struct execmem_area *area;
+	int err = 0;
+
+	size = PAGE_ALIGN(size);
+
+	mutex_lock(mutex);
+	mas_for_each(&mas, area, addr + size - 1) {
+		area->rw_mappings--;
+		if (!area->rw_mappings) {
+			unsigned int nr = area->size >> PAGE_SHIFT;
+
+			addr = (unsigned long)area->vm->addr;
+			err = set_memory_rox(addr, nr);
+			if (err)
+				break;
+		}
+	}
+	mutex_unlock(mutex);
+
+	return err;
+}
+
 #else /* CONFIG_ARCH_HAS_EXECMEM_ROX */
 static void *execmem_cache_alloc(struct execmem_range *range, size_t size)
 {
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
