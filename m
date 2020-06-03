Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B01EC882
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 06:49:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgLLL-00009t-Sj
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 04:49:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgLLK-00009m-Rn
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 04:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9jneiIwhoTeX6/+oub23nloy5lCEM9fcOmaGR+FZzuQ=; b=ebvTbbk6nv3Z+uOuNUedlDLbwn
 ONdBOmHwTgKlodNFaGl+Fdk2+QbAC1YEJpaGU3NXuv+KRK7eV/apYGr6nNTSmM/rxsg2+ZhGLBlRP
 VeQn1Hx/6508GxkwaHT8eNnpwM69fspKIJDlipbBjUYMbKSFMzZruNfS0hUEvElaNGq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9jneiIwhoTeX6/+oub23nloy5lCEM9fcOmaGR+FZzuQ=; b=dZv3d5eXgGVGTA0H3spLMJayC8
 Ys1D4rvibtMaghIWU+Pf5tlsGeLODMm6Vontf43J/znCabIuApzjheOdxes6llDzFDqNtK+K6Jrm1
 fI+wMF8/qd8He3/BS+rF7ORM04607itrYlLcUSzSYnBJkDDYTpI8LAES2uJJUK0Rz45Y=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgLLG-0075GB-86
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 04:49:34 +0000
Received: by mail-lf1-f68.google.com with SMTP id j12so465121lfh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9jneiIwhoTeX6/+oub23nloy5lCEM9fcOmaGR+FZzuQ=;
 b=HDw5vz+XXOVCtGvAKqFpoiuh+xys7OQHwn8q7cgtFrTWNO4on7NiHA2zOuapDLNoz1
 mDjMgphgtHbSP+nPF6r6uNuocnnul07gWzdPZKg8yeOA8I508mvPIQ38+zRSc5SMYV0k
 LCLxIsWN+n/GGOfSfY5u0ym046F9u1c1xzXxnkhmoYwjaBy/1gne1+eKYdxy0rdYn/z+
 yKwRLF9QzeGTweMPvwYCYmuUGONixe9NYeKX0NVITwGONe0hYXYj3JWcqnvtiGoBJ2Zl
 vssvHbI8KPS+mkk++mT+d5ETK3QPsoo5iSuEFm6Fatte6kJ6KlrunflI9hESwsSrrtqF
 lKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9jneiIwhoTeX6/+oub23nloy5lCEM9fcOmaGR+FZzuQ=;
 b=uTBnLhOEPWSYyVbE2hKOcjk73XsgbGjylGTdwj6bYEV2BG/ACrOTI3dCfWmS0BODFe
 D7X9ag1KnfeURF+TpzGGudtMkON3RJP58yVduHlBC67+5YtyrjiPixIhBPI6UGTpGmzV
 lJ1QFyHZfHOjsEXptkKp+LMEY7XfMzOJP4e1Va1kHwAD/VGMomN6IlM71lyM58Q3sG+3
 UxPkh+WiZTTZxQzGv4E5l8dwPBH3oP9g4GBJpkFiThvw7R3U3zLeIaRDlTOZVaD399+R
 jyqozwwBFF/kkoo8yPRYLEaoTEigLclrJnaZdyOZEs8JBA74Tr5G1LPyNkAjvzyJAALQ
 0n8A==
X-Gm-Message-State: AOAM532KB+tlU4rjho/81qFbPANPrDkp52BzczCiAh0RicWgoI07+3TT
 tA8gk1wAVazQUgRp3MTwc7ahxDSMug8d4Y6OoZpkhA==
X-Google-Smtp-Source: ABdhPJwDORogO1WFt2x81Zb6ZMcF+AGvh9D4jM0Bn9dfTEjME8ZsO1znUus+MzGiFrlhO1QElJ13xWV61TV6zvjE0M4=
X-Received: by 2002:ac2:44c1:: with SMTP id d1mr1384141lfm.37.1591159763530;
 Tue, 02 Jun 2020 21:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=WZwUx0SKO96g6vqh3qgwq5xeaAOoT-Qgx3JnEB3c1AkQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WZwUx0SKO96g6vqh3qgwq5xeaAOoT-Qgx3JnEB3c1AkQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 3 Jun 2020 10:19:11 +0530
Message-ID: <CAFA6WYPfxMtykUES3MqhK++WC7EkfDdQRbMPsoEqPcdx41O6jA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgLLG-0075GB-86
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
> > In kgdb context, calling console handlers aren't safe due to locks used
> > in those handlers which could in turn lead to a deadlock. Although, using
> > oops_in_progress increases the chance to bypass locks in most console
> > handlers but it might not be sufficient enough in case a console uses
> > more locks (VT/TTY is good example).
> >
> > Currently when a driver provides both polling I/O and a console then kdb
> > will output using the console. We can increase robustness by using the
> > currently active polling I/O driver (which should be lockless) instead
> > of the corresponding console. For several common cases (e.g. an
> > embedded system with a single serial port that is used both for console
> > output and debugger I/O) this will result in no console handler being
> > used.
> >
> > In order to achieve this we need to reverse the order of preference to
> > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > store "struct console" that represents debugger I/O in dbg_io_ops and
> > while emitting kdb messages, skip console that matches dbg_io_ops
> > console in order to avoid duplicate messages. After this change,
> > "is_console" param becomes redundant and hence removed.
> >
> > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tty/serial/kgdb_nmi.c | 2 +-
> >  drivers/tty/serial/kgdboc.c   | 4 ++--
>
> I don't think this will compile against the "kgdboc_earlycon" patches
> that landed, will it?  Specifically when I apply your patch I still
> see "is_console" in:

Agree will fix this and rebase this patch-set onto Daniel's tree.

>
> static struct kgdb_io kgdboc_earlycon_io_ops = {
>   .name = "kgdboc_earlycon",
>   .read_char = kgdboc_earlycon_get_char,
>   .write_char = kgdboc_earlycon_put_char,
>   .pre_exception = kgdboc_earlycon_pre_exp_handler,
>   .deinit = kgdboc_earlycon_deinit,
>   .is_console = true,
> };
>
>
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index b072aeb..bc0face3 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -273,8 +273,7 @@ struct kgdb_arch {
> >   * the I/O driver.
> >   * @post_exception: Pointer to a function that will do any cleanup work
> >   * for the I/O driver.
> > - * @is_console: 1 if the end device is a console 0 if the I/O device is
> > - * not a console
> > + * @cons: valid if the I/O device is a console.
>
> optional nit: add "; else NULL"
>

Okay.

>
> Other than that this looks great.  Feel free to add my Reviewed-by:
> tag once you've fixed the error that the bot found and resolved with
> kgdb_earlycon.
>

Thanks.

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
