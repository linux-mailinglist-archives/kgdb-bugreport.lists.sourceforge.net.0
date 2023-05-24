Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EF70F746
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 May 2023 15:08:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1oDi-00081E-Hs
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 May 2023 13:08:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1oDa-00080v-E8
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 13:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1uzlbCLytRmf0lA+DtAHijJtX4O3Gwzv81/iHYbX4xM=; b=e4PQJnNiyFfPrCDwhjGcRRFbXT
 Qp/c3zQTRFbFHj/Pb1BIb3o8fx13nUD7F2xwTxc73oQM70EDcQn9aU9QqHEGh5qlDr/h5NGq+zSf7
 CfyX8dsdk23Msk0smaHRG/4CP6KfDLfAdJZFfsEr+VkRnR+fTZ6GEwbHq6LwxG+5FWHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1uzlbCLytRmf0lA+DtAHijJtX4O3Gwzv81/iHYbX4xM=; b=Qy4Q5tiXUAEZIQo90lZtzdSbvU
 Ek7AyjddDWXzuAcezdrH8ICRdvbFF0FH8PrVJyjev/9qEWnSyV/5QdyLC/i22qvbmRIXvM6l711CK
 xmCTTXkU3hMVQIMB4y0JkO99x82LPU2rRP8JT4cCq1Co3dLqQefWk4iOudQk5TdqwTIE=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1oDZ-0000rM-1l for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 13:07:54 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C5C241F8AA;
 Wed, 24 May 2023 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684933666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1uzlbCLytRmf0lA+DtAHijJtX4O3Gwzv81/iHYbX4xM=;
 b=dNCKCmzrAguc4Zu0EVLMzkQBOnzySCfPWd6UAjSLLX4F7lVFU/qdF2897g72w3J9pbcyo7
 hMgY3ZZMBUMpYla7bUIKkhKJHRHTtECbW305O4opeysKGun6LgnV0dOKn6b9AFAsXyiSo6
 MTyA6XI74c0YA2S//W5ap7ZCPSlLK1c=
Received: from suse.cz (dhcp129.suse.cz [10.100.51.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B798F2C141;
 Wed, 24 May 2023 13:07:44 +0000 (UTC)
Date: Wed, 24 May 2023 15:07:44 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZG4MIFNPi6zwO_WV@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.11.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.11.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:35,
 Douglas Anderson wrote: > In preparation
 for the buddy hardlockup detector, which wants the same > petting logic as
 the current perf hardlockup detector, move the code > to [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1oDZ-0000rM-1l
Subject: Re: [Kgdb-bugreport] [PATCH v5 11/18] watchdog/hardlockup: Move
 perf hardlockup watchdog petting to watchdog.c
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
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-19 10:18:35, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector, which wants the same
> petting logic as the current perf hardlockup detector, move the code
> to watchdog.c. While doing this, rename the global variable to match
> others nearby. As part of this change we have to change the code to
> account for the fact that the CPU we're running on might be different
> than the one we're checking.
> 
> Currently the code in watchdog.c is guarded by
> CONFIG_HARDLOCKUP_DETECTOR_PERF, which makes this change seem
> silly. However, a future patch will change this.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
