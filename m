Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAC269A3E
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 15 Sep 2020 02:14:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHybk-0006EC-GZ
	for lists+kgdb-bugreport@lfdr.de; Tue, 15 Sep 2020 00:14:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1kHybj-0006E5-5a
 for kgdb-bugreport@lists.sourceforge.net; Tue, 15 Sep 2020 00:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vbe1AqHS58DfWSfiPA4xYQAF16nRd6xvbt+9w/fq7F8=; b=Vai1OTSF/JhSZuertJretyTr7v
 37j8rDTTG+eZKn1dHi2PnAmyFxiNv6MuZWWrlYyBxXo68JjtMcX3YanrRMW9ZJXxT3OUqdMPG9tse
 k6yNENM8kpEPvTRpDnkyjtJAT0ovbQxzdJAZemGPPx+ekxeYZAA053gavyQP8CM4w5yM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vbe1AqHS58DfWSfiPA4xYQAF16nRd6xvbt+9w/fq7F8=; b=LtsktE7Y95aTxcZhSRNOIjiczm
 Dpfp8+fgR5BNmiTKOGfOLeY0D8WjkgV8UZXtxDFSYJzrtnt8IKtkvJhTsWJvafneMG0ynMFgA8EbW
 GFrtRSgYI9wBd6Q5LLNHdZugA9YR0vhtfWnbb7l+NR4Lo9piG4TJaN40hnB21mNdika4=;
Received: from mail-vk1-f195.google.com ([209.85.221.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHybX-00985s-A9
 for kgdb-bugreport@lists.sourceforge.net; Tue, 15 Sep 2020 00:14:03 +0000
Received: by mail-vk1-f195.google.com with SMTP id n193so381974vkf.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 17:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbe1AqHS58DfWSfiPA4xYQAF16nRd6xvbt+9w/fq7F8=;
 b=a9nIWOuBsncn5CebByhLCjo54A9sj/xgJrXzTbXB4c+iGvDoxRz2kj+HDFuTlz6FHe
 ccTCakQhRnSTvbseiPYReW0cS/V95isQRNkbPDnFi3195ZDjjfks6GzN4NKVPvcaGFRA
 OiJFlEWiuip89VPeG5qgsATN0udSYhMKAY1mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbe1AqHS58DfWSfiPA4xYQAF16nRd6xvbt+9w/fq7F8=;
 b=pY8e1oFOIDxMpcwHMxYBdwKClLLHrrhUEKugSuZJljHP3cFvsHlbvApq8CyqjxVrgI
 yZujNUq6UnHbLD55sepyHj0gwJ9+BR8JVj0ITqhU1LTvPPW+Lc++MFdfKonm5nUc5RSd
 OCM5G/fAe/kqpsNsLlUC5w/+40PoNPag52508GioyAs7/jadO3idIyA21cah5JdfbWHi
 PEmYg7eGr+9T9cz7KbCl5RPRMcyH0/xdg7mQnNtM8JSLLcBJsRzM/zKHaT0zc0GxZt8/
 QhwLXCTWS2+SC8lTmhPRp6mEYpyGOzAvQGEpPYglbKNp315skZNEZDvq7gkYt7Y8Cq9Z
 B3+w==
X-Gm-Message-State: AOAM530ZMQRUIPSs2vyvBkKWUHKMuqRfEVgnYH7B75xYm/6ERAFGNbiF
 XDWjDlimYQr/y/1b5BVX3ZCaN2VVuKwg3A==
X-Google-Smtp-Source: ABdhPJzDzRNCP2fucIbECmXvGr7kXojK1Ai+1WC0ax0DwyUKfQYsU3gcLqY4qalJXDkuRTJ9pLHzTw==
X-Received: by 2002:a1f:e542:: with SMTP id c63mr8797267vkh.4.1600128821023;
 Mon, 14 Sep 2020 17:13:41 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id s5sm1963475vsk.10.2020.09.14.17.13.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 17:13:40 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id h23so397785vkn.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 17:13:40 -0700 (PDT)
X-Received: by 2002:a1f:1dcf:: with SMTP id d198mr2927179vkd.30.1600128819652; 
 Mon, 14 Sep 2020 17:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
 <20200914130143.1322802-4-daniel.thompson@linaro.org>
In-Reply-To: <20200914130143.1322802-4-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 17:13:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUPXdHoPaQg=Pp=bH-iORicO+1LjBZ0PNu0=SumC5tYw@mail.gmail.com>
Message-ID: <CAD=FV=VUPXdHoPaQg=Pp=bH-iORicO+1LjBZ0PNu0=SumC5tYw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHybX-00985s-A9
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

Hi,

On Mon, Sep 14, 2020 at 6:02 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> During debug trap execution we expect dbg_deactivate_sw_breakpoints()
> to be paired with an dbg_activate_sw_breakpoint(). Currently although
> the calls are paired correctly they are needlessly smeared across three
> different functions. Worse this also results in code to drive polled I/O
> being called with breakpoints activated which, in turn, needlessly
> increases the set of functions that will recursively trap if breakpointed.
>
> Fix this by moving the activation of breakpoints into the debug core.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c       | 2 ++
>  kernel/debug/gdbstub.c          | 1 -
>  kernel/debug/kdb/kdb_debugger.c | 2 --
>  3 files changed, 2 insertions(+), 3 deletions(-)

I like the idea, but previously the kgdb_arch_handle_exception() was
always called after the SW breakpoints were activated.  Are you sure
it's OK to swap those two orders across all architectures?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
