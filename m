Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB1E269A44
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 15 Sep 2020 02:14:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHycQ-0006GE-Jq
	for lists+kgdb-bugreport@lfdr.de; Tue, 15 Sep 2020 00:14:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1kHycP-0006G7-79
 for kgdb-bugreport@lists.sourceforge.net; Tue, 15 Sep 2020 00:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aJnbONMeYZfyVdyxeGsIkJTHYkKRPSNz8vRxzIqGNEU=; b=jQgUb5Q351qjb5zG+GbPCjX/ac
 i5pOSqiYeFl1OHtvcAyPfU9gVMoI8WFIIDmiPgYcQxB8rXRR81PaHayICriMaeAOKwZ19vRQndqeg
 /c50HUYeq6DN6YfGBlMAFAbbNIlX/eTyuV2KH5+KKSpQr+YUiNkrSaqj5IcLjFJnh9jE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aJnbONMeYZfyVdyxeGsIkJTHYkKRPSNz8vRxzIqGNEU=; b=T6QviJoM99muJTTw/6cmGh0w6V
 Cf66ngZ8QWOt4KT3ud1Rc71x7smLWa/CokHKfuRgL7WsT7dD275it1SZQMt9PppumMGjug1EgSFym
 vulDkFx9QB89So1zy1QzXGTzpMYOnhdwEbxONFvUP0RU443k+MoOP6ZIciJy7XcuWzaU=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHycL-00988d-9F
 for kgdb-bugreport@lists.sourceforge.net; Tue, 15 Sep 2020 00:14:45 +0000
Received: by mail-ua1-f67.google.com with SMTP id e41so455498uad.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 17:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aJnbONMeYZfyVdyxeGsIkJTHYkKRPSNz8vRxzIqGNEU=;
 b=d6gCudIK5g9Xugrn0/5pf/xRr0qPusWV9CWQYguGjj3LhcFyO8LTKBFmPsg7RfcHD3
 R2gUlTkMLn1B1RF/E7q/eSwLpevMLjOdwQQHQt6uq3KC9yEZJ1uxlK2N031hdXOkkYkf
 o9LHRKj4aCWRZS40y/4pMy6E/Bg3CS5QnHv2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJnbONMeYZfyVdyxeGsIkJTHYkKRPSNz8vRxzIqGNEU=;
 b=Q9XJe6a6BkORBLVBY1cViypHty9jyhGFvo5/cpk56hWpg/IAjESz5ZbTmkDOdDFwwD
 k+Ue/sFB+5Q1Esu2BljKlKubE+dhTX9ITlHyw/kYTLfwbsljJVIQ31DmVhahdPX3hpjn
 Kms5sxAHzuQXOLPu8LTBPNFFJNjsEY8JLfr6AwWbCoh8R5uALfa9wOoVFQGRjalDCyex
 t66CB6jKUkfI1DnTdjaZDmOkCzA2D4zI2nOnJIBi76yv2BS7yc/52HJ2nXnorpJ9cOWZ
 e6w5hHixZn5ZM2tZvpb2IBIaysyr9tEuDw+cz/WE2w43qf6nvnyyNlJBLTbSYIGkg+AP
 v0Lw==
X-Gm-Message-State: AOAM530QoEIqmnRcW5zFL7RWc+6SCeNlDRwHTEPNP0EI5x2kASypaDm3
 YoGLfzeJy6GUERHCU282BcVzuV9h7Dk6Cg==
X-Google-Smtp-Source: ABdhPJy6HqgwRTqQ2LQZc4//IqlUZI4zLckiQmCGucI5PBfsWnlHKrbnF+Zp0wTOsXg0cFuvssYXXA==
X-Received: by 2002:ab0:78e:: with SMTP id c14mr7975945uaf.117.1600128874919; 
 Mon, 14 Sep 2020 17:14:34 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id c125sm365985vkc.43.2020.09.14.17.14.33
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 17:14:34 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id g16so457782uan.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 17:14:33 -0700 (PDT)
X-Received: by 2002:ab0:5905:: with SMTP id n5mr8290763uad.90.1600128873477;
 Mon, 14 Sep 2020 17:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
 <20200914130143.1322802-3-daniel.thompson@linaro.org>
In-Reply-To: <20200914130143.1322802-3-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 17:14:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTgNxVLwytSY1wmCj7Dex3cWGVMA+Rkpp9gb1UN5CU_A@mail.gmail.com>
Message-ID: <CAD=FV=XTgNxVLwytSY1wmCj7Dex3cWGVMA+Rkpp9gb1UN5CU_A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHycL-00988d-9F
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/3] kgdb: Add NOKPROBE labels on
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

On Mon, Sep 14, 2020 at 6:02 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kgdb honours the kprobe blocklist but doesn't place its own
> trap handling code on the list. Add labels to discourage attempting to
> use kgdb to debug itself.
>
> Not every functions that executes from the trap handler needs to be
> marked up: relatively early in the trap handler execution (just after
> we bring the other CPUs to a halt) all breakpoints are replaced with
> the original opcodes. This patch marks up code in the debug_core that
> executes between trap entry and the breakpoints being deactivated
> and, also, code that executes between breakpoint activation and trap
> exit.

Other functions that seem to be missing from a quick skim:
* kgdb_io_ready()
* kgdb_roundup_cpus()
* kgdb_call_nmi_hook()

I'm not confident in my ability to spot every code path, though, so
I'm not sure at what point we stop looking.  I only spent a few
minutes and, if important, I could dig more.  Did you have any chance
to see if there was any way to have a magic linker script just add
this to everything under "kernel/debug" or something like that where
we just use a heavier hammer to whack a whole bunch?

In general any extra annotation here is better than no annotation, I
suppose.  ...so if you just want to commit what you have (maybe with
the above 3 extra functions) then I suppose it'd be fine.

-Doug


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
