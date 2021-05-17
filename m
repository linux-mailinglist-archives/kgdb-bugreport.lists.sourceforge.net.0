Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43738242F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 May 2021 08:21:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1liWdB-0002GO-8C
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 May 2021 06:21:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1liWd9-0002GG-Cp
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 May 2021 06:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CLy1HCVs0cKm4Xqyppl0tkWoihiJt5GKD+uzmavPNlU=; b=CWpBNTnAgnZq48tsanoNIAa7LA
 bP6Vrs13dPpBWd4ozb5VXNWbPxI7gx+QQid4WtBu+9S5ShmG9cGzf1GAgSl1hZxEvtum84etbFyvJ
 DAjXRgam8cIz4H2UBtUnK6aCaYR3KUtssAheqLsNi857RMliynNG2HqLxliJD8iTqBZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLy1HCVs0cKm4Xqyppl0tkWoihiJt5GKD+uzmavPNlU=; b=Scl/Lfvjz/4AJlef1vpfiyn9Ve
 0R1F2OkKuCiwUEzt8tYYzIe4BLYGDPu4/RhXE1f8Qw38PTvTC5Klkg/T58nDVzm/EmpXqwAqJkyMK
 wQD9j0kieBq8ImXlew/EXX88rOX3B5WJMtOVlBByxrBpnO/Nbx+OPW/zf4y6O2Pt18sw=;
Received: from mga17.intel.com ([192.55.52.151])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1liWd3-00B5dC-6X
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 May 2021 06:21:33 +0000
IronPort-SDR: pVq4AX/XxDKlSodGk5ULGZNfBZo9ech/xvqhoIMgo/0tMUbELzMthBbHmjdvvWLBntqHIs5mEq
 3OrMnztriE0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="180668864"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="180668864"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2021 23:21:18 -0700
IronPort-SDR: ucTslSVrfm3Dr7fBX9XveScssOvJXF8A+PoVzICYkR7EOlQpPaKaAxwPSXA5dOhVeMulwInDJF
 8ZsWmYFEWLOQ==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="611468871"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2021 23:21:12 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1liWcn-00CfzY-8g; Mon, 17 May 2021 09:21:09 +0300
Date: Mon, 17 May 2021 09:21:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <YKILVUc3stIWeHpo@smile.fi.intel.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
 <20210513093130.qzbh6tm7lbclgayh@maple.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513093130.qzbh6tm7lbclgayh@maple.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1liWd3-00B5dC-6X
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/4] kdb: Switch to use %ptTs
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
Cc: Petr Mladek <pmladek@suse.com>, linux-nilfs@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>, linux-doc@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-usb@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
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

On Thu, May 13, 2021 at 10:31:30AM +0100, Daniel Thompson wrote:
> On Tue, May 11, 2021 at 06:39:56PM +0300, Andy Shevchenko wrote:
> > Use %ptTs instead of open-coded variant to print contents
> > of time64_t type in human readable form.
> > 
> > Cc: Jason Wessel <jason.wessel@windriver.com>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: kgdb-bugreport@lists.sourceforge.net
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Any clue what route this will take into the kernel? I'm certainly happy
> for someone else to take the kdb bits alongside the vsprintf stuff
> (so here's an acked-by too in case they are fussy about that sort of
> thing ;-) ):

I hope Petr will take it thru PRINTK tree.

> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
