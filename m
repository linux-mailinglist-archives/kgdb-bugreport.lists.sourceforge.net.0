Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1D204B89
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Jun 2020 09:48:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jndfm-0008NK-Ap
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Jun 2020 07:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jndfk-0008NC-V7
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 07:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rgZbUCewmd3JpSFrxwjakoIwIqrpt2vAjuWM35Dv1Bk=; b=HjJtd82xE+4Q/2oLjRmHomxdVq
 G6+E/wqi8emBlinbn/Y2ahXYwiOvc+kHqVfELo6dO7Gz2NaUAYnRVp/78NnS91bLSliZq++qRl0jT
 UBX4XHDEj6IqzKHPcr0Y2QFQwnhXvwkWreBx2qmLmYazFdVPTBMq8eO8p0fsxlxvhlX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rgZbUCewmd3JpSFrxwjakoIwIqrpt2vAjuWM35Dv1Bk=; b=GOuvIiTvsm2QMOUCWj1sMHtOx0
 5n+btLazfPdI5eZLJ7tGCzkYwgb/+0OuKdNmr4bv9KgcERCX2H2NvXc7fCUbGyIlcQu6ERWW9gXIy
 JPaql9ruLUpOsLyJxXLXIx55y3IsZGbUfyAgH2tJD4kg0vVNrlklMcsonNjjsW2zmHco=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jndfg-00CjAr-AG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 07:48:48 +0000
Received: by mail-lj1-f196.google.com with SMTP id n24so22247447lji.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Jun 2020 00:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgZbUCewmd3JpSFrxwjakoIwIqrpt2vAjuWM35Dv1Bk=;
 b=I44oZZrXmV9zsIep9z35wn/TfLK8oAFCUs6GPfhkGdU7gZuaQNG9ONyQlpqzqEhD+4
 BJKObFrcqNpCMTIgejakJwOTULOqIcoHVjdEbZPaWC5GBkcAUVO8KO9vXIO4LMEMH8O/
 3TiyvCmKxxQE/6TTM2eT4qHlKaqczdtMCcuYHl8+i64j83hqQOGUCrmRRRq2MKaUUs4/
 oFjgioZIOrNkGX5icvtdDGAURahxgae/fet56fCKX7g6ibosuh5reuQ6LqBd9trq5AeX
 Ukjm7Opyrg9HAskD5QYxEvdR5U4Yxy/vsQv9Sp96gb16+K4RcZBSbUFYiv7M4TRbXS6s
 fCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgZbUCewmd3JpSFrxwjakoIwIqrpt2vAjuWM35Dv1Bk=;
 b=hnS9w91+qP6U6zAzeaXsugQ0NV3LwKVD0fmZ84KRitxreM23A96+Ots2mIhchYybJc
 Mysl6tfDQaM9ioMp5PV4HOhosDs+o1JyVmVWisClogxN6Sb64VQUAXaSyh4mkssGqSEQ
 xfO4NXo9tkUzO8BWHVKyccav+VeLZPsPTkt678bLxpP+a01IAkKro676FFpibdI3dJ1U
 6vxrkgbqxOoxQe3mRkeA6Gxi4UvDVDtSTHeqQDjFDUbBW9rR8MP0s0ByOe2IocCN38Ng
 yjE0MkzAvagJTJvStUp+k+h7ldXgq/ZY8xZfq1HwwuaC2Y/ah6mrbJ8GJG8xKkRS6V2l
 UyUg==
X-Gm-Message-State: AOAM533Wt9jNJsVC9MCfyO6+POwavokos2/p4/0FCxPkr4lEIKoJxKpw
 TSDIL3USa5zid6aSSb59zjjn2IABbMWjnZVilQWlzA==
X-Google-Smtp-Source: ABdhPJywYH0GGUmp/Ab36r+Py4ZhzCxsujeitfB7FAsBiyyA0FHiDT2hxOmOan5kf5RI57LXgURXuQSSAyxjB8A7Wlw=
X-Received: by 2002:a05:651c:1103:: with SMTP id
 d3mr11029863ljo.110.1592898517647; 
 Tue, 23 Jun 2020 00:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-3-git-send-email-sumit.garg@linaro.org>
 <20200622155624.he2vs2r3e5yzf3sl@holly.lan>
In-Reply-To: <20200622155624.he2vs2r3e5yzf3sl@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 13:18:25 +0530
Message-ID: <CAFA6WYPEbLVRSHC0QFcWusUrakmxuEjBMYJQb41htbALeTQRPg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jndfg-00CjAr-AG
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] tty: serial: Add poll_get_irq() to
 the polling interface
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 22 Jun 2020 at 21:26, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jun 22, 2020 at 07:56:19PM +0530, Sumit Garg wrote:
> > From: Daniel Thompson <daniel.thompson@linaro.org>
>
> Sumit, to some extent this mail is me yelling at myself two years ago
> although, in my defence, at the time I choose not to post it because I
> knew it wasn't right.
>
> I'm a bit concerned to see the TODO: comment critiquing this interface
> being removed (from patch 3) without this patch being changed to
> address that comment.
>

