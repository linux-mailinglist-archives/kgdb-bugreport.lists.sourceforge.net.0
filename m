Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E421BCEB
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jul 2020 20:27:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jtxkK-0006Si-H3
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Jul 2020 18:27:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jtxkJ-0006Sb-9j
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wnOuOYXoizS/zBJcCxGZB+NxpIyUG/B4G9U+uO4vkR8=; b=YN0B/i6orm853mEJnuFwbWhH3p
 yf94YyzXRovrNA/uJ7YNnBxiQLPUjqT28kvQScjWPfMxDPiNWtWZKdlkQpBccNZg3ATmXwgQm1O/2
 LFMTAPLsttj+Aj54D/aC95j6lnKFZF5Kx8POdtyL+gmJZEthXa9L4/LyIgIrhZVgF/Y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wnOuOYXoizS/zBJcCxGZB+NxpIyUG/B4G9U+uO4vkR8=; b=KsQ1JNwEpapUFkgubYA2lJ5hLA
 C54jTqqPAxYbADAZMEsvE0pFsbRkfxpnOAoNNz94DhsC20gnutJY4jqLGpkG5VmRrMq3HY/VE/Xfj
 OzwHb91kvbqHbOEvonTjV8cTmlAAatYdMue6AoKOrg7G83rF+DMKmHNTCiqqu8sSGXOM=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtxkH-00DP8I-Rc
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:27:39 +0000
Received: by mail-pg1-f196.google.com with SMTP id w2so2872198pgg.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wnOuOYXoizS/zBJcCxGZB+NxpIyUG/B4G9U+uO4vkR8=;
 b=fIzKSvedd4Xt5WU2QaHjdRj4b+kQNS0g4OL/AbWRJroDEmFD6e2U7AfiGxiqLSrEsh
 cbA8OTFyZGQg4LPC7mhD+97Rsxo3xGQbiUQU07CTX/Jri44VcMEmEFLK3znjZyauLD2N
 Ti+2fqqRdC62TnnqThorhsp32v+sNHqM7B4z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wnOuOYXoizS/zBJcCxGZB+NxpIyUG/B4G9U+uO4vkR8=;
 b=OwiGeUtZpYbllHmyft9ES9Q0rvxQWdUmXI0TXI6nt6ylXoPWAdewxclN0y18Q0riWv
 2xyU3At46P872Un6ojlTQusnGPBDaZMv2hA1OOkhLWhndKDs0QGk3XSvjfYXMK34ZFTP
 Suj+GS+32ihpHX0eFHvB8eh8GaBiJnOQf/0DvLftsDT0J5WKYKxr5jjsjAFiU0if7EaA
 jyw16nJxSSd2k7O+tr/3d2oBe1NEluJQi+WY6wiiSVhRpDi2araLsCEIUkC15sx9oUgG
 iQEi/Pwmc3AVKNPSiWRpfp0FwIcDVgqDvGs2L8WepdW9SuTAruQ2WY3cKRK85Y5I6UeK
 PnjA==
X-Gm-Message-State: AOAM5333WL4amde6yJvEgoszs+zZqhHFVorgqw77hkeJvEanhn4xSUSt
 ZZYpTsgUsqdFrx70dmRqKqX7kJ32vFk=
X-Google-Smtp-Source: ABdhPJzkv+SB6EjqmpcRUuE67Y/BIK6c+0r2u5on9ZNWp/jmfst+Plx31Ura6WDnEw9ypZkvzAbLIQ==
X-Received: by 2002:a1f:66c2:: with SMTP id a185mr52086113vkc.31.1594405177999; 
 Fri, 10 Jul 2020 11:19:37 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id s19sm895500vke.14.2020.07.10.11.19.36
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 11:19:37 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id u133so3477179vsc.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 11:19:36 -0700 (PDT)
X-Received: by 2002:a05:6102:20a:: with SMTP id
 z10mr43192375vsp.213.1594405176107; 
 Fri, 10 Jul 2020 11:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.1.I8546ecb6c5beb054f70c5302d1a7293484212cd1@changeid>
 <CAE=gft7Q-KC2+9kGVT1k3BaAHZv61iWaeEODZEf7FnXX6i=1LA@mail.gmail.com>
