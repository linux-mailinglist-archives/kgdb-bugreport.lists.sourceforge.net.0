Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB32344CB8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 18:05:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lONzW-0002Mg-G0
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 17:05:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dianders@chromium.org>) id 1lONzT-0002MW-DY
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 17:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=edxiajj3pRs/T67JjKnnNu8jS6uH/jxSLcgetS/152k=; b=N3idhvYJ+UpPrkx4M4NMujpnlg
 hcBhhvnfbCmGexGSdzGE/5z3ibUmBQpH2mAnJEkOLTw/Kzi4nRzLuVRRp/nmaLvCjFqWnpEetT+PE
 W9CqK/7gzukIzpptyglNSfyrAjmJ3vPlRWqXWuvtCadrIm4c4I3nNlKShWIsfVOa9qMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=edxiajj3pRs/T67JjKnnNu8jS6uH/jxSLcgetS/152k=; b=Wh2bnqyc4FLD7erJr+CtDHO2Rc
 4O16Bzqed7+tA65zRtGWYlyHNWZv7vZC0DnwRtZKQwFsl5xe+EHHLOzI4W0LoBYKiShK7HH0Ry+2R
 s0e43HY0zv59nwKPWjXGt3Q5A0WC5zwDka75y4SJUoTFccfwFaGF2xgBoyBZdmh4+hNI=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lONzQ-00032t-Mb
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 17:05:19 +0000
Received: by mail-qt1-f182.google.com with SMTP id m7so12847192qtq.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edxiajj3pRs/T67JjKnnNu8jS6uH/jxSLcgetS/152k=;
 b=lmUJKKcr5fwHsvwxbmTJiLXqr3KMnghgEokc5CtfneaAi4MoijJYSE3OCkVWnCgFqe
 u7EDtki7hnxQsBdjx96G9NCYraX+R5cL/jIGYPr9oXPPXR3djdJA6BhAPfcM3ymATyLx
 NxlwTpErCk2IWszGDaspRUYC00EIJX5VvwIFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edxiajj3pRs/T67JjKnnNu8jS6uH/jxSLcgetS/152k=;
 b=YV80WKnlNFK9PrLW7GLfOvkSoAc0R+vDGco8A/IKG6/10+gnHyZYtqUpWhDFnpBb6i
 PFJOIL4PWcAaKkYuNb7VORgD+d69nTsfxaxiwxawtaFEmHqxLGj//cVVmiVobQkm9XaS
 UJ96cvBPf4VYjMbUyBh/7EQNK23yYkBtFuAp4zkaQBV0I0SIhEULlIJJaSghvBbvWbbs
 uGD4hBswyqz22S6XLu2dAYDYalfqRioHuFfH+JUzwc6Dpmo3lLXy4AzJ3GKMMmwaWyJQ
 lMr0f+4hhxk8TMhsiIhiOeMCHnkzLQ56DbDBHEXSAfkVRRukMJ4dd8y1VLjQq2e+R5eb
 0YpQ==
X-Gm-Message-State: AOAM533hjmRovgJGD2QMqD46WNYXzmCvVFk9B8joATldFD8825Oqhusj
 8fV8NagedJSfN4wc2dNCnLp7mywKXY7ZyA==
X-Google-Smtp-Source: ABdhPJwUVx3wpMtAXCaaTpdcfsJ0lgmI6OKpiqDqvLjfyPtDHTGSbuV7I61iQYmK9PDdyb4U9ACnBg==
X-Received: by 2002:a05:622a:149:: with SMTP id
 v9mr811927qtw.172.1616432710462; 
 Mon, 22 Mar 2021 10:05:10 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id p5sm11700826qkj.35.2021.03.22.10.05.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 10:05:10 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id g38so7330196ybi.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 10:05:09 -0700 (PDT)
X-Received: by 2002:a25:3741:: with SMTP id e62mr583491yba.343.1616432709363; 
 Mon, 22 Mar 2021 10:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322164308.827846-1-arnd@kernel.org>
In-Reply-To: <20210322164308.827846-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Mar 2021 10:04:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
Message-ID: <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lONzQ-00032t-Mb
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Christian Brauner <christian.brauner@ubuntu.com>, Ingo Molnar <mingo@elte.hu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Mar 22, 2021 at 9:43 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> -#define v1printk(a...) do { \
> -       if (verbose) \
> -               printk(KERN_INFO a); \
> -       } while (0)
> -#define v2printk(a...) do { \
> -       if (verbose > 1) \
> -               printk(KERN_INFO a); \
> -               touch_nmi_watchdog();   \
> -       } while (0)
> -#define eprintk(a...) do { \
> -               printk(KERN_ERR a); \
> -               WARN_ON(1); \
> -       } while (0)
> +#define v1printk(a...) do {            \

nit: In addition to the indentation change you're also lining up the
backslashes. Is that just personal preference, or is there some
official recommendation in the kernel? I don't really have a strong
opinion either way (IMO each style has its advantages).


> +       if (verbose)                    \
> +               printk(KERN_INFO a);    \
> +} while (0)
> +#define v2printk(a...) do {            \
> +       if (verbose > 1)                \
> +               printk(KERN_INFO a);    \
> +       touch_nmi_watchdog();           \

This touch_nmi_watchdog() is pretty wonky. I guess maybe the
assumption is that the "verbose level 2" prints are so chatty that the
printing might prevent us from touching the NMI watchdog in the way
that we normally do and thus we need an extra one here?

...but, in that case, I think the old code was _wrong_ and that the
intention was that the touch_nmi_watchdog() should only be if "verose
> 1" as the indentation implied. There doesn't feel like a reason to
touch the watchdog if we're not doing anything slow.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
