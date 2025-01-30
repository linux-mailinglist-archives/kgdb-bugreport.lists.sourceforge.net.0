Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FDA22990
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Jan 2025 09:27:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tdPtp-0004qI-JD
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 30 Jan 2025 08:27:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdPtn-0004pH-6g for kgdb-bugreport@lists.sourceforge.net;
 Thu, 30 Jan 2025 08:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pme/fCB9gQn79dSGejiJbfsX1E2LqH8A1Q5+Zrb2eDQ=; b=a4oRaAJ4Q2k89U4g8crQx0sagG
 6lqofh2V4/yq08sm8bRgvEQzWATyfDQilYSn7uZ/CM64oWyKqDsOQJN7GS/uOINfH1rkrXuFGrhuX
 R0t8XuzcqlTnji9jln1osBkXvELdBUpcmjeBKZlUQ8joN8zmzuBzg474ucC37pFSaQJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pme/fCB9gQn79dSGejiJbfsX1E2LqH8A1Q5+Zrb2eDQ=; b=FC42SDJzJTeGAHTgOi0SGMcGuE
 J4y+R3EUtNhOO2z4o7NXV3AQyfm5pk17pPC6BhQhekUv4IGWJ/sSc0I/266TIzp+zPiJ7rUoAXL5G
 g9oPXkfaPuHrmC+SveDSCLgygZ87sxJozoR4OtftZBqIwLnLuWmLVO1OEl/WlBEg3mBo=;
Received: from mgamail.intel.com ([198.175.65.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdPtm-00035H-SP for kgdb-bugreport@lists.sourceforge.net;
 Thu, 30 Jan 2025 08:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738225663; x=1769761663;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zOHzA3WIRnWRYd8zYSHICptJqDMxtviZfBL5dLN0Ck4=;
 b=Q5D1MLA3/bzoAi7Gjn+qfeWEPO82VIviNx/4gTw5IFeEy5G3SKspUXVP
 P6xAnVtKfeC7Pu2lLaBjop78BVYN9KCQ9kG53D2rwrwCEVGN/u2GRIYus
 Q4a36wHmgmDLUCIdrORigA/6ksDpO3V/W7XMGG987i3GDB3g4KjOWfeGP
 lN7o+4dI7OS7mJP3xh0adHsrpfE7B34mksWllYMy+ZvMDuxjfeMMKZs02
 A/tmMAsxOeF/e0c5Sm6jldK/VnUfWkUTul8RAK0Obv2d7JKGwvvihjAJ3
 lcW7HCbWZbRiFe7NyRIM5ckUawg1Ut1vCwdx/IZEG4y6mEKziXeDhMZTP Q==;
X-CSE-ConnectionGUID: iZLHGawkRuqSThcPXheOUA==
X-CSE-MsgGUID: GoggPn6nQJWqPwp+V4VhdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38649781"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38649781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:27:37 -0800
X-CSE-ConnectionGUID: 5nz1vCDUTaSrJIal1+RIVw==
X-CSE-MsgGUID: quipAQiYQQqx09CcBDV6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="114297897"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:27:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tdPtZ-00000006ctb-2XVl; Thu, 30 Jan 2025 10:27:29 +0200
Date: Thu, 30 Jan 2025 10:27:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <Z5s38S7sJ2mka3-1@smile.fi.intel.com>
References: <20250129162700.848018-1-dianders@chromium.org>
 <20250129082535.1.Ia095eac1ae357f87d23e7af2206741f5d40788f1@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129082535.1.Ia095eac1ae357f87d23e7af2206741f5d40788f1@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 29, 2025 at 08:25:50AM -0800, Douglas Anderson
 wrote: > This reverts commit 0c57dfcc6c1d037243c2f8fbf62eab3633326ec0. >
 > The functionality was supoosed to be used by a later patch in the [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.21 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.21 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.21 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdPtm-00035H-SP
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

On Wed, Jan 29, 2025 at 08:25:50AM -0800, Douglas Anderson wrote:
> This reverts commit 0c57dfcc6c1d037243c2f8fbf62eab3633326ec0.
> 
> The functionality was supoosed to be used by a later patch in the
> series that never landed [1]. Drop it.
> 
> NOTE: part of functionality was already reverted by commit
> 39d0be87438a ("serial: kgdb_nmi: Remove unused knock code"). Also note
> that this revert is not a clean revert given code changes that have
> happened in the meantime.
> 
> It's obvious that nobody is using this code since the two exposed
> functions (kgdb_register_nmi_console() and
> kgdb_unregister_nmi_console()) are both no-ops if
> "arch_kgdb_ops.enable_nmi" is not defined. No architectures define it.

Fine with me.
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> [1] https://lore.kernel.org/lkml/1348522080-32629-9-git-send-email-anton.vorontsov@linaro.org/

It might be possible to use Link tag here in a form

Link: URL [1]


-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
