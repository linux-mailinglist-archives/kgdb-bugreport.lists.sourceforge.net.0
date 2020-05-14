Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBF1D368C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 18:34:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZGoy-0003jp-F1
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 May 2020 16:34:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jZGox-0003jh-Bk
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HWFeoUCCAGrwFNZxgc3//5BRvEIhNROwr+Wf1EbQfmY=; b=bnFJYQJKpxHYRHiB8KHRUS/uSp
 iIvb6gPKlKy+RJM3SPXoNUhdReosxbioxE60a6PEk38W7UCFr6YAb0/6miwvJY4gqXmrqPYheWtD+
 u5cG5pHWfIPd7RAQSjEoF6u1Cs2XJ4x0pXpU3apPz+iDbzUW0D7HfhCYkB+E4w5bxEqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HWFeoUCCAGrwFNZxgc3//5BRvEIhNROwr+Wf1EbQfmY=; b=ZueiX+1/j/yUONhaNbk3FbJ5FZ
 rRwtlO+V8vVubqVkXIMnW9NntgQf4hmHyG36yEp4K6nwBDteYqA4BJaqIYRTw4OsDAZnSekZO98BD
 I4v7VcOektntB9KKK/G5iffOPPv03US2CqjmmrY6Y5x3vz9VvWexdaZWbJb5HpRSxDiM=;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZGov-0078MF-Ku
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:34:55 +0000
Received: by mail-vs1-f66.google.com with SMTP id z1so2320970vsn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 May 2020 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWFeoUCCAGrwFNZxgc3//5BRvEIhNROwr+Wf1EbQfmY=;
 b=UvPlZl0iOaSxRCrz4fSlO6xyQ4m5RIN2qw1rZtiYNuvBFSSNHUv+z6jsScDG2JkoLZ
 9KPzqq9Yz+Xek9thEBwb1hxG4RE2BMXein7EOEaNp8aruvGk13N+6glTTIgL7iBjci/B
 OvS5nH3CBDh2XG23YTlRN04vrysWYTmp0OAqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWFeoUCCAGrwFNZxgc3//5BRvEIhNROwr+Wf1EbQfmY=;
 b=BiEFUyRA3y20yHizElkDEkHZDFG/bCT6X6LdIHKJPQBY0jltXpYlV4nCnQemAZEl/e
 KkZC4P0a4GDYJoz0SrNahksNcjBexhNkH7gJX5ZmDssmqtk0uyPTY0jNxWRrwY2u+aOW
 4uSBccoeRDeK8QBG2ng+zNgxhb8uUqLrpIwI4NigZAVgWo9P9WAdETsEzWMvgLxTi8GV
 nHnL/QWNCXspbHqF97ph5pYH/e80vJjeSUc0DavzgcbUwKm+zcRECgccqL8wSNxjZl3b
 WxnSLex0ffw7nrtUlW0gorCX6v1nt0ZlwYnSW031KqbYY5n3sXvmZg4BELaYqH5hzh1H
 IHbg==
X-Gm-Message-State: AOAM5327Lst36oZUyEYFzHpIp9KfKG3lmqFdcRLhEEgxvg3AiiuPxJgo
 7Je/jfA4e9JRC6il/dS9B47tsiIJrA8=
X-Google-Smtp-Source: ABdhPJwkUHDy94f0jpUNyVWpki+iPyJYiP+zUVPg1OxTzQohVLDRxXgHh4mhDl6CraxZTikNMs4g6Q==
X-Received: by 2002:a67:2d17:: with SMTP id t23mr4094679vst.52.1589474079995; 
 Thu, 14 May 2020 09:34:39 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id x7sm804268vsx.33.2020.05.14.09.34.38
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 09:34:38 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id y13so2329813vsk.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 May 2020 09:34:38 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr4374233vsq.109.1589474077707; 
 Thu, 14 May 2020 09:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200514162109.6qt5drd27hpilijh@holly.lan>
