Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29268228B09
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jul 2020 23:22:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jxzik-0002p7-OU
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Jul 2020 21:22:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jxzih-0002ow-7S
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 21:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ti/LYNMV4Io9WHvJwi/sVnT0KR0RLJ+cynlnt8AzAKs=; b=Yp9zMh5vPJfyb2Mz9kJlldf2ss
 +8ovSsOzqTQrAPy2NuoXVB8asiIGyI0VMRnDMSD31YS7y8S+Ste4cnOiKu7UIxZ0f3djlCbSJufTy
 hWraT3CTm3PHnBg2sfIPDOPskmzaWfyNwCKRDzmZc7n2x+gqJLXn+NK7NB8UVwa+qvdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ti/LYNMV4Io9WHvJwi/sVnT0KR0RLJ+cynlnt8AzAKs=; b=OgZfWFxClicgREIe5+CYcgyOYZ
 hFiRKCv1pcRRTVPS8R22YD3qOfwVBLteGG3yFNPBQBREHaGVizO2XUdcJfKPMQ3qWkATa2cc1Og+T
 Jak/Ykb5OwkrfW5wE64m3r1P/jvOiv3EiU1+iWtGuQGxSK5AJ0bTm1iCcpzztEo0EqA4=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxzid-00CcrB-ED
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Jul 2020 21:22:39 +0000
Received: by mail-vs1-f65.google.com with SMTP id x13so15038vsx.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 14:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ti/LYNMV4Io9WHvJwi/sVnT0KR0RLJ+cynlnt8AzAKs=;
 b=io6q2W3OR7PHrPE78QkYmRtAy6IqueGeMnDtZTV/5G/M+ILV9XZoF02ypfJE/FonaG
 sxLZ4bhJlH+ObUJiUko5OSW9ebedFdRmmuMWKmJ2LkGkmz96A7Nievs/m4oaYkCW6gmQ
 KfNqnVzaDRtPVMd7GBdcBuskQOYb/xXc40byA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ti/LYNMV4Io9WHvJwi/sVnT0KR0RLJ+cynlnt8AzAKs=;
 b=dGONUkFL+SKs1THUpFMQDtvnVpIbDhc0FcgOBxNqA51qxL636CDrPXlmxskAF/OnBo
 QeVOv77IOaocStnLvhGUnOGdfs/MwG6rMCOGzuv4IEalbVvRlLE4St6oqN6Yti8SPMJW
 1mwuEcbEVlFQZ+3N80Qs8TKDXAkoFJIk1H6B7Xy5x7dm2f3M99Zo26grdLAQ/OVhToqm
 jIyMGxEXNRg0BKYIcGPJWKKJN7QJzeJduIFA3Cyjsd8Z8CLm4ZEHui8NaIFeVKDdBg+U
 saOtDaFqaW/Rppen5yoKloiQG2CFhCVgVQ8kRQu16DNaDvJW3toZwQemJ7WZ1JhDG2/6
 n4JA==
X-Gm-Message-State: AOAM532UjdVr+NmGkm5Knv7EXX4BNWkFDGXTOTDeawHU9neknztD7D8G
 JTfcvyKLM9MD1PrTDFdgiaqWA1iL4C0=
X-Google-Smtp-Source: ABdhPJyyWISSbECo9znfRQ5nR4ZIXz5JD+MY9uWeP32alFjPCcxijJgHu8q8MpihyUc0LW5YZ/Ly4g==
X-Received: by 2002:a67:6785:: with SMTP id
 b127mr21916467vsc.186.1595366541682; 
 Tue, 21 Jul 2020 14:22:21 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id h77sm3396520vke.21.2020.07.21.14.22.20
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 14:22:20 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id j21so6693516ual.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Jul 2020 14:22:20 -0700 (PDT)
X-Received: by 2002:ab0:150c:: with SMTP id o12mr21597172uae.90.1595366540167; 
 Tue, 21 Jul 2020 14:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-4-daniel.thompson@linaro.org>
 <CAD=FV=UBMa4pt7Xg2sKXHdjo6tVaQWBQFtT_aoDJ+Xt1HrPD+Q@mail.gmail.com>
 <20200720081323.5f3xojhu6v23jgqi@holly.lan>
In-Reply-To: <20200720081323.5f3xojhu6v23jgqi@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Jul 2020 14:22:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VipxFspgHJZ0uKURyfE4e3GB-w3gyJZdRn5CF9aLT8fg@mail.gmail.com>
Message-ID: <CAD=FV=VipxFspgHJZ0uKURyfE4e3GB-w3gyJZdRn5CF9aLT8fg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxzid-00CcrB-ED
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

Hi,

On Mon, Jul 20, 2020 at 1:13 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jul 17, 2020 at 03:39:58PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > Currently kgdb honours the kprobe blocklist but doesn't place its own
> > > trap handling code on the list. Add labels to discourage attempting to
> > > use kgdb to debug itself.
> > >
> > > These changes do not make it impossible to provoke recursive trapping
> > > since they do not cover all the calls that can be made on kgdb's entry
> > > logic. However going much further whilst we are sharing the kprobe
> > > blocklist risks reducing the capabilities of kprobe and this would be a
> > > bad trade off (especially so given kgdb's users are currently conditioned
> > > to avoid recursive traps).
> > >
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >  kernel/debug/debug_core.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> >
> > I could just be missing something, but...
> >
> > I understand not adding "NOKPROBE_SYMBOL" to generic kernel functions
> > that kgdb happens to call, but I'm not quite sure I understand why all
> > of the kdb / kgdb code itself shouldn't be in the blocklist.  I
> > certainly don't object to the functions you added to the blocklist, I
> > guess I'm must trying to understand why it's a bad idea to add more or
> > how you came up with the list of functions that you did.
>
> Relatively early in the trap handler execution (just after we bring the
> other CPUs to a halt) all breakpoints are replaced with the original
> opcodes. Therefore I only marked up functions that run between the trap
> firing and the breakpoints being removed (and also between the
> breakpoints being reinstated and trap exit).

Ah, OK!  Could that be added to the commit message?

Also, shouldn't you mark kgdb_arch_set_breakpoint()?  What about
dbg_activate_sw_breakpoints()?  I haven't gone and extensively
searched, but those two jump out to me as ones that were missed.

I suppose that means that if someone tried to set a breakpoint on a
kgdb function that wasn't one of the ones that you listed then the
system would happily report that the breakpoint has been set (no error
given) but that the breakpoint would just have no effect?  It wouldn't
crash (which is good), it just wouldn't detect that the breakpoint was
useless.  However, if these were in the NOKPROBE_SYMBOL then you'd get
a nice error message.  Is there no way we could use a linker script to
just mark everything using a linker script or somesuch?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
