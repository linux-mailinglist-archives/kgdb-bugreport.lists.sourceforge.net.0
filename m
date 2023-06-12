Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247872BF24
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jun 2023 12:34:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q8es6-000205-Oj
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Jun 2023 10:34:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1q8es5-0001zz-U3
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Jun 2023 10:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDSlg54vwBBIuWV7+5kIMyjtmm29S3rTe8iZzQt5kro=; b=SxnpAS8Dv5rR9i/kk6DAYM2Ev8
 vP1MOKOQsNpItBYTFaTAmiiT1MDOtZkEOb6hML9DeDuPze8JYFRM+6zz0RS7ueK/7vW/mwGDAGyyk
 Ul1QEwA6IhUlFzQyFahsTpujnAHIweqrKuJ8T/vrDod3dlSqEX8blCOoUSlrw2j9dGcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDSlg54vwBBIuWV7+5kIMyjtmm29S3rTe8iZzQt5kro=; b=QjREDzjpBbARa6H3dIar1PIXJ1
 JvLrn6+FSU+I0mh2Zw0f5FyrF4tHDKmutVRWTHvxymLI58VNxTybk4eQVQRbRX5xn+JiBXEPgApSk
 PK0SLh4jImmlLKQM+SVd+4sseIN3Kp/R4lsTKaAWyxpTvLvFRaXdy4zr1646OtYcoH+A=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1q8es1-000dGV-Qz for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Jun 2023 10:34:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C32F2F4;
 Mon, 12 Jun 2023 03:34:37 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.27.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BAC03F663;
 Mon, 12 Jun 2023 03:33:47 -0700 (PDT)
Date: Mon, 12 Jun 2023 11:33:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 19, 2023 at 10:18:39AM -0700, Douglas Anderson
 wrote: > On arm64, NMI support needs to be detected at runtime. Add a weak
 > function to the perf hardlockup detector so that an architecture [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8es1-000dGV-Qz
Subject: Re: [Kgdb-bugreport] [PATCH v5 15/18] watchdog/perf: Add a weak
 function for an arch to detect if perf can use NMIs
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
Cc: Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 19, 2023 at 10:18:39AM -0700, Douglas Anderson wrote:
> On arm64, NMI support needs to be detected at runtime. Add a weak
> function to the perf hardlockup detector so that an architecture can
> implement it to detect whether NMIs are available.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> While I won't object to this patch landing, I consider it part of the
> arm64 perf hardlockup effort. I would be OK with the earlier patches
> in the series landing and then not landing ${SUBJECT} patch nor
> anything else later.

FWIW, everything prior to this looks fine to me, so I reckon it'd be worth
splitting the series here and getting the buddy lockup detector in first, to
avoid a log-jam on all the subsequent NMI bits.

Thanks,
Mark.

> I'll also note that, as an alternative to this, it would be nice if we
> could figure out how to make perf_event_create_kernel_counter() fail
> on arm64 if NMIs aren't available. Maybe we could add a "must_use_nmi"
> element to "struct perf_event_attr"?
> 
> (no changes since v4)
> 
> Changes in v4:
> - ("Add a weak function for an arch to detect ...") new for v4.
> 
>  include/linux/nmi.h    |  1 +
>  kernel/watchdog_perf.c | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 47db14e7da52..eb616fc07c85 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -210,6 +210,7 @@ static inline bool trigger_single_cpu_backtrace(int cpu)
>  
>  #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
>  u64 hw_nmi_get_sample_period(int watchdog_thresh);
> +bool arch_perf_nmi_is_available(void);
>  #endif
>  
>  #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index 349fcd4d2abc..8ea00c4a24b2 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -234,12 +234,22 @@ void __init hardlockup_detector_perf_restart(void)
>  	}
>  }
>  
> +bool __weak __init arch_perf_nmi_is_available(void)
> +{
> +	return true;
> +}
> +
>  /**
>   * watchdog_hardlockup_probe - Probe whether NMI event is available at all
>   */
>  int __init watchdog_hardlockup_probe(void)
>  {
> -	int ret = hardlockup_detector_event_create();
> +	int ret;
> +
> +	if (!arch_perf_nmi_is_available())
> +		return -ENODEV;
> +
> +	ret = hardlockup_detector_event_create();
>  
>  	if (ret) {
>  		pr_info("Perf NMI watchdog permanently disabled\n");
> -- 
> 2.40.1.698.g37aff9b760-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
