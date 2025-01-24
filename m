Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD27A1B46F
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Jan 2025 12:07:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbHXC-00059l-AE
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 24 Jan 2025 11:07:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tbHXA-00059b-Md
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Jan 2025 11:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsHc0DkyTGM6Cpzq70Lj5XZc9IxktRLAdwDaGEdlVhU=; b=BIij1B/KI6mAYELAie//VzWg9r
 UdZXaRW6HXvwweV1hNVyEmquZsI8SFhLrKkO+QTiz6cmVtKW6D/KvkDd7D9Qla7jzpWnjsu88ANP2
 /FHyc2qLnMSkqkIyM3/WDonD3xAo/V8vx4IX6oCUMfPZsnSq8/9xLS1rrjFCtBtEKUcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GsHc0DkyTGM6Cpzq70Lj5XZc9IxktRLAdwDaGEdlVhU=; b=V/lR8Fjq1dPC2fE3AEBlU7wjxl
 Rw2aObMmFSjQv2v15TZp76HP0JITaLIDZt0QDiVwx1k0WnVMpttjRNCZSSrQhrW1++f0jwk/metXL
 f3k68Of/bvEWsgHJNui+ejZqeKy469HlipfmBZ3xJLaCvODvVM5hEWAqGUSsdFS5F8bw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbHX9-0007on-V8 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Jan 2025 11:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDEFD5C5DE5;
 Fri, 24 Jan 2025 11:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833FDC4CED2;
 Fri, 24 Jan 2025 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737716840;
 bh=wSfyHXcmcOSuIJyW+bb7SIJC8asuo8BMjmJ6ZKag59U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g8qJYU/pXyq687Cg0zGfUkpXlGffvuM6D0jtxkliKJACp5JlMojm1GDrNE8vwkQHh
 QhQ6ovm02lHCCSi4Q+bICN5Ri53ztGf22K3e0skaJ4pRVYXnu3siPiddwrn71c1YpM
 keFYn5AIrov0gSoot4RZ0oOIf/s0nFcQ/mMYx6r53nKF2FyEV8e+apGJAN5yv5UYhI
 nIw+SIrFrRkO/Gzpy0loesaORzuJhjgA3nl3p1C1IHchkGMB2VNwUZ4rQfDyfRcmKr
 FqCOto/w0cN/rIRN+Pw1dI1+KtqsXHjMG2qvVSJC18R98+nJwFyTMBLA5ebT7cyqm7
 eo4aCP4xXm6ZA==
Date: Fri, 24 Jan 2025 13:06:57 +0200
To: Petr Pavlu <petr.pavlu@suse.com>
Message-ID: <Z5N0UVLTJrrK8evM@kernel.org>
References: <20250121095739.986006-1-rppt@kernel.org>
 <20250121095739.986006-7-rppt@kernel.org>
 <4a9ca024-fc25-4fe0-94d5-65899b2cec6b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a9ca024-fc25-4fe0-94d5-65899b2cec6b@suse.com>
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 23, 2025 at 03:16:28PM +0100, Petr Pavlu wrote:
 > On 1/21/25 10:57, Mike Rapoport wrote: > > In order to use execmem's API
 for temporal remapping of the memory > > allocated from ROX cache [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbHX9-0007on-V8
Subject: Re: [Kgdb-bugreport] [PATCH v2 06/10] module: introduce
 MODULE_STATE_GONE
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Daniel Thompson <danielt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-trace-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Gomez <da.gomez@samsung.com>, Borislav Petkov <bp@alien8.de>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, kunit-dev@googlegroups.com,
 Song Liu <song@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jan 23, 2025 at 03:16:28PM +0100, Petr Pavlu wrote:
> On 1/21/25 10:57, Mike Rapoport wrote:
> > In order to use execmem's API for temporal remapping of the memory
> > allocated from ROX cache as writable, there is a need to distinguish
> > between the state when the module is being formed and the state when it is
> > deconstructed and freed so that when module_memory_free() is called from
> > error paths during module loading it could restore ROX mappings.
> > 
> > Replace open coded checks for MODULE_STATE_UNFORMED with a helper
> > function module_is_formed() and add a new MODULE_STATE_GONE that will be
> > set when the module is deconstructed and freed.
> 
> I don't fully follow why this case requires a new module state. My
> understanding it that the function load_module() has the necessary
> context that after calling layout_and_allocate(), the updated ROX
> mappings need to be restored. I would then expect the function to be
> appropriately able to unwind this operation in case of an error. It
> could be done by having a helper that walks the mappings and calls
> execmem_restore_rox(), or if you want to keep it in module_memory_free()
> as done in the patch #7 then a flag could be passed down to
> module_deallocate() -> free_mod_mem() -> module_memory_free()?

Initially I wanted to track ROX <-> RW transitions in struct module_memory
so that module_memory_free() could do the right thing depending on memory
state. But that meant either ugly games with const'ness in strict_rwx.c,
an additional helper or a new global module state. The latter seemed the
most elegant to me.
If a new global module state is really that intrusive, I can drop it in
favor a helper that will be called from error handling paths. E.g.
something like the patch below (on top of this series and with this patch
reverted)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 7164cd353a78..4a02503836d7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1268,13 +1268,20 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	return 0;
 }
 
+static void module_memory_restore_rox(struct module *mod)
+{
+	for_class_mod_mem_type(type, text) {
+		struct module_memory *mem = &mod->mem[type];
+
+		if (mem->is_rox)
+			execmem_restore_rox(mem->base, mem->size);
+	}
+}
+
 static void module_memory_free(struct module *mod, enum mod_mem_type type)
 {
 	struct module_memory *mem = &mod->mem[type];
 
-	if (mod->state == MODULE_STATE_UNFORMED && mem->is_rox)
-		execmem_restore_rox(mem->base, mem->size);
-
 	execmem_free(mem->base);
 }
 
@@ -2617,6 +2624,7 @@ static int move_module(struct module *mod, struct load_info *info)
 
 	return 0;
 out_err:
+	module_memory_restore_rox(mod);
 	for (t--; t >= 0; t--)
 		module_memory_free(mod, t);
 	if (codetag_section_found)
@@ -3372,6 +3380,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 				       mod->mem[type].size);
 	}
 
+	module_memory_restore_rox(mod);
 	module_deallocate(mod, info);
  free_copy:
 	/*
 
> It is at least good that MODULE_STATE_GONE is only set in free_module()
> past the sysfs teardown, so it never shows in
> /sys/module/<mod>/initstate. Otherwise, this would require teaching kmod
> about this state as well.
> 
> -- 
> Thanks,
> Petr

-- 
Sincerely yours,
Mike.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
