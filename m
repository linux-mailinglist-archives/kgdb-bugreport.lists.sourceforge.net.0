Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ABA1D365B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 18:21:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZGbs-0002s6-DY
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 May 2020 16:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jZGbr-0002rx-74
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KV4BSoviEBOfIIyT+7Io9PqJ+AxGL6m4ncG0jX3R3Vg=; b=g5teJoXkrJJkE9pv6aCeU81ljg
 mGCyqs04bvPf2e7AYOvxRGBtBcyg7wAogM/MYfOLwxhfXJJ0CNEliPHhm5XoGbsgLgGdKu/KO1m10
 89H2rMQIKgVPEFbxpy9LUPbLzwWhSqOBmdTEqy8R78Gu1aYgbJqyQPMzn4NBqgzJMMn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KV4BSoviEBOfIIyT+7Io9PqJ+AxGL6m4ncG0jX3R3Vg=; b=Zw5nvc0mOomidTmwRvXJe8Zt3p
 eE6NXQxjXlOOFml3Qe8tBHR5wxQQkfXdCM0x88p5ftv2VDdSrhD0+87xepIgU5aQWaDySBTQmFOrX
 UlND2tsczwI7j7KFdmqQcFgESU3CX7bkwTHvzeF07UerYJAhi+Qge1fJkSQMpS8NgqKc=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZGbm-0077MA-HO
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:21:23 +0000
Received: by mail-wm1-f65.google.com with SMTP id w64so1253754wmg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 May 2020 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KV4BSoviEBOfIIyT+7Io9PqJ+AxGL6m4ncG0jX3R3Vg=;
 b=iiHyiJ4q0+KsNNeDxvvCz9wtZO9sC8IuSU69MkWg6ukuylaAreG2+ufhhS2q0LvI4a
 9ZFBQEB3gresJbeadDdort7B7CJztVaOzd+imGLK9adisFs8l1EkEXwjPix6DMwXWpjX
 /bCdQB8gtMafG88ExRQb7sOFOT2TnNJlqCmCoaS8LyHnYhBzplYGqcazpRuc/Byl/kdH
 h8OE0uxsaWxjlIp/J8ewc/SWJUPpFj3CJfpjNNHOJYP6BbciN+6P7zMR4GQBICDm8oYj
 m2m8J1vRn9sCMPHm5LZbqiU0px2GbT9jNPn6q/3jziLa6B8kfu211fXDrBPg+K08gUdF
 P8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KV4BSoviEBOfIIyT+7Io9PqJ+AxGL6m4ncG0jX3R3Vg=;
 b=gcvPRVfeXg+icDVZx/YeG4KbBBXK2moSOhz0SMB/VSVzZm/rDyM0kN8u79jGtHt+Ha
 TY/qA+MtUXEeLgldBaUWtZGPx+I2hrGlqQb8bak9N9SYeDlMBlk5v1LmQKUT5cU04nHE
 FCds8F3E4Z6Hod4o5l9ojrXsBQ2ZDDH+pMNkDrVEt6ATVyCpjm/OUcmnV3yNcgBJIYx9
 hBNdEs6A6LFg6KnjmhMQKIIQD7ec/oXAAmh4Np6PVo1yvgvlIE6tz27THqun84oBFiIl
 z2KR4/B13FJ6Pu0BwOSVwEfaj+YjuZg860gRY2EL57j28LnQo79dst0CTiA9/ibPhqWp
 QXgA==
X-Gm-Message-State: AGi0Pua/2gLQdy92hKqfASdL7jij2MFXj6cXktWxl12ZPtZP8SA6S3LA
 +kuRfih9pO2QD78BRS9Wwi0c8Q==
X-Google-Smtp-Source: APiQypKzrysBhAd4T+CnYHlYyQM0grnydFJdjF31clt1OcgBcXllaYep5/9TgtCb41lshr5MEdxP5g==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr49969579wmh.93.1589473272074; 
 Thu, 14 May 2020 09:21:12 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b14sm29577880wmb.18.2020.05.14.09.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 09:21:11 -0700 (PDT)
Date: Thu, 14 May 2020 17:21:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200514162109.6qt5drd27hpilijh@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jZGbm-0077MA-HO
Subject: Re: [Kgdb-bugreport] [PATCH v4 00/12] kgdb: Support late serial
 drivers; enable early debug w/ boot consoles
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 catalin.marinas@arm.com, bjorn.andersson@linaro.org, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, will@kernel.org,
 corbet@lwn.net, x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, jinho lim <jordan.lim@samsung.com>,
 agross@kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org,
 jslaby@suse.com, Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 tglx@linutronix.de, mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, jason.wessel@windriver.com,
 Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 01:08:38PM -0700, Douglas Anderson wrote:
> <snip>
>
> My first attempt was to try to get the existing "ekgdboc" to work
> earlier.  I tried that for a bit until I realized that it needed to
> work at the tty layer and I couldn't find any serial drivers that
> managed to register themselves to the tty layer super early at boot.
> The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
> of a special snowflake.  Trying to get my serial driver and all its
> dependencies to probe normally and register the tty driver super early
> at boot seemed like a bad way to go.  In fact, all the complexity
> needed to do something like this is why the system already has a
> special concept of a "boot console" that lives only long enough to
> transition to the normal console.
> 
> <snip>
> 
> The devices I had for testing were:
> - arm32: rk3288-veyron-jerry
> - arm64: rk3399-gru-kevin
> - arm64: qcom-sc7180-trogdor (not mainline yet)
> 
> These are the devices I tested this series on.  I tried to test
> various combinations of enabling/disabling various options and I
> hopefully caught the corner cases, but I'd appreciate any extra
> testing people can do.  Notably I didn't test on x86, but (I think) I
> didn't touch much there so I shouldn't have broken anything.

I have tested a slightly earlier version using qemu and will test this
set before it moves forwards.


>  .../admin-guide/kernel-parameters.txt         |  20 ++
>  Documentation/dev-tools/kgdb.rst              |  24 ++
>  arch/arm64/Kconfig                            |   1 +
>  arch/arm64/include/asm/debug-monitors.h       |   2 +
>  arch/arm64/kernel/debug-monitors.c            |   2 +-
>  arch/arm64/kernel/traps.c                     |   3 +
>  arch/x86/Kconfig                              |   1 +
>  drivers/tty/serial/8250/8250_early.c          |  23 ++
>  drivers/tty/serial/amba-pl011.c               |  32 +++
>  drivers/tty/serial/kgdboc.c                   | 268 ++++++++++++++++--
>  drivers/tty/serial/qcom_geni_serial.c         |  32 +++
>  include/linux/kgdb.h                          |   4 +
>  kernel/debug/debug_core.c                     |  52 +++-
>  lib/Kconfig.kgdb                              |  18 ++
>  14 files changed, 436 insertions(+), 46 deletions(-)

Any thoughts on how best to land these changes?

AFAICT the arm64 and 8250/amba-pl011/qcom_geni_serial code
could be applied independently of the kgdb changes (though we must keep
changes to drivers/tty/serial/kgdboc alongside the kgdb changes).

I can hoover them up but I'd need a solid set of acks and
I don't think we've got that yet.

I'd also be happy to ack where needed and let someone else pick it up
(the other changes queued for kgdb this cycle are pretty small so we
shouldn't see much conflict in kernel/debug/ ).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
