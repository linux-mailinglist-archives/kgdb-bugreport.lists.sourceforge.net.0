Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C46170D9B4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 May 2023 11:58:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1Omx-000450-Hg
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 May 2023 09:58:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1Omi-00044r-Bg
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 09:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nijlHHOQkzUZvFPKISvsuCEtH+liiy/rrVmusLy93j8=; b=a20qyvjy5Venscfd9Z+1a7sDMw
 8lhHPIWB5OOdLVZLDAyl6csjdDxKc3qOTZ4+RGIess+90vSRSS9o0KMa0UccusEZilINd80GCEwrt
 /aq4lUHmjy/KwGjag+lmX86wktIkluVxUToYAjjoHTaxbhbT6Xz6Il6cCv/jGUWTTmXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nijlHHOQkzUZvFPKISvsuCEtH+liiy/rrVmusLy93j8=; b=HIpDgkrRuLIVgARW8/FGZ07FTd
 QYeXTFNAIfwM+MMCJr/1vCu8pCDBYFN9xUXOsp2RMn7dOsAiuf9zsABOjob8l+8noGEIpP6dqIkAB
 ExF9SiBgeAe1fhYi8GIJBp6Qiab/oUcy0/LfnnirAQ/mFINLjzat+AnHj5FfXKhHqvU0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1Omg-00019m-1l for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 09:58:28 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id ABFEE228CB;
 Tue, 23 May 2023 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684835895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nijlHHOQkzUZvFPKISvsuCEtH+liiy/rrVmusLy93j8=;
 b=ukTNS+LA6LnEMXgs7TAWMh1IEmoqBA7OQZDzqQXjQCWc5jDXPfiss/BRVs+P68hkc1jpJr
 c6osfgyH7PPHg1SaA9cUw8ILMGtVpU6UYgIiSt2i5Y85hLTxvlKanmjx7xXSsVqooWm2a+
 O77Wy9lZcLNnFK6dGprQMn1Tn2HdM8E=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 305BA2C141;
 Tue, 23 May 2023 09:58:14 +0000 (UTC)
Date: Tue, 23 May 2023 11:58:13 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZGyONWPXpE1DcxA5@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.6.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.6.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:30,
 Douglas Anderson wrote: > In preparation
 for the buddy hardlockup detector, add comments to > touch_nmi_watchdog()
 to make it obvious that it touches the configured > hardl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1Omg-00019m-1l
Subject: Re: [Kgdb-bugreport] [PATCH v5 06/18] watchdog/hardlockup: Add
 comments to touch_nmi_watchdog()
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

On Fri 2023-05-19 10:18:30, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector, add comments to
> touch_nmi_watchdog() to make it obvious that it touches the configured
> hardlockup detector regardless of whether it's backed by an NMI. Also
> note that arch_touch_nmi_watchdog() may not be architecture-specific.
> 
> Ideally, we'd like to rename these functions but that is a fairly
> disruptive change touching a lot of drivers. After discussion [1] the
> plan is to defer this until a good time.
> 
> [1] https://lore.kernel.org/r/ZFy0TX1tfhlH8gxj@alley
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v5:
> - No longer rename touch_nmi_watchdog(), just add comments.
> 
> Changes in v4:
> - ("Rename touch_nmi_watchdog() to ...") new for v4.
> 
>  include/linux/nmi.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 454fe99c4874..fafab128f37e 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -125,15 +125,30 @@ void watchdog_nmi_disable(unsigned int cpu);
>  void lockup_detector_reconfigure(void);
>  
>  /**
> - * touch_nmi_watchdog - restart NMI watchdog timeout.
> + * touch_nmi_watchdog - manually pet the hardlockup watchdog.
>   *
> - * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
> - * may be used to reset the timeout - for code which intentionally
> - * disables interrupts for a long time. This call is stateless.
> + * If we support detecting hardlockups, touch_nmi_watchdog() may be
> + * used to pet the watchdog (reset the timeout) - for code which

Nit: I personally prefer "reset the timeout" over "pet the watchdog".
     "pet" is just another ambiguous name as "touch" ;-)

> + * intentionally disables interrupts for a long time. This call is stateless.
> + *
> + * Though this function has "nmi" in the name, the hardlockup watchdog might
> + * not be backed by NMIs. This function will likely be renamed to
> + * touch_hardlockup_watchdog() in the future.
>   */
>  static inline void touch_nmi_watchdog(void)
>  {
> +	/*
> +	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
> +	 * the hardlockup detector may not be arch-specific nor using NMIs
> +	 * and the arch_touch_nmi_watchdog() function will likely be renamed
> +	 * in the future.
> +	 */
>  	arch_touch_nmi_watchdog();
> +
> +	/*
> +	 * Touching the hardlock detector implcitily pets the
> +	 * softlockup detector too
> +	 */

s/implcitily/implicitly/

That said, I would remove this comment completely. It describes what
is clear from the code.

A more useful information would be why it is done. But it is probably
clear as well. CPU could not schedule when interrupts are disabled.

>  	touch_softlockup_watchdog();
>  }

With the removed comment above touch_softlockup_watchdog():

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
