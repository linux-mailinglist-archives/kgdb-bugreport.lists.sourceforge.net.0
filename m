Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D1A0041E
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  3 Jan 2025 07:12:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tTavS-0005Fo-EW
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 03 Jan 2025 06:12:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1tTavR-0005Fi-M3
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 03 Jan 2025 06:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SIGi5SMCJUmJYg30g8DWwZYJMBTKXWhgRft845gxHoo=; b=KlHenp7ZaTIo3WOSpCYByPiI/w
 kR48rscztGRA0PcTeMntwuZ3XdGiBL6Y82TDshDfbhvgikkNceMuOm7K2dNC3+0TOwekn9oF8LnFV
 CmH/WYnnNeMsLQpT4PDa8mSdU9Ws1fDTP7v0Xh8wpy2N4eA5gncHVYOUgEYJFMXTYTI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SIGi5SMCJUmJYg30g8DWwZYJMBTKXWhgRft845gxHoo=; b=RYizDpe99IrIXPqPBQT6dxbX5F
 xE0XaBox23g4MQ/YQMNAuVXxeJyyxN5pM8DgO9NgXThIT0EiIdBiHTrGi5RMCVeDp43ofMa1mUJet
 PlmffH/Yfpe94mSurCX33QIYhgw9LlTDJbkDOgEdHw6xDz0me5AY8O1qu7J8Ya4UrbDQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTavO-0007kA-Rz for kgdb-bugreport@lists.sourceforge.net;
 Fri, 03 Jan 2025 06:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8B725C3A56;
 Fri,  3 Jan 2025 05:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77287C4CECE;
 Fri,  3 Jan 2025 05:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1735883836;
 bh=ahkJxGtysqPWgnOL67yhgSmmIjzKoeYD0h3gq1Efw8s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aQZpAR0mwD+9uME8jJKLdIKsDsBBNx7RFftbrdOt2Z9ezUhGkaSxQYeWN3B5a5lXK
 swbw4eAbHvBcyBGp53eUADLv9enJyd7F1VABGcwP2T6kkfI7+ZcsM5B7c9YUKvQsve
 5gOb9teUK9gxiG0ELqADgwYPpQaTpTwlUT6BuhO0=
Date: Thu, 2 Jan 2025 21:57:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <20250102215714.a37e828cf073ea6a14d30559@linux-foundation.org>
In-Reply-To: <d48193a3-65fe-4aa9-98f6-dd5869bd9127@citrix.com>
References: <86eba318-464b-4b9b-a79e-64039b17be34@lucifer.local>
 <d48193a3-65fe-4aa9-98f6-dd5869bd9127@citrix.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -7.5 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri,
 3 Jan 2025 02:06:10 +0000 Andrew Cooper <andrew.cooper3@citrix.com>
 wrote: > > Hi Mike, > > > > This commit is making my intel box not boot in
 mm-unstable :>) I bisected it to > > this commit. > > For what it's worth,
 we've found the same under Xen too. > > There's one concr [...] 
 Content analysis details:   (-7.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1tTavO-0007kA-Rz
Subject: Re: [Kgdb-bugreport] [PATCH 6/8] modules: switch to execmem API for
 remapping as RW and restoring ROX
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
Cc: mark.rutland@arm.com, luto@kernel.org, peterz@infradead.org,
 kgdb-bugreport@lists.sourceforge.net, dave.hansen@linux.intel.com,
 rmoar@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, live-patching@vger.kernel.org,
 mbenes@suse.cz, shuah@kernel.org, anton.ivanov@cambridgegreys.com,
 joe.lawrence@redhat.com, lorenzo.stoakes@oracle.com, richard@nod.at,
 x86@kernel.org, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, mingo@redhat.com, danielt@kernel.org,
 samitolvanen@google.com, linux-trace-kernel@vger.kernel.org, pmladek@suse.com,
 petr.pavlu@suse.com, jikos@kernel.org, linux-um@lists.infradead.org,
 mhiramat@kernel.org, rostedt@goodmis.org, da.gomez@samsung.com, bp@alien8.de,
 rppt@kernel.org, davidgow@google.com, tglx@linutronix.de, jpoimboe@kernel.org,
 kunit-dev@googlegroups.com, Juergen Gross <jgross@suse.com>,
 brendan.higgins@linux.dev, song@kernel.org, mcgrof@kernel.org,
 kirill.shutemov@linux.intel.com, jason.wessel@windriver.com,
 johannes@sipsolutions.net, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 3 Jan 2025 02:06:10 +0000 Andrew Cooper <andrew.cooper3@citrix.com> wrote:

> > Hi Mike,
> >
> > This commit is making my intel box not boot in mm-unstable :>) I bisected it to
> > this commit.
> 
> For what it's worth, we've found the same under Xen too.
> 
> There's one concrete bug in the series, failing to cope with the absence
> of superpages (fix in
> https://lore.kernel.org/xen-devel/6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com/
> but not formally posted yet AFAICT).
> 
> The rest of the thread then found a crash looking to be the same as
> reported here, but you've made better progress narrowing it down than we
> have.
> 

Thanks.  I removed this series from mm.git while this is worked on.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