In-Reply-To: <CAE=gft7Q-KC2+9kGVT1k3BaAHZv61iWaeEODZEf7FnXX6i=1LA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Jul 2020 11:19:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VS9e_rj1ufEDw5+Vu_WMVrSqJWjSdK-oZ2OtPxahsMvg@mail.gmail.com>
Message-ID: <CAD=FV=VS9e_rj1ufEDw5+Vu_WMVrSqJWjSdK-oZ2OtPxahsMvg@mail.gmail.com>
To: Evan Green <evgreen@chromium.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtxkH-00DP8I-Rc
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

Hi,

On Fri, Jul 10, 2020 at 10:39 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The geni serial driver had the rather sketchy hack in it where it
> > would adjust the number of bytes per RX FIFO word from 4 down to 1 if
> > it detected that CONFIG_CONSOLE_POLL was enabled (for kgdb) and this
> > was a console port (defined by the kernel directing output to this
> > port via the "console=" command line argument).
> >
> > The problem with that sketchy hack is that it's possible to run kgdb
> > over a serial port even if it isn't used for console.
> >
> > Let's avoid the hack by simply handling the 4-bytes-per-FIFO word case
> > for kdb.  We'll have to have a (very small) cache but that should be
> > fine.
> >
> > A nice side effect of this patch is that an agetty (or similar)
> > running on this port is less likely to drop characters.  We'll
> > have roughly 4 times the RX FIFO depth than we used to now.
> >
> > NOTE: the character cache here isn't shared between the polling API
> > and the non-polling API.  That means that, technically, the polling
> > API could eat a few extra bytes.  This doesn't seem to pose a huge
> > problem in reality because we'll only get several characters per FIFO
> > word if those characters are all received at nearly the same time and
> > we don't really expect non-kgdb characters to be sent to the same port
> > as kgdb at the exact same time we're exiting kgdb.
> >
> > ALSO NOTE: we still have the sketchy hack for setting the number of
> > bytes per TX FIFO word in place, but that one is less bad.  kgdb
> > doesn't have any problem with this because it always just sends 1 byte
> > at a time and waits for it to finish.  The TX FIFO hack is only really
> > needed for console output.  In any case, a future patch will remove
> > that hack, too.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/tty/serial/qcom_geni_serial.c | 80 ++++++++++++++++++---------
> >  1 file changed, 55 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 0300867eab7a..4610e391e886 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -103,11 +103,13 @@
> >  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
> >  #define IO_MACRO_IO2_IO3_SWAP          0x4640
> >
> > -#ifdef CONFIG_CONSOLE_POLL
> > -#define CONSOLE_RX_BYTES_PW 1
> > -#else
> > -#define CONSOLE_RX_BYTES_PW 4
> > -#endif
> > +struct qcom_geni_private_data {
> > +       /* NOTE: earlycon port will have NULL here */
> > +       struct uart_driver *drv;
> > +
> > +       u32 poll_cached_bytes;
> > +       unsigned int poll_cached_bytes_cnt;
> > +};
> >
> >  struct qcom_geni_serial_port {
> >         struct uart_port uport;
> > @@ -129,6 +131,8 @@ struct qcom_geni_serial_port {
> >         int wakeup_irq;
> >         bool rx_tx_swap;
> >         bool cts_rts_swap;
> > +
> > +       struct qcom_geni_private_data private_data;
> >  };
> >
> >  static const struct uart_ops qcom_geni_console_pops;
> > @@ -264,8 +268,9 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> >         unsigned int baud;
> >         unsigned int fifo_bits;
> >         unsigned long timeout_us = 20000;
> > +       struct qcom_geni_private_data *private_data = uport->private_data;
> >
> > -       if (uport->private_data) {
> > +       if (private_data->drv) {
> >                 port = to_dev_port(uport, uport);
> >                 baud = port->baud;
> >                 if (!baud)
> > @@ -331,23 +336,42 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
> >  }
> >
> >  #ifdef CONFIG_CONSOLE_POLL
> > +
> >  static int qcom_geni_serial_get_char(struct uart_port *uport)
> >  {
> > -       u32 rx_fifo;
> > +       struct qcom_geni_private_data *private_data = uport->private_data;
> >         u32 status;
> > +       u32 word_cnt;
> > +       int ret;
> > +
> > +       if (!private_data->poll_cached_bytes_cnt) {
> > +               status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> > +               writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> >
> > -       status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
> > -       writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
> > +               status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> > +               writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> >
> > -       status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> > -       writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> > +               status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> > +               word_cnt = status & RX_FIFO_WC_MSK;
> > +               if (!word_cnt)
> > +                       return NO_POLL_CHAR;
> >
> > -       status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
> > -       if (!(status & RX_FIFO_WC_MSK))
> > -               return NO_POLL_CHAR;
> > +               if (word_cnt == 1 && (status & RX_LAST))
>
> I forget how the partial word snapping works. Are you sure you want
> word_cnt == 1? I see qcom_geni_serial_handle_rx() looks at RX_LAST
> independently as long as word_cnt != 0. I'm worried the hardware
> allows one FIFO entry with say 2 bytes in it and RX_LAST set, but then
> also piles new stuff in the FIFO behind it, so that word_cnt can be
> >1.

So I guess one point of evidence that the logic I have there is OK is
that it works.  :-P

...but also looking closer.  Maybe first it's important to understand
the REALLY WEIRD protocol that geni serial uses.  This was discovered
through a bunch of trial and error long ago when poking at how the
driver worked.

When you're reading from geni it essentially breaks things into
packets.  If you're midway through reading a packet of data and more
bytes come in then geni will hide them from you until you read the
whole packet.  I'm not totally sure the exact conditions for when it
decides to make a packet out of the data, but it's not important for
this discussion.

So when you read "RX_FIFO_WC" it tells you the total number of FIFO
words in the current packet.  That number will only ever go down.  A
packet is made up of some number of whole words plus one word that
could be a whole word or could be a partial word.  So if "RX_FIFO_WC"
says 4 it means you've got 3 whole words (3 * 4 = 12 bytes) and one
word that might be partial.  You can find out about that one partial
word (always the last word in the FIFO) by reading "RX_LAST" and
"RX_LAST_BYTE_VALID".

Once you finally read the last word in the FIFO then geni can tell you
about the next packet of data.

OK, so hopefully that made sense?

So qcom_geni_serial_handle_rx() is trying to read ALL bytes.  It first
figures out the total count of bytes and then reads them all.  That's
why it needs to look at RX_LAST all the time.  Also of note: RX_LAST
only ever applies to the last word in the FIFO.  If it was possible
for the word count to grow _before_ fully clearing out the FIFO then
it would be a race and software would never be able to tell which byte
RX_LAST applied to.

In the case of qcom_geni_serial_get_char() we don't want to read all
bytes because we don't have a place to put them.  We only want 1 byte
but sometimes we're forced to read 4 because of the whole
4-bytes-per-fifo-entry thing.  So we read one FIFO entry.  As long as
we're not reading the _last_ FIFO entry then geni won't start a new
packet.  So if RX_FIFO_WC > 1 and we read a byte then it'll go down by
1.  If RX_FIFO_WC == 1 then we're reading the last entry and geni is
allowed to start its next packet.


> Also I mostly reviewed the change on Gerrit, they seemed to be the
> same. In this case it was easier to understand the indentation
> changes. If there were gotchas between the Gerrit version and this
> patch, let me know.

They are the same.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
