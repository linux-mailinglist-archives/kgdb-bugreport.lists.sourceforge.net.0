Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C112A1C6D3
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 26 Jan 2025 08:49:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbxOV-0002Pj-Q7
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 26 Jan 2025 07:49:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tbxOQ-0002On-2S
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 26 Jan 2025 07:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NfiOldQuoBsOca6bai8743RJBuvry8sUliN14rP7yPw=; b=BXby3+vHrgZ9rEelcN0eFvqk2N
 NqUcxXupqEBn9vZW5VjJZFrGPWcTn9yTUVPPMZeYQE4P9bXZDjJgr5NArKGiwL+lRLQmCbHBhvdJV
 MfsyiSDA4PEzwLJhgZlIIMyH2qn4oLOKtXVOH7+07ZEp+hUjlc8qGTnlLduIEmuuby8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NfiOldQuoBsOca6bai8743RJBuvry8sUliN14rP7yPw=; b=X2/fTW0rFhh88HGAyNbkCf61Qh
 C6nwRJ2UgygHeeTA1TQaDUZHqH9deZ1yt3cntRkS6z6i1RApAEMcdkf91R+8DS/OkR+CoWvGvhOpW
 YCUacghtl45h/6PgPiPqU/+lBKLmXDQiClF5h8EGswdLkb+anrTWVgfDoOyv5jGumSQs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbxO2-0001wa-Nx for kgdb-bugreport@lists.sourceforge.net;
 Sun, 26 Jan 2025 07:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D9144A4023F;
 Sun, 26 Jan 2025 07:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01143C4CEE1;
 Sun, 26 Jan 2025 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737877723;
 bh=mjWwPz12D8IuXSas4rcsP8ghTqzzxxLYwZNdxRHbGuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L7WS+xrD8siDHHKIewMcy4VDu761ztpMzjAypCJJ2WsNTWgjM3mc6GgvHmJQlqhBk
 OnkGkuyPc9CJKE6wqSVz9q5vArEIkaAs95yYliIfUZrn60Z6kTJscKscpbt5txLhM7
 cRTNesO6U4XLYOzbbXL0WlzgBkPKBKmlhy1tx1WSfpBDU7tSNQU9viL0l7X9MIM9uF
 cCfiOh26vaEB3Y9WpnrWOn86FsEiN31h+IvXpdqwTTQkykeWsOiCKoiH9f2lYv4AzZ
 dbMj3rG/xphiE5ifXHBrt7di3cQmP1Y9JQNoeT88cxV+Hbw4MXvC0Z6tQxVLYsexB6
 xRwqH+ad+TyqA==
To: x86@kernel.org
Date: Sun, 26 Jan 2025 09:47:29 +0200
Message-ID: <20250126074733.1384926-6-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250126074733.1384926-1-rppt@kernel.org>
References: <20250126074733.1384926-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> Using
 a writable copy for ROX memory is cumbersome and error prone. Add API that
 allow temporarily remapping of ranges in the ROX cache as writable and then
 restoring their read-only-execute permissions. 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbxO2-0001wa-Nx
Subject: [Kgdb-bugreport] [PATCH v3 5/9] execmem: add API for temporal
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

Using a writable copy for ROX memory is cumbersome and error prone.

Add API that allow temporarily remapping of ranges in the ROX cache as
writable  and then restoring their read-only-execute permissions.

This API will be later used in modules code and will allow removing nasty
games with writable copy in alternatives patching on x86.

The restoring of the ROX permissions relies on the ability of architecture
to reconstruct large pages in its set_memory_rox() method.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/execmem.h | 31 +++++++++++++++++++++++++++++++
 mm/execmem.c            | 22 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)

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
index 04b0bf1b5025..e6c4f5076ca8 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -335,6 +335,28 @@ static bool execmem_cache_free(void *ptr)
 
 	return true;
 }
+
+int execmem_make_temp_rw(void *ptr, size_t size)
+{
+	unsigned int nr = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	unsigned long addr = (unsigned long)ptr;
+	int ret;
+
+	ret = set_memory_nx(addr, nr);
+	if (ret)
+		return ret;
+
+	return set_memory_rw(addr, nr);
+}
+
+int execmem_restore_rox(void *ptr, size_t size)
+{
+	unsigned int nr = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	unsigned long addr = (unsigned long)ptr;
+
+	return set_memory_rox(addr, nr);
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
