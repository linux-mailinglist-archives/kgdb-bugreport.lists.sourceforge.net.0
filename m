Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5BA20803
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Jan 2025 11:01:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tciPT-0001tQ-Fd
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 Jan 2025 10:01:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tciPR-0001tJ-VY
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Jan 2025 10:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QP7XxJ6Qr0/ecZq8j3OAaCKlA5Lvhwlpzy7j9900yC0=; b=eRZzPtEh/a27ugJplW8mVa8Qnk
 Y/bATC1dUOVL4M/TK+ER62hB7o2LmFVmgZgk+mdy0uF9E4mpzBEAmSgqZnj91PvYxLx1nbdI+OAs6
 U5jQewe2FdEHUNXiieD3KvuWgYnVQy6JuHi2y1hBvOd+MENkqjp3O1Ok9xPciMM3dGQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QP7XxJ6Qr0/ecZq8j3OAaCKlA5Lvhwlpzy7j9900yC0=; b=jO1Vx/GncNmeWxqn4PzDwjc1ef
 wRahPau1vT4GDgEC8HHKsTrlqBmnRdc34KtXtk/LOeozJeBCKFu/K+cpIGX4j61xSAxM8gizekjGD
 ub7PyKerevlebbfvPWQUeL2A1Qt+BplIaV5EueQfSOHFpIkT0Q5f5oicBrO24CNIn224=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tciPR-0007CV-AS for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Jan 2025 10:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C79005C4786;
 Tue, 28 Jan 2025 10:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0C8C4CED3;
 Tue, 28 Jan 2025 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738058478;
 bh=H+G3TtSN5z2rPg9q7jaqw3zaBc0K+irN0EUiSSVdGVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bx7V38SoAhETd9sc3qxV33PkV4fbZ9U+nWfMSuyj7aAE4t36vZLBolyqeF4nbGBta
 XbN1Q+pDjEpEFtKJHmktZXdqMYusjeXUsBpMTU7b6k5chsugMb3GDVaN7OIdra9mNc
 LgS+jr+iGKrULxB2qPNZHewWubD6EIpyvgyZNsdxQFtO0jyXH5V+jnnZUMM6ltJCFZ
 S0bl1WgjGqJhnkUL6gVfjpKxam708lIRTpj76NinsW/OGobdYd4Lb21/LvZ8ubl/cT
 FoOzOIdBgb8magf0NcV37KSZIgUUV04fADb6slWXhE+UMBFk+i/daHvsFfa4nWGW8m
 oHJUjwuGUTj7g==
Date: Tue, 28 Jan 2025 12:00:56 +0200
To: Petr Pavlu <petr.pavlu@suse.com>
Message-ID: <Z5iq2GJKIdlB9APM@kernel.org>
References: <20250126074733.1384926-1-rppt@kernel.org>
 <20250126074733.1384926-7-rppt@kernel.org>
 <021665c5-b017-415f-ad2b-0131dcc81068@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <021665c5-b017-415f-ad2b-0131dcc81068@suse.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 27, 2025 at 01:50:31PM +0100, Petr Pavlu wrote:
 > On 1/26/25 08:47, Mike Rapoport wrote: > > From: "Mike Rapoport (Microsoft)"
 <rppt@kernel.org> > > > > Instead of using writable copy for [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tciPR-0007CV-AS
Subject: Re: [Kgdb-bugreport] [PATCH v3 6/9] module: switch to execmem API
 for remapping as RW and restoring ROX
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

On Mon, Jan 27, 2025 at 01:50:31PM +0100, Petr Pavlu wrote:
> On 1/26/25 08:47, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Instead of using writable copy for module text sections, temporarily remap
> > the memory allocated from execmem's ROX cache as writable and restore its
> > ROX permissions after the module is formed.
> > 
> > This will allow removing nasty games with writable copy in alternatives
> > patching on x86.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> [...]
> 
> > +static void module_memory_restore_rox(struct module *mod)
> > +{
> > +	for_class_mod_mem_type(type, text) {
> > +		struct module_memory *mem = &mod->mem[type];
> > +
> > +		if (mem->is_rox)
> > +			execmem_restore_rox(mem->base, mem->size);
> > +	}
> > +}
> > +
> 
> Can the execmem_restore_rox() call here fail? I realize that there isn't
> much that the module loader can do if that happens, but should it be
> perhaps logged as a warning?

It won't fail at this point. set_memory APIs may fail if they need to split
a large page and could not allocate a new page table, but here all the
splits were already done at module_memory_alloc() time.
 
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
