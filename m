Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7B9D912
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 27 Aug 2019 00:26:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1i2NR5-0000Y2-19
	for lists+kgdb-bugreport@lfdr.de; Mon, 26 Aug 2019 22:26:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1i2NR3-0000XU-T7
 for kgdb-bugreport@lists.sourceforge.net; Mon, 26 Aug 2019 22:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygGU8DXWO27Q7hU4Gq61cURNY6ZFP912S21n8nKf1Hs=; b=FTVDjoi+ph9btW18Usp+0d4FGU
 G3ng/t4m3TNk/DGYhHYDrByzQCmU+bn1lWF8EvmscXgm5zspxrfMOz8PECBucpUiSnN9nks833Sx+
 KcAQY+OBiTiC9cLRV09R7Wsl1kpAfwiAHUO44IKXlj0VfteGLbYOZwIlXX3agTaJ4s8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ygGU8DXWO27Q7hU4Gq61cURNY6ZFP912S21n8nKf1Hs=; b=U05wZr1P1nqkmzs0f7rinaMcgj
 C7eb+5+kSXOu9Igfm4vsIrbXVuoaVzmI5COf5YijA5/2I7b6v9ifmq+vLaOFz0ojxOws9IIj74/Ow
 vkuuzNk1AEYtZXFPYdpGYj6lsRvHb/xxTtJL0OgSWsoGeSlsCH8YScV9Optjb4OtxUWM=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i2NR2-00GIU2-DM
 for kgdb-bugreport@lists.sourceforge.net; Mon, 26 Aug 2019 22:26:01 +0000
Received: by mail-io1-f68.google.com with SMTP id b10so32359070ioj.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 26 Aug 2019 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygGU8DXWO27Q7hU4Gq61cURNY6ZFP912S21n8nKf1Hs=;
 b=UtMoWumbCJ634fip4dFc90v0ojimVkA6Sm7sxgejzU4PsxHukts3eRWIhXUMFiGfrV
 8sn596xpxuu10d6PAtHfgCUwGei4KF8Trtt/UwFilKk+pYsyGBh0BPkD/AXTvFfhkDRj
 Iu8Vpk9ycW0DyzQMHJFuDaaP7bxxkkTjqzUY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygGU8DXWO27Q7hU4Gq61cURNY6ZFP912S21n8nKf1Hs=;
 b=H3bEC3flSxrCc6fNUoAXL3GD1r1V92BQopHbxhUb5iES+foIC8Mf06xss+JHa7izfg
 IgkGUkl2XaUgJoR7UG5ZNuBx8v6skNh4cdcNk3fI5AqwCvuhfjTMrFaGl//FwkoujDND
 QV4wUjJN70KLYhabjmIriHBflfdLQZ5pa4OGO+U+R/5tth74dyTjopVnvn0s9JMRwkGX
 Y9yKo4TDj9oZvgwYatwTAQ2V/3xx7cbBYbm4qNJhAO1Jjg65BkHkv/7gLWXwBpQuBAvd
 nRjobIHTCoSIGHDkWsFUzO3a18Q4d7+N3NWCfRoQqQfBKP8dxjdJ6pox++x6DgYI44Wd
 7Y9A==
X-Gm-Message-State: APjAAAXqMGpGdpXjoSdt6s9Nrwl6+JJxwUBoXEdTBSuyj6i/NP7GQiVT
 gNDLob+l04SCAFnheW0LwOfFc2O15Xc=
X-Google-Smtp-Source: APXvYqy4wcw2zWG7xXLENmp4JSMuB3r/gGhsMp6I4Uxcsi/IREFbzLRWJHZJeMecQvv6VJjr9chdAw==
X-Received: by 2002:a6b:5a12:: with SMTP id o18mr6922837iob.159.1566858354238; 
 Mon, 26 Aug 2019 15:25:54 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id c3sm20478000iot.42.2019.08.26.15.25.53
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2019 15:25:53 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id p12so41458420iog.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 26 Aug 2019 15:25:53 -0700 (PDT)
X-Received: by 2002:a02:8481:: with SMTP id f1mr20019902jai.112.1566858352806; 
 Mon, 26 Aug 2019 15:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190731183732.178134-1-dianders@chromium.org>
