Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA637A082
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 09:14:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgMbN-0007Os-Vu
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 07:14:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgMbM-0007Ob-6P
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 07:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8z4EmekVg5rWeCHA4xwCSNaicVBopfdTZGYYTHKgvVY=; b=eXkki6DOOvAaKt+35Tbv6m8kLi
 TtQZhvZILm8ky+fjzmXL/erHVbc5dTboxrxt8MrboSu0xOMWAgdfuAsTgEtYcpPRjqLBF9Lj//AJs
 Lzmd82clGO4rG2/4pItRg2HkjwZs95ogGlMRKDxzXeeGNcHkZgg/nqnNE/6B/NpWhq5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8z4EmekVg5rWeCHA4xwCSNaicVBopfdTZGYYTHKgvVY=; b=JhyEr4RyGlQWKSpVeWIPz4RnOt
 8SlV0AWEAzT+mvjWkL+NrkgxWpcsiEr08Wze5Qjbr3gAt2q20Om81GMJxNf7CVruAmVAzja5u1mfx
 8d+vun6UTxYnruvdogBgVd46agXDB5fy3rqa/fhZyAcYgytSOltDTO6luKCKeDUtn1wM=;
Received: from mga12.intel.com ([192.55.52.136])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgMb7-0001oO-D8
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 07:14:43 +0000
IronPort-SDR: nIVl/uBCj07haGdZlAmcQhJ38K//jfziigHGfjPbA5nNSFGso/bsbc1UpKwBKkjr0IHTlEcsJc
 UQ4xTQT0mRdg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="178967302"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="178967302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 00:14:22 -0700
IronPort-SDR: c9aBpxO375CWUx7wQBSZFwPtRRtr9HPVsWUAJ6QjumnKzHL2Jr2PXOzEB/RbxjSno3CUx58zEW
 Tc/8aidWwKIw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536865524"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 00:14:16 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgMaq-00BNFg-I9; Tue, 11 May 2021 10:14:12 +0300
Date: Tue, 11 May 2021 10:14:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <YJouxMmwwVwqqKi1@smile.fi.intel.com>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
 <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1lgMb7-0001oO-D8
Subject: Re: [Kgdb-bugreport] [PATCH v1 2/4] kdb: Switch to use %ptTs
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-nilfs@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, JC Kuo <jckuo@nvidia.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux USB List <linux-usb@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, May 10, 2021 at 05:05:46PM -0700, Doug Anderson wrote:
> On Mon, May 10, 2021 at 8:04 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Use %ptTs instead of open-coded variant to print contents
> > of time64_t type in human readable form.
> >
> > Cc: Jason Wessel <jason.wessel@windriver.com>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: kgdb-bugreport@lists.sourceforge.net
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  kernel/debug/kdb/kdb_main.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> I kinda doubt anyone would really care if we just switched kdb to just
> the old "%ptT". Probably no machines are parsing this string.

Formally it's an ABI.

> ...but in any case, now that the nifty new format is there we might as
> well use it. Thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
