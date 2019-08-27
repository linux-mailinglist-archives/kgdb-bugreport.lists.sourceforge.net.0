Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D469DEA7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 27 Aug 2019 09:24:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1i2VqT-0005Bo-St
	for lists+kgdb-bugreport@lfdr.de; Tue, 27 Aug 2019 07:24:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1i2VqT-0005Bh-At
 for kgdb-bugreport@lists.sourceforge.net; Tue, 27 Aug 2019 07:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UdTlWBq67pFf3BFWbVXOJiSHrcyQJ0PaYrdJV+R7zcU=; b=nIiq/8+GmmTUUWqA4PUMlsWgp7
 vMUKoXusalqebpGvlbxsWOsO53sz4z9NM8pXYdSZOZ/bLcBZN6WHF5MYc8FdgEJkw/4UcSW+VVyxE
 5Z6BJotsR+satgMZPsoj7HQ39dwlhLrvEV+Oitr+mEMlRlM3Lm28ALBIzecMCqhLfz1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UdTlWBq67pFf3BFWbVXOJiSHrcyQJ0PaYrdJV+R7zcU=; b=lgiz1ZYhTCfhVl4msq+/09Q6Pr
 IwKAV0Qa/bpkEU2qJtEaVXI6aOeQOgW+gyRCGcjtIqAuI0o3FKmV0cztXT8hFKEZDe8YtC6rBFDoN
 c4xi/RYn7nesBlBa5pzrsQW4bLymWd4ouatCetIDs6jVH82dRhotgUqDTd2Ie/7p87yQ=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i2VqR-00HLCX-5J
 for kgdb-bugreport@lists.sourceforge.net; Tue, 27 Aug 2019 07:24:49 +0000
Received: by mail-wm1-f66.google.com with SMTP id f72so1882847wmf.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 27 Aug 2019 00:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UdTlWBq67pFf3BFWbVXOJiSHrcyQJ0PaYrdJV+R7zcU=;
 b=c2sKfjCE0fItXLJHeMv+GFYS7uvSIGQkogDsakG8O19i0NlYaODm94EwmQ50o38LQV
 mA1kQOnvXiyJA1mPxiSFVX4Bv3lBUKvphBE7sdggGArrhBMi9oi0IcaEwxEw1XPhn+b1
 0zFEjRx0AmbyZHeENOesuUaV9+5nCkMBca0RiN6su84zLI7dK5FecyQJg+7tP9T07fzZ
 SC1h37BQEd/JC2HWLiDjeC4CBIt2vM2Wkogf/2ZzHjUZ4Zg3maxR2QnfpyVb+EX6Zv06
 tr8TbSn7OTqoWAk9sgTp2GvblzPAqcudIgCUAtfjHhPouWeNAWyZl61dM0JrV4fjmrmW
 RqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UdTlWBq67pFf3BFWbVXOJiSHrcyQJ0PaYrdJV+R7zcU=;
 b=uZXoEtk+bNguUWjEUksyX6RbqS5Yjx+UJC7HDKhy44JS0IpLkehBdNvf6XsEPLxu3T
 SRhedzMsTr2YTK9PhQAlwUaI4qUjh5DchcYN7rodE1xfuoVQAFt3Syo/xCoH9AsCXxGf
 lgbteabG63XhO41qN/SZet/8GJScSakp3lzK+9ivAEk+OoAu5eMktDTZhhM/ZZwBWKV2
 UNFgwyTvgPbgAww+83GEr8chhgYi3z7rfI44vYe5Kd97JaxmrxlGs+Gyb8VsOD59h4Pc
 YEAfK8D1ae1C+r8gO/4tB38qmmbjkUji1gcIIIdNhjAUU2LYGVxen5WDEoeQPBV2NN5R
 Iz2g==
X-Gm-Message-State: APjAAAXs0UuzPcPwZJ/pL4IMFQVKhu44vqKzn5QKcT5kberyWQNFlwEf
 SC9/YVK0UxuerwAU0+C6T5OjGQ==
X-Google-Smtp-Source: APXvYqxJhTYivRAhMDNxZV3fC6gk7F90Dm33K2rsokvik6IXJCEnJusIOA+DBItODlwcKjJsf469pg==
X-Received: by 2002:a1c:dd82:: with SMTP id u124mr26802396wmg.89.1566890680428; 
 Tue, 27 Aug 2019 00:24:40 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 16sm2352759wmx.45.2019.08.27.00.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 00:24:39 -0700 (PDT)
