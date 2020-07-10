Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2221D38D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Jul 2020 12:08:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1juvOC-0003gM-J7
	for lists+kgdb-bugreport@lfdr.de; Mon, 13 Jul 2020 10:08:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <evgreen@chromium.org>) id 1jtyIj-0003bp-Va
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 19:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4txGu+L9ytDTchSvMzInqB3BwWj0CeVC3c7stkzFIE=; b=iuaRzDnNOAkQf3xCRumLwWJHK4
 wBdi3g/E/boIhMWTJG3Pc9YbGR0eyUSFiPxwb/xUXyrrTm89f7ZXKoEYCYX3QyBhJmEeVBl/9NTzH
 iLBclbEgLhC8GeUMRAf5U+Nd3/6fl2QOv+QCfQG0ggLWVb5G62tBWlYFviHJRhFgKehI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B4txGu+L9ytDTchSvMzInqB3BwWj0CeVC3c7stkzFIE=; b=URkmPPIlRC3u/FQ9JBPvyecUDL
 f63ufEfz/6ccoXijoNYUFXxNwX7SyyxOcqLT9n0Jv2DwK6oz1HREZNUg6Zhs1N01uzJG96/S+q4iq
 4R04j0YQ369W8dKXKVqQBHKnYjLlLkksIaVuAbHHEluMoazdxGIqA05bmjieeVZXV5Vw=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtyIi-00DQkn-IP
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 19:03:13 +0000
Received: by mail-lf1-f65.google.com with SMTP id s16so3763889lfp.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 12:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B4txGu+L9ytDTchSvMzInqB3BwWj0CeVC3c7stkzFIE=;
 b=RbhxAnbm6eiOPuuLHjFiTgJpEbhVekJR6akL5iHDKWH0gurwLj00Kj4J9sJOplEq12
 w5BsEy9WLRXSzRXeUE8SSzRvE48ih45NyPiwXX4/TPnLdM88A2M3z+EVtavOjW3YiOUT
 toCJW6Cxt6wfTtmGhesIKfLo3+rxbXAomylQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4txGu+L9ytDTchSvMzInqB3BwWj0CeVC3c7stkzFIE=;
 b=P4BcGa4J9so4Pyzf2yxXDKu9BeVHO36vAR2ul0rZlWr4O54hJ1+ce3THi9/914WmzG
 zaN7S4lX3axJ569apyQnnWTyJQxoDzsUeitoAJqVfbqPU0iDmpkHzEVxAAufqLxDfA3F
 UfizlcMrRI7c7IX9BpuNwSGOxu24pzcaSrU9RgVnZYd2Vyk0JlWtBAkZjpJxP84nx7Js
 m5CDkovzeK0EcAzba1Vu0wtvGATOMKWSO3VV+jOyBNAaz/yvn2EaToMlRgGMUj2HSWll
 lCXB7Kq74laYy1iwhZ6zZ54JqEwsm/JM3+SwaFaUGhX80aRUnNdycXgFisZpQpbJ/+nN
 cUYA==
X-Gm-Message-State: AOAM530HIUk6EKneRRaYBw6IUCRu/jt3SjJeu7Xa8MQpyOl6lJBtNk/x
 +j4WbG/YlQ9+OI+E0vz0d5Q0RM5akwI=
X-Google-Smtp-Source: ABdhPJwn4TKguUpd3m/M6GD92VJo61NYQ14RnBU7tEMXqL/0drFcZq9+QYURRfHx1RocNuZ6QkU0WA==
X-Received: by 2002:a19:7111:: with SMTP id m17mr45360032lfc.156.1594407785946; 
 Fri, 10 Jul 2020 12:03:05 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id v20sm2456345lfe.46.2020.07.10.12.03.05
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 12:03:05 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id b25so7628404ljp.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 12:03:05 -0700 (PDT)
X-Received: by 2002:a2e:571c:: with SMTP id l28mr18955674ljb.432.1594407784467; 
 Fri, 10 Jul 2020 12:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.1.I8546ecb6c5beb054f70c5302d1a7293484212cd1@changeid>
 <CAE=gft7Q-KC2+9kGVT1k3BaAHZv61iWaeEODZEf7FnXX6i=1LA@mail.gmail.com>
 <CAD=FV=VS9e_rj1ufEDw5+Vu_WMVrSqJWjSdK-oZ2OtPxahsMvg@mail.gmail.com>
