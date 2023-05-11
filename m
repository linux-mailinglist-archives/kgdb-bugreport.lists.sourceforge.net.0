Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BE6FEFA6
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 12:09:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px3Et-00071Q-Vn
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 10:09:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px3Es-00071E-AH
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 10:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SbrhlAxTy12DuOMU4fjS/AymAGt4r/nQ5uvoi576oXM=; b=NSAnmYEXp1INq4x35KB6bKCfVF
 PCU/LyuU2XbZv6KFsVU1wHGc3Pn7gWIrWwtAxTeUFVA6biR7Fv/rsZeagJ5NNAoUp5AVtQI7KdwXS
 /0PWADoHG/F8D1n+xAi1y0LViAQyVQjpU4DW4yJhgfMabG+fz7TU/nVXK4IqnJ4Uoq6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SbrhlAxTy12DuOMU4fjS/AymAGt4r/nQ5uvoi576oXM=; b=Yjpks4LoAQqas6H6XbkLL49jNM
 A/S1y9SMIOl8q5jHXhQUxjCHr1m1+eTPoTpm7/IWAHln9iPdMcd8c7oMhW8nTewQIllR112NZQalY
 sAVTm3NpFOUspUaLnEja7N0AOLugpAAbITIdxV2kuiolCg7dFFvZzXHkdpjkLbHNdbe4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px3Es-003DEN-E4 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 10:09:35 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0B8EF21A7A;
 Thu, 11 May 2023 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683799768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SbrhlAxTy12DuOMU4fjS/AymAGt4r/nQ5uvoi576oXM=;
 b=VAUBVXxcOYrdWYrOPvR6B8qg753tmtNfI5oh7SL8GWP9gCw0aTtROJHDE8kWmh+b1nFuKu
 C6IZngtzdwZjZhkrt4EyTwF+Z+vfmDTwEWo5LzOjQE1ptpqObMqhXokJERk5TNsjOb/xyc
 9Erw3Fcbne9jc8AZ14Njgrl3nfmsYoE=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CCAF52C141;
 Thu, 11 May 2023 10:09:25 +0000 (UTC)
Date: Thu, 11 May 2023 12:09:24 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZFy-1Mv_od3Fu--y@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-05-04 15:13:38, Douglas Anderson wrote: > The
 code currently in "watchdog_hld.c" is for detecting hardlockups > using perf, 
 as evidenced by the line in the Makefile that only > compiles th [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
X-Headers-End: 1px3Es-003DEN-E4
Subject: Re: [Kgdb-bugreport] [PATCH v4 06/17] watchdog/perf: Rename
 watchdog_hld.c to watchdog_perf.c
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2023-05-04 15:13:38, Douglas Anderson wrote:
> The code currently in "watchdog_hld.c" is for detecting hardlockups
> using perf, as evidenced by the line in the Makefile that only
> compiles this file if CONFIG_HARDLOCKUP_DETECTOR_PERF is
> defined. Rename the file to prepare for the buddy hardlockup detector,
> which doesn't use perf.
> 
> It could be argued that the new name makes it less obvious that this
> is a hardlockup detector. While true, it's not hard to remember that
> the "perf" detector is always a hardlockup detector and it's nice not
> to have names that are too convoluted.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
