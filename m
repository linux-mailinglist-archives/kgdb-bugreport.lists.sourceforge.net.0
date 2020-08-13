Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A242438A7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Aug 2020 12:34:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6AZQ-0001nI-WD
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Aug 2020 10:34:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k6AZP-0001n6-TS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 10:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7NGtWJGPcgd1VIjYzHJj4Y2SVsXKakJeWwxu/26ONf4=; b=j4gpGopek0LzJaueJ6aQ3lp1kQ
 8BGhj1mVapi2XK80wfO4kb9G6xF7/HJJm2wDzxjSPWKyxXZgGOWvAeHWJLLraPc7ssWATYS38OMlq
 IIHUDYi3arZcqHa3bV5S2QnaJx+9vJHK9ixdcAOOGacEFS9tpkk9XzSJG1HW1hbdtggY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7NGtWJGPcgd1VIjYzHJj4Y2SVsXKakJeWwxu/26ONf4=; b=gRlsmse+b7aTLLxa1swLrQoTdK
 rUVs7/1tjppJIbR/sb54+5/KeYZcqbLc0Eif9+ixpqaBDNVsKW+nvjTjSngO8yeuTLU6peNc7ooym
 xV/jNABMSPXBuHqBnJicoGX/EAMABHdhpsTNNqZNmYpw2yUcohvfhPdXrmL3hcM2HNjQ=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6AZN-00C25x-Ap
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 10:34:51 +0000
Received: by mail-lj1-f194.google.com with SMTP id w14so5619613ljj.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Aug 2020 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7NGtWJGPcgd1VIjYzHJj4Y2SVsXKakJeWwxu/26ONf4=;
 b=q54Un1IAB7Vpqog5Evk/Q/yAaIJZ2vqhPucK0NkLViQz7ZsRcpiLsbfC14FaEuPSgK
 sCHlL8Ymdc/DGXbw7NHFgNb4xm3cuBH27DWCPZVKmOeBNmjWdfDPSz7E/hl2ddKztbAO
 N/j99YGMOsDgMFmcQC73Qk2OEfGQbLvyJwHWldJPaDiAruzBGcY2q19NpFq2eZclKHVZ
 V4e1A8ONVTvpaOGaSHIB8SJgtPdcMJzSj+GH6sXp6XcG48Hm7Z0m92ELlHs456FyhFmo
 abM8nKtML2in5zKDNcIK6lEH42U8ns/W/wCsx7eJYgrhR0gxWAXHeERdmESo3FyhtFbM
 G4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7NGtWJGPcgd1VIjYzHJj4Y2SVsXKakJeWwxu/26ONf4=;
 b=l86h45GKkPA1hwqemtEEsj3LElwurS9o/37bjFtqaJQSCJmMfX8yMnb5mN28QfY7Dz
 go+mPeylKyyg4iUXEE4wqQdxMnFt+I37lt0BW3Sk8h/TYJkORXYrP7307D5C2qlKPTBR
 Hla8aj/xzUXtU53AElPCmZ+NV5hBZxfb6jykzxe3upqIjwo7m2UJhlojN+Oc1h5jidXD
 I9DETzfZsmAhovRjfwlMMJfO6JcklH2T89EsKyDQmceCddPHVl7myJQEE00fz54GD8ND
 KuDvNnwfznEyvgTPAJSILuIK9mo04KaKw99lfHJK9dy3hcxBxdNvvBFKq+T84afHIRr4
 4F8g==
X-Gm-Message-State: AOAM533+XXS37HpSZKqOF6H5CATo4HaUUIoO8DsNFFKvF5AT4Qo9AWKp
 /iNQOC6t5qV+ywLG73m7iudVHDbslNOGGgcmI+ANWQ==
