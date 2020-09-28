Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0A27AC88
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Sep 2020 13:18:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kMrAU-0002g5-1f
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Sep 2020 11:18:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kMrAS-0002fv-6l
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Sep 2020 11:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eF74ZFK17+xMyvZFbbKNSS8MJbDDGd1/oidFI6dtPeQ=; b=eKL/8kGZqXmZAt5/yY0UgXXh+O
 LQMJ7QCJCbEiYKh+3UfUw8GP5wB7an6bEJlOxdGMoTljNL/lkF4oruShG1fAvXiDlzZuYCLMn3OdH
 gr6L1lHa73HpwL+XODcK5gK0yFb7IPop/57U3I7h+whNk69G8Kl3GlF4VTG04mGFjv44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eF74ZFK17+xMyvZFbbKNSS8MJbDDGd1/oidFI6dtPeQ=; b=LV/ObQpf87t5/yGvYxBHFfxnyt
 jE7ubv/r1ZYzf2tUlmjIh+12hgCnHIPUKHuD53TND6SA3HYfJVGwHJNnZjpeYs2P+JxXHytuCY0jw
 DuytZWePk1z5Rqz+AIOl6/1Ql9oyZM2rYFZQhi5uOqBMXT+W1+4efQ6d2h/Cj4TrkJgg=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kMrAB-00BR3a-Bp
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Sep 2020 11:18:04 +0000
Received: by mail-wr1-f66.google.com with SMTP id k15so840667wrn.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Sep 2020 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eF74ZFK17+xMyvZFbbKNSS8MJbDDGd1/oidFI6dtPeQ=;
 b=gg1JP4uRsjVTO5ysoyRinZfbru3qcVXq+xS5cIWbUwGxr1C6syaVT1NLFv8sEaKsR3
 bAGqWW8dIq6OUE1cv7esaoDR7pE1Xq1sUQRrk76BH0vh7ktEvuAm4oWTc1ggqcNz1NL2
 BNRtwjBVZHKHzY0gOT9Kju106JXPdHoD/Qd+Rz2Ig5xPXZYyIHUXFw4oqIjNb/P3uA46
 xZeaUTicg/SFRfXDdYEnrL4vgn5EGZV8xh7Aa1ClYnXRHANrth/n10+sqbzpW/MtXlmN
 7UEgMMFgYtXrS+6ogHOmMjx/WiCkgeb02EFYwHfyHPgnsp6oMXmlVxRH77+bQzSUaxET
 UrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eF74ZFK17+xMyvZFbbKNSS8MJbDDGd1/oidFI6dtPeQ=;
 b=VJlWuR0GGzO6kVgWemHToBiEdGe7+zocj/sKH9tb780yKeTA8KEXNbTY6/M1dDOVOU
 G+LYd2k59LipFYZ4bdqEG+3iA6jyXGST/F3HtfcQMISYm9cBPwjlEwva+V9z03qH/HtT
 b9eIhtf44fgqnNdixd5MBcrauP0kSXaJJP4b8a/UEPy/227AsU1Ka8QsW+FAMxWyIPBw
 d3e1jXFWu7efFNQJrjfHHnx2o/Pj+TWQ2Jqk6B68QVpT72FgZevjf5RFldYhsgmZVBDF
 YrpnovoOWi4ONsdwEf979fc1ZrwTIZyphAlMmd3/O/En1acyZjnTrCOAZ5bf+E52aXy0
 wHvg==
X-Gm-Message-State: AOAM5334JfOIVXtttLadqi7TdSOXbE6AqVBfvmlvAPdlqmeckkB83NU0
 G3vkCWMpQj1WmFgf4nJlpxfSXg==
X-Google-Smtp-Source: ABdhPJxYnMFBR4He86ej0AcG8HKyVAP+FtnsRyYUT8aR0hp7Rx18E0FIW1v8bd3rqv9adlovXDN4Gw==
X-Received: by 2002:adf:cf01:: with SMTP id o1mr1128621wrj.421.1601291853709; 
 Mon, 28 Sep 2020 04:17:33 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id d23sm860748wmb.6.2020.09.28.04.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 04:17:33 -0700 (PDT)
Date: Mon, 28 Sep 2020 12:17:31 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <20200928111731.koa7am62uxxaezcz@holly.lan>
References: <20200927211531.1380577-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200927211531.1380577-1-daniel.thompson@linaro.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.6 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kMrAB-00BR3a-Bp
Subject: Re: [Kgdb-bugreport] [PATCH v3 0/3] kgdb: Honour the kprobe
 blocklist when setting breakpoints
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
Cc: pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sun, Sep 27, 2020 at 10:15:28PM +0100, Daniel Thompson wrote:
> kgdb has traditionally adopted a no safety rails approach to breakpoint
> placement. If the debugger is commanded to place a breakpoint at an
> address then it will do so even if that breakpoint results in kgdb
> becoming inoperable.
> 
> A stop-the-world debugger with memory peek/poke intrinsically provides
> its operator with the means to hose their system in all manner of
> exciting ways (not least because stopping-the-world is already a DoS
> attack ;-) ). Nevertheless the current no safety rail approach is
> difficult to defend, especially given kprobes can provide us with plenty
> of machinery to mark the parts of the kernel where breakpointing is
> discouraged.
> 
> This patchset introduces some safety rails by using the existing kprobes
> infrastructure and ensures this will be enabled by default on
> architectures that implement kprobes. At present it does not cover
> absolutely all locations where breakpoints can cause trouble but it will
> block off several avenues, including the architecture specific parts
> that are handled by arch_within_kprobe_blacklist().
> 
> v4:
> * Fixed KConfig dependencies for HONOUR_KPROBE_BLOCKLIST on kernels
>   where MODULES=n
> * Add additional debug_core.c functions to the blocklist (thanks Doug)
> * Collected a few tags

Looks like I neglected to bump the version number in the subject.
For the avoidance of doubt, this comment is correct and the subject
line is broken.

Sorry!


Daniel.


> 
> v3:
> * Dropped the single step blocklist checks. It is not proven that the
>   code was actually reachable without triggering the catastrophic
>   failure flag (which inhibits resume already).
> * Update patch description for ("kgdb: Add NOKPROBE labels...") and
>   added symbols that are called during trap exit
> * Added a new patch to push the breakpoint activation later in the
>   flow and ensure the I/O functions are not called with breakpoints
>   activated.
> 
> v2:
> * Reworked after initial RFC to make honouring the blocklist require
>   CONFIG_KPROBES. It is now optional but the blocklist will be enabled
>   by default for architectures that CONFIG_HAVE_KPROBES
> 
> Daniel Thompson (3):
>   kgdb: Honour the kprobe blocklist when setting breakpoints
>   kgdb: Add NOKPROBE labels on the trap handler functions
>   kernel: debug: Centralize dbg_[de]activate_sw_breakpoints
> 
>  include/linux/kgdb.h            | 18 ++++++++++++++++++
>  kernel/debug/debug_core.c       | 22 ++++++++++++++++++++++
>  kernel/debug/gdbstub.c          |  1 -
>  kernel/debug/kdb/kdb_bp.c       |  9 +++++++++
>  kernel/debug/kdb/kdb_debugger.c |  2 --
>  lib/Kconfig.kgdb                | 15 +++++++++++++++
>  6 files changed, 64 insertions(+), 3 deletions(-)
> 
> --
> 2.25.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