In-Reply-To: <20190731183732.178134-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Aug 2019 15:25:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wh4M_A01gsWYBXSdgs0Gg4LAGDZ8X+5=4j=nuxiJ8kNA@mail.gmail.com>
Message-ID: <CAD=FV=Wh4M_A01gsWYBXSdgs0Gg4LAGDZ8X+5=4j=nuxiJ8kNA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i2NR2-00GIU2-DM
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Fix stack crawling on
 'running' CPUs that aren't the master
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Jason / Daniel,

On Wed, Jul 31, 2019 at 11:38 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> In kdb when you do 'btc' (back trace on CPU) it doesn't necessarily
> give you the right info.  Specifically on many architectures
> (including arm64, where I tested) you can't dump the stack of a
> "running" process that isn't the process running on the current CPU.
> This can be seen by this:
>
>  echo SOFTLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
>  # wait 2 seconds
>  <sysrq>g
>
> Here's what I see now on rk3399-gru-kevin.  I see the stack crawl for
> the CPU that handled the sysrq but everything else just shows me stuck
> in __switch_to() which is bogus:
>
> ======
>
> [0]kdb> btc
> btc: cpu status: Currently on cpu 0
> Available cpus: 0, 1-3(I), 4, 5(I)
> Stack traceback for pid 0
> 0xffffff801101a9c0        0        0  1    0   R  0xffffff801101b3b0 *swapper/0
> Call trace:
>  dump_backtrace+0x0/0x138
>  ...
>  kgdb_compiled_brk_fn+0x34/0x44
>  ...
>  sysrq_handle_dbg+0x34/0x5c
> Stack traceback for pid 0
> 0xffffffc0f175a040        0        0  1    1   I  0xffffffc0f175aa30  swapper/1
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f65616c0
> Stack traceback for pid 0
> 0xffffffc0f175d040        0        0  1    2   I  0xffffffc0f175da30  swapper/2
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f65806c0
> Stack traceback for pid 0
> 0xffffffc0f175b040        0        0  1    3   I  0xffffffc0f175ba30  swapper/3
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f659f6c0
> Stack traceback for pid 1474
> 0xffffffc0dde8b040     1474      727  1    4   R  0xffffffc0dde8ba30  bash
> Call trace:
>  __switch_to+0x1e4/0x240
>  __schedule+0x464/0x618
>  0xffffffc0dde8b040
> Stack traceback for pid 0
> 0xffffffc0f17b0040        0        0  1    5   I  0xffffffc0f17b0a30  swapper/5
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f65dd6c0
>
> ===
>
> The problem is that 'btc' eventually boils down to
>   show_stack(task_struct, NULL);
>
> ...and show_stack() doesn't work for "running" CPUs because their
> registers haven't been stashed.
>
> On x86 things might work better (I haven't tested) because kdb has a
> special case for x86 in kdb_show_stack() where it passes the stack
> pointer to show_stack().  This wouldn't work on arm64 where the stack
> crawling function seems needs the "fp" and "pc", not the "sp" which is
> presumably why arm64's show_stack() function totally ignores the "sp"
> parameter.
>
> NOTE: we _can_ get a good stack dump for all the cpus if we manually
> switch each one to the kdb master and do a back trace.  AKA:
>   cpu 4
>   bt
> ...will give the expected trace.  That's because now arm64's
> dump_backtrace will now see that "tsk == current" and go through a
> different path.
>
> In this patch I fix the problems by catching a request to stack crawl
> a task that's running on a CPU and then I ask that CPU to do the stack
> crawl.
>
> NOTE: this will (presumably) change what stack crawls are printed for
> x86 machines.  Now kdb functions will show up in the stack crawl.
> Presumably this is OK but if it's not we can go back and add a special
> case for x86 again.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Totally new approach; now arch agnostic.
>
>  kernel/debug/debug_core.c |  5 +++++
>  kernel/debug/debug_core.h |  1 +
>  kernel/debug/kdb/kdb_bt.c | 44 ++++++++++++++++++++++++++++++---------
>  3 files changed, 40 insertions(+), 10 deletions(-)

Did either of you have thoughts on this patch?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
