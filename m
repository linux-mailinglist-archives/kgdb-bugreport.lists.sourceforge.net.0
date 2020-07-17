Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E862622466E
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 18 Jul 2020 00:40:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwZ1j-0002wl-O9
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 22:40:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jwZ1i-0002wd-3N
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 22:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZyZ467hIccQl/fLPtGOgJ9GVjmNV0nRkM5JSKZ0eUA=; b=RSfTzenVlBf22+bs6vM+QT8F+c
 RT/GvxaZUH6GzhOIGgdnVecxNN1FJoJbt6I1DUyzpW2191yP2Hr5/Z5RSDkpNmwLcr5RAgOBAYKwP
 f3nBbGelQmXNvcHRiLfiPuQlIUAm12r3/C17uTrdlPgak3Rnv2nCtQLG9SRXrXPSlzI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SZyZ467hIccQl/fLPtGOgJ9GVjmNV0nRkM5JSKZ0eUA=; b=LjJOASPP3NnEuNH4exwHZHydM2
 XLVadHcOYBrbuxic2JvBMOVLR0JCSt9K9/UyR8Lbvl8HmW+j5jzE/+VhSqhakQA0Ehe6+p8WjOs4r
 YTAaO08RlqsWU1bRmdyh76n06xvErL8/7xHUe6ifQr8EF6wOmZge+UBjm/jHts8y19L0=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwZ1e-004yZB-9P
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 22:40:22 +0000
Received: by mail-ua1-f66.google.com with SMTP id u33so3345856uad.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Jul 2020 15:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZyZ467hIccQl/fLPtGOgJ9GVjmNV0nRkM5JSKZ0eUA=;
 b=GomICRb5nZ9AfMHvPuoZI9Nbna9nrEcMfyotbsXbKTOwiWbdxkGc31o4K3DmBKnVFs
 USNTnZSIRmtmhCioWNZiPbRNJC4rBkfzRD+++dw3AYRbKw9mQl2l4jech0vRweiL1/bj
 ck9javutd1dlNYxF5oD3KtwdU5fnN2jzWtBV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZyZ467hIccQl/fLPtGOgJ9GVjmNV0nRkM5JSKZ0eUA=;
 b=cbbPjFk9EM+jigmypstYiQbCqEb6ysvmy1m76oKjQiigpFIFw6O5C4ACmJ9VnB3t9G
 RzWkboj12Mo8PvHCciPUPbY+2oc2q6uczTVIpKWpYVATWmK/QcjuNqHGKiU/AlLXrZma
 prPpGeUsb5WUMzG95g6MjxlMypTzHzULeZboIggYLi3uxQx5XsaOGha6VlW9i3ETOUmu
 MwG7crev6mBzushPKpbM5jyM71ly0ek0TallVJew55LCPi5XRHajKxfWwQtI526PQg6E
 EJuUmh9fHeNwXdhL7CxzyDkwjj7BEnrwz7v9+ByrKGLLXcBz/uejymN2Sm31CQAfho3G
 zf0Q==
X-Gm-Message-State: AOAM5331T6fR1dz3GfCky+n6uR+7nav847LhiU7BSW5rc5z6F9d/fec6
 SEOQCjEnLLSuDz6qsrlMZz9mZ6ewjHo=
X-Google-Smtp-Source: ABdhPJzsc8od407qWJ1LW5XDJSycWDYQO6l1irSzjHbZOVt8taAK4+C10JUT2exJYAvv43lg7pp+nQ==
X-Received: by 2002:ab0:5ea5:: with SMTP id y37mr8863931uag.71.1595025612151; 
 Fri, 17 Jul 2020 15:40:12 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id d200sm1385131vkd.16.2020.07.17.15.40.10
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 15:40:11 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id u6so3348217uau.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Jul 2020 15:40:10 -0700 (PDT)
X-Received: by 2002:ab0:150c:: with SMTP id o12mr9192504uae.90.1595025609920; 
 Fri, 17 Jul 2020 15:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-4-daniel.thompson@linaro.org>
In-Reply-To: <20200716151943.2167652-4-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 15:39:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBMa4pt7Xg2sKXHdjo6tVaQWBQFtT_aoDJ+Xt1HrPD+Q@mail.gmail.com>
Message-ID: <CAD=FV=UBMa4pt7Xg2sKXHdjo6tVaQWBQFtT_aoDJ+Xt1HrPD+Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwZ1e-004yZB-9P
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

On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kgdb honours the kprobe blocklist but doesn't place its own
> trap handling code on the list. Add labels to discourage attempting to
> use kgdb to debug itself.
>
> These changes do not make it impossible to provoke recursive trapping
> since they do not cover all the calls that can be made on kgdb's entry
> logic. However going much further whilst we are sharing the kprobe
> blocklist risks reducing the capabilities of kprobe and this would be a
> bad trade off (especially so given kgdb's users are currently conditioned
> to avoid recursive traps).
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

I could just be missing something, but...

I understand not adding "NOKPROBE_SYMBOL" to generic kernel functions
that kgdb happens to call, but I'm not quite sure I understand why all
of the kdb / kgdb code itself shouldn't be in the blocklist.  I
certainly don't object to the functions you added to the blocklist, I
guess I'm must trying to understand why it's a bad idea to add more or
how you came up with the list of functions that you did.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
