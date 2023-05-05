Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8C6FC7A9
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBo-0007ZY-MK
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulRh-000517-8i
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:Cc:To:From:Subject:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VPayZxQXhn5fHUUTNLTNfbsixo+tOxhKRUmk7oh5a/w=; b=j8VMhrNNMaS6pcSG6HlYo5sSMe
 tCLVY8uq5mIchgVek1i0MRXaBMEryUjrDmEwZm90oWfVtXoIWEysxbQeJY/UasLp4Bdr6e0Ulotz8
 2rXQFlAaPzOuxwDYunBQ4qjfAIAMgDYnVBRKUXN0HsXggL0jl0S50ajPKl3gdbxjZfOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VPayZxQXhn5fHUUTNLTNfbsixo+tOxhKRUmk7oh5a/w=; b=i/dW+xbGSoJhfEQECRtZlG4ROI
 1wcXYTg27CKoL14Ol0XC+Q0TvUOWMxUoedXtOh25hMk1OpBUvyRO5W+dl9yUuaKe9La87uksF+POL
 vx1S+VA4DMNEpP/G9u59OQq8xwm67eG5Retrm4uxNgpc1roIVCRlrwBTRaC9Wknjp0Qo=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulRg-0002T5-KZ for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:45:21 +0000
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-51fcf5d1e44so1063858a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 19:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683254715; x=1685846715;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPayZxQXhn5fHUUTNLTNfbsixo+tOxhKRUmk7oh5a/w=;
 b=WY+pVFDrtbMq8x5EimKII2bW9WUx1lTIueOxBuy+296TzJv/lBCs2CVAl95G11oi+6
 OZNsCVJXRYwNOUePuVJ0+7z9G92HLzFZEMU/ej0a0B82cu11Q9UTbuSiZAbzM14CvYQr
 vSBwEP/zedkJKPWlTT86wxJPoMzMwlMsssbc0ETJDwX1uinKmleFDpH+izvPPzVQ2LlX
 GBO/I7GPjSznEYiBLpenS8d5vQj8J9utS5crxpbEVjZ/mmpFvTw1bfgpr3vdS/SdWaXC
 fm0hYT4RrH3rTkpnTHaFTuS8OW6QdYF/oypQk9UEjTZoOxeIHIMj1e8JUXXQYGHF51Uc
 39eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683254715; x=1685846715;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VPayZxQXhn5fHUUTNLTNfbsixo+tOxhKRUmk7oh5a/w=;
 b=caIklnbMy682uBFaQB5lSRunJq7MxQF513C+a3rg+GEX/4h7Qp13tdiQpQwJ5mtuod
 lu0ArtZsgXm+ibulw7mKN200mCygzL4u2Ktcf0xEodICQKlMeyoFTcwqGY+ccTi0VLaK
 CvE2m1h6HW1husO+0ENGGRenxQfThkHiyseKIaUXFhgzakdVNqnigBOIbXV1FBjBhJmo
 nlDjYyP6C2uAV69j2VXciAW7QUXEM4bnyY3Z3GbeLM1LMKrLRld1gngLMXgBurLepCJJ
 XeSex7asMpH5SfSwjxwZ9WZbdsuBNBz70/oBG1dy9sUFNC6b+bnJ4V3UJjfu3B61LkMd
 8+/A==
X-Gm-Message-State: AC+VfDzbxj3N3pA46PYDae+tlal8H0o4fg32GRlGRp94WFoOepvj/oMp
 mQo5cGJYrKbm506FFB5lA9Y=
X-Google-Smtp-Source: ACHHUZ7idBWKbQjk10tpmFWDhGOiQRpg+CYPjBMjjCmko/Hu86hwsF4Jk+5iuKMKBjLrW41Iwy8Stg==
X-Received: by 2002:a17:902:d315:b0:1ab:13bd:5f96 with SMTP id
 b21-20020a170902d31500b001ab13bd5f96mr5830962plc.4.1683254714963; 
 Thu, 04 May 2023 19:45:14 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 o5-20020a1709026b0500b001a6cd1e4205sm320934plk.279.2023.05.04.19.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 19:45:14 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 12:45:00 +1000
