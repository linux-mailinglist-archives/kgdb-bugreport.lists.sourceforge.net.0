Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068B6FC7A7
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBo-0007ZO-Aa
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulQa-0000LD-Oq
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6p6u1lFjW4Kf09rSTKWsXMKlDYVeiQSooaSY9v1sr/Q=; b=malfZfUpe8XRsuQh9FZ+ewlF4K
 hnLCoSgOQN6TtMzqnCXDrQuiuM78HWRJGNsrCRA/jDYYD3cFAxXnhXehoPWSc3KJI5Tbz7oBT340b
 ngPzcKN/ZTBSM47vQiymSIndXc1bx3iiuXWvu/SF7JLnGhz01Af9TlhAdmmeFYIrTHCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6p6u1lFjW4Kf09rSTKWsXMKlDYVeiQSooaSY9v1sr/Q=; b=biB+P1LEl1JUi/7bKh9fgdGxhU
 Uvk5awQUMHlLhbXiR9dCtrhM9u2+GiW6xaXkMVZrkWQC/HSxNqjA7lbrLlEscEQTpboLTst59eupw
 cBoYm6wwIvmZMGyX6iz4IkUTzuY3GpDQwCjPQklHoklM2rsKV+jswrVmgu4CYL6fo5rQ=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulQX-0002Qb-Ds for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:44:13 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16658525b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 19:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683254644; x=1685846644;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6p6u1lFjW4Kf09rSTKWsXMKlDYVeiQSooaSY9v1sr/Q=;
 b=QbKGfhq0/VukYKNOHSY0v6xool59GlcBA7iNCg/HZdPbfNOI2U2wcnjPXAdf3zpDkj
 neU9jKCAtRwHCKxj/dP2KmEw7WoZ+/fSgnPuru60Zr2cLV8DFMTJpFsvQUp0osYoWylv
 rT8pWaBnXgiHvYDJMiG4neHu+4VqKhfWNnr1tIHtYOjRAWtH4DTqcyx92QPeDmU7q82E
 frpiNSAXqak7qrwnnS0dIUPjc5fXWsiEuhJKdxFLctM5Zvbjdi+fLfjCp2V83M1r4jnH
 XnrKN5LRxqq3UGh5iew5MwCe4VHRQcAXT4k2Gtdn/87diQ/0Tf+k5/0FugOrgI2Vifc8
 agSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683254644; x=1685846644;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6p6u1lFjW4Kf09rSTKWsXMKlDYVeiQSooaSY9v1sr/Q=;
 b=ad/F2QWY9Nhx5WNHd9w4+Pu3KWezLvFpmUWdxgVPlIRYvloNzHuEYmT4Nx2l4Ue8i5
 kbXaILoMzZqBEzfRUcsUM86ZSerJ3pAUlWOS8MHO5WqKe+8yAzIcCxdRrtHaPhznFhgS
 UY8TMYGowqNqA/p8ueEx4fC75elwLKlfsU2x30lDTCnB7Xt1dmYIovsmYfqfw0h/mHCx
 ldShkXofIHhTWiGoBXbmk1uvCYQAWByzAxyph8Nj37MAmjU5HjwV22h0fCc6zzx89hZf
 fq6deolf6wpTQXxqNBSl4jLNTYRclVQUAidVQfHnO6Cu/fRkPvHOK4/eHCBtnOmkCwku
 d54w==
X-Gm-Message-State: AC+VfDwfpaM5bC1Pv94gfuckwcIgnur8JN/fxVV1ALY6qmCraHVxuq8a
 gs4ZcpzfpjnA7hHCqhPmlrM=
X-Google-Smtp-Source: ACHHUZ4FBwflGrFFYjYNCYAzAyBJY99qsAdoPf2uCzMYjlcj4Lp1AfSMQ3BwlsR14zq5zCM3V2Gwxg==
X-Received: by 2002:a05:6a20:4309:b0:f4:c0d6:87c with SMTP id
 h9-20020a056a20430900b000f4c0d6087cmr202733pzk.14.1683254643632; 
 Thu, 04 May 2023 19:44:03 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 n7-20020aa79047000000b00642ea56f06fsm435666pfo.0.2023.05.04.19.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 19:44:02 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 12:43:49 +1000
Message-Id: <CSDZYTDN5EHC.1AOZO6QV1UGJR@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
In-Reply-To: <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > The real watchdog_update_hrtimer_threshold() is defined in >
 watchdog_hardlockup_perf.c.
 That file is included if In kernel/watchdog_hld.c. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pulQX-0002Qb-Ds
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 01/17] watchdog/perf: Define dummy
 watchdog_update_hrtimer_threshold() on correct config
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
> The real watchdog_update_hrtimer_threshold() is defined in
> watchdog_hardlockup_perf.c. That file is included if

In kernel/watchdog_hld.c.

> CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
> file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.
>
> The dummy version of the function in "nmi.h" didn't get that quite
> right. While this doesn't appear to be a huge deal, it's nice to make
> it consistent.

It doesn't break builds because CHECK_TIMESTAMP is only defined by
x86 so others don't get a double definition, and x86 uses perf lockup
detector, so it gets the out of line version.

So has no functional change but should be fixed.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Define dummy watchdog_update_hrtimer_threshold() ...") new for v4.
>
>  include/linux/nmi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 048c0b9aa623..771d77b62bc1 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -197,7 +197,7 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh);
>  #endif
>  
>  #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
> -    defined(CONFIG_HARDLOCKUP_DETECTOR)
> +    defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
>  void watchdog_update_hrtimer_threshold(u64 period);
>  #else
>  static inline void watchdog_update_hrtimer_threshold(u64 period) { }
> -- 
> 2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
