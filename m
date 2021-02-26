Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B0325DC1
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 07:57:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFX3w-0002Iq-8z
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 06:57:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lFX3u-0002Id-PF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 06:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gTghAYC+gRhrAARfUZ1trTPRu51XeejlsuQaOFCWN7A=; b=lzxQF7KBVnhqMY4R75x3szmvXF
 jmoPBJkZe4vxJr8+GAQv2LoHNwiymPVsKk7VL5ECogsxC6utrmCUdcrx28X/3EFornLBPy4U45qIu
 nb6fgp0BkkwIlGeAi+9v0H0uSperS1kfuGsq+iAEZ5288kZ0itqIoieJdeU/y+RpQgGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gTghAYC+gRhrAARfUZ1trTPRu51XeejlsuQaOFCWN7A=; b=OOPq3qP0Oo9fQTqdGH5V1mLHc3
 EWhT3IY3ccne8j9NUhIygic1H37yczS2AQuJBQzsZUR5Velwgud50aLQeZck8YA/CutZY4MW2xwAX
 A1QtgkXMe6CFRjzEbSjaFPmhbSLxN5YNeKCztAiYaBmRvHIJGa/XtDPJFqTZGo74RId4=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFX3r-005wL8-Ul
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 06:57:18 +0000
Received: by mail-lf1-f42.google.com with SMTP id p21so12314242lfu.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Feb 2021 22:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gTghAYC+gRhrAARfUZ1trTPRu51XeejlsuQaOFCWN7A=;
 b=susevJATkTe7C57QpZVMpR//EDKwOOqnHDssM2XTs8U8PRxcs6OK8NSe3zdGl9+mHE
 xvfWZQfYXJR2SlV8oPP2jIufFa6C9paGbp4q1LTcF+ily8Cu0eMDapLU7xn8+gxRzyam
 /2qCvHmLtq46Vv1Ncj6xZ2QTmb5QbtdBzlYaQGtk4sdK/lnPk/4ObcjCYQiW+yJ4vcnJ
 SSzmeAvQ7Pm/WGKP0BgA9mfopaQapYA2eP9rpWHK/osOvGuK+ONiRM3zBmbqqon64Bon
 TqahnkV3PnLb0TeF+ZHtc0waxmx1zcyUmBj4ruENZq0jdgoUz7vrSSeW4TsBlaY/FK0u
 s8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gTghAYC+gRhrAARfUZ1trTPRu51XeejlsuQaOFCWN7A=;
 b=X7S/9wEHwt1nKmzqWrtpM2Vcj9yk6GzBzsYOUk3hvJk/Tf1GeoXcJvSwRYmrtJQMx4
 As52czFp0uiU4BA21cL12lIFXrjD10b39D7tQ7nem1bZ9X4TQV6Ew4LlPKttxmph/diy
 /eRF9IGrUPVrjfprP6jK23Ho1fkofpVyU0iXz8tE/eD5P949olVHBkRwb+D1rNaYBRgZ
 +Sfg3ij0IyspEsE2h//jEq+FKNaGJb/0HJnVfvp3kvZMky9yCsD96a3WLnGjgSNlmskp
 Tql/waGqjqUKDJ6Px2jL1tSDBjXzvutLEYGWSzR/w0BRytRRaN+cNAJJyJ6I990ibVtW
 BpyQ==
X-Gm-Message-State: AOAM531ZuNwPQja0KjV5P/NGesOYCXpRzIjUmn/QatWSSLlTtdEmCY17
 z9vIPni1AQdr++iPH3etw1uaeAuslD4OxUFWtCcAKQ==
X-Google-Smtp-Source: ABdhPJwf/fs8KdhYyBibGWfVILQtI0qi3lSGoT+v/KGNx294ah6iU6SvE/8TrjPwmnrmOf7hHXXyIaccIncYV+Orh+M=
X-Received: by 2002:a05:6512:308a:: with SMTP id
 z10mr960635lfd.84.1614322629317; 
 Thu, 25 Feb 2021 22:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20210224081652.587785-1-sumit.garg@linaro.org>
 <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
 <20210224102052.009aaa27dd5b530d7e7ef599@linux-foundation.org>
In-Reply-To: <20210224102052.009aaa27dd5b530d7e7ef599@linux-foundation.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 26 Feb 2021 12:26:58 +0530
Message-ID: <CAFA6WYN===hi_6w=zhXKT=iCAyMkXvi0OwvZb3bbsZpUeeFg-A@mail.gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFX3r-005wL8-Ul
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on
 initmem after boot
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>,
 qy15sije@cip.cs.fau.de, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 24 Feb 2021 at 23:50, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 24 Feb 2021 10:09:25 -0800 Doug Anderson <dianders@chromium.org> wrote:
>
> > On Wed, Feb 24, 2021 at 12:17 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Currently breakpoints in kernel .init.text section are not handled
> > > correctly while allowing to remove them even after corresponding pages
> > > have been freed.
> > >
> > > Fix it via killing .init.text section breakpoints just prior to initmem
> > > pages being freed.
> >
> > It might be worth it to mention that HW breakpoints aren't handled by
> > this patch but it's probably not such a big deal.
>
> I added that to the changelog, thanks.
>

Thanks Andrew for picking this up.

-Sumit

> I'll take your response to be the coveted acked-by :)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
