Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3D6FC7AB
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBp-0007Zy-Cp
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulZU-0001he-QM
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TvuQIwE86qT9nMkGXeQaDip5ug2GQu1BAKE7bYWgdwk=; b=WC0gtlWE5N6MzDHndEy3EfBuoT
 1XbPWxEHGbRSyrFsTSNWR2x6OgtFtwkfH0oiC/fMXi+2InfHREsqw3zzuvT40/Nn2YQQgbqQ41BEq
 MQwixQPiTPU+sUGHZpfu8VSuH39st5B0uKv7PsTe/MjT9tM/Xe8RqskNIPeDSZoSluiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TvuQIwE86qT9nMkGXeQaDip5ug2GQu1BAKE7bYWgdwk=; b=ikkteSsT510RgU1/VdV1y3NyDV
 mfVYPly5laRTGP3HdijFEa9v6LcslJPvQoxUbunIxYuSfdvmXSgNCnAIckYLihFHUIfEWSDE1ooWF
 KN+ecWHQPZ3lIU0K8jMbBjq/th8xhBC8Ev4UngkFKbvixmevF1QIr2V+8ZqcLfVLNUyw=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulZQ-0002cP-Jw for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:53:24 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1aaf21bb427so8954485ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683255195; x=1685847195;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvuQIwE86qT9nMkGXeQaDip5ug2GQu1BAKE7bYWgdwk=;
 b=jxvLXO0ysCTk5XQj17Rp4MPTljRhsg/NAlWqiFmGR2fpw55Cfg5sVLQNF9ke8zqu/N
 HHnWR+znibrRLrH9vcnvMDlm348iuI+SsyPL+KjDHd8kJ+kLygMtANYkoqlJA6z6lSGj
 QZNZWJy5SjgWh7ZGzeckqYUPsJuTsWIU94R5NJGqG7ornKXAjfQhUxU9ZW6eHYyHSwC8
 XuNhhR9rjzN6nhEHsIDIEBvw8EKr9RR4JqVK8n0VmA4Fy2LIawRCSoZ2wFbIEnMX0Hu7
 jCpsjNuzdvbOAUR1puJswLMYD3EbpysfH1e5Yu7q8B6TUU8LxJDGkmTXqTGuht3T2lUp
 xFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683255195; x=1685847195;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TvuQIwE86qT9nMkGXeQaDip5ug2GQu1BAKE7bYWgdwk=;
 b=ky7h2NWdXBrf2aNuoH07qsjESAsLXLujGsUwUGZjCNus+AC9kuae7xU7UZ5TIBRG57
 hvXFpXuOM+bS0zMBlpKtwVQEZ+5B/OsmxS70ZzbTABEIJ/1/q3hlTZ9NyVkHROCfkdLL
 1qcSvUI7Py73jFpS7KcFPNsf3+BrQNUaCqNGfsR4L/JdpdHTkhCCjFJ68EuPqYJtd8H/
 MKtw1nCm595zou3dEK2s6UqpcrqhgesN9gPS1HDF3Xhu+6I9vqr/7o5DktaNHqvoecgK
 4rbckeuZi7GvZTQMqfQg1F96bOxPsOjdDQzQkTcTD9nqRk4MeNKCT4uT9mvziLnc0PnE
 Tf0w==
X-Gm-Message-State: AC+VfDyyLFZFn8kpIBJAFgdLzBaxtqvv7JsvbKDuWNm8q6Rv3CvmO2tr
 B/JoZ3WLx3qOfLHQ6m7d9Qo=
X-Google-Smtp-Source: ACHHUZ5a9oH4I1uJO71H1fLGgVbhwllNxoxjP5ILVe8scfc+huKbvNVr33otWqWTE3YRZg/we43I2g==
X-Received: by 2002:a17:903:2285:b0:1aa:f536:b1e2 with SMTP id
 b5-20020a170903228500b001aaf536b1e2mr6428524plh.62.1683255194928; 
 Thu, 04 May 2023 19:53:14 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170902eccd00b00186a2274382sm356805plh.76.2023.05.04.19.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 19:53:14 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 12:53:01 +1000
Message-Id: <CSE05UZ1HC0R.2L6QW2OI7GIMA@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
In-Reply-To: <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > The code currently in "watchdog_hld.c" is for detecting hardlockups > using
 perf, as evidenced by the line in the Makefile that only > com [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pulZQ-0002cP-Jw
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
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

Better than the confusion that the perf version is *the* hardlockup
detector IMO.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Rename watchdog_hld.c to watchdog_perf.c") new for v4.
>
>  kernel/Makefile                            | 2 +-
>  kernel/{watchdog_hld.c => watchdog_perf.c} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename kernel/{watchdog_hld.c => watchdog_perf.c} (99%)
>
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 10ef068f598d..406ccccc4dd3 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -91,7 +91,7 @@ obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
>  obj-$(CONFIG_KGDB) += debug/
>  obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
>  obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
> -obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_hld.o
> +obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o
>  obj-$(CONFIG_SECCOMP) += seccomp.o
>  obj-$(CONFIG_RELAY) += relay.o
>  obj-$(CONFIG_SYSCTL) += utsname_sysctl.o
> diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_perf.c
> similarity index 99%
> rename from kernel/watchdog_hld.c
> rename to kernel/watchdog_perf.c
> index 96b717205952..c3d8ceb149da 100644
> --- a/kernel/watchdog_hld.c
> +++ b/kernel/watchdog_perf.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Detect hard lockups on a system
> + * Detect hard lockups on a system using perf
>   *
>   * started by Don Zickus, Copyright (C) 2010 Red Hat, Inc.
>   *
> -- 
> 2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
