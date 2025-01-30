Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30AA2299D
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Jan 2025 09:32:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tdPyn-0000Lk-T6
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 30 Jan 2025 08:32:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdPym-0000Lc-LU for kgdb-bugreport@lists.sourceforge.net;
 Thu, 30 Jan 2025 08:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kP1sths0LfrZx69u+NvoL7q/GdrGB6o2ZgCxKyv+3hY=; b=F4vkpU3XR/uJx0FZxSDSHmWZvT
 xQjsIkUIEJLeE6s3+iQ3EUXNN4xUMfSqZ9wcdkeChGpEND9gf/4A8xD7tsokC98O0DRM4rsrun8G9
 Ee8k0F8/CLFClmUdhS9/H7bLVaQBRK/o1PdxtUNt587uePnKQehfMlbFLWvMFemPL/8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kP1sths0LfrZx69u+NvoL7q/GdrGB6o2ZgCxKyv+3hY=; b=BwtkDxb0rHodKy3QcZV3r57Nr6
 3DxE3tG0KFDC1vrF2YyskBTLuE1Iqjo3Cr4HKxwRd0Qoe+LpdXmpUe9ACUqIDtUqXDCf2GG1JMjWl
 w/odx7i92/yWst/ZeK4hkCA0jTbpyfSdjMI9rKX7mPSf+Am7GbDQnvwUBVthSkne0faE=;
Received: from mgamail.intel.com ([198.175.65.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdPym-0003ex-0Y for kgdb-bugreport@lists.sourceforge.net;
 Thu, 30 Jan 2025 08:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738225973; x=1769761973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KGZn6Xt9v0IKvMBO/XZlgfWkSXISMGsYFaHeuoOmrSM=;
 b=L8DGE58mKT9i2L+NC+vzXMxrxN2au8csfVncg9wBt5BnACMAU5bb8Eqt
 oOQHkJnntYcztxdxBUKN6lB1Y609FbIc+eQTF4K3qSDj1fGpzmAj8Efm+
 xgi9wgY+SVfkdhF7MhcejcjPPEUXFss/kFsQ7ToEMgUnEqVfJ8EwNND+Y
 H8Jf4tLHEvU1/yxlL5JWyEUSZ/pXHf8f5g/VUEVYNFYEpLlKfM2+2rlMt
 Pg4EI2WdvTqMOu9HhDRnZNsPtcTDx+TEUUn0SA3sIcez9nkLg8Fb9wNsd
 AjpEUxa5nm3ZYMKBMNxD8IJdDs18PmkpKxSSFaQu6t/2utLXXEozEXQ/0 g==;
X-CSE-ConnectionGUID: yuy9JB58SC6vIFoqcedvLw==
X-CSE-MsgGUID: qNgDG2HFSr+Ru29+6FKBCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56186022"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56186022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:32:42 -0800
X-CSE-ConnectionGUID: MsL1juu8Rza5VqiPNSHU4A==
X-CSE-MsgGUID: IFKHj+vcReOFJ/dMDX0nAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109066052"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:32:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdPyT-00000006cxf-3VBL; Thu, 30 Jan 2025 10:32:33 +0200
Date: Thu, 30 Jan 2025 10:32:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <Z5s5IThpnMNdY62v@smile.fi.intel.com>
References: <20250129162700.848018-1-dianders@chromium.org>
 <20250129082535.1.Ia095eac1ae357f87d23e7af2206741f5d40788f1@changeid>
 <Z5s38S7sJ2mka3-1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5s38S7sJ2mka3-1@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 30, 2025 at 10:27:29AM +0200, Andy Shevchenko
 wrote: > On Wed, Jan 29, 2025 at 08:25:50AM -0800, Douglas Anderson wrote:
 ... > > [1]
 https://lore.kernel.org/lkml/1348522080-32629-9-git-send-email-anton.vorontsov@linaro.org/
 > > It might be possible to use Link tag here in a form > > Link: URL [1]
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.10 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.10 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.10 listed in list.dnswl.org]
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdPym-0003ex-0Y
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

On Thu, Jan 30, 2025 at 10:27:29AM +0200, Andy Shevchenko wrote:
> On Wed, Jan 29, 2025 at 08:25:50AM -0800, Douglas Anderson wrote:

...

> > [1] https://lore.kernel.org/lkml/1348522080-32629-9-git-send-email-anton.vorontsov@linaro.org/
> 
> It might be possible to use Link tag here in a form
> 
> Link: URL [1]

Hmm... I'm not sure what this Link is supposed to mean. You might be forgotten
to update an URL to point out to the cover letter? (This is the link to patch 9
in the series and looks a bit unrelated).

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
