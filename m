Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC691E26EC
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 May 2020 18:28:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdcRI-0004WG-7e
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 May 2020 16:28:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1jdcRH-0004W8-2e
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 16:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=suOooOcNSKyFICMWbxMpUFg1suvhpJtkun3SmXbqCrg=; b=GiF8kOt/4sZSI6zevsuYelDdVz
 Rz0Wn6Kc7y+ec4wNcAvm2/BZO0jHoUUbqHO+gwd7Wgx6t/hIA/4kgoMkXdXRf2Ldpsr7TorSqPHlj
 6rtXU+PfKovph0QAsqhU+Z0QpWTd8ZFGhK4CL6qxbKk757E5umcRNLuC9BbpWr69A4rw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=suOooOcNSKyFICMWbxMpUFg1suvhpJtkun3SmXbqCrg=; b=eQqBCscspjcAYl7jGgkTm9cHz7
 umYVWsOxaBX4FTfNJNoMNzt6LUfE/rS17hZGM14VDvCCi+pb2W6/aMeAjl/TIwKW8KqrDDahmOcv1
 L6AvYqOSsFOFRm+zB4iDNeKKmKfDjB1VbUoTz2cQdKDAwsPETu6mSHpM7kwB7ZXUa3NQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdcRE-00DlMS-VC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 16:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=suOooOcNSKyFICMWbxMpUFg1suvhpJtkun3SmXbqCrg=; b=Ugrb0QqIocIMnls/zFRcMWGt8j
 5TBxG/cxm/Ofpxm3bSOcfZ2HzlMuXxz/xIxh9BrEm6u0zYGCwQe7/Qql5JPZtNJ4dKKQhoeiQcseB
 uDeDwWtVxgIdDHNwpa8cXzgL+c/KIm2ndmgCGk5NQbEWOj6uOsA1snbcSlWeyVH0Cgc9ceWUb+r6U
 NQps9CfhBeAxLWoJFa+YpaSp9Ebeh1Sn8OK4+6vAlZO8sYeKB4DZXLJgGAlPIB337tfti8TTcVY12
 TPNk/OmW9arl/cMn9kQ0GDIyjK6Vbjm0oXPVnLjHvsIQzpSMCciCssYYys4mO8VCzR3LmcpQaCuqd
 jPZpUXoQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdcQy-0006Ou-Dw; Tue, 26 May 2020 16:28:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 74E0D30047A;
 Tue, 26 May 2020 18:28:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 604C420FF7929; Tue, 26 May 2020 18:28:06 +0200 (CEST)
Date: Tue, 26 May 2020 18:28:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200526162806.GD325280@hirez.programming.kicks-ass.net>
References: <20200525083605.GB317569@hirez.programming.kicks-ass.net>
 <20200525091832.GE325303@hirez.programming.kicks-ass.net>
 <20200526161621.7ucj5jn6rm5yednb@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526161621.7ucj5jn6rm5yednb@holly.lan>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdcRE-00DlMS-VC
Subject: Re: [Kgdb-bugreport] x86/entry vs kgdb
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net, x86@kernel.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 laijs@linux.alibaba.com, jason.wessel@windriver.com, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, May 26, 2020 at 05:16:21PM +0100, Daniel Thompson wrote:
> On Mon, May 25, 2020 at 11:18:32AM +0200, Peter Zijlstra wrote:
> > On Mon, May 25, 2020 at 10:36:05AM +0200, Peter Zijlstra wrote:
> > > Hi!
> > > 
> > > Since you seem to care about kgdb, I figured you might want to fix this
> > > before I mark it broken on x86 (we've been considering doing that for a
> > > while).
> > > 
> > > AFAICT the whole debugreg usage of kgdb-x86_64 is completely hosed; it
> > > doesn't respsect the normal exclusion zones as per arch_build_bp_info().
> > > 
> > > That is, breakpoints must never be in:
> > > 
> > >   - in the cpu_entry_area
> > >   - in .entry.text
> > >   - in .noinstr.text
> > >   - in anything else marked NOKPROBE
> > > 
> > > by not respecting these constraints it is trivial to completely and
> > > utterly hose the machine. The entry rework that is current underway will
> > > explicitly not deal with #DB triggering in any of those places.
> > 
> > This also very much includes single stepping those bits.  Which KGDB
> > obviously also does not respects.
> 
> For breakpoints there's already a pre-poke validation hook that
> architectures can override if they want to. I can modify the default
> implementation to include checking the nokprobe list.

Excellent, and I suppose the arch callback should be changed to share
code with arch_build_bp_info(), which Lai was extending here:

  https://lkml.kernel.org/r/20200526014221.2119-1-laijs@linux.alibaba.com

> Stepping is a bit more complex. There are hooks for some of the
> underlying work but not pre-step validation hook. I'll see if we can add
> one.

That'd be great; because where we're going getting this wrong is
insta-fail.

Another point to look at is the whole dbg_is_early; I suspect that's
similarly wrecked, the entry code isn't more robust early on.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