X-Google-Smtp-Source: ABdhPJxliViaJ8ARbskn0LgtD6gLl3MGGsEBpe6Tm7eu7a0g2grnBoK7It5YLUNgrWdX140BkBcfuqtG1PTcH3+MSxs=
X-Received: by 2002:a05:651c:1293:: with SMTP id
 19mr1625745ljc.427.1597314882606; 
 Thu, 13 Aug 2020 03:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-5-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XjKgbT0df-4AKo7B4Mgn2+oiOtVe3_umQH2FWTMTjsGg@mail.gmail.com>
In-Reply-To: <CAD=FV=XjKgbT0df-4AKo7B4Mgn2+oiOtVe3_umQH2FWTMTjsGg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 13 Aug 2020 16:04:31 +0530
Message-ID: <CAFA6WYNcpce0D5SS1WEGzo0OyMq+qKrJtB_CKHAwRGZBO_paCA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k6AZN-00C25x-Ap
Subject: Re: [Kgdb-bugreport] [RFC 4/5] serial: amba-pl011: Enable NMI aware
 uart port
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 13 Aug 2020 at 05:29, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 21, 2020 at 5:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Allow serial device interrupt to be requested as an NMI during
> > initialization in polling mode. If the irqchip doesn't support serial
> > device interrupt as an NMI then fallback to it being as a normal IRQ.
> >
> > Currently this NMI aware uart port only supports NMI driven programmed
> > IO operation whereas DMA operation isn't supported.
> >
> > And while operating in NMI mode, RX always remains active irrespective
> > of whether corresponding TTY port is active or not. So we directly bail
> > out of startup, shutdown and rx_stop APIs if NMI mode is active.
> >
> > Also, get rid of modification to interrupts enable mask in pl011_hwinit()
> > as now we have a proper way to enable interrupts for NMI entry using
> > pl011_enable_interrupts().
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tty/serial/amba-pl011.c | 124 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 113 insertions(+), 11 deletions(-)
>
> Overall: I ran out of time to do a super full review, but presumably
> you're going to spin this series anyway and I'll look at it again
> then.  For now a few things I noticed below...
>

Sure and thanks for your review.

