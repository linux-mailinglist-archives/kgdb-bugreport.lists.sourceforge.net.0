Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B592621D38C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Jul 2020 12:08:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1juvOC-0003gB-Hf
	for lists+kgdb-bugreport@lfdr.de; Mon, 13 Jul 2020 10:08:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <evgreen@chromium.org>) id 1jty2Y-00031y-HI
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXuUczWFNlwPKehZIWXn30gRWiLBJgbemeVZ6SnUAcc=; b=gAyUkQvp4n7LIgjpzBGwjCVI4u
 w0s0rgL9oUWzbiBP5oWEZNUOD4lW4eKeIFIVIiO0Rwh2HiFORHqrNEE4c8y0m8+TaB4rhWWaOgRtg
 7wPKD159FKPHXtb7x4f0QZVqfZbR8GM4QgEry4o13/3VtiyEsOVI+Xc/7S/MUbL1P9v4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lXuUczWFNlwPKehZIWXn30gRWiLBJgbemeVZ6SnUAcc=; b=Z5aUO8slqGX3N/aGLDGBHZbLie
 1vmC3DCEWs4o3LD9Pa8nLXSFMFqzpCEDwnArTL+NR5xHz4IR5dbnc5pbjlJFuDbBlN/ZJyltTGWEt
 DT/l36c4tROFQtSxZ5Tp2/aHQaW/W+Ea3hLCbdhqFRuhHKUaMFTyLloiPAUo9lecVvBo=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jty2X-00GPiv-7o
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:46:30 +0000
Received: by mail-lj1-f195.google.com with SMTP id s9so7557627ljm.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 11:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lXuUczWFNlwPKehZIWXn30gRWiLBJgbemeVZ6SnUAcc=;
 b=H+fQVchtOQTAtj7qP/IRP93a2MdhdzCX+kqk9bAncYdhLuiymqoDTbVFJDni8bdQpW
 bnkmCwDyWeEU0Op/y1KIcZ2rsMu0mVcT3G48Ow4qQw8E9PMNaJYfexIG1RlD8Tpvf9VU
 MfU7LXYx4m5hygDtLlzwEm+bMw8uFlgaP7fOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXuUczWFNlwPKehZIWXn30gRWiLBJgbemeVZ6SnUAcc=;
 b=M3su99+EgC2WTU2CNfD0ltLCBLFplnV6WQxEFiOslFIiW7Lke25ntZe7OLKh4ZsBYM
 h1CStx6ecm74yncxzCgiRwPSQt9vkgW69n/m+5mWs6lnioHmHM9OAkxZEFgLO6zTzg0/
 HAX8nm+PswX4VD8wSnxAiBBKbkijNRZMmkfhdE8WAgFxLeukYQE8SLtfEEyvus4omQMv
 iMyy7trAmiwS8GvBS4AlhTEu2dWYcKXrdr0fo6ewnOVXKZEo9aON3ScGwXLOpgyRlgxf
 M5UA4G//co9HlO+zsbjErekfkJEi6d/NEnCihg3zFdB/rQqJDL4w6blSeVPUtzvmkVFm
 7gXg==
X-Gm-Message-State: AOAM530cLIQlikhcGm5ye4uE5pmFz3wjbnSSThIdDj7XxMItv2R+iNMc
 R4ArQqdj3nRc6kjzgmboRoyal/X/aP4=
X-Google-Smtp-Source: ABdhPJzSGU/ts5XEOBcxXYC8xlaaNgRzjFLUf6liFIwFssE7HLehpaTy9uadsmNJwjP3SAGLIjXPVg==
X-Received: by 2002:a05:651c:339:: with SMTP id
 b25mr40488362ljp.456.1594402767917; 
 Fri, 10 Jul 2020 10:39:27 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id x11sm2390194lfq.23.2020.07.10.10.39.26
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:39:26 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id h19so7341544ljg.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 10:39:26 -0700 (PDT)
X-Received: by 2002:a2e:b0ed:: with SMTP id h13mr30489580ljl.250.1594402765997; 
 Fri, 10 Jul 2020 10:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.1.I8546ecb6c5beb054f70c5302d1a7293484212cd1@changeid>