Date: Tue, 27 Aug 2019 08:24:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20190827072438.fwgggambxp34onid@holly.lan>
References: <20190731183732.178134-1-dianders@chromium.org>
 <CAD=FV=Wh4M_A01gsWYBXSdgs0Gg4LAGDZ8X+5=4j=nuxiJ8kNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wh4M_A01gsWYBXSdgs0Gg4LAGDZ8X+5=4j=nuxiJ8kNA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i2VqR-00HLCX-5J
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 26, 2019 at 03:25:43PM -0700, Doug Anderson wrote:
> Jason / Daniel,
> 
> On Wed, Jul 31, 2019 at 11:38 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > In kdb when you do 'btc' (back trace on CPU) it doesn't necessarily
> > give you the right info.  Specifically on many architectures
> > (including arm64, where I tested) you can't dump the stack of a
> > "running" process that isn't the process running on the current CPU.
> > This can be seen by this:
> >
> >  echo SOFTLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> >  # wait 2 seconds
> >  <sysrq>g
> >
> > Here's what I see now on rk3399-gru-kevin.  I see the stack crawl for
> > the CPU that handled the sysrq but everything else just shows me stuck
> > in __switch_to() which is bogus:
> >
> > ======
> >
> > [0]kdb> btc
> > btc: cpu status: Currently on cpu 0
> > Available cpus: 0, 1-3(I), 4, 5(I)
> > Stack traceback for pid 0
> > 0xffffff801101a9c0        0        0  1    0   R  0xffffff801101b3b0 *swapper/0
> > Call trace:
> >  dump_backtrace+0x0/0x138
> >  ...
> >  kgdb_compiled_brk_fn+0x34/0x44
> >  ...
> >  sysrq_handle_dbg+0x34/0x5c
> > Stack traceback for pid 0
> > 0xffffffc0f175a040        0        0  1    1   I  0xffffffc0f175aa30  swapper/1
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f65616c0
> > Stack traceback for pid 0
> > 0xffffffc0f175d040        0        0  1    2   I  0xffffffc0f175da30  swapper/2
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f65806c0
> > Stack traceback for pid 0
> > 0xffffffc0f175b040        0        0  1    3   I  0xffffffc0f175ba30  swapper/3
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f659f6c0
> > Stack traceback for pid 1474
> > 0xffffffc0dde8b040     1474      727  1    4   R  0xffffffc0dde8ba30  bash
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  __schedule+0x464/0x618
> >  0xffffffc0dde8b040
> > Stack traceback for pid 0
> > 0xffffffc0f17b0040        0        0  1    5   I  0xffffffc0f17b0a30  swapper/5
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f65dd6c0
> >
> > ===
> >
> > The problem is that 'btc' eventually boils down to
> >   show_stack(task_struct, NULL);
> >
> > ...and show_stack() doesn't work for "running" CPUs because their
> > registers haven't been stashed.
> >
> > On x86 things might work better (I haven't tested) because kdb has a
> > special case for x86 in kdb_show_stack() where it passes the stack
> > pointer to show_stack().  This wouldn't work on arm64 where the stack
> > crawling function seems needs the "fp" and "pc", not the "sp" which is
> > presumably why arm64's show_stack() function totally ignores the "sp"
> > parameter.
> >
> > NOTE: we _can_ get a good stack dump for all the cpus if we manually
> > switch each one to the kdb master and do a back trace.  AKA:
> >   cpu 4
> >   bt
> > ...will give the expected trace.  That's because now arm64's
> > dump_backtrace will now see that "tsk == current" and go through a
> > different path.
> >
> > In this patch I fix the problems by catching a request to stack crawl
> > a task that's running on a CPU and then I ask that CPU to do the stack
> > crawl.
> >
> > NOTE: this will (presumably) change what stack crawls are printed for
> > x86 machines.  Now kdb functions will show up in the stack crawl.
> > Presumably this is OK but if it's not we can go back and add a special
> > case for x86 again.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Totally new approach; now arch agnostic.
> >
> >  kernel/debug/debug_core.c |  5 +++++
> >  kernel/debug/debug_core.h |  1 +
> >  kernel/debug/kdb/kdb_bt.c | 44 ++++++++++++++++++++++++++++++---------
> >  3 files changed, 40 insertions(+), 10 deletions(-)
> 
> Did either of you have thoughts on this patch?

Hi Doug

Sorry about this. It got backlogged during a recent holiday... it's still
on the list.

I took a quick look a week or so ago but at this point I haven't yet
tested out the behaviour on x86 and I wanted to do a closer review to
check I am happy with the barriering.


Daniel.

> 
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
