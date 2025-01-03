Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF422A00887
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  3 Jan 2025 12:20:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tTfjE-0001ns-Q3
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 03 Jan 2025 11:20:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <peterz@infradead.org>) id 1tTfjD-0001nh-BR
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 03 Jan 2025 11:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+e20JDJu3VwrmlmlVVpxrvFlU6CuxSxftw52pQXGnog=; b=hJbixoSk1bLWFkouLfkZcWNCM3
 EipjhLUbZ7tTPAnvM49p53A+MMTwf3qbECMyYomkoIauoGjJJn3ZCw3JzuGyJrNuwh15VR8haMNVQ
 DPFV1GMdjC1/WaT/nh/J3nYQPZO2Ynjknz4wXbxpX5R6A1mVeUpYqPwBTmOxGMpd6Il0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+e20JDJu3VwrmlmlVVpxrvFlU6CuxSxftw52pQXGnog=; b=Ix6sTiF79Cqshgm2dDhZlszSyz
 T/uZnbTuNKJWzZ3tGOZq0sMIRW0h3NmJE2xy1hteNDSrwa95CsmiJWfyE5usNsdAQfue+6hs7XXYt
 AQ+B9TwLdr64Dk3WQHQln6DZGWSOIXKwWpEL++PbWbxonqxK61baBEv8pAqD+cNMbgfQ=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTfjC-0008Ob-9i for kgdb-bugreport@lists.sourceforge.net;
 Fri, 03 Jan 2025 11:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+e20JDJu3VwrmlmlVVpxrvFlU6CuxSxftw52pQXGnog=; b=DaRgJ6ZeouUFnjZ11up8spR4oW
 o3qngr9xYj85lxVEWvhjfekmFNWYSpBpnDXfgrnmBcXz21BVnbWSjwF7FJpVqC3515Zz7xoNghOSN
 DH+Y2PmIRLQ12UwBno8GZvcaEK1tyJyBcOeuOEqZZDyo61EUcCWq7+pFRb99cLZH0ChNWFaY8ue4g
 z8w5w37xbByYWZ1U79CbSnvZ1WHPtTWr6jtlQX4rjTXRfc9uIqBUMMP6yizCWyO7qbPQ54fvQbCrO
 XqWipiJzxMZluWZYjJQzRjkUSapDbZoOBeoCu74phuj0VrMCuywG6Sfo3qD6+BsfXkShHAV3onqo/
 yYIJfPJw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tTfih-00000008NOv-2fvw; Fri, 03 Jan 2025 11:19:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3A6C93003AF; Fri,  3 Jan 2025 12:19:59 +0100 (CET)
Date: Fri, 3 Jan 2025 12:19:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20250103111959.GD22934@noisy.programming.kicks-ass.net>
References: <20241227072825.1288491-1-rppt@kernel.org>
 <20241227072825.1288491-2-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241227072825.1288491-2-rppt@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 27, 2024 at 09:28:18AM +0200,
 Mike Rapoport wrote:
 > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> > > The CPA_ARRAY test
 always uses len[1] as numpages argument to > change_page_att [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.92.199 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.92.199 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.92.199 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tTfjC-0008Ob-9i
Subject: Re: [Kgdb-bugreport] [PATCH 1/8] x86/mm/pat: cpa-test: fix length
 for CPA_ARRAY test
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

On Fri, Dec 27, 2024 at 09:28:18AM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> The CPA_ARRAY test always uses len[1] as numpages argument to
> change_page_attr_set() although the addresses array is different each
> iteration of the test loop.
> 
> Replace len[1] with len[i] to have numpages matching the addresses array.

D'oh..


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
