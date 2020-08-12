Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17710243195
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Aug 2020 01:59:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k60ey-0006aN-Sw
	for lists+kgdb-bugreport@lfdr.de; Wed, 12 Aug 2020 23:59:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k60ex-0006aE-Us
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 23:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HkhzGPTFs+cac0M1GsyIfO4qoWfrJUKbKZsDfMHWaAg=; b=AUDDHWfjfOGCde4e+4q7/u7dGI
 N2Wbzi03G3xZIoLtMcKnQQ3NY1XjipICKSmE/SIsiHU3H5hNwssn/tAEMXrwpOnoMov3+0HIczSVw
 9pdPQ6iSisYdEm2qfyiccbboUS0uDa4q8BMzQEyUBpbcH14LVXXCFOoaXS4rslBWh+jo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HkhzGPTFs+cac0M1GsyIfO4qoWfrJUKbKZsDfMHWaAg=; b=G4frpm04mXWXAGlNtDf7wOrB5Y
 vvZPB0UnmakgnYKOlQxio+EgKH0sU++vISTEO/RJC5UG6ZObzmhR2lyA2JVB4MJwXSt6KvdIJBjo8
 zcahNlN8LpAxuWU64voHZC0LO2zzlY4r/i1SRmGrjsc/U+nhBmYR1nGCVYwqloZnnKG0=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k60ew-008WBi-3Q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 23:59:55 +0000
Received: by mail-ua1-f67.google.com with SMTP id z12so1122871uam.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HkhzGPTFs+cac0M1GsyIfO4qoWfrJUKbKZsDfMHWaAg=;
 b=HFkzTwNacjMvOvgx22Z3SG8a6pDXPQ+p9Z6vB8BMDuAuTtWaCiM8aYdJxMIuZeRmbO
 45cxZTBoq3sVtBgHK8iPHQYje/WU0QiZt/AseLymk+FGgtaJFeJMA/jXvbUVcH4VnaAI
 9x5KXG/OaT2CkwffRwz7Xb5RmKH+Bk1BlH9R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HkhzGPTFs+cac0M1GsyIfO4qoWfrJUKbKZsDfMHWaAg=;
 b=Wz8F6V+0pP+BwsArE5m6Dt2O9/hcxLQ6zdx/NqfHBz9vDIA+wSwmP/ESCkXqahHhKe
 494dYpoK+nAFUyR8NeZDqnAqHvaxPN3u0AkRS/kQ9N21l7YZO9yUYgOvPtAoRQnDJTLO
 8xjfx81Wp2U+kU3HnyXVmI0D8e9RsicJdy2u9QDo+sUvS+WZwAtWScpRjRdbC/elCeHV
 hjctGQGSYqb2Jx2gM4aTCpi0rkrnLYgoT2M4faeLRhnadypYdoWqlyMrLkfbRe2EMYal
 hwGj3v4C6r8i9ewzuV8VnUQlPwIUwNQBiEtU12HtkbxcqidEe2cbFVhpku6JMgjSnQMm
 u7Hw==
X-Gm-Message-State: AOAM531fSRnBCezM4HC9soceR7AOv7xfTIoaLEwEpf2F7xub4vlgHznb
 3OoW1SekjCYwA6oYojc7JQIGCo6LNb0=
X-Google-Smtp-Source: ABdhPJw3PJWBnq+S9dub6OZIAwIyYMBjr3aiZxjssiPEVKoF1yoKsUcBa/BTZfh2FqTRyL0O0tAZAg==
X-Received: by 2002:ab0:6f8b:: with SMTP id f11mr1404021uav.45.1597276787780; 
 Wed, 12 Aug 2020 16:59:47 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id s144sm541860vkd.25.2020.08.12.16.59.46
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 16:59:47 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 186so900121vkx.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 16:59:46 -0700 (PDT)
X-Received: by 2002:a1f:ae42:: with SMTP id x63mr1608058vke.100.1597276786166; 
 Wed, 12 Aug 2020 16:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Aug 2020 16:59:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
Message-ID: <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k60ew-008WBi-3Q
Subject: Re: [Kgdb-bugreport] [RFC 2/5] serial: core: Add framework to allow
 NMI aware serial drivers
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

Hi,

On Tue, Jul 21, 2020 at 5:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Add NMI framework APIs in serial core which can be leveraged by serial
> drivers to have NMI driven serial transfers. These APIs are kept under
> CONFIG_CONSOLE_POLL as currently kgdb initializing uart in polling mode
> is the only known user to enable NMI driven serial port.
>
> The general idea is to intercept RX characters in NMI context, if those
> are specific to magic sysrq then allow corresponding handler to run in
> NMI context. Otherwise defer all other RX and TX operations to IRQ work
> queue in order to run those in normal interrupt context.
>
> Also, since magic sysrq entry APIs will need to be invoked from NMI
> context, so make those APIs NMI safe via deferring NMI unsafe work to
> IRQ work queue.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/serial_core.c | 120 ++++++++++++++++++++++++++++++++++++++-
>  include/linux/serial_core.h      |  67 ++++++++++++++++++++++
>  2 files changed, 185 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 57840cf..6342e90 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -3181,8 +3181,14 @@ static bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)
>                 return true;
>         }
>
> +#ifdef CONFIG_CONSOLE_POLL
> +       if (in_nmi())
> +               irq_work_queue(&port->nmi_state.sysrq_toggle_work);
> +       else
> +               schedule_work(&sysrq_enable_work);
> +#else
>         schedule_work(&sysrq_enable_work);
> -
> +#endif

