Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F4FA104E4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 14 Jan 2025 12:01:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tXeg4-0004Fm-Sb
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 14 Jan 2025 11:01:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tXeg3-0004Fa-4U
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 14 Jan 2025 11:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+JInSN26cxQi/MBr6S+TUtqFx1X6dz/kqWvfZ53znrY=; b=EyP9KF7V5MA7QAmpW9427NgSQO
 W9UrtuLw8inZyW2aKlUcw3wmK+SKwgLegjUclU8P4Rq/CQfEX8+XJ1TFVea18PrDVZosRTcm1bwFe
 vZbq6m3GTn4LKb8TLVwtTudQPAsgGpdcnf5tg5SNAAjsHib0m2PZ7RpfvWQwWMXpo6aU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+JInSN26cxQi/MBr6S+TUtqFx1X6dz/kqWvfZ53znrY=; b=KHNvhTu9lZ6hlhIqrLiE4pYDIQ
 X38y+6yxFCgw5nRPNXh6Hc42MhfYWEy+R/vpKR0yXRHiF88NN9nEFNThx8Va8NNvLot9NY/seanRC
 7BbAbVtOsfMhi+CR/Wj28rgkiXT3twRrThR5X+7yytV8+76C2R33XdZ/IG0E4Yhsioz0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXeg2-0005ar-4k for kgdb-bugreport@lists.sourceforge.net;
 Tue, 14 Jan 2025 11:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A4A2A41273;
 Tue, 14 Jan 2025 10:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165CBC4CEDD;
 Tue, 14 Jan 2025 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736852491;
 bh=mbHS99/jEJpIbZomuQgs7L8z3N8P/BZq6eKT12MfMQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MI/OnrdpyPjreb29TH1K7V92pcHREffE7EWvZPPD/CQnZx1Z2V//mN5/XO4rnjbEe
 woLKU+r4vDndmePFt/UZIgxmh04ThYr+z9+zfQj21ZNN0sl7KCp2Vl8WVb5SvZllou
 4etv5w5vUXrxnghs9U7tvjY3Mc+wDwzBs1zXG7Rvuizz8c5KbCSfqZS819UY64k+/Q
 H31n0Pp7yvSpueyJuMPlw2CrvcLTpEOUxOjLbaOuXtftRTndUinQPNSWPDgB+/nHR9
 1M3LhDFViqSxB+C7+9/3HG8tin4pDD8Gja9UlC/e1cGrVOu9nP1kn14oZvA5k7neLT
 OIf9MZ4k/uWTA==
Date: Tue, 14 Jan 2025 13:01:09 +0200
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <Z4ZD9exBt-JQiuS6@kernel.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
 <20241227072825.1288491-4-rppt@kernel.org>
 <jut35igb2kstpz24apqdeubv5rvyl3vmp2s43xtivpz54uiedj@wmd2onulv4xw>
 <Z4ODVmnC4fDnIUSN@kernel.org>
 <sivhweds7p5sst2jpxanrj6qc7wlonqkod64nsr5cgttma7ntp@bhqespo3jdqz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sivhweds7p5sst2jpxanrj6qc7wlonqkod64nsr5cgttma7ntp@bhqespo3jdqz>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 13, 2025 at 10:01:13AM +0200, Kirill A. Shutemov
 wrote: > On Sun, Jan 12, 2025 at 10:54:46AM +0200, Mike Rapoport wrote: >
 > Hi Kirill, > > > > On Fri, Jan 10, 2025 at 12:36:59PM +0200, Ki [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXeg2-0005ar-4k
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
 David Gow <davidgow@google.com>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 kunit-dev@googlegroups.com, Song Liu <song@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 13, 2025 at 10:01:13AM +0200, Kirill A. Shutemov wrote:
> On Sun, Jan 12, 2025 at 10:54:46AM +0200, Mike Rapoport wrote:
> > Hi Kirill,
> > 
> > On Fri, Jan 10, 2025 at 12:36:59PM +0200, Kirill A. Shutemov wrote:
> > > On Fri, Dec 27, 2024 at 09:28:20AM +0200, Mike Rapoport wrote:
> > > > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > > > 
> > > > Change of attributes of the pages may lead to fragmentation of direct
> > > > mapping over time and performance degradation as result.
> > > > 
> > > > With current code it's one way road: kernel tries to avoid splitting
> > > > large pages, but it doesn't restore them back even if page attributes
> > > > got compatible again.
> > > > 
> > > > Any change to the mapping may potentially allow to restore large page.
> > > > 
> > > > Hook up into cpa_flush() path to check if there's any pages to be
> > > > recovered in PUD_SIZE range around pages we've just touched.
> > > > 
> > > > CPUs don't like[1] to have to have TLB entries of different size for the
> > > > same memory, but looks like it's okay as long as these entries have
> > > > matching attributes[2]. Therefore it's critical to flush TLB before any
> > > > following changes to the mapping.
> > > > 
> > > > Note that we already allow for multiple TLB entries of different sizes
> > > > for the same memory now in split_large_page() path. It's not a new
> > > > situation.
> > > > 
> > > > set_memory_4k() provides a way to use 4k pages on purpose. Kernel must
> > > > not remap such pages as large. Re-use one of software PTE bits to
> > > > indicate such pages.
> > > > 
> > > > [1] See Erratum 383 of AMD Family 10h Processors
> > > > [2] https://lore.kernel.org/linux-mm/1da1b025-cabc-6f04-bde5-e50830d1ecf0@amd.com/
> > > > 
> > > > [rppt@kernel.org:
> > > >  * s/restore/collapse/
> > > >  * update formatting per peterz
> > > >  * use 'struct ptdesc' instead of 'struct page' for list of page tables to
> > > >    be freed
> > > >  * try to collapse PMD first and if it succeeds move on to PUD as peterz
> > > >    suggested
> > > >  * flush TLB twice: for changes done in the original CPA call and after
> > > >    collapsing of large pages
> > > > ]
> > > > 
> > > > Link: https://lore.kernel.org/all/20200416213229.19174-1-kirill.shutemov@linux.intel.com
> > > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > 
> > > When I originally attempted this, the patch was dropped because of
> > > performance regressions. Was it addressed somehow?
> > 
> > I didn't realize the patch was dropped because of performance regressions,
> > so I didn't address it.
> > 
> > Do you remember where did the regressions show up?
> 
> https://github.com/zen-kernel/zen-kernel/issues/169
> 
> My understanding is if userspace somewhat frequently triggers set_memory_*
> codepath we will get a performance hit.

This version of the patch will cause smaller performance hit because it
does not scan an entire PUD every time collapse_large_pages() is called.

Still, when I tweaked cpa-test to take some time measurements I see about
60% increase in the time it takes to perform set_memory operations.

Since we only really care about restoring large pages for ROX mapping, I'm
going to update the patch so that we'll try to collapse large pages only
from set_memory_rox().
 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

-- 
Sincerely yours,
Mike.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
