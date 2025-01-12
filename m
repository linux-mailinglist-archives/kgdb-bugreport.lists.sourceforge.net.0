Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACBA0A7D3
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Jan 2025 09:55:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tWtkc-0004XT-0A
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 12 Jan 2025 08:55:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tWtkb-0004XL-46
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 12 Jan 2025 08:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R0zwgCtXOX9INcLxT8PUdhpiuzZmyEDq1CB3lorjDO8=; b=AGEMNHnYzmJkXPjaASG3Bre3l+
 O0yNUKbuk51i8bfBl6cL1LeC6YzqOYl/33tHyORwtSm8+FZl9zQtN1SIHjI1qV+TaURb3+xZEsgWH
 NPrZSOzatqMJvoy9xL/m2gVUjhbcpfhPErkgJgAyZT1Ku9h6oq2Aqf2kafu0Sw8xJdxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R0zwgCtXOX9INcLxT8PUdhpiuzZmyEDq1CB3lorjDO8=; b=QISVdSsvVzffu+Pa0yzw80Rf+T
 GOF1ukmu5fvfcuPK0o9792+YQB8w2jT2Tv9hZH9fXbm5LhXOlGng0HmjPo+PGeuuVZiTTe0a9McPL
 s3otlB9AH4cMrydYGU1Z2xb3lEKUnsNhBm00LaCiV8ZneHfr5W/JCmKfs43ZA9FQwjdA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tWtka-00029Q-Az for kgdb-bugreport@lists.sourceforge.net;
 Sun, 12 Jan 2025 08:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D03C5C2CB5;
 Sun, 12 Jan 2025 08:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78674C4CEDF;
 Sun, 12 Jan 2025 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736672109;
 bh=2OdLtNhpOzwVLBuyjT4Pmrh9g+J++anxIOyBzX8oFRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bt//TFsjp7oBP/+mYKotPM1CCH/pvCViP9lReiFZD2VikywkhE1q0XvAzRMYgR9w/
 rDXqF5aM9MujwGkgmdrwVN+U9S/HNKSeUhH0oeUj1JklV0TXx4lQhSwaKnFu9xce32
 ftWG7NtXr9D1Marf2RroYue+KEiHc08VUhcxsxtgtvH/1RuSspxTlk/8FfWRwTUUWL
 GQrOHNuzVf53wyl/rIxgHT4G9jfVuY7AOydTBH62p6BSjVcKmEwo1PW/k1dMtwfkJE
 pWwQqokKV7JcLsi4Ix+zyeqNEodjirjOo+JMvLDH6LUhiX+SLLVYTId1lNsII6yjXH
 ekVDGfSuma34Q==
Date: Sun, 12 Jan 2025 10:54:46 +0200
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Message-ID: <Z4ODVmnC4fDnIUSN@kernel.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
 <20241227072825.1288491-4-rppt@kernel.org>
 <jut35igb2kstpz24apqdeubv5rvyl3vmp2s43xtivpz54uiedj@wmd2onulv4xw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jut35igb2kstpz24apqdeubv5rvyl3vmp2s43xtivpz54uiedj@wmd2onulv4xw>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Kirill, On Fri, Jan 10, 2025 at 12:36:59PM +0200, Kirill
 A. Shutemov wrote: > On Fri, Dec 27, 2024 at 09:28:20AM +0200, Mike Rapoport
 wrote: > > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> >
 [...] Content analysis details:   (-5.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tWtka-00029Q-Az
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
 Joe Lawrence <joe.lawrence@redhat.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
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
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Kirill,

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

I didn't realize the patch was dropped because of performance regressions,
so I didn't address it.

Do you remember where did the regressions show up?
 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
