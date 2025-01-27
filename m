Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9FA1D537
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Jan 2025 12:19:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tcN9f-000589-1U
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 27 Jan 2025 11:19:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <peterz@infradead.org>) id 1tcN9d-000581-AJ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 27 Jan 2025 11:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2nxlZG0x9iQaYpsd+eadUudjrFnJ1cGtAfW/gj43tTw=; b=OUh4OLyfLRobbRpz0/yLR/l8WQ
 hsDbIt4EdS4avQZr81cY13JDA933dMEtBtTr/IA85r+8gI9YXn41W1caE/y5nDGOMLhDWXXKQTl4/
 1w2lmpiEqNUFpIFDqoekSlwUjIGMdNKFXd3pDJ+NyYqf95O2fEIkKzsE+DaqIItQTza0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2nxlZG0x9iQaYpsd+eadUudjrFnJ1cGtAfW/gj43tTw=; b=JUnHRahO9+IUPiOv+449Fyhb+7
 A1zuGSqWBy45gbgmcJXouIbZvYwIXGNwdQa1ehE2wALL19TtTDGsazCzRbH/7R7JIr8Nn9DzJEU17
 ZtM9QXxvbe1reI8hmrbaIpGwPcSiYtGRs2nfVjbMLX0/TZ5ND1V/mg4pYF083lQNC8kY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcN9c-0006Xg-Vl for kgdb-bugreport@lists.sourceforge.net;
 Mon, 27 Jan 2025 11:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2nxlZG0x9iQaYpsd+eadUudjrFnJ1cGtAfW/gj43tTw=; b=Sj0xS/qvr8H41QAKtpZRieE13Y
 aiVj8mHj3pZnEWKoAD3Wd6wuTFDoU6Be22SwXDNWbDzO3IM8T+gXHeZKhWxjNclBx0dQumSMS1C5Z
 V6PP/mamsBhXIVujfX/YgB1kEHLgPt9Ul42gqoJRUMafSAa5MwSWRLYQzlGsbBTTAdV72PxTu0OCk
 sjvgNjd0NtJmzEdGPfPV5twTvfTzqazcPs0SxNXf1kV+BZzGIS9BUgIVAO3P8AKnOWlRTL5HeRnt2
 6XCGhLzKQzQu31s8rh+jHRlsG4MmmtNripWGwIxe3Sb6e6uX4JNIerL4SqMtbLL+escsGkpuLAdEH
 oGUBpIuw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tcN96-00000009K2m-3aM4; Mon, 27 Jan 2025 11:19:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6EF783004DE; Mon, 27 Jan 2025 12:19:12 +0100 (CET)
Date: Mon, 27 Jan 2025 12:19:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20250127111912.GF16742@noisy.programming.kicks-ass.net>
References: <20250126074733.1384926-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126074733.1384926-1-rppt@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jan 26, 2025 at 09:47:24AM +0200,
 Mike Rapoport wrote:
 > v3 changes: > * instead of adding a new module state handle ROX restoration
 locally in > load_module() as Petr suggested OK, updated the patches I have
 pending for post -rc1. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1tcN9c-0006Xg-Vl
Subject: Re: [Kgdb-bugreport] [PATCH v3 0/9] x86/module: rework ROX cache to
 avoid writable copy
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

On Sun, Jan 26, 2025 at 09:47:24AM +0200, Mike Rapoport wrote:
> v3 changes:
> * instead of adding a new module state handle ROX restoration locally in
>   load_module() as Petr suggested

OK, updated the patches I have pending for post -rc1.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
