Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B2379B15
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 02:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgG1q-0007JG-HV
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 00:13:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lgG1p-0007J1-42
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 00:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=; b=ZmfmuODKEvb/D63xR838hEwADo
 GLxg+kGC6AkWwEqHs00ECjRoF721drqBfQQtoEfLit2nGMLjq9YR5PMWaVa5H4UU/41DJaa/SlUQn
 Oq0RBQIeeL1I6Yd//2cczk15uFWoo0cMRc+ZAJ2yQYxMiCrn2fsR3qWs4QbuUr74HFNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=; b=Km3WY3SNoaaxuyQvpTQsdK/XhK
 jYVgza78A0cgld8knH+gkq/bkQj84gDfAFtN/9IcWEuUIhM/NXMR5/bAzZvu0UodRAogo+tV4aR7D
 ftj7RrAvBRDaAsT0iQlguF6NkKXfMqQ1WIHJB3lbh46YpbrfyAlGWWgVl0KNrOVDo83g=;
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lgG1i-00060j-AC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 00:13:36 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso16044850otg.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 10 May 2021 17:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
 b=KFj5l6zhdrS0fLCWMGjmr/xO4BlTFtZoz3C0X6f4yXPAPd4QFYCKQ6VCRUB/RhrcYc
 /aNljSGJlQqpYw9kb4Ei54tqu7LZbNffzPVR359jRbFKseto3PQlwou2i3Frh18gwxLZ
 83EJdcrxGqEoNBrlRvGIOn9J8VC7CuWrNZTlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
 b=gOYyAkGX/mGF0eaT6V3wGJRyhRkUmH5iW0CI359x3Rq5ILkGNfjd5D8RbYA1O06CpE
 Jw08tRvgjwX8A+Ywrh44RXIIqObOy5y3RFZq+bm+J1gygTNwngsx9x3wdD5V4zF0HVzP
 UQTnQFJkdi0pjWECwNTAYgUu+ZBD99DHmkDE9hbkhVJaCLbYeQlZZtQJ4ufhLZaIcwKt
 m7rWl9aO8au+wxO/pAMFMXHqqjEVCPAfvjOBOUSqqwkprh7wAyW1zUcP8QwJcY18YCv2
 pjnBmccvXvrl5gdjMt3YqNrnjVMUzYVgZtDQ47XrIG2aUTbBuS8hBFow9uvpJDbWvugL
 Hcow==
X-Gm-Message-State: AOAM5335DMWx9VI2LQhtq39Pc5BjVI8w2QeUy0/pwNPQ8oeKfsaS4vOX
 yhG+BhsQMvq/jSfgtePGSpUXraOSWg+gTg==
X-Google-Smtp-Source: ABdhPJzNxQe6pnW+qnx2cbCs8vrkomawTqkn489gpeieb6k/DCpfiFjocUKFPZ0/QreDgao8fHwzfQ==
X-Received: by 2002:a9d:12b5:: with SMTP id g50mr23583457otg.97.1620692005316; 
 Mon, 10 May 2021 17:13:25 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id v28sm3084103ood.27.2021.05.10.17.13.25
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 17:13:25 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so9736777oth.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 10 May 2021 17:13:25 -0700 (PDT)
X-Received: by 2002:a5b:8cc:: with SMTP id w12mr37539122ybq.32.1620691558469; 
 Mon, 10 May 2021 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 May 2021 17:05:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgG1i-00060j-AC
Subject: Re: [Kgdb-bugreport] [PATCH v1 2/4] kdb: Switch to use %ptTs
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-nilfs@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, JC Kuo <jckuo@nvidia.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux USB List <linux-usb@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, May 10, 2021 at 8:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

I kinda doubt anyone would really care if we just switched kdb to just
the old "%ptT". Probably no machines are parsing this string.

...but in any case, now that the nifty new format is there we might as
well use it. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
