Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FE772915
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 17:25:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qT26O-0002Ph-OV
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 15:25:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qT26N-0002Pb-AP
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 15:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RM6FEX0hkfSucEN2RNtPwB4Lp3pZ1/g2aHa0yo5DkxA=; b=BACVaAM7CoF1mnzV2WNbutKB7V
 otSwioe6RcjlnQcWB5RSa8j3QP3Dqijlw8aYmK0viw5q7v+X8xEPuNxiXRPqpBIWSKbUrP7cd2IAH
 rrbEOvheOju0xKupWCv2WI+RAGXczkW0zAmtiDMzb5K+fgc3S3a2wJaZZDTFqk4Hlq8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RM6FEX0hkfSucEN2RNtPwB4Lp3pZ1/g2aHa0yo5DkxA=; b=C0BVM4dLDak+uZfNePRoOzIXzk
 wXUEDfNp6dhg+cItRgUBPv5vbUb4pR30IStZSfbD4y8AYq0576RrWv8sAIVp753/oxwJAl99bRYYE
 8DJt67mWtOxCAit+T38IUcX5vMWe8bQXslDGEdLOQ51e3XPDhmTSAkj7O72TJqqrFIpM=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qT26H-00034X-SP for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 15:24:59 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3fe2d218eedso40249785e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Aug 2023 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691421887; x=1692026687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RM6FEX0hkfSucEN2RNtPwB4Lp3pZ1/g2aHa0yo5DkxA=;
 b=YBfAYrox4WwNmSljlKByV5/fpIap2pKUoRw5AygT2uJb2iRFmdXouQKc9P8DlghNBn
 mD9d5xOsnCzGOCCwXphMo4cvJTfBp37FlIxYd5iaS6JX3YNY8Twb6NyyioxxNZ15/yMp
 OSRbBgvU2b1TwsfAaUxBxc0GDJJVxRUZBJGGmT1PN5bkFh/gdOovIuFoP+21R5ocXzBg
 08QaWeNi1GpA9zhcYxWWOxOey3tkERo9fB23ax/OV6UI6IthFUHlfSILQ/SAuJhjxObI
 fj2F3r7m3cuIP6OxAgL66LQ1cbbrbBujYRezedh9b96POwP/ifMXwFnGRbeU4lgxz2j5
 2RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691421887; x=1692026687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RM6FEX0hkfSucEN2RNtPwB4Lp3pZ1/g2aHa0yo5DkxA=;
 b=dRuMv2wUXghHSrrqc1eaKLsekZV3pJOqEcsk+niWpdQNkHeAsH9+6HrV/RNSssXR5e
 53e00ZOPxUVhz+Qn6hDeR1xdNz4kHQtkly1Hr7afEUIsEc70J7y5GTgH0fys2pD9IWoK
 TH2SRzAsYyqiDco+smDuVtVPI1OduJP8J/1o2OWreR2grEdymkndLHUbm1k4XDRPQZqL
 22pCsydrhSEyrBGL+x/CYVrbGSyfDgo64nVoNYXOlqfigOsiGPDXijslnOYcfsTY6iie
 2lWp2JqfRHzShVtkdkIQ1E8CvQCWmpc3wHNQIdKmK4ug7MGR+mtGZDk8Nq/REAMClmOq
 r1gQ==
X-Gm-Message-State: AOJu0YwfMWv8dw4HIOTXFz/1gN7Xz0KHqj3YMeOVOnyhe0nes+gYcX+G
 sGxejN4CYLf0Y4AOTyePAq5BFw==
X-Google-Smtp-Source: AGHT+IGBcN8x+jcr5Z6fXcbJpNL+hygXsHQl0A6iUvy8eoqLQSJBGrRviYCA1pNQ7vzL2NtQD5wOPw==
X-Received: by 2002:a05:600c:2210:b0:3fb:a62d:1992 with SMTP id
 z16-20020a05600c221000b003fba62d1992mr6230198wml.0.1691421887335; 
 Mon, 07 Aug 2023 08:24:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c248400b003fbb5506e54sm11026994wms.29.2023.08.07.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 08:24:46 -0700 (PDT)
Date: Mon, 7 Aug 2023 16:24:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>
Message-ID: <20230807152444.GA375529@aspen.lan>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 11:28:52AM +0100, Mark Rutland wrote:
 > On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote: > > From:
 Sumit Garg <sumit.garg@linaro.org> > > > > Let's use the deb [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qT26H-00034X-SP
Subject: Re: [Kgdb-bugreport] [PATCH v9 7/7] arm64: kgdb: Roundup cpus using
 the debug IPI
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Wei Li <liwei391@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 11:28:52AM +0100, Mark Rutland wrote:
> On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
> > From: Sumit Garg <sumit.garg@linaro.org>
> >
> > Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
> > IPI is backed by an NMI (or pseudo NMI) then this will let us debug
> > even hard locked CPUs. When the debug IPI isn't backed by an NMI then
> > this won't really have any huge benefit but it will still work.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v9:
> > - Remove fallback for when debug IPI isn't available.
> > - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> >
> >  arch/arm64/kernel/ipi_debug.c |  5 +++++
> >  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
> >  2 files changed, 19 insertions(+)
>
> This looks fine to me, but I'd feel a bit happier if we had separate SGIs for
> the backtrace and the KGDB callback as they're logically unrelated.

I've no objections to seperate SGIs (if one can be found) but I'm curious
what benefit emerges from giving them seperate IPIs.

Both interfaces are already designed to share and NMI-like IPI nicely
(and IIUC they must share one on x86), neither is performance
critical[1] and the content of /proc/interrupts for the IPI is seldom
going to be of much interest.

As mentioned it is perfectly OK to separate them if there is space in
the SGI allocations. However if any two functions are good candidates to
share a scarce resource such as an SGI then it is these!


Daniel.


[1] In both cases their results are only required at human-scale
    and the work of the both handlers is hugely more expensive than
    either up front quick-check.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
