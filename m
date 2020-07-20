Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C72F2259C5
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Jul 2020 10:13:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxQve-0005UL-A1
	for lists+kgdb-bugreport@lfdr.de; Mon, 20 Jul 2020 08:13:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jxQvd-0005UE-AC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 20 Jul 2020 08:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CkY+pR8nEvvyoGCzwyetoIvFB+8wf85iBL4BwWdb0QY=; b=D0y5NqCsqNPGoOMiXRzEvH1xin
 PfnTD21uGBIJRdVd4UCxT/IR6ZgMLsUtszHO+xu7kIHgZ5kdkCZPoC54mS137Nf6zFyvtu6xiciBg
 rUplquMWhxY/FMx8GSTdHUAxeEmBoJgwTjeLK8e9L6M1cqy5eJKrRQXU6+9e9xQ/AiuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CkY+pR8nEvvyoGCzwyetoIvFB+8wf85iBL4BwWdb0QY=; b=g5o2eXWw3bmcWKuS4cvlOzsX9r
 jmAh+dBLlqur1uX7VzYB7GlLXsYF7VkDsW0EtcC8n9ztu1GelDsXzgq/y4QP02FxOhyjgVnbbQCgJ
 eqWmuoiOdybHdbYPP7/1ueVwM62jHcdR5uzO5cx0wI83H23LmxAOFisCjX/FqspWk3yw=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxQvW-00ALGr-Bs
 for kgdb-bugreport@lists.sourceforge.net; Mon, 20 Jul 2020 08:13:41 +0000
Received: by mail-wr1-f66.google.com with SMTP id s10so16805278wrw.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 20 Jul 2020 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CkY+pR8nEvvyoGCzwyetoIvFB+8wf85iBL4BwWdb0QY=;
 b=QOyAfparPK4/pswN9TyLt4wo+ECAHBz1qejQHZnyNbTMxa+R1EMI5FavIgDFKwwaXZ
 3o6K7vmjlkEE0WO71DvkaXSrKF8r2UaPvmCGaGcMlJ7uKbMDG7Y6NVsUJGrSjWNTWPTo
 stsWstq+531ICwKMgnJyFTB6hRdTFo9M2wJxt12S2Zx7+Ti+J1Y949iRy4zbcP0D8F/I
 YuPGN3WnmJyw6qdSZF/ixNYuhakoF2Etl3dsJDB4scpsORnnni5NckGUPOO/cyWeVz4S
 nctS/x2b9yvECWajFqNvt4GDCMxd2IAqk0fl7g4bE4kGmdy/gAkTuDCZSvu++s1MymcW
 0r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CkY+pR8nEvvyoGCzwyetoIvFB+8wf85iBL4BwWdb0QY=;
 b=N1P2KWIyVeA6BuZqBz/jT872qOco14PFefcY2ZtfzuqIWgsDPqyDv1ioMrmlieUfPG
 UW9UW0GIoHohdM/SZoWpnM9k3QpljbUDiPY/Zwj4Y2O3/Ay+vRowXY3CMlQP8VcDVUdb
 o4QA96s8IzcVWxgXT5L0TQg6DDptfrg9UYNGpaARpt6mrYzQXWlgPngYBRabYd3Od0Le
 xyLiZGpFABXDjn94H320BCopGvxKrcHYPUrfSdGz9kNdejFD7KuSH/ePOxdDDP84+IWV
 bOJJu09HkwHRiwSfW6bOqdW1O7SX27+JQQxC5qBHFNiqym0inrLk5Iy5lSGsUz8dD+f/
 ESwA==
X-Gm-Message-State: AOAM532Re/LY8si3RuMx52v+Iv7kJS9ML2Tig+9veCcLX7OxQBm9LT2r
 wsiC4EsRg60AZX/DQ0ZvI4qIIg==
X-Google-Smtp-Source: ABdhPJzEcEIHyVwVAFXwN4wddaaeejW5ihXMCoeMsXMuylUnDNPpIrFhlHpgTJyAVNNrlB3nS6ByvA==
X-Received: by 2002:adf:bc54:: with SMTP id a20mr2575534wrh.227.1595232807971; 
 Mon, 20 Jul 2020 01:13:27 -0700 (PDT)
Received: from holly.lan (82-132-214-103.dab.02.net. [82.132.214.103])
 by smtp.gmail.com with ESMTPSA id i14sm372585wrc.19.2020.07.20.01.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 01:13:27 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:13:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200720081323.5f3xojhu6v23jgqi@holly.lan>
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-4-daniel.thompson@linaro.org>
 <CAD=FV=UBMa4pt7Xg2sKXHdjo6tVaQWBQFtT_aoDJ+Xt1HrPD+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UBMa4pt7Xg2sKXHdjo6tVaQWBQFtT_aoDJ+Xt1HrPD+Q@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxQvW-00ALGr-Bs
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/3] kgdb: Add NOKPROBE labels on
 the trap handler functions
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jul 17, 2020 at 03:39:58PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > Currently kgdb honours the kprobe blocklist but doesn't place its own
> > trap handling code on the list. Add labels to discourage attempting to
> > use kgdb to debug itself.
> >
> > These changes do not make it impossible to provoke recursive trapping
> > since they do not cover all the calls that can be made on kgdb's entry
> > logic. However going much further whilst we are sharing the kprobe
> > blocklist risks reducing the capabilities of kprobe and this would be a
> > bad trade off (especially so given kgdb's users are currently conditioned
> > to avoid recursive traps).
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  kernel/debug/debug_core.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> I could just be missing something, but...
> 
> I understand not adding "NOKPROBE_SYMBOL" to generic kernel functions
> that kgdb happens to call, but I'm not quite sure I understand why all
> of the kdb / kgdb code itself shouldn't be in the blocklist.  I
> certainly don't object to the functions you added to the blocklist, I
> guess I'm must trying to understand why it's a bad idea to add more or
> how you came up with the list of functions that you did.

Relatively early in the trap handler execution (just after we bring the
other CPUs to a halt) all breakpoints are replaced with the original
opcodes. Therefore I only marked up functions that run between the trap
firing and the breakpoints being removed (and also between the
breakpoints being reinstated and trap exit).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