Message-Id: <CSDZZQEL28W8.1WE80JHITRBKA@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.3.Ic3a19b592eb1ac4c6f6eade44ffd943e8637b6e5@changeid>
In-Reply-To: <20230504151100.v4.3.Ic3a19b592eb1ac4c6f6eade44ffd943e8637b6e5@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > From: Lecopzer Chen > > Nobody cares about the return value of
 watchdog_nmi_enable(), 
 > changing its prototype to void. > Acked-by: Nicholas Piggin 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pulRg-0002T5-KZ
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 03/17] watchdog/hardlockup: change
 watchdog_nmi_enable() to void
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net,
 ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> From: Lecopzer Chen <lecopzer.chen@mediatek.com>
>
> Nobody cares about the return value of watchdog_nmi_enable(),
> changing its prototype to void.
>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I yanked this patch from the mailing lists [1] into my series just to
> make it easier to avoid conflicts between my series and the one adding
> the arm64 perf hardlockup detector, in case someone wanted to test
> them both together. This is a nice cleanup and could land together
> with the rest of my series if that makes sense.
>
> I changed the patch prefix to match others in my series.
>
> [1] https://lore.kernel.org/r/20220903093415.15850-3-lecopzer.chen@mediatek.com/
>
> Changes in v4:
> - Pulled ("change watchdog_nmi_enable() to void") into my series for v4.
>
>  arch/sparc/kernel/nmi.c | 8 +++-----
>  include/linux/nmi.h     | 2 +-
>  kernel/watchdog.c       | 3 +--
>  3 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
> index 060fff95a305..5dcf31f7e81f 100644
> --- a/arch/sparc/kernel/nmi.c
> +++ b/arch/sparc/kernel/nmi.c
> @@ -282,11 +282,11 @@ __setup("nmi_watchdog=", setup_nmi_watchdog);
>   * sparc specific NMI watchdog enable function.
>   * Enables watchdog if it is not enabled already.
>   */
> -int watchdog_nmi_enable(unsigned int cpu)
> +void watchdog_nmi_enable(unsigned int cpu)
>  {
>  	if (atomic_read(&nmi_active) == -1) {
>  		pr_warn("NMI watchdog cannot be enabled or disabled\n");
> -		return -1;
> +		return;
>  	}
>  
>  	/*
> @@ -295,11 +295,9 @@ int watchdog_nmi_enable(unsigned int cpu)
>  	 * process first.
>  	 */
>  	if (!nmi_init_done)
> -		return 0;
> +		return;
>  
>  	smp_call_function_single(cpu, start_nmi_watchdog, NULL, 1);
> -
> -	return 0;
>  }
>  /*
>   * sparc specific NMI watchdog disable function.
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 771d77b62bc1..454fe99c4874 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -119,7 +119,7 @@ static inline int hardlockup_detector_perf_init(void) { return 0; }
>  void watchdog_nmi_stop(void);
>  void watchdog_nmi_start(void);
>  int watchdog_nmi_probe(void);
> -int watchdog_nmi_enable(unsigned int cpu);
> +void watchdog_nmi_enable(unsigned int cpu);
>  void watchdog_nmi_disable(unsigned int cpu);
>  
>  void lockup_detector_reconfigure(void);
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 582d572e1379..c705a18b26bf 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -93,10 +93,9 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
>   * softlockup watchdog start and stop. The arch must select the
>   * SOFTLOCKUP_DETECTOR Kconfig.
>   */
> -int __weak watchdog_nmi_enable(unsigned int cpu)
> +void __weak watchdog_nmi_enable(unsigned int cpu)
>  {
>  	hardlockup_detector_perf_enable();
> -	return 0;
>  }
>  
>  void __weak watchdog_nmi_disable(unsigned int cpu)
> -- 
> 2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
