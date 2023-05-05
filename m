Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B966FC7AA
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBp-0007Zm-16
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulXd-0000Qj-5X
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:Subject:Cc:To:From:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gVzHKIeVTs5o2uUKP+mQkds3ksDwFVvhqkKafztg4+4=; b=l/6unegSE9ys2Z3PObiHbXHBfu
 qX2ufzQnRJnVeBQKYNsc+8jM8OCr0wnJNG/p1SMlwhPJwsh2IgfQj9cCA9a/itL7YPmjWmumB82ps
 XLZyc7519rEK9BBNV9nKHtLNvladH7hQsM+oDSUxvUulCh6vTXJCXdV3d+DfztspVpqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gVzHKIeVTs5o2uUKP+mQkds3ksDwFVvhqkKafztg4+4=; b=I3loyBD0OVIetzFDnuIMEcoShF
 KNfsFjy6S89o64oP26yurDU5czxPlfVxP1FivPhnOeMGr7emv/kBER3+eN85cHT4p0yIM5pKmZVXP
 gSYlEHa9Hr7/nTpV/+FqFKkcZkrvHH1jJnhXVwaF3qCdTVAXC61Sj0vJ62ld7oiStCWg=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulXd-00ErU7-AY for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:51:29 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso16804067b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 19:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683255084; x=1685847084;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVzHKIeVTs5o2uUKP+mQkds3ksDwFVvhqkKafztg4+4=;
 b=ktqHNk5loLtU/KCwR//Z7tYcVQSm8JM7u7EDXu2OxKQQsBws43LRUPjwNVbUHAGJBj
 gc3DxpQtC1/OOyHW26dX3MwFbgdfWwpOVxdtbuQThRVEzgfI1BNUZ5OhrxthomwTTvW9
 KuWgSVznYjqLHRiyHmWJk+LT2L2s0ufFsPGG+IURgPieshXMcNyyDt/Kzo+DCv0xKjZe
 DyDKfQZeNNs/8VMonmfGERnmO5tTqr0eHZh+Y875AJRCzvNs9yxUih9l0rhqWFmBJrRo
 cV/9lUiVQ0pbHb4cFF5mCXAHtl60nbslHtAtfWdEsj03EbDyIlSOcirz6VnmjBK9H4/J
 ow4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683255084; x=1685847084;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gVzHKIeVTs5o2uUKP+mQkds3ksDwFVvhqkKafztg4+4=;
 b=icmvUOboEUBC1YuZG0Tr2CtVe685z7JMQ2RtzdgCV47Grz5ThZuIWiZzjrsNJsMIQL
 hGts2XPyKriGFGaLqaYM/ycqiTtK4pCVQ6bB2N+0bleNmKUxz8k628bYDTylDbfvYECE
 6f9h2MFWMabThYubiSeFQcW0YhvY335k76Yr0H/B4/ilIV5F8a9jXw+R1vfBYw+jN6Wn
 cAjFCgIRfgGsH41bJu6S5CDnbNNw5NJKWGSV0TkYEOSYUnTFgAsPXkb/Vigu/GFcjWMl
 gFJXCWjiV/egWS8+yfu6maU1tgrQtCv516a17SrRasDKNgg+zcqcXiyULr7eNH7YMjLk
 AQVA==
X-Gm-Message-State: AC+VfDy5ITrRUFvrWiDmSjdN1XvMs5uECR3LgXR/ibz0/AjiZNU6DAdG
 HTfzBq2fmkXK/1SLkMgcPRs=
X-Google-Smtp-Source: ACHHUZ5BRoOs+9WXOczfgGoXbf4YZMUc/Uu5++G5XcOuyogjStZoqiKceepZC/RfSwAcQqdM6F1UUg==
X-Received: by 2002:a17:902:d48e:b0:1a9:68d2:e4ae with SMTP id
 c14-20020a170902d48e00b001a968d2e4aemr6701878plg.2.1683255083704; 
 Thu, 04 May 2023 19:51:23 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 t4-20020a170902bc4400b001ab29e002fbsm367141plz.17.2023.05.04.19.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 19:51:23 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 12:51:06 +1000
Message-Id: <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
In-Reply-To: <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > In preparation for the buddy hardlockup detector,
 rename > touch_nmi_watchdog()
 to touch_hardlockup_watchdog() to make it clear > that it [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pulXd-00ErU7-AY
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 05/17] watchdog/hardlockup: Rename
 touch_nmi_watchdog() to touch_hardlockup_watchdog()
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
> In preparation for the buddy hardlockup detector, rename
> touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clear
> that it will touch whatever hardlockup detector is configured. We'll
> add a #define for the old name (touch_nmi_watchdog) so that we don't
> have to touch every piece of code referring to the old name.

Is this really helpful? Now it's got two names Could just leave it.
If you insist then it'd be better just to rename everything in one
go at the end of a merge window IMO. Conflicts would be trivial.

> Ideally this change would also rename the arch_touch_nmi_watchdog(),
> but that is harder since arch_touch_nmi_watchdog() is exported with
> EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
> hopefully alleviate some of the confusion here.

We don't keep ABI fixed upstream.

Thanks,
Nick

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Rename touch_nmi_watchdog() to ...") new for v4.
>
>  include/linux/nmi.h | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 454fe99c4874..35d09d70f394 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -125,18 +125,35 @@ void watchdog_nmi_disable(unsigned int cpu);
>  void lockup_detector_reconfigure(void);
>  
>  /**
> - * touch_nmi_watchdog - restart NMI watchdog timeout.
> + * touch_hardlockup_watchdog - manually pet the hardlockup watchdog.
>   *
> - * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
> - * may be used to reset the timeout - for code which intentionally
> - * disables interrupts for a long time. This call is stateless.
> + * If we support detecting hardlockups, touch_hardlockup_watchdog() may be
> + * used to pet the watchdog (reset the timeout) - for code which
> + * intentionally disables interrupts for a long time. This call is stateless.
>   */
> -static inline void touch_nmi_watchdog(void)
> +static inline void touch_hardlockup_watchdog(void)
>  {
> +	/*
> +	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
> +	 * the hardlockup detector may not be arch-specific nor using NMIs,
> +	 * but arch_touch_nmi_watchdog() is exported with EXPORT_SYMBOL() and
> +	 * is thus ABI.
> +	 */
>  	arch_touch_nmi_watchdog();
> +
> +	/*
> +	 * Touching the hardlock detector implcitily pets the
> +	 * softlockup detector too
> +	 */
>  	touch_softlockup_watchdog();
>  }
>  
> +/*
> + * It's encouraged for code to refer to the new name, but allow the old
> + * name as well.
> + */
> +#define touch_nmi_watchdog	touch_hardlockup_watchdog
> +
>  /*
>   * Create trigger_all_cpu_backtrace() out of the arch-provided
>   * base function. Return whether such support was available,
> -- 
> 2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