>
> > diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> > index 0983c5e..5df1c07 100644
> > --- a/drivers/tty/serial/amba-pl011.c
> > +++ b/drivers/tty/serial/amba-pl011.c
> > @@ -41,6 +41,8 @@
> >  #include <linux/sizes.h>
> >  #include <linux/io.h>
> >  #include <linux/acpi.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdesc.h>
> >
> >  #include "amba-pl011.h"
> >
> > @@ -347,6 +349,10 @@ static int pl011_fifo_to_tty(struct uart_amba_port *uap)
> >                 if (uart_handle_sysrq_char(&uap->port, ch & 255))
> >                         continue;
> >
> > +               if (uart_nmi_handle_char(&uap->port, ch, UART011_DR_OE, ch,
> > +                                        flag))
> > +                       continue;
> > +
> >                 uart_insert_char(&uap->port, ch, UART011_DR_OE, ch, flag);
> >         }
> >
> > @@ -1316,6 +1322,9 @@ static void pl011_stop_rx(struct uart_port *port)
> >         struct uart_amba_port *uap =
> >             container_of(port, struct uart_amba_port, port);
> >
> > +       if (uart_nmi_active(port))
> > +               return;
> > +
> >         uap->im &= ~(UART011_RXIM|UART011_RTIM|UART011_FEIM|
> >                      UART011_PEIM|UART011_BEIM|UART011_OEIM);
> >         pl011_write(uap->im, uap, REG_IMSC);
> > @@ -1604,13 +1613,6 @@ static int pl011_hwinit(struct uart_port *port)
> >                     UART011_FEIS | UART011_RTIS | UART011_RXIS,
> >                     uap, REG_ICR);
> >
> > -       /*
> > -        * Save interrupts enable mask, and enable RX interrupts in case if
> > -        * the interrupt is used for NMI entry.
> > -        */
> > -       uap->im = pl011_read(uap, REG_IMSC);
> > -       pl011_write(UART011_RTIM | UART011_RXIM, uap, REG_IMSC);
> > -
> >         if (dev_get_platdata(uap->port.dev)) {
> >                 struct amba_pl011_data *plat;
> >
> > @@ -1711,6 +1713,96 @@ static void pl011_put_poll_char(struct uart_port *port,
> >         pl011_write(ch, uap, REG_DR);
> >  }
> >
> > +static irqreturn_t pl011_nmi_int(int irq, void *dev_id)
> > +{
>
> I wish there was a better way to share code between this and
> pl011_int(), but I guess it'd be too ugly?  If nothing else it feels
> like you should do something to make it more obvious to anyone looking
> at them that they are sister functions and any change to one of them
> should be reflected in the other.  Maybe they should be logically next
> to each other?
>

Yes, I can make them sit logically next to each other.

>
> > +       struct uart_amba_port *uap = dev_id;
> > +       unsigned int status, pass_counter = AMBA_ISR_PASS_LIMIT;
> > +       int handled = 0;
> > +
> > +       status = pl011_read(uap, REG_MIS);
> > +       if (status) {
> > +               do {
> > +                       check_apply_cts_event_workaround(uap);
> > +
> > +                       pl011_write(status, uap, REG_ICR);
> > +
> > +                       if (status & (UART011_RTIS|UART011_RXIS)) {
> > +                               pl011_fifo_to_tty(uap);
> > +                               irq_work_queue(&uap->port.nmi_state.rx_work);
>
> It feels like it might be beneficial to not call irq_work_queue() in a
> loop.  It doesn't hurt but it feels like, at least, it's going to keep
> doing a bunch of atomic operations.  It's not like it'll cause the
> work to run any sooner because it has to run on the same CPU, right?
>

AFAIK, the loop here is about checking interrupt status if another
interrupt is raised while we are servicing the prior one. But I think
it would be an unlikely case here as we defer actual work and given
the slow serial transfer rate.

>
> > +                       }
> > +
> > +                       if (status & UART011_TXIS)
> > +                               irq_work_queue(&uap->port.nmi_state.tx_work);
>
> Here too...
>

Ditto.

>
> > +
> > +                       if (pass_counter-- == 0)
> > +                               break;
> > +
> > +                       status = pl011_read(uap, REG_MIS);
> > +               } while (status != 0);
> > +               handled = 1;
> > +       }
> > +
> > +       return IRQ_RETVAL(handled);
> > +}
> > +
> > +static int pl011_allocate_nmi(struct uart_amba_port *uap)
> > +{
> > +       int ret;
> > +
> > +       irq_set_status_flags(uap->port.irq, IRQ_NOAUTOEN);
> > +       ret = request_nmi(uap->port.irq, pl011_nmi_int, IRQF_PERCPU,
> > +                         "uart-pl011", uap);
> > +       if (ret) {
> > +               irq_clear_status_flags(uap->port.irq, IRQ_NOAUTOEN);
> > +               return ret;
> > +       }
> > +
> > +       enable_irq(uap->port.irq);
> > +
> > +       return ret;
> > +}
> > +
> > +static void pl011_tx_irq_callback(struct uart_port *port)
> > +{
> > +       struct uart_amba_port *uap =
> > +           container_of(port, struct uart_amba_port, port);
> > +
> > +       spin_lock(&port->lock);
> > +       pl011_tx_chars(uap, true);
> > +       spin_unlock(&port->lock);
> > +}
> > +
> > +static int pl011_poll_init(struct uart_port *port)
> > +{
> > +       struct uart_amba_port *uap =
> > +           container_of(port, struct uart_amba_port, port);
> > +       int retval;
> > +
> > +       retval = pl011_hwinit(port);
> > +       if (retval)
> > +               goto clk_dis;
>
> I don't think you want "goto clk_dis" here.
>

Yeah, will fix it to return here instead.

>
> > +
> > +       /* In case NMI isn't supported, fallback to normal interrupt mode */
> > +       retval = pl011_allocate_nmi(uap);
> > +       if (retval)
> > +               return 0;
> > +
> > +       retval = uart_nmi_state_init(port);
> > +       if (retval)
> > +               goto clk_dis;
>
> Wouldn't you also need to to somehow call free_nmi() in the error case?
>

Yes, will fix it.

>
> > +       port->nmi_state.tx_irq_callback = pl011_tx_irq_callback;
> > +       uart_set_nmi_active(port, true);
> > +
> > +       pl011_enable_interrupts(uap);
> > +
> > +       return 0;
> > +
> > + clk_dis:
> > +       clk_disable_unprepare(uap->clk);
> > +       return retval;
> > +}
> > +
> >  #endif /* CONFIG_CONSOLE_POLL */
> >
> >  static bool pl011_split_lcrh(const struct uart_amba_port *uap)
> > @@ -1736,8 +1828,6 @@ static void pl011_write_lcr_h(struct uart_amba_port *uap, unsigned int lcr_h)
> >
> >  static int pl011_allocate_irq(struct uart_amba_port *uap)
> >  {
> > -       pl011_write(uap->im, uap, REG_IMSC);
> > -
> >         return request_irq(uap->port.irq, pl011_int, IRQF_SHARED, "uart-pl011", uap);
> >  }
> >
> > @@ -1748,6 +1838,9 @@ static int pl011_startup(struct uart_port *port)
> >         unsigned int cr;
> >         int retval;
> >
> > +       if (uart_nmi_active(port))
> > +               return 0;
> > +
> >         retval = pl011_hwinit(port);
> >         if (retval)
> >                 goto clk_dis;
> > @@ -1790,6 +1883,9 @@ static int sbsa_uart_startup(struct uart_port *port)
> >                 container_of(port, struct uart_amba_port, port);
> >         int retval;
> >
> > +       if (uart_nmi_active(port))
> > +               return 0;
> > +
> >         retval = pl011_hwinit(port);
> >         if (retval)
> >                 return retval;
> > @@ -1859,6 +1955,9 @@ static void pl011_shutdown(struct uart_port *port)
> >         struct uart_amba_port *uap =
> >                 container_of(port, struct uart_amba_port, port);
> >
> > +       if (uart_nmi_active(port))
> > +               return;
> > +
> >         pl011_disable_interrupts(uap);
> >
> >         pl011_dma_shutdown(uap);
> > @@ -1891,6 +1990,9 @@ static void sbsa_uart_shutdown(struct uart_port *port)
> >         struct uart_amba_port *uap =
> >                 container_of(port, struct uart_amba_port, port);
> >
> > +       if (uart_nmi_active(port))
> > +               return;
> > +
> >         pl011_disable_interrupts(uap);
> >
> >         free_irq(uap->port.irq, uap);
> > @@ -2142,7 +2244,7 @@ static const struct uart_ops amba_pl011_pops = {
> >         .config_port    = pl011_config_port,
> >         .verify_port    = pl011_verify_port,
> >  #ifdef CONFIG_CONSOLE_POLL
> > -       .poll_init     = pl011_hwinit,
> > +       .poll_init     = pl011_poll_init,
>
> Do we need to add a "free" at this point?
>

Where do you envision its usage? As currently if we enable NMI once,
we would like it to be active throughout a boot cycle.

-Sumit

>
>
> >         .poll_get_char = pl011_get_poll_char,
> >         .poll_put_char = pl011_put_poll_char,
> >  #endif
> > @@ -2173,7 +2275,7 @@ static const struct uart_ops sbsa_uart_pops = {
> >         .config_port    = pl011_config_port,
> >         .verify_port    = pl011_verify_port,
> >  #ifdef CONFIG_CONSOLE_POLL
> > -       .poll_init     = pl011_hwinit,
> > +       .poll_init     = pl011_poll_init,
> >         .poll_get_char = pl011_get_poll_char,
> >         .poll_put_char = pl011_put_poll_char,
> >  #endif
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
