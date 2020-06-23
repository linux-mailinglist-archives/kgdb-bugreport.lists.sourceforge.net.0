Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5381204F9A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Jun 2020 12:52:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jngXM-0000aC-Et
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Jun 2020 10:52:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jngXK-0000a3-VS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 10:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBzPbPycPoCqD0jxPC/ZRazkaIKgNXR6qz1TtThkFUU=; b=ae7/KON2MXsfEf3myt0/H4bQio
 cnUIldrXz5FfEoqqPUUSdISavBDpihBZWgKMvc1EroeHXvsO53UgsDG11dgsMeBXbYisgCmeIeQDY
 A9cuC41ji5WTPyoFQYWSBKw9Jvxhb5SAheha+yF71WUfomjDV/Mt4bOSJHz7KPzpdnTY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBzPbPycPoCqD0jxPC/ZRazkaIKgNXR6qz1TtThkFUU=; b=dMLt+oICZa1wIYiNRtV1a3pVVs
 ps6GHI+uUcYBRssz15xc5dPaikfKWpM+G/si0BrqMumIG0gZeXF+HIDNG9ffjn2X1uNvevJLpP9W1
 4phi8ZSZw/FjCXn+Y2PtFAWzX11AKfixIQtvudjD2awzGc8bgeWq2IRRu/l/esntwecY=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jngXF-00FtN6-RC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 10:52:18 +0000
Received: by mail-wr1-f68.google.com with SMTP id z13so8255666wrw.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Jun 2020 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dBzPbPycPoCqD0jxPC/ZRazkaIKgNXR6qz1TtThkFUU=;
 b=hVTKgZRYdrZf8D1hqAyqe0LNbpXqLr2qkyQuORdV5ZQF1n8hpcd2PdufDsxy2KZshW
 f3xFNx1WZb2U5LWD+NgGoZ7RarxK1BfT88GLA/1YuWUZ3l3UTlZO4jGaPBsRqOjOc9R4
 Gz86QuEbWGVO12QL7IcTOXHrAyOjMblCv6w1ADGv4nXP3YZwJVoeFu+dLUbQWZF5KzWn
 e8ajLS9iSB76QXQOfuZlpGZROIkNwTDFhhRsOc/OKvkydOic3Oo/md3dFvCPS5eX6T7Z
 4XuA5j6ku24jRQSOB5wf2TI8xKo1W911B7qq2Y4IPNu7Br70etSZO121Jms9Lll2HL0K
 srEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dBzPbPycPoCqD0jxPC/ZRazkaIKgNXR6qz1TtThkFUU=;
 b=nQP3WynHEZQBLb3iyi4JWgKSKmBcT1FlwhnolU3cMkHvrtdZU9MHSLF+vANF2DL+sn
 tKmmSlORnI/2eRCGPc6jrItkzz4WgkinPdYh1RKDZZ4MQdCQoqYawA+ubrdzH+8+DVaF
 31hR18YOS89cn/69Z8pCNAWhoAismuN+DF+dYxIS6dKEmnrwo+I05MjXXK6wlkeJDDx7
 T+KA0Tw/5DXdMqZpTLv7RZuIbEC45GJofAC9Hxrb3u0i5nsbElz9Kyz4mgXn7G/e5C9p
 V8LHog4m4O+LVZJ8yYdct0W9JpBLfS/0Qb7NPR+9DCbTn9wntjNhu9LJ9lAysUESguhY
 lcIg==
X-Gm-Message-State: AOAM5321V7dgsOs49P/dUlVjQMu4JzmqfvYWUjWyX3/gJweA3CbdAapA
 +g8mzLgUMiM+2wbi1T28g9EWeQ==
X-Google-Smtp-Source: ABdhPJxLAPHsxecFBVI1/3n+UdvZKrmvDn4Mcf8d7zg0Xtlmk9Z6ZJ4YUJm4LoASAqM0Kz5pD+MAXA==
X-Received: by 2002:adf:dc42:: with SMTP id m2mr26010430wrj.342.1592909527428; 
 Tue, 23 Jun 2020 03:52:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c66sm3471923wma.20.2020.06.23.03.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 03:52:06 -0700 (PDT)
Date: Tue, 23 Jun 2020 11:52:04 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200623105204.mj4eax7wq7om4jka@holly.lan>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-3-git-send-email-sumit.garg@linaro.org>
 <20200622155624.he2vs2r3e5yzf3sl@holly.lan>
 <CAFA6WYPEbLVRSHC0QFcWusUrakmxuEjBMYJQb41htbALeTQRPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPEbLVRSHC0QFcWusUrakmxuEjBMYJQb41htbALeTQRPg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jngXF-00FtN6-RC
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

