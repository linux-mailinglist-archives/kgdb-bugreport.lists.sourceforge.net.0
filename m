Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D40391EC87B
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 06:47:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgLJ8-0005io-Li
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 04:47:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgLJ7-0005iN-1X
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 04:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5HyznCRSqZKzp8yxYccefdnyUnHkOKLPSiD7FrX1pVE=; b=SjaZqJcK0amXGAJRO8Qp/nrE1k
 ApGwCLchvkOhWoXZpztS3evczOLm97bpH1YLUokzMhzy/QZlsW5fFP1jUoo5O9mq0CMe5GstG4Lb1
 h/cQC3OFgg5pG2LAqBgDEr4aivPk0ehPf/jHU2z/t/7riCoC33PvtJ3AHTuJUuGRv1vQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5HyznCRSqZKzp8yxYccefdnyUnHkOKLPSiD7FrX1pVE=; b=bPeuEo2kQF1xvuFSXojbRBkW8K
 d00Chir3YS82xyI30faOgv7guWDaNcVdFzRsMNtiNrkJR/vqdNOdI1CndpkajWZmiqYGbx+/LdIJq
 VjGfU/VJkbF+4n+7wMlUIeZ/SegWnyuUB7pdMvO+g/u3JgSPe+mIkzHlVyO1hj5h5FQM=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgLJ1-003SaN-WF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 04:47:16 +0000
Received: by mail-lj1-f196.google.com with SMTP id z9so958647ljh.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HyznCRSqZKzp8yxYccefdnyUnHkOKLPSiD7FrX1pVE=;
 b=OUe25Cg22WDYpRQ3XCaRcJ8nvIFDL++1wJ/8vhdCEGylPavhoKCvOcfB8UqmXCEEzm
 QAaJcNA0prtyQ4Ns5VW0t1iHhGEm4e2XLP+ankfK8QmKgzY5kgO00Chd5xwIoaDWSLdk
 Eia05lSaRZaSnrPlDc2RZ0iEM0bykCtNo2IGVdBBeP4tgWzqnItxIFYExBPCFbYjxos7
 OAl9WiwYvn8Aq2u1ZqRqWMmS/j/WO1Rf6RhsDH4VRnz3uEyFQqv3epIy+2b7loQ5ejTq
 v3D/h2pdRkV/2t6joCyzshZ5JXZm658VhLGhQADOK0CoMox9NFKdr35dzQ2+wAUqMZIQ
 FrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HyznCRSqZKzp8yxYccefdnyUnHkOKLPSiD7FrX1pVE=;
 b=OYfZ5gJ41uf7oxF00ZOKOFxXiMa0aTr7KeF1cRiNED0twV3XI6cQEpN+bHlOqAGZkS
 IzvacNeMhMrQ/QHCP/O8lCu7IRYRXYc3hvSL8CRC84yHKJcydR9MaSxRsAJ2pNmXIE6p
 WKsVg7GgXA7ji2KDr4MpiMrWBZgBrEorDzAfN1bez1pWlQey/6LYsXfzt638VZbIwurq
 tSjL0LvZx9utRtz7k7l0rYMH2F6E1E4fSI8dglawQK2Elk8EYUZyCcmeevfRqvCyvLO7
 9DRrBIhRuTtCM4oa66temT3U/ZftU6q1qLXsPY/keB0xbWAkw8bIjTu+ml/UxFFYPGaQ
 dKxg==
X-Gm-Message-State: AOAM532wxQNmdBEBRqoi1igUgVdy8nWO+qNLUGNvBTwwsjZf11q8N20x
 WdqZg7ERhjKRYVPYv1gN69H/Kul0+JS7WmVGofjHWA==
X-Google-Smtp-Source: ABdhPJzX/QPYO+IFkLwCC/pcn+l34ZzpqPaDG1GSY3dO4wqzcrCQkLqFUew2QLYvZN8DZ75w1+s67PXQw6+A7EJ7zd0=
X-Received: by 2002:a05:651c:1103:: with SMTP id
 d3mr1171214ljo.110.1591159625236; 
 Tue, 02 Jun 2020 21:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-2-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=WVdRcvfR-O-A2809AqFggqhJmvrTSo9qafxq=DgSbLrw@mail.gmail.com>
In-Reply-To: <CAD=FV=WVdRcvfR-O-A2809AqFggqhJmvrTSo9qafxq=DgSbLrw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 3 Jun 2020 10:16:53 +0530
Message-ID: <CAFA6WYM0=WaFd7uUYaTje+22oVmG1fCBOYAz8UUmB2z6qcK=6g@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgLJ1-003SaN-WF
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/4] kdb: Re-factor kdb_printf()
 message write code
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 3 Jun 2020 at 03:02, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, May 29, 2020 at 4:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Re-factor kdb_printf() message write code in order to avoid duplication
> > of code and thereby increase readability.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 61 +++++++++++++++++++++++++----------------------
> >  1 file changed, 32 insertions(+), 29 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 924bc92..e46f33e 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -542,6 +542,33 @@ static int kdb_search_string(char *searched, char *searchfor)
> >         return 0;
> >  }
> >
> > +static void kdb_io_write(char *cp, int len)
>
> nit: "const char *" just to make it obvious that we don't modify the string?
>
>
> > +{
> > +       if (len == 0)
> > +               return;
>
> Remove the above check.  It's double-overkill.  Not only did you just
> check in kdb_msg_write() but also the while loop below will do a
> "no-op" just fine even without your check.
>

I will get rid of kdb_io_write() as per Daniel's comment on patch #4.

>
> > +
> > +       while (len--) {
> > +               dbg_io_ops->write_char(*cp);
> > +               cp++;
> > +       }
> > +}
> > +
> > +static void kdb_msg_write(char *msg, int msg_len)
>
> nit: "const char *" just to make it obvious that we don't modify the string?
>

Okay.

>
> Other than those small things, this looks nice to me.  Feel free to
> add my Reviewed-by tag once small things are fixed.
>

Thanks.

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
