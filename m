Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BD11C8504
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 10:39:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWc4R-0001iD-OG
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 08:39:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1jWc4O-0001i1-SG
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 08:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E0XkTfAqabVzP/gfTdussAa0KRB+MIubD7Q1T3FvNQ8=; b=ZAcgu1HjnX8YzwCiXfiR3SQl3P
 8BPgduHQt/jEqAXhn+YpCELa2m+t3c+BfnFkFavS0z2eZ/FJbRg09N01iwewd24R3bYWKRLMKPq35
 8SGboqoK+8TgUDLyOXIo1ug2EklHKVowJFvix5tY+4YkKstWquz+BgC2mRCZnaRYXvL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E0XkTfAqabVzP/gfTdussAa0KRB+MIubD7Q1T3FvNQ8=; b=XQkCyYbH5qRzZ4WULkqiS0isOM
 FbEuCH6fKp774UhT4oSuF/cYsEk5fXi0YWRSVRPaPjcKoduhrk+kupn5O74u8lnTfJ36lGBrBRdo7
 +xmI5fdsz9nqexj+EVG7bZYhzpLfIy1rknYqGx1Q2wHPcS5x7RmrPHkeolumQdzVXKo0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWc4I-00Av4a-TR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 08:39:52 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F3782080D;
 Thu,  7 May 2020 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588840774;
 bh=Ld4HmaMz+uu6ugfeoP8TBmKNgDCsNouPkgsc7oqJvJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ro9/oIOy26gDdLHjpEUoFtciNshEP2GerzmgbWkGIanFXpQygbI2/v8W6P3WCmgyy
 7Kr7vpMASvV958hsQEWu3oTRmchj+Ts2GFYBk2xWWCVepWBbLyZKBdzQ0rQ2GEjw1n
 ALYvEew8+AvUNXKIKXDXpWcgpWnYLJsD2/+bcOoc=
Date: Thu, 7 May 2020 09:39:30 +0100
From: Will Deacon <will@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200507083929.GC28215@willie-the-truck>
References: <20200506164223.2875760-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506164223.2875760-1-daniel.thompson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWc4I-00Av4a-TR
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix spurious true from
 in_dbg_master()
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
Cc: kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 06, 2020 at 05:42:23PM +0100, Daniel Thompson wrote:
> Currently there is a small window where a badly timed migration could
> cause in_dbg_master() to spuriously return true. Specifically if we
> migrate to a new core after reading the processor id and the previous
> core takes a breakpoint then we will evaluate true if we read
> kgdb_active before we get the IPI to bring us to halt.
> 
> Fix this by checking irqs_disabled() first. Interrupts are always
> disabled when we are executing the kgdb trap so this is an acceptable
> prerequisite. This also allows us to replace raw_smp_processor_id()
> with smp_processor_id() since the short circuit logic will prevent
> warnings from PREEMPT_DEBUG.
> 
> Fixes: dcc7871128e9 ("kgdb: core changes to support kdb")
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  include/linux/kgdb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..4d6fe87fd38f 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -323,7 +323,7 @@ extern void gdbstub_exit(int status);
>  extern int			kgdb_single_step;
>  extern atomic_t			kgdb_active;
>  #define in_dbg_master() \
> -	(raw_smp_processor_id() == atomic_read(&kgdb_active))
> +	(irqs_disabled() && (smp_processor_id() == atomic_read(&kgdb_active)))
>  extern bool dbg_is_early;
>  extern void __init dbg_late_init(void);
>  extern void kgdb_panic(const char *msg);

Cheers, Daniel. I assume you'll route this one via the kgdb tree? I can
live with the "small window" in the arm64 for-next/core branch ;)

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