In-Reply-To: <20200514162109.6qt5drd27hpilijh@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 May 2020 09:34:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
Message-ID: <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZGov-0078MF-Ku
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
 kgdb-bugreport@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 jinho lim <jordan.lim@samsung.com>, Andy Gross <agross@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, May 14, 2020 at 9:21 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, May 07, 2020 at 01:08:38PM -0700, Douglas Anderson wrote:
> > <snip>
> >
> > My first attempt was to try to get the existing "ekgdboc" to work
> > earlier.  I tried that for a bit until I realized that it needed to
> > work at the tty layer and I couldn't find any serial drivers that
> > managed to register themselves to the tty layer super early at boot.
> > The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
> > of a special snowflake.  Trying to get my serial driver and all its
> > dependencies to probe normally and register the tty driver super early
> > at boot seemed like a bad way to go.  In fact, all the complexity
> > needed to do something like this is why the system already has a
> > special concept of a "boot console" that lives only long enough to
> > transition to the normal console.
> >
> > <snip>
> >
> > The devices I had for testing were:
> > - arm32: rk3288-veyron-jerry
> > - arm64: rk3399-gru-kevin
> > - arm64: qcom-sc7180-trogdor (not mainline yet)
> >
> > These are the devices I tested this series on.  I tried to test
> > various combinations of enabling/disabling various options and I
> > hopefully caught the corner cases, but I'd appreciate any extra
> > testing people can do.  Notably I didn't test on x86, but (I think) I
> > didn't touch much there so I shouldn't have broken anything.
>
> I have tested a slightly earlier version using qemu and will test this
> set before it moves forwards.
>
>
> >  .../admin-guide/kernel-parameters.txt         |  20 ++
> >  Documentation/dev-tools/kgdb.rst              |  24 ++
> >  arch/arm64/Kconfig                            |   1 +
> >  arch/arm64/include/asm/debug-monitors.h       |   2 +
> >  arch/arm64/kernel/debug-monitors.c            |   2 +-
> >  arch/arm64/kernel/traps.c                     |   3 +
> >  arch/x86/Kconfig                              |   1 +
> >  drivers/tty/serial/8250/8250_early.c          |  23 ++
> >  drivers/tty/serial/amba-pl011.c               |  32 +++
> >  drivers/tty/serial/kgdboc.c                   | 268 ++++++++++++++++--
> >  drivers/tty/serial/qcom_geni_serial.c         |  32 +++
> >  include/linux/kgdb.h                          |   4 +
> >  kernel/debug/debug_core.c                     |  52 +++-
> >  lib/Kconfig.kgdb                              |  18 ++
> >  14 files changed, 436 insertions(+), 46 deletions(-)
>
> Any thoughts on how best to land these changes?
>
> AFAICT the arm64

I was hoping to get an Ack from Will or Catalin for my most recent
arm64 patch [1] and then it could land in your tree.  However, it
wouldn't be the end of the world if that landed later.  "kgdbwait"
would be broken if you used it together with "kgdb_earlycon" but
overall we'd still be in a better place than we were.


> and 8250/amba-pl011/qcom_geni_serial code
> could be applied independently of the kgdb changes

Right, that would be OK.  Nobody would actually be able to use
"kgdb_earlycon" until those landed but there would be no problem with
those two landing separately.


> (though we must keep
> changes to drivers/tty/serial/kgdboc alongside the kgdb changes).
>
> I can hoover them up but I'd need a solid set of acks and
> I don't think we've got that yet.

It would be nice for it to be explicit, but "get_maintainer" says that
Greg KH is the maintainer of serial drivers.  Git log confirms that he
also has been the one landing changes to these files.  Early-on he
provided his Reviewed-by for the series as a whole, so he's aware of
it and maybe would be fine w/ the serial changes landing through the
kgdb tree?

Greg: is that correct?


> I'd also be happy to ack where needed and let someone else pick it up
> (the other changes queued for kgdb this cycle are pretty small so we
> shouldn't see much conflict in kernel/debug/ ).

It feels to me that the kgdb tree is the best destination for all
these patches if possible.


[1] https://lore.kernel.org/r/20200513160501.1.I0b5edf030cc6ebef6ab4829f8867cdaea42485d8@changeid

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