On Tue, Jun 23, 2020 at 01:18:25PM +0530, Sumit Garg wrote:
> On Mon, 22 Jun 2020 at 21:26, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Mon, Jun 22, 2020 at 07:56:19PM +0530, Sumit Garg wrote:
> > > From: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > Sumit, to some extent this mail is me yelling at myself two years ago
> > although, in my defence, at the time I choose not to post it because I
> > knew it wasn't right.
> >
> > I'm a bit concerned to see the TODO: comment critiquing this interface
> > being removed (from patch 3) without this patch being changed to
> > address that comment.
> >
> 
> I did consider that comment but I couldn't think of a normal scenario
> where request_irq() should fail. And in case it fails as well, I did
> put in "WARN_ON(res);" so that the user is notified of that particular
> error scenario.
> 
> >
> > > Add new API: poll_get_irq() to the polling interface in order for user
> > > of polling interface to retrieve allocated IRQ corresponding to
> > > underlying serial device.
> > >
> > > Although, serial interface still works in polling mode but interrupt
> > > associated with serial device can be leveraged for special purposes like
> > > debugger(kgdb) entry.
> > >
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  drivers/tty/serial/serial_core.c | 18 ++++++++++++++++++
> > >  include/linux/serial_core.h      |  1 +
> > >  include/linux/tty_driver.h       |  1 +
> > >  3 files changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> > > index 66a5e2f..1bb033c 100644
> > > --- a/drivers/tty/serial/serial_core.c
> > > +++ b/drivers/tty/serial/serial_core.c
> > > @@ -2470,6 +2470,23 @@ static void uart_poll_put_char(struct tty_driver *driver, int line, char ch)
> > >       port->ops->poll_put_char(port, ch);
> > >       uart_port_deref(port);
> > >  }
> > > +
> > > +static int uart_poll_get_irq(struct tty_driver *driver, int line)
> > > +{
> > > +     struct uart_driver *drv = driver->driver_state;
> > > +     struct uart_state *state = drv->state + line;
> > > +     struct uart_port *port;
> > > +     int ret = -ENODEV;
> > > +
> > > +     port = uart_port_ref(state);
> > > +     if (port && port->ops->poll_get_irq) {
> > > +             ret = port->ops->poll_get_irq(port);
> > > +             uart_port_deref(port);
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >  #endif
> > >
> > >  static const struct tty_operations uart_ops = {
> > > @@ -2505,6 +2522,7 @@ static const struct tty_operations uart_ops = {
> > >       .poll_init      = uart_poll_init,
> > >       .poll_get_char  = uart_poll_get_char,
> > >       .poll_put_char  = uart_poll_put_char,
> > > +     .poll_get_irq   = uart_poll_get_irq,
> >
> > The TODO comments claimed this API was bogus because it doesn't permit
> > a free and that can cause interoperation problems with the real serial
> > driver. I'll cover some of that in a reply to patch 3 but for now.
> >
> > Anyhow, for this patch, what are the expected semantics for
> > uart_poll_get_irq().
> 
> Currently, the expected use for this API is to enable uart RX
> interrupts and return corresponding IRQ id.
> 
> Although, we can make this interface modular as follows:
> 
> .poll_get_irq
> .poll_enable_rx_int
> .poll_disable_rx_int
> 
> Your views?

A direct reply is to ask what the purpose of poll_enable_rx_int()
is? It appears to be making something modular without any reason to do
so.

More generally lets ask some more questions:

1. What serial hardware and/or driver state change happens when we call
   poll_get_irq()

2. After a call to poll_get_irq() are there any new restrictions on
   the underlying serial driver?

3. Does implementing poll_get_irq() create an implied change of
   contract to any other polling function (I think yes, because
   poll_read_char() will now have to acknowledge an interrupt if
   the interrupt flags are edge triggered)?

4. To what extent, if any, do we have to support disconnection of
   kgdb_nmi?

5. Is the API matched with how it will be used by the layers above?
   (top level uses a request_irq approach, low level is using a
   let me have the irq number approach)

An interesting idea to explore is using a different verb for
poll_get_irq(). Perhaps poll_borrow_irq()? It is now much clearer that
we are stealing the IRQ and making it unusable by the underlying serial
driver.


> > In particular how do they ensure correct interlocking with the real
> > serial driver underlying it (if kgdb_nmi is active on a serial port
> > then the underlying driver better not be active at the same time).
> >
> 
> AFAIU kgdb_nmi feature, it registers a new tty driver (ttyNMI0) which
> is expected to work alongside underlying tty driver (eg. ttyAMA0 with
> amba-pl011). So ttyAMA0 will only become active if user-space tries to
> interact with /dev/ttyAMA0 like:
> 
> # echo "Hello World!" > /dev/ttyAMA0
> 
> So I would like to understand the downsides of having both of them
> active at the same time using shared IRQ (although that won't be
> possible with NMI as that doesn't support shared mode)?

It is likely that one of the interrupt handlers will become unreachable
since the first handler to execute will clear the interrupt flags. This
will result in anything waiting for the broken driver getting stuck and
not reporting an error code.

That isn't acceptable.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
