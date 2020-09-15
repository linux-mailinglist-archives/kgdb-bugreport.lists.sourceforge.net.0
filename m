Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038026A677
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 15 Sep 2020 15:45:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kIBHA-000874-S0
	for lists+kgdb-bugreport@lfdr.de; Tue, 15 Sep 2020 13:45:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kIBH8-00086x-OJ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 15 Sep 2020 13:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jFlH2Mb4PbicIWoSy/doLle0e/no7tiKAYBIFeeMPlE=; b=IhMkx/hljcdnSA0CIFn9W+g9Z/
 Tqvrv2lcNyn3OEw0GOpd82jVct631lb2ymN3RW0QhdwSI0mmJKweFzIRxe36b/BD/u/2GHQOyjsbp
 HikVlbF4CsE/PcVAbLf5TzU4EtgwH82l/SmN+xDuuhMgcTZbIgB3s7aJ5tjZvEd1F5KY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jFlH2Mb4PbicIWoSy/doLle0e/no7tiKAYBIFeeMPlE=; b=QMmj/8YAS61dDHN9w+JcWP7/yy
 TBddhjlVLTn/osbavB1O0i6313J/HqTmFUj2I8KP4ev8MzGDAGAlQNkk5nz2OfhgjsRI6/9efimRp
 acidl7t0DINQkmdxND7dG2K+hABqhOrPjjLRbMtvZwA568bd1B7ReMH7ZCf1MDECqNS4=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kIBH0-00AtpO-1n
 for kgdb-bugreport@lists.sourceforge.net; Tue, 15 Sep 2020 13:45:38 +0000
Received: by mail-wr1-f67.google.com with SMTP id t10so3435319wrv.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 15 Sep 2020 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jFlH2Mb4PbicIWoSy/doLle0e/no7tiKAYBIFeeMPlE=;
 b=cmL+DxSQG5LinAgNudybg6vutCW3d525J8bCTa5zQRsM1+6+9u7btw251f1MR5sX39
 Kn/qOa17Cl5qvCihyI9tkcM8WGn9vqBjwld//Cam6u5a3lqBnRxOS4kPFMaM2+Wh9lia
 Dn+7EZImyLJIgW00vBvwynPEbNYZ0mpBabcIzIYm5h5992MwZNrWy+feXgrdqpRfjP7c
 KnbtFJAXCexsAwnXmW5KKgDj9dLqg13gTmbXS8r66cb9GGwEJGnYYoGLIzVkjlffojzc
 WyHU31DfYADP/TjbzvIKu9VPGeBim2GV59AVMSdRiTBRMbmZklS6/f5SMPDIgQUCdwVb
 r2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jFlH2Mb4PbicIWoSy/doLle0e/no7tiKAYBIFeeMPlE=;
 b=LlXfWtFoFRcRyErwJ9nxF2Ix3DZX3gvfu3cgjYOA8poHTDSXgm7s0Yeq7n25QVygMR
 wzMt8lQ4iS06YZxyQhFMaw7gVBmv1SfD4cJwYtMO5UFP1HHmGUq+hCkygcckJD+wFiHJ
 V/eQD0dCrBh0INAWWgLcOG9kS6HekAi2pgDoIc2/PCGdyKKnFYJSHmwYJ5KeZm+xrnat
 T+cTR/OP9Pno1CPH3TeboRGmTfnIDGCpN1VpTEXVhdj30IykHEjIDjJgqNPKnGLAlB9q
 msdlKzMnWn8yxU6fQ5KAOWMbTt7FLafbQmFoglEa48HvkjriSQ0WEWejqp2+2DWrQnYT
 Tb1w==
X-Gm-Message-State: AOAM533apkwcLAH6+jUEucUIwSgr3Jl3sLr7SWIWbKEtofI1YMhkvRik
 ZGQyZNd5KJhRodC4PDjUEpg3yg==
X-Google-Smtp-Source: ABdhPJzE0F+7GcnPcOMiYkTxRx7ha2dm7bcywWCpIi540WqHfOagDSepgNDSVCDmhfeZeRYs9Zjwrw==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr21149017wro.315.1600177523578; 
 Tue, 15 Sep 2020 06:45:23 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id x2sm26804404wrl.13.2020.09.15.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 06:45:22 -0700 (PDT)
Date: Tue, 15 Sep 2020 14:45:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200915134520.jgbxallmksifrg2x@holly.lan>
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
 <20200914130143.1322802-4-daniel.thompson@linaro.org>
 <CAD=FV=VUPXdHoPaQg=Pp=bH-iORicO+1LjBZ0PNu0=SumC5tYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VUPXdHoPaQg=Pp=bH-iORicO+1LjBZ0PNu0=SumC5tYw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kIBH0-00AtpO-1n
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/3] kernel: debug: Centralize
 dbg_[de]activate_sw_breakpoints
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

On Mon, Sep 14, 2020 at 05:13:28PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 14, 2020 at 6:02 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > During debug trap execution we expect dbg_deactivate_sw_breakpoints()
> > to be paired with an dbg_activate_sw_breakpoint(). Currently although
> > the calls are paired correctly they are needlessly smeared across three
> > different functions. Worse this also results in code to drive polled I/O
> > being called with breakpoints activated which, in turn, needlessly
> > increases the set of functions that will recursively trap if breakpointed.
> >
> > Fix this by moving the activation of breakpoints into the debug core.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  kernel/debug/debug_core.c       | 2 ++
> >  kernel/debug/gdbstub.c          | 1 -
> >  kernel/debug/kdb/kdb_debugger.c | 2 --
> >  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> I like the idea, but previously the kgdb_arch_handle_exception() was
> always called after the SW breakpoints were activated.  Are you sure
> it's OK to swap those two orders across all architectures?

Pretty sure, yes.

However, given the poor attention to detail I demonstrated in patch 2/3,
I figure I'd better write out the full chain of reasoning if I want
you to trust me ;-) .

kgdb_arch_handle_exception() is already called frequently with
breakpoints disabled since it is basically a fallback that is called
whenever the architecture neutral parts of the gdb packet processing
cannot cope.

So your question becomes more specific: is it OK to swap orders when the
architecture code is handling a (c)ontinue or (s)tep packet[1]?

The reason the architecture neutral part cannot cope is because it
because *if* gdb has been instructed that the PC must be changed before
resuming then the architecture neutral code does not know how to effect
this. In other words the call to kgdb_arch_handle_exception() will
boil down to doing whatever the architecture equivalent of writing to
linux_regs->pc actually is (or return an error).

Updating the PC is safe whether or not breakpoints are deactivated
and activating the breakpoints if the architecture code actually
censors the resume is a bug (which we just fixed).


Daniel.


[1]
   The fallthroughs aren't a whole lot of fun to read but
   if gdb_cmd_exception_pass() provokes a fallthrough then it will
   have rewritten the packet as a (c)ontinue.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
