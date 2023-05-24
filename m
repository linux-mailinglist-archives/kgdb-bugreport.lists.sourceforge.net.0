Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A014D70F827
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 May 2023 15:59:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1p1a-0000JX-Uv
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 May 2023 13:59:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1p1T-0000JP-Rd
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 13:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBvtScxG64js1V2WtJGSat2wyTIF8r92U3UegFL2rYQ=; b=Nct6hKgYqRcbSxkMCVAurnjTUg
 VPYJhrv0poXlNM2Kco+W+Hn4YhNNqP8HTPnmMrYPqy6F5CkvzyUi3yZ3VK0ffbvg/8FcTeefk2vRI
 KoG/rLVRyDsrd5bgKj728G4PmS6jM3sidz8rQ14QtGsKdJtLrb6b15NKf7WwNxkp2oWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBvtScxG64js1V2WtJGSat2wyTIF8r92U3UegFL2rYQ=; b=N3xw2Ac4X0QOVfV/auDnwSQQCh
 CRx4ltfgGmrG4MapcKGkmbbuDWvw5rEMRQqYTzxCCeUmJU3oWOuqQ9s+U36wPJhnI508qbLzof+lS
 fa/fDRsJ/hEdJTx8SHgmhEvlqhRm+NDpC05Hhs1T2fZ0VuEkiMTxTqyH3Yq20iggEWQw=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1p1T-001PZA-Hf for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 13:59:28 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BDD9021D3D;
 Wed, 24 May 2023 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684936756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBvtScxG64js1V2WtJGSat2wyTIF8r92U3UegFL2rYQ=;
 b=RHX2g085w5u88X+4Z6mGRE58L0b4uuVjnoB5ile5yyEku/n0vK3Ga3gzxfL7+dqOWR8qzS
 Enh+hAYTwRSzigqBWe8ELlR+JBHmK0H4bMUVMJEQc98zMr5VIBl3JapUXhy5gy6G8xv9gW
 1Vyj+Mx19rJDf489l0WBgZnOiWR+PkQ=
Received: from suse.cz (dhcp129.suse.cz [10.100.51.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 944262C141;
 Wed, 24 May 2023 13:59:15 +0000 (UTC)
Date: Wed, 24 May 2023 15:59:15 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZG4YMyifGLOBJxLo@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-19 10:18:37, Douglas Anderson wrote: > The
 fact that there watchdog_hardlockup_enable(), > watchdog_hardlockup_disable(), 
 and watchdog_hardlockup_probe() are > declared __weak means tha [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1p1T-001PZA-Hf
Subject: Re: [Kgdb-bugreport] [PATCH v5 13/18] watchdog/hardlockup: Have the
 perf hardlockup use __weak functions more cleanly
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

On Fri 2023-05-19 10:18:37, Douglas Anderson wrote:
> The fact that there watchdog_hardlockup_enable(),
> watchdog_hardlockup_disable(), and watchdog_hardlockup_probe() are
> declared __weak means that the configured hardlockup detector can
> define non-weak versions of those functions if it needs to. Instead of
> doing this, the perf hardlockup detector hooked itself into the
> default __weak implementation, which was a bit awkward. Clean this up.
> 
> >From comments, it looks as if the original design was done because the
> __weak function were expected to implemented by the architecture and
> not by the configured hardlockup detector. This got awkward when we
> tried to add the buddy lockup detector which was not arch-specific but
> wanted to hook into those same functions.
> 
> This is not expected to have any functional impact.
>
> @@ -187,27 +187,33 @@ static inline void watchdog_hardlockup_kick(void) { }
>  #endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
>  
>  /*
> - * These functions can be overridden if an architecture implements its
> - * own hardlockup detector.
> + * These functions can be overridden based on the configured hardlockdup detector.
>   *
>   * watchdog_hardlockup_enable/disable can be implemented to start and stop when
> - * softlockup watchdog start and stop. The arch must select the
> + * softlockup watchdog start and stop. The detector must select the
>   * SOFTLOCKUP_DETECTOR Kconfig.
>   */
> -void __weak watchdog_hardlockup_enable(unsigned int cpu)
> -{
> -	hardlockup_detector_perf_enable();
> -}
> +void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
>  
> -void __weak watchdog_hardlockup_disable(unsigned int cpu)
> -{
> -	hardlockup_detector_perf_disable();
> -}
> +void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
>  
>  /* Return 0, if a hardlockup watchdog is available. Error code otherwise */
>  int __weak __init watchdog_hardlockup_probe(void)
>  {
> -	return hardlockup_detector_perf_init();
> +	/*
> +	 * If CONFIG_HAVE_NMI_WATCHDOG is defined then an architecture
> +	 * is assumed to have the hard watchdog available and we return 0.
> +	 */
> +	if (IS_ENABLED(CONFIG_HAVE_NMI_WATCHDOG))
> +		return 0;
> +
> +	/*
> +	 * Hardlockup detectors other than those using CONFIG_HAVE_NMI_WATCHDOG
> +	 * are required to implement a non-weak version of this probe function
> +	 * to tell whether they are available. If they don't override then
> +	 * we'll return -ENODEV.
> +	 */
> +	return -ENODEV;
>  }

When thinking more about it. It is weird that we need to handle
CONFIG_HAVE_NMI_WATCHDOG in this default week function.

It should be handled in watchdog_hardlockup_probe() implemented
in kernel/watchdog_perf.c.

IMHO, the default __weak function could always return -ENODEV;

Would it make sense, please?

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
