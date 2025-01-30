Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E0A231DD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Jan 2025 17:31:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tdXSO-0004Dq-Uo
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 30 Jan 2025 16:31:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdXSL-0004Dd-K7 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 30 Jan 2025 16:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WHsiIDbeKr+stnFGOlIQw/PeEXv09+hCPR7+OGR4tVc=; b=O2N2fRSRcYQ5pEul/zD+N9uVpG
 pColXQL5fmUlO81ghhUkI5gMQkSTGr4sT3zsMapu81IryzuJWb34Mk1AE/pg2DLec/rLCpUQWSj5R
 Xn0Uy/tdacUEQ5thFYBei/Qdu1wakQ8yvG5SG25NIhf6JtZ5zAUE+wMb/6z/UL51FYGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WHsiIDbeKr+stnFGOlIQw/PeEXv09+hCPR7+OGR4tVc=; b=JsMXsBG6FgB0WzakE7b2JZeK61
 rCimS9iO/vJboy+1bWLkyGot2eGICWqH4laTPqTGf6YYY9gbxgZy/Cnz8gldKUIUaZGFR5mmlib31
 cVGnnms8upjAkl4DIyUAeeyjLD3nac71ZeqsdjNfGm+kMexyoXdi88MaByeEf6SSSEJA=;
Received: from mgamail.intel.com ([198.175.65.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdXSL-0003xQ-0h for kgdb-bugreport@lists.sourceforge.net;
 Thu, 30 Jan 2025 16:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738254713; x=1769790713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=33qiW3dWmI8bHxHCG3SW5kkf5Qn+guEvPG4As5/sGno=;
 b=mBlWW6ehhTWpnp/9edSxDQAe7mSUwGTHIrWF2EAqla5mip07lHPZiD1M
 6BsO2I/9FwBa2nSJMVpHaSP50rhY/4NOzAraIr98soitCO8fSEsPr8it0
 CQ62Fg30qCKwM+euMddJ6naMT98qYOu6PjomHz/PZiK87HWPyc5ZdvDjR
 6kojcKGih3VJLCkZ2GzK8Kb/J9jNFlEFOQGboC+zXW4COrk5CPT9FWVBz
 l2tRWe/g2SHjCNmGVBp4+rQrNShqnu+7TgW2VAV4tyEYbdYUldyh3YI2Z
 9oYigQcJU71NE6LbN1RM08haYitKCqMPL1ViNvYXTl85FXU4JJNLlnWHj A==;
X-CSE-ConnectionGUID: Rh0awDI8Tqmox/1r2iPQrg==
X-CSE-MsgGUID: jKbZgOLkQDGgXHFxh0LI5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38514477"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38514477"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:31:42 -0800
X-CSE-ConnectionGUID: Aq4BY09mR/+UcK4yGKgjJg==
X-CSE-MsgGUID: qSUJ8LpvTMCHNOdKh5Y06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109944324"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:31:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdXS3-00000006ixE-0s7S; Thu, 30 Jan 2025 18:31:35 +0200
Date: Thu, 30 Jan 2025 18:31:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <Z5upZhPz_LIbwrzx@smile.fi.intel.com>
References: <20250129162700.848018-1-dianders@chromium.org>
 <20250129082535.1.Ia095eac1ae357f87d23e7af2206741f5d40788f1@changeid>
 <Z5s38S7sJ2mka3-1@smile.fi.intel.com>
 <Z5s5IThpnMNdY62v@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5s5IThpnMNdY62v@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 30, 2025 at 10:32:33AM +0200, Andy Shevchenko
 wrote: > On Thu, Jan 30, 2025 at 10:27:29AM +0200, Andy Shevchenko wrote:
 > > On Wed, Jan 29, 2025 at 08:25:50AM -0800, Douglas Anderson wrote [...]
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.20 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.20 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.20 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdXSL-0003xQ-0h
Subject: Re: [Kgdb-bugreport] [PATCH 1/3] Revert "tty/serial: Add kgdb_nmi
 driver"
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, linux-serial@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Anton Vorontsov <anton.vorontsov@linaro.org>,
 Daniel Thompson <danielt@kernel.org>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 kgdb-bugreport@lists.sourceforge.net, Robert Marko <robert.marko@sartura.hr>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jan 30, 2025 at 10:32:33AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 30, 2025 at 10:27:29AM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 29, 2025 at 08:25:50AM -0800, Douglas Anderson wrote:

...

> > > [1] https://lore.kernel.org/lkml/1348522080-32629-9-git-send-email-anton.vorontsov@linaro.org/
> > 
> > It might be possible to use Link tag here in a form
> > 
> > Link: URL [1]
> 
> Hmm... I'm not sure what this Link is supposed to mean. You might be forgotten
> to update an URL to point out to the cover letter? (This is the link to patch 9
> in the series and looks a bit unrelated).

I reread and I think now understand what you meant. The are several patches
starting from this one that are not landed in the upstream.

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
