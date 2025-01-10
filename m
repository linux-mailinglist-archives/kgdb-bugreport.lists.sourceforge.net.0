Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1490A09BB9
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jan 2025 20:18:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tWKWt-0001DH-NV
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 10 Jan 2025 19:18:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@kernel.org>) id 1tWKWt-0001DB-0j
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 10 Jan 2025 19:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MmNW7y3eqsd92Gzg8gEtV3OkdUAt4QIGvUyRb4/YY3Y=; b=IJPekb06xMRox6Xmhl6q8a70mt
 bQlCBT6i6U2DLlsEV1wGgeSoW3umpDKBILos4WaeD5c1yawLOWXR5hewbjaL1Qnrark7yDKqQfFyW
 CxLIVDQYesMcqTrJsgtK3jzwIIYNlsXVciNZltbZqKR6rUPQGdhkwKk7GzuTq+klxzWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MmNW7y3eqsd92Gzg8gEtV3OkdUAt4QIGvUyRb4/YY3Y=; b=Nn8Ft6run1oWbVg0s8p9IJigCc
 ALtpQkpIpgbOCZtK9HbBHOFP0wcPeLhMmD/Idd7IEehtikERuGBBCiTLqHoM1ejAiVJonC1QFpKVP
 GS7svKWpDe1zcL2BGkbFBg9uq/cUQUOh2AeqgrRrUjNIRxXsS3sjRUYIyoiNzxgMEfGw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tWKWs-0004eQ-8w for kgdb-bugreport@lists.sourceforge.net;
 Fri, 10 Jan 2025 19:18:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8EF1EA4292D;
 Fri, 10 Jan 2025 19:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2BDC4CED6;
 Fri, 10 Jan 2025 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736536714;
 bh=2qtn/yN8KGnvKM4Be6ymIMRepfChNk260BsIzmavFNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lVSbNBfBgiPxfs3j9J4+Q/Mm+va0HnyJJvJ511BIZPHoPIheFgi517TCooWsbBMUd
 WSTmKdJWe1UfTSlATsW95ACeJ+2Ll0h4BtuuaSFwVIFk0Wv0zZu3LZGeJRFeQJn0qe
 lg2p9xQs3O5V2HOaVWmRlOJx02Yzw7s7vpvz4fokLmZ7ey61g0GQZuRvribH6nHyqr
 xDH3Wpe0L5t74rdpA5UINqI4Hxxsp6lB+b5KVRB/rten4cAybUcKdl/88Oc2pCe2TE
 6b7kfjQEJbS5HJyWvsAtyyHoKwfXfP3N4KXgVgUwkJm645MDTdxDa3wPAeEVyf6U26
 meOgl0uiogQDw==
Date: Fri, 10 Jan 2025 11:18:32 -0800
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Message-ID: <Z4FyiALKwX-AIWtF@bombadil.infradead.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
 <20241227072825.1288491-4-rppt@kernel.org>
 <jut35igb2kstpz24apqdeubv5rvyl3vmp2s43xtivpz54uiedj@wmd2onulv4xw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jut35igb2kstpz24apqdeubv5rvyl3vmp2s43xtivpz54uiedj@wmd2onulv4xw>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 10, 2025 at 12:36:59PM +0200, Kirill A. Shutemov
 wrote: > On Fri, Dec 27, 2024 at 09:28:20AM +0200, Mike Rapoport wrote: >
 > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> > [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tWKWs-0004eQ-8w
Subject: Re: [Kgdb-bugreport] [PATCH 3/8] x86/mm/pat: Restore large pages
 after fragmentation
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
From: Luis Chamberlain via Kgdb-bugreport
 <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Rae Moar <rmoar@google.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, Shuah Khan <shuah@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Daniel Thompson <danielt@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-trace-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Jiri Kosina <jikos@kernel.org>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Gomez <da.gomez@samsung.com>, Borislav Petkov <bp@alien8.de>,
 Mike Rapoport <rppt@kernel.org>, David Gow <davidgow@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 kunit-dev@googlegroups.com, Song Liu <song@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jan 10, 2025 at 12:36:59PM +0200, Kirill A. Shutemov wrote:
> On Fri, Dec 27, 2024 at 09:28:20AM +0200, Mike Rapoport wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > Change of attributes of the pages may lead to fragmentation of direct
> > mapping over time and performance degradation as result.
> > 
> > With current code it's one way road: kernel tries to avoid splitting
> > large pages, but it doesn't restore them back even if page attributes
> > got compatible again.
> > 
> > Any change to the mapping may potentially allow to restore large page.
> > 
> > Hook up into cpa_flush() path to check if there's any pages to be
> > recovered in PUD_SIZE range around pages we've just touched.
> > 
> > CPUs don't like[1] to have to have TLB entries of different size for the
> > same memory, but looks like it's okay as long as these entries have
> > matching attributes[2]. Therefore it's critical to flush TLB before any
> > following changes to the mapping.
> > 
> > Note that we already allow for multiple TLB entries of different sizes
> > for the same memory now in split_large_page() path. It's not a new
> > situation.
> > 
> > set_memory_4k() provides a way to use 4k pages on purpose. Kernel must
> > not remap such pages as large. Re-use one of software PTE bits to
> > indicate such pages.
> > 
> > [1] See Erratum 383 of AMD Family 10h Processors
> > [2] https://lore.kernel.org/linux-mm/1da1b025-cabc-6f04-bde5-e50830d1ecf0@amd.com/
> > 
> > [rppt@kernel.org:
> >  * s/restore/collapse/
> >  * update formatting per peterz
> >  * use 'struct ptdesc' instead of 'struct page' for list of page tables to
> >    be freed
> >  * try to collapse PMD first and if it succeeds move on to PUD as peterz
> >    suggested
> >  * flush TLB twice: for changes done in the original CPA call and after
> >    collapsing of large pages
> > ]
> > 
> > Link: https://lore.kernel.org/all/20200416213229.19174-1-kirill.shutemov@linux.intel.com
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> When I originally attempted this, the patch was dropped because of
> performance regressions. Was it addressed somehow?
> 

Also, the statement:

"Change of attributes of the pages may lead to fragmentation of
direct mapping over time and performance degradation as result.  "

Seems to contradict the findings reported at LSFMM by Mike before
that direct map fragmentation does not incur performance penalty,
so I don't see a point in contradicing those findings and confusing
people further.

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