In-Reply-To: <20200626125844.1.I8546ecb6c5beb054f70c5302d1a7293484212cd1@changeid>
From: Evan Green <evgreen@chromium.org>
Date: Fri, 10 Jul 2020 10:38:44 -0700
X-Gmail-Original-Message-ID: <CAE=gft7Q-KC2+9kGVT1k3BaAHZv61iWaeEODZEf7FnXX6i=1LA@mail.gmail.com>
Message-ID: <CAE=gft7Q-KC2+9kGVT1k3BaAHZv61iWaeEODZEf7FnXX6i=1LA@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jty2X-00GPiv-7o
X-Mailman-Approved-At: Mon, 13 Jul 2020 10:08:47 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 1/2] serial: qcom_geni_serial: Make
 kgdb work even if UART isn't console
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
Cc: daniel.thompson@linaro.org, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Akash Asthana <akashast@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The geni serial driver had the rather sketchy hack in it where it
> would adjust the number of bytes per RX FIFO word from 4 down to 1 if
> it detected that CONFIG_CONSOLE_POLL was enabled (for kgdb) and this
> was a console port (defined by the kernel directing output to this
> port via the "console=" command line argument).
>
> The problem with that sketchy hack is that it's possible to run kgdb
> over a serial port even if it isn't used for console.
>
> Let's avoid the hack by simply handling the 4-bytes-per-FIFO word case
> for kdb.  We'll have to have a (very small) cache but that should be
> fine.
>
> A nice side effect of this patch is that an agetty (or similar)
> running on this port is less likely to drop characters.  We'll
> have roughly 4 times the RX FIFO depth than we used to now.
>
> NOTE: the character cache here isn't shared between the polling API
> and the non-polling API.  That means that, technically, the polling
> API could eat a few extra bytes.  This doesn't seem to pose a huge
> problem in reality because we'll only get several characters per FIFO
> word if those characters are all received at nearly the same time and
> we don't really expect non-kgdb characters to be sent to the same port
> as kgdb at the exact same time we're exiting kgdb.
>
> ALSO NOTE: we still have the sketchy hack for setting the number of
> bytes per TX FIFO word in place, but that one is less bad.  kgdb
> doesn't have any problem with this because it always just sends 1 byte
> at a time and waits for it to finish.  The TX FIFO hack is only really
> needed for console output.  In any case, a future patch will remove
> that hack, too.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/tty/serial/qcom_geni_serial.c | 80 ++++++++++++++++++---------
>  1 file changed, 55 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 0300867eab7a..4610e391e886 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -103,11 +103,13 @@
>  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
>  #define IO_MACRO_IO2_IO3_SWAP          0x4640
>
> -#ifdef CONFIG_CONSOLE_POLL
> -#define CONSOLE_RX_BYTES_PW 1
> -#else
> -#define CONSOLE_RX_BYTES_PW 4
> -#endif
> +struct qcom_geni_private_data {
> +       /* NOTE: earlycon port will have NULL here */
> +       struct uart_driver *drv;
> +
> +       u32 poll_cached_bytes;
> +       unsigned int poll_cached_bytes_cnt;
> +};
>
>  struct qcom_geni_serial_port {
>         struct uart_port uport;
> @@ -129,6 +131,8 @@ struct qcom_geni_serial_port {
>         int wakeup_irq;
>         bool rx_tx_swap;
>         bool cts_rts_swap;
> +
> +       struct qcom_geni_private_data private_data;
>  };
>
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -264,8 +268,9 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
>         unsigned int baud;
>         unsigned int fifo_bits;
>         unsigned long timeout_us = 20000;
> +       struct qcom_geni_private_data *private_data = uport->private_data;
>
> -       if (uport->private_data) {
> +       if (private_data->drv) {
>                 port = to_dev_port(uport, uport);
>                 baud = port->baud;
>                 if (!baud)
> @@ -331,23 +336,42 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
>  }
>
>  #ifdef CONFIG_CONSOLE_POLL
> +
>  static int qcom_geni_serial_get_char(struct uart_port *uport)
>  {
> -       u32 rx_fifo;
> +       struct qcom_geni_private_data *private_data = uport->private_data;
>         u32 status;
> +       u32 word_cnt;
> +       int ret;
> +
> +       if (!private_data->poll_cached_bytes_cnt) {
> +               status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> +               writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
>
> -       status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> -       writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> +               status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> +               writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
>
> -       status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> -       writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> +               status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> +               word_cnt = status & RX_FIFO_WC_MSK;
> +               if (!word_cnt)
> +                       return NO_POLL_CHAR;
>
> -       status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> -       if (!(status & RX_FIFO_WC_MSK))
> -               return NO_POLL_CHAR;
> +               if (word_cnt == 1 && (status & RX_LAST))

I forget how the partial word snapping works. Are you sure you want
word_cnt == 1? I see qcom_geni_serial_handle_rx() looks at RX_LAST
independently as long as word_cnt != 0. I'm worried the hardware
allows one FIFO entry with say 2 bytes in it and RX_LAST set, but then
also piles new stuff in the FIFO behind it, so that word_cnt can be
>1.

Also I mostly reviewed the change on Gerrit, they seemed to be the
same. In this case it was easier to understand the indentation
changes. If there were gotchas between the Gerrit version and this
patch, let me know.
-Evan


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