It should be a very high bar to have #ifdefs inside functions.  I
don't think this meets it.  Instead maybe something like this
(untested and maybe slightly wrong syntax, but hopefully makes
sense?):

Outside the function:

#ifdef CONFIG_CONSOLE_POLL
#define queue_port_nmi_work(port, work_type)
irq_work_queue(&port->nmi_state.work_type)
#else
#define queue_port_nmi_work(port, work_type)
#endif

...and then:

if (IS_ENABLED(CONFIG_CONSOLE_POLL) && in_nmi())
  queue_port_nmi_work(port, sysrq_toggle_work);
else
  schedule_work(&sysrq_enable_work);

---

The whole double-hopping is really quite annoying.  I guess
schedule_work() can't be called from NMI context but can be called
from IRQ context?  So you need to first transition from NMI context to
IRQ context and then go and schedule the work?  Almost feels like we
should just fix schedule_work() to do this double-hop for you if
called from NMI context.  Seems like you could even re-use the list
pointers in the work_struct to keep the queue of people who need to be
scheduled from the next irq_work?  Worst case it seems like you could
add a schedule_work_nmi() that would do all the hoops for you.  ...but
I also know very little about NMI so maybe I'm being naive.


>         port->sysrq = 0;
>         return true;
>  }
> @@ -3273,12 +3279,122 @@ int uart_handle_break(struct uart_port *port)
>                 port->sysrq = 0;
>         }
>
> -       if (port->flags & UPF_SAK)
> +       if (port->flags & UPF_SAK) {
> +#ifdef CONFIG_CONSOLE_POLL
> +               if (in_nmi())
> +                       irq_work_queue(&port->nmi_state.sysrq_sak_work);
> +               else
> +                       do_SAK(state->port.tty);
> +#else
>                 do_SAK(state->port.tty);
> +#endif
> +       }

Similar comment as above about avoiding #ifdef in functions.  NOTE: if
you have something like schedule_work_nmi() I think you could just
modify the do_SAK() function to call it and consider do_SAK() to be
NMI safe.


>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(uart_handle_break);
>
> +#ifdef CONFIG_CONSOLE_POLL
> +int uart_nmi_handle_char(struct uart_port *port, unsigned int status,
> +                        unsigned int overrun, unsigned int ch,
> +                        unsigned int flag)
> +{
> +       struct uart_nmi_rx_data rx_data;
> +
> +       if (!in_nmi())
> +               return 0;
> +
> +       rx_data.status = status;
> +       rx_data.overrun = overrun;
> +       rx_data.ch = ch;
> +       rx_data.flag = flag;
> +
> +       if (!kfifo_in(&port->nmi_state.rx_fifo, &rx_data, 1))
> +               ++port->icount.buf_overrun;
> +
> +       return 1;
> +}
> +EXPORT_SYMBOL_GPL(uart_nmi_handle_char);
> +
> +static void uart_nmi_rx_work(struct irq_work *rx_work)
> +{
> +       struct uart_nmi_state *nmi_state =
> +           container_of(rx_work, struct uart_nmi_state, rx_work);
> +       struct uart_port *port =
> +           container_of(nmi_state, struct uart_port, nmi_state);
> +       struct uart_nmi_rx_data rx_data;
> +
> +       /*
> +        * In polling mode, serial device is initialized much prior to
> +        * TTY port becoming active. This scenario is especially useful
> +        * from debugging perspective such that magic sysrq or debugger
> +        * entry would still be possible even when TTY port isn't
> +        * active (consider a boot hang case or if a user hasn't opened
> +        * the serial port). So we discard any other RX data apart from
> +        * magic sysrq commands in case TTY port isn't active.
> +        */
> +       if (!port->state || !tty_port_active(&port->state->port)) {
> +               kfifo_reset(&nmi_state->rx_fifo);
> +               return;
> +       }
> +
> +       spin_lock(&port->lock);
> +       while (kfifo_out(&nmi_state->rx_fifo, &rx_data, 1))
> +               uart_insert_char(port, rx_data.status, rx_data.overrun,
> +                                rx_data.ch, rx_data.flag);
> +       spin_unlock(&port->lock);
> +
> +       tty_flip_buffer_push(&port->state->port);
> +}
> +
> +static void uart_nmi_tx_work(struct irq_work *tx_work)
> +{
> +       struct uart_nmi_state *nmi_state =
> +           container_of(tx_work, struct uart_nmi_state, tx_work);
> +       struct uart_port *port =
> +           container_of(nmi_state, struct uart_port, nmi_state);
> +
> +       spin_lock(&port->lock);
> +       if (nmi_state->tx_irq_callback)
> +               nmi_state->tx_irq_callback(port);
> +       spin_unlock(&port->lock);
> +}
> +
> +static void uart_nmi_sak_work(struct irq_work *work)
> +{
> +       struct uart_nmi_state *nmi_state =
> +           container_of(work, struct uart_nmi_state, sysrq_sak_work);
> +       struct uart_port *port =
> +           container_of(nmi_state, struct uart_port, nmi_state);
> +
> +       do_SAK(port->state->port.tty);
> +}
> +
> +#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
> +static void uart_nmi_toggle_work(struct irq_work *work)
> +{
> +       schedule_work(&sysrq_enable_work);
> +}

