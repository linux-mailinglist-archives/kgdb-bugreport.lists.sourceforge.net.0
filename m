Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98061A17DDD
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jan 2025 13:37:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1taDVT-0005yc-L6
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 21 Jan 2025 12:37:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <peterz@infradead.org>) id 1taDVS-0005yW-BT
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 12:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+S3XXHbN/oe6xKVYGSf9YZ3CRMWHxj1l3FkfZRty5tI=; b=QHgfd9RIZP8lEE1OsEuBhUK9Sr
 hFjJuAzUSdAa6WQDnxj1BhvdcondOdubcbX8trKgjqDShwb+qzAe4jwr6Fvw8M+fghPlR/+6AY9q+
 D99SSIYpR2AWZZNoqvcMZHRk4UCwwX5k5uPxJnyVRKwkKBxsVl0n6h3WV/156ZrlamIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+S3XXHbN/oe6xKVYGSf9YZ3CRMWHxj1l3FkfZRty5tI=; b=TL2oAUOK9WBSWMCGX2cL7AIVKs
 e2FUnU0bjgqkO+H4peHEmPUJJz+I24JD/NH1Y3vTL8dfXqVtTIInhh7MKwPBJBMdmkN9dIs2wejH1
 J6tgDDj0AyxQINJ/f9RnzDzgmDLGy8E6VlRf6Up6Cc5ewyrW0wyBzmt2t7dqddws2wdw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taDVR-0001Ko-A1 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 12:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+S3XXHbN/oe6xKVYGSf9YZ3CRMWHxj1l3FkfZRty5tI=; b=FiKvPMinu66/G2JHsGRgnMbT5F
 rMCwmED4+IvlnlmUz8ASXQB1GnEDZq3CzcLFTzt/RVSSHIUCEDPvYaR/vpM6O1K7+ZPOaapQJPWi8
 gca1sxhPAW16+uYuk22hj7LI7nu4tDIkzL3A6KLSNh1mj956fKMeGTTg9KGoF+XnjymQh81ulQrlI
 CCL1agCm2m2GbwQWiEo5t3elu50no64PB+45UsbaAodphvLrkDFOhDpfNYqzLzLyJGT+DvKcMFIph
 zBK8tPp+ZXFGNxDquE/xKAwVWlD5DQAw2mJsd7DgAkH4dWm3RWoF9hgpd6mq3Ji/IulJ6M7qZucvU
 ddwVVUjg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1taDUu-0000000AbnU-0YO0; Tue, 21 Jan 2025 12:36:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0BE8E300619; Tue, 21 Jan 2025 13:36:47 +0100 (CET)
Date: Tue, 21 Jan 2025 13:36:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20250121123646.GC7145@noisy.programming.kicks-ass.net>
References: <20250121095739.986006-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121095739.986006-1-rppt@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 21, 2025 at 11:57:29AM +0200,
 Mike Rapoport wrote:
 > Kirill A. Shutemov (1): > x86/mm/pat: restore large ROX pages after
 fragmentation
 The duplication between pmd and pud collapse is a bit annoying, but so be
 it. Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1taDVR-0001Ko-A1
Subject: Re: [Kgdb-bugreport] [PATCH v2 00/10] x86/module: rework ROX cache
 to avoid writable copy
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
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
 Petr Mladek <pmladek@suse.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Jiri Kosina <jikos@kernel.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Daniel Gomez <da.gomez@samsung.com>,
 Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 kunit-dev@googlegroups.com, Song Liu <song@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Jan 21, 2025 at 11:57:29AM +0200, Mike Rapoport wrote:

> Kirill A. Shutemov (1):
>   x86/mm/pat: restore large ROX pages after fragmentation

The duplication between pmd and pud collapse is a bit annoying, but so
be it.

> Mike Rapoport (Microsoft) (9):
>   x86/mm/pat: cpa-test: fix length for CPA_ARRAY test
>   x86/mm/pat: drop duplicate variable in cpa_flush()
>   execmem: don't remove ROX cache from the direct map
>   execmem: add API for temporal remapping as RW and restoring ROX afterwards
>   module: introduce MODULE_STATE_GONE
>   module: switch to execmem API for remapping as RW and restoring ROX
>   Revert "x86/module: prepare module loading for ROX allocations of text"
>   module: drop unused module_writable_address()
>   x86: re-enable EXECMEM_ROX support

All these look good on a first reading, let me go build and test the
various options.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