I did consider that comment but I couldn't think of a normal scenario
where request_irq() should fail. And in case it fails as well, I did
put in "WARN_ON(res);" so that the user is notified of that particular
error scenario.

>
> > Add new API: poll_get_irq() to the polling interface in order for user
> > of polling interface to retrieve allocated IRQ corresponding to
> > underlying serial device.
> >
> > Although, serial interface still works in polling mode but interrupt
> > associated with serial device can be leveraged for special purposes like
> > debugger(kgdb) entry.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tty/serial/serial_core.c | 18 ++++++++++++++++++
> >  include/linux/serial_core.h      |  1 +
> >  include/linux/tty_driver.h       |  1 +
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> > index 66a5e2f..1bb033c 100644
> > --- a/drivers/tty/serial/serial_core.c
> > +++ b/drivers/tty/serial/serial_core.c
> > @@ -2470,6 +2470,23 @@ static void uart_poll_put_char(struct tty_driver *driver, int line, char ch)
> >       port->ops->poll_put_char(port, ch);
> >       uart_port_deref(port);
> >  }
> > +
> > +static int uart_poll_get_irq(struct tty_driver *driver, int line)
> > +{
> > +     struct uart_driver *drv = driver->driver_state;
> > +     struct uart_state *state = drv->state + line;
> > +     struct uart_port *port;
> > +     int ret = -ENODEV;
> > +
> > +     port = uart_port_ref(state);
> > +     if (port && port->ops->poll_get_irq) {
> > +             ret = port->ops->poll_get_irq(port);
> > +             uart_port_deref(port);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >  #endif
> >
> >  static const struct tty_operations uart_ops = {
> > @@ -2505,6 +2522,7 @@ static const struct tty_operations uart_ops = {
> >       .poll_init      = uart_poll_init,
> >       .poll_get_char  = uart_poll_get_char,
> >       .poll_put_char  = uart_poll_put_char,
> > +     .poll_get_irq   = uart_poll_get_irq,
>
> The TODO comments claimed this API was bogus because it doesn't permit
> a free and that can cause interoperation problems with the real serial
> driver. I'll cover some of that in a reply to patch 3 but for now.
>
> Anyhow, for this patch, what are the expected semantics for
> uart_poll_get_irq().

Currently, the expected use for this API is to enable uart RX
interrupts and return corresponding IRQ id.

Although, we can make this interface modular as follows:

.poll_get_irq
.poll_enable_rx_int
.poll_disable_rx_int

Your views?

>
> In particular how do they ensure correct interlocking with the real
> serial driver underlying it (if kgdb_nmi is active on a serial port
> then the underlying driver better not be active at the same time).
>

AFAIU kgdb_nmi feature, it registers a new tty driver (ttyNMI0) which
is expected to work alongside underlying tty driver (eg. ttyAMA0 with
amba-pl011). So ttyAMA0 will only become active if user-space tries to
interact with /dev/ttyAMA0 like:

# echo "Hello World!" > /dev/ttyAMA0

So I would like to understand the downsides of having both of them
active at the same time using shared IRQ (although that won't be
possible with NMI as that doesn't support shared mode)?

-Sumit

>
> Daniel.
>
>
> >  #endif
> >  };
> >
> > diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> > index 92f5eba..8b132e6 100644
> > --- a/include/linux/serial_core.h
> > +++ b/include/linux/serial_core.h
> > @@ -78,6 +78,7 @@ struct uart_ops {
> >       int             (*poll_init)(struct uart_port *);
> >       void            (*poll_put_char)(struct uart_port *, unsigned char);
> >       int             (*poll_get_char)(struct uart_port *);
> > +     int             (*poll_get_irq)(struct uart_port *);
> >  #endif
> >  };
> >
> > diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
> > index 3584462..d6da5c5 100644
> > --- a/include/linux/tty_driver.h
> > +++ b/include/linux/tty_driver.h
> > @@ -295,6 +295,7 @@ struct tty_operations {
> >       int (*poll_init)(struct tty_driver *driver, int line, char *options);
> >       int (*poll_get_char)(struct tty_driver *driver, int line);
> >       void (*poll_put_char)(struct tty_driver *driver, int line, char ch);
> > +     int (*poll_get_irq)(struct tty_driver *driver, int line);
> >  #endif
> >       int (*proc_show)(struct seq_file *, void *);
> >  } __randomize_layout;
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