Nit: weird that it's called "toggle" work but just wrapps "enable" work.



> +#endif
> +
> +int uart_nmi_state_init(struct uart_port *port)
> +{
> +       int ret;
> +
> +       ret = kfifo_alloc(&port->nmi_state.rx_fifo, 256, GFP_KERNEL);
> +       if (ret)
> +               return ret;
> +
> +       init_irq_work(&port->nmi_state.rx_work, uart_nmi_rx_work);
> +       init_irq_work(&port->nmi_state.tx_work, uart_nmi_tx_work);
> +       init_irq_work(&port->nmi_state.sysrq_sak_work, uart_nmi_sak_work);
> +#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
> +       init_irq_work(&port->nmi_state.sysrq_toggle_work, uart_nmi_toggle_work);
> +#endif
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(uart_nmi_state_init);
> +#endif
> +
>  EXPORT_SYMBOL(uart_write_wakeup);
>  EXPORT_SYMBOL(uart_register_driver);
>  EXPORT_SYMBOL(uart_unregister_driver);
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 9fd550e..84487a9 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -18,6 +18,8 @@
>  #include <linux/tty.h>
>  #include <linux/mutex.h>
>  #include <linux/sysrq.h>
> +#include <linux/irq_work.h>
> +#include <linux/kfifo.h>
>  #include <uapi/linux/serial_core.h>
>
>  #ifdef CONFIG_SERIAL_CORE_CONSOLE
> @@ -103,6 +105,28 @@ struct uart_icount {
>  typedef unsigned int __bitwise upf_t;
>  typedef unsigned int __bitwise upstat_t;
>
> +#ifdef CONFIG_CONSOLE_POLL
> +struct uart_nmi_rx_data {
> +       unsigned int            status;
> +       unsigned int            overrun;
> +       unsigned int            ch;
> +       unsigned int            flag;
> +};
> +
> +struct uart_nmi_state {
> +       bool                    active;
> +
> +       struct irq_work         tx_work;
> +       void                    (*tx_irq_callback)(struct uart_port *port);
> +
> +       struct irq_work         rx_work;
> +       DECLARE_KFIFO_PTR(rx_fifo, struct uart_nmi_rx_data);
> +
> +       struct irq_work         sysrq_sak_work;
> +       struct irq_work         sysrq_toggle_work;
> +};
> +#endif
> +
>  struct uart_port {
>         spinlock_t              lock;                   /* port lock */
>         unsigned long           iobase;                 /* in/out[bwl] */
> @@ -255,6 +279,9 @@ struct uart_port {
>         struct gpio_desc        *rs485_term_gpio;       /* enable RS485 bus termination */
>         struct serial_iso7816   iso7816;
>         void                    *private_data;          /* generic platform data pointer */
> +#ifdef CONFIG_CONSOLE_POLL
> +       struct uart_nmi_state   nmi_state;
> +#endif
>  };
>
>  static inline int serial_port_in(struct uart_port *up, int offset)
> @@ -475,4 +502,44 @@ extern int uart_handle_break(struct uart_port *port);
>                                          !((cflag) & CLOCAL))
>
>  int uart_get_rs485_mode(struct uart_port *port);
> +
> +/*
> + * The following are helper functions for the NMI aware serial drivers.
> + * Currently NMI support is only enabled under polling mode.
> + */
> +
> +#ifdef CONFIG_CONSOLE_POLL
> +int uart_nmi_state_init(struct uart_port *port);
> +int uart_nmi_handle_char(struct uart_port *port, unsigned int status,
> +                        unsigned int overrun, unsigned int ch,
> +                        unsigned int flag);
> +
> +static inline bool uart_nmi_active(struct uart_port *port)
> +{
> +       return port->nmi_state.active;
> +}
> +
> +static inline void uart_set_nmi_active(struct uart_port *port, bool val)
> +{
> +       port->nmi_state.active = val;
> +}
> +#else
> +static inline int uart_nmi_handle_char(struct uart_port *port,
> +                                      unsigned int status,
> +                                      unsigned int overrun,
> +                                      unsigned int ch, unsigned int flag)
> +{
> +       return 0;
> +}
> +
> +static inline bool uart_nmi_active(struct uart_port *port)
> +{
> +       return false;
> +}
> +
> +static inline void uart_set_nmi_active(struct uart_port *port, bool val)
> +{
> +}
> +#endif
> +
>  #endif /* LINUX_SERIAL_CORE_H */
> --
> 2.7.4
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