In-Reply-To: <CAD=FV=VS9e_rj1ufEDw5+Vu_WMVrSqJWjSdK-oZ2OtPxahsMvg@mail.gmail.com>
From: Evan Green <evgreen@chromium.org>
Date: Fri, 10 Jul 2020 12:02:28 -0700
X-Gmail-Original-Message-ID: <CAE=gft7kJErXN2WYzRMjbV0LBSH0sw80XVph14OhaYccWh=RBA@mail.gmail.com>
Message-ID: <CAE=gft7kJErXN2WYzRMjbV0LBSH0sw80XVph14OhaYccWh=RBA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtyIi-00DQkn-IP
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-serial@vger.kernel.org,
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

On Fri, Jul 10, 2020 at 11:19 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 10, 2020 at 10:39 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > The geni serial driver had the rather sketchy hack in it where it
> > > would adjust the number of bytes per RX FIFO word from 4 down to 1 if
> > > it detected that CONFIG_CONSOLE_POLL was enabled (for kgdb) and this
> > > was a console port (defined by the kernel directing output to this
> > > port via the "console=" command line argument).
> > >
> > > The problem with that sketchy hack is that it's possible to run kgdb
> > > over a serial port even if it isn't used for console.
> > >
> > > Let's avoid the hack by simply handling the 4-bytes-per-FIFO word case
> > > for kdb.  We'll have to have a (very small) cache but that should be
> > > fine.
> > >
> > > A nice side effect of this patch is that an agetty (or similar)
> > > running on this port is less likely to drop characters.  We'll
> > > have roughly 4 times the RX FIFO depth than we used to now.
> > >
> > > NOTE: the character cache here isn't shared between the polling API
> > > and the non-polling API.  That means that, technically, the polling
> > > API could eat a few extra bytes.  This doesn't seem to pose a huge
> > > problem in reality because we'll only get several characters per FIFO
> > > word if those characters are all received at nearly the same time and
> > > we don't really expect non-kgdb characters to be sent to the same port
> > > as kgdb at the exact same time we're exiting kgdb.
> > >
> > > ALSO NOTE: we still have the sketchy hack for setting the number of
> > > bytes per TX FIFO word in place, but that one is less bad.  kgdb
> > > doesn't have any problem with this because it always just sends 1 byte
> > > at a time and waits for it to finish.  The TX FIFO hack is only really
> > > needed for console output.  In any case, a future patch will remove
> > > that hack, too.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/tty/serial/qcom_geni_serial.c | 80 ++++++++++++++++++---------
> > >  1 file changed, 55 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index 0300867eab7a..4610e391e886 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > @@ -103,11 +103,13 @@
> > >  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
> > >  #define IO_MACRO_IO2_IO3_SWAP          0x4640
> > >
> > > -#ifdef CONFIG_CONSOLE_POLL
> > > -#define CONSOLE_RX_BYTES_PW 1
> > > -#else
> > > -#define CONSOLE_RX_BYTES_PW 4
> > > -#endif
> > > +struct qcom_geni_private_data {
> > > +       /* NOTE: earlycon port will have NULL here */
> > > +       struct uart_driver *drv;
> > > +
> > > +       u32 poll_cached_bytes;
> > > +       unsigned int poll_cached_bytes_cnt;
> > > +};
> > >
> > >  struct qcom_geni_serial_port {
> > >         struct uart_port uport;
> > > @@ -129,6 +131,8 @@ struct qcom_geni_serial_port {
> > >         int wakeup_irq;
> > >         bool rx_tx_swap;
> > >         bool cts_rts_swap;
> > > +
> > > +       struct qcom_geni_private_data private_data;
> > >  };
> > >
> > >  static const struct uart_ops qcom_geni_console_pops;
> > > @@ -264,8 +268,9 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> > >         unsigned int baud;
> > >         unsigned int fifo_bits;
> > >         unsigned long timeout_us = 20000;
> > > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > >
> > > -       if (uport->private_data) {
> > > +       if (private_data->drv) {
> > >                 port = to_dev_port(uport, uport);
> > >                 baud = port->baud;
> > >                 if (!baud)
> > > @@ -331,23 +336,42 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
> > >  }
> > >
> > >  #ifdef CONFIG_CONSOLE_POLL
> > > +
> > >  static int qcom_geni_serial_get_char(struct uart_port *uport)
> > >  {
> > > -       u32 rx_fifo;
> > > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > >         u32 status;
> > > +       u32 word_cnt;
> > > +       int ret;
> > > +
> > > +       if (!private_data->poll_cached_bytes_cnt) {
> > > +               status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> > > +               writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> > >
> > > -       status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> > > -       writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> > > +               status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> > > +               writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> > >
> > > -       status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> > > -       writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> > > +               status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> > > +               word_cnt = status & RX_FIFO_WC_MSK;
> > > +               if (!word_cnt)
> > > +                       return NO_POLL_CHAR;
> > >
> > > -       status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> > > -       if (!(status & RX_FIFO_WC_MSK))
> > > -               return NO_POLL_CHAR;
> > > +               if (word_cnt == 1 && (status & RX_LAST))
> >
> > I forget how the partial word snapping works. Are you sure you want
> > word_cnt == 1? I see qcom_geni_serial_handle_rx() looks at RX_LAST
> > independently as long as word_cnt != 0. I'm worried the hardware
> > allows one FIFO entry with say 2 bytes in it and RX_LAST set, but then
> > also piles new stuff in the FIFO behind it, so that word_cnt can be
> > >1.
>
> So I guess one point of evidence that the logic I have there is OK is
> that it works.  :-P
>
> ...but also looking closer.  Maybe first it's important to understand
> the REALLY WEIRD protocol that geni serial uses.  This was discovered
> through a bunch of trial and error long ago when poking at how the
> driver worked.
>
> When you're reading from geni it essentially breaks things into
> packets.  If you're midway through reading a packet of data and more
> bytes come in then geni will hide them from you until you read the
> whole packet.  I'm not totally sure the exact conditions for when it
> decides to make a packet out of the data, but it's not important for
> this discussion.
>
> So when you read "RX_FIFO_WC" it tells you the total number of FIFO
> words in the current packet.  That number will only ever go down.  A
> packet is made up of some number of whole words plus one word that
> could be a whole word or could be a partial word.  So if "RX_FIFO_WC"
> says 4 it means you've got 3 whole words (3 * 4 = 12 bytes) and one
> word that might be partial.  You can find out about that one partial
> word (always the last word in the FIFO) by reading "RX_LAST" and
> "RX_LAST_BYTE_VALID".
>
> Once you finally read the last word in the FIFO then geni can tell you
> about the next packet of data.
>
> OK, so hopefully that made sense?

I see, yes. In your description, the status register is a single
storage element with a decrementing counter that stores the state for
this current packet. Then it's a mystery how/where additional packets
are buffered.

In my mental model, RX_FIFO_WC tells you how many elements are
occupied in the FIFO, regardless of packet boundaries. RX_LAST and
byte count are actually little tags in each FIFO element. So a FIFO
element internally consists of 4 data bytes + 3 status bits. Then that
portion of the status register shows you the status/tag bits for the
element at the top of the FIFO. I can't remember why I think it works
this way, but it does explain how the hardware can queue/store
multiple RX packets, and how it would handle overflows.

>
> So qcom_geni_serial_handle_rx() is trying to read ALL bytes.  It first
> figures out the total count of bytes and then reads them all.  That's
> why it needs to look at RX_LAST all the time.  Also of note: RX_LAST
> only ever applies to the last word in the FIFO.  If it was possible
> for the word count to grow _before_ fully clearing out the FIFO then
> it would be a race and software would never be able to tell which byte
> RX_LAST applied to.

In my world, I was imagining word count could grow, since it showed
the current fullness of the FIFO, but RX_LAST and BYTE_COUNT_MSK
showed the tag bits for the current element. It looked like
qcom_geni_serial_handle_rx() was coded for that since it seemed to
only check that FIFO_WC was non-zero.

If you only check RX_LAST, and remove the word_cnt == 1, then the code
is correct in both of our mental models of the hardware, right?

But TBH I've basically fabricated my mental model out of the air. So
I'll defer to you if you're sure it works the way you've described.
-Evan

>
> In the case of qcom_geni_serial_get_char() we don't want to read all
> bytes because we don't have a place to put them.  We only want 1 byte
> but sometimes we're forced to read 4 because of the whole
> 4-bytes-per-fifo-entry thing.  So we read one FIFO entry.  As long as
> we're not reading the _last_ FIFO entry then geni won't start a new
> packet.  So if RX_FIFO_WC > 1 and we read a byte then it'll go down by
> 1.  If RX_FIFO_WC == 1 then we're reading the last entry and geni is
> allowed to start its next packet.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
