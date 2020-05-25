Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F01E0A1E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 May 2020 11:18:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jd9Fv-0000ZX-6W
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 May 2020 09:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1jd9Fu-0000Yq-9F
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 May 2020 09:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sb77lX+DMcqY6cREpR0MjEzbsR6ud83Odwt/z0stuhI=; b=KYazomFJgT4x3lpQuJDXrwlpYO
 EJew0eC6O0vp+8IUuuQMz2q+BAcG8SsYzBZSSrOoc/x2VVR2VF2Qn8tI7C/2LtOfgYnOH2BjsBk3W
 ngZdoKqyHgni6uTKbnTvZUi4vav4pGjiijjEdMAi+DWATFA/lR+izXnQndTre/E9U8CI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sb77lX+DMcqY6cREpR0MjEzbsR6ud83Odwt/z0stuhI=; b=QZowluX+4YeyaGTeD5JyVDLGGA
 THgN3iCEdzVdRlGiiOULgl1kkgRWWpCzpdZ4EGWeaPXMk9obUxNnO42Toq53U52p+ZjGzMG+s39dV
 S0QU7pN4b62GxzwfMawze2QcpoPQ8EhiKCyGn4VPE8Grc2zVQWUTjmUtIFGfVVu1Mzzw=;
Received: from [198.137.202.133] (helo=bombadil.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jd9Fs-004Uhb-Gn
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 May 2020 09:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sb77lX+DMcqY6cREpR0MjEzbsR6ud83Odwt/z0stuhI=; b=NsVypL1ygpElBuT3GTopsIuXUZ
 aOILjRmDHzsb1vyAEUwW83smtj4KlujTDWHIeyDfcOORYy/+9RJmt3v9n5jBgU9k0iN4XN26ggIrC
 gh+RHCSbZR0sOjuCyMaP000NwmGZc0BcM8mfRO8tbo2d2ydRAKAwSfOygrfndfMBO1iB7ymkx+CZK
 tKg3/kku828OUM8ahrGQLCO+6bPyEBAJs25oqdiqUCni8+7agpPgfdb2CsBzDiICojQvDEGS/mkeu
 Ym7wpoZMQKc9j37w0Bl/9Ww45a3ZAkQyrojkg+2pVGo1c1I+j4eYcwpHEvQnTOsHG9IZD+a1XxHLN
 rFtUddFg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9Fi-0008Qe-DQ; Mon, 25 May 2020 09:18:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 28B6C30018B;
 Mon, 25 May 2020 11:18:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 12D81286BFC11; Mon, 25 May 2020 11:18:32 +0200 (CEST)
Date: Mon, 25 May 2020 11:18:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: daniel.thompson@linaro.org, x86@kernel.org
Message-ID: <20200525091832.GE325303@hirez.programming.kicks-ass.net>
References: <20200525083605.GB317569@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525083605.GB317569@hirez.programming.kicks-ass.net>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jd9Fs-004Uhb-Gn
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, May 25, 2020 at 10:36:05AM +0200, Peter Zijlstra wrote:
> Hi!
> 
> Since you seem to care about kgdb, I figured you might want to fix this
> before I mark it broken on x86 (we've been considering doing that for a
> while).
> 
> AFAICT the whole debugreg usage of kgdb-x86_64 is completely hosed; it
> doesn't respsect the normal exclusion zones as per arch_build_bp_info().
> 
> That is, breakpoints must never be in:
> 
>   - in the cpu_entry_area
>   - in .entry.text
>   - in .noinstr.text
>   - in anything else marked NOKPROBE
> 
> by not respecting these constraints it is trivial to completely and
> utterly hose the machine. The entry rework that is current underway will
> explicitly not deal with #DB triggering in any of those places.

This also very much includes single stepping those bits.  Which KGDB
obviously also does not respects.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
