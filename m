Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4421BCF0
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 10 Jul 2020 20:28:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jtxkv-0006Uo-KB
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Jul 2020 18:28:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jtxku-0006Ug-RV
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tLKh/X0uXeX2LGln8V38XdhqIytFWvmdivttEbfej3A=; b=UVCPDU0b6d/GSBJRjH6suESqjx
 DIZ3kP7+N633mi1AVF5T1u9vWoa13AC0KEMYjAH0vwQNGxoOA7XXYD1DMqIE3RIKgixeW3qCdpDwZ
 PWGaLjstX/tn4W2IWHwwinLgDUpmKUnfuHPt4hj6fTnAqnjtUKCzEVScCEgmPPcY02YY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tLKh/X0uXeX2LGln8V38XdhqIytFWvmdivttEbfej3A=; b=iWBQ8592QB3uIlKIV0GRFdzNrS
 XrwTJ349gRxyJXU8pJMJvmZCQgSGKTPkGrYy8P5z9gF2IYLe783l/83t1J4bmHpffWJqENThbmuwJ
 mcyN0dMYt8hKcXnUFAyFrcqDJ0bhGVhaMn2vjm3+qXfROj/NMqOQ5tQFRDvQUm8+6Ikk=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtxks-00DP9Z-UO
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:28:16 +0000
Received: by mail-vs1-f68.google.com with SMTP id d11so987436vsq.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tLKh/X0uXeX2LGln8V38XdhqIytFWvmdivttEbfej3A=;
 b=T8gHEm7iKqdyoST5OEcE24mAxhUbWx/ujrm3+39tyFVSnNITZrImdgsKf4o14KEpH6
 xFCInhQJCQb11FGriDxPVd45l6X0wbiUg8mSX3FT1IduymyhHIDBYMsQfOfPJzhSZTRu
 nRe5eVDX9XxoTmNXd+01hakcw5MXFJS70VUPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tLKh/X0uXeX2LGln8V38XdhqIytFWvmdivttEbfej3A=;
 b=BtqPYpgJ1epdUPLhOdvMjS2ml2tRGHBcAKatrnSIhmkVL9Yd7I2D93G/bG9dUx/LlO
 9ZhSSt1rsvujCDeqofvXNyXscnL/ussPJyaHQnWwyvERjb0vAen4DyeJ5wu7yk7pds30
 WYDHkPqASILbFbwAJhuPZVGWmkiR+033oC/VshmjZlaTNDGHg+x6dzWu7j9DPycPdd1P
 Xi2uBS3ciwhWBLNTXrTG+/kh6mvqs8KXV34Rt9yIbp1QGrev7kToIRbit819OsseTuIB
 NiZK3w9aL34G0ARG/goMdjbujgn+LUo0xFBdz5GGmFB6rqhG63XnYRw5b24Dvc1/vjyd
 +9mw==
X-Gm-Message-State: AOAM532Qv3GKLo0LomhKBSi31Pvc70JVyFLgz1k+1x0F/r8+GNOvaF1c
 xxtB5MU0lZ3XME+u5l1sPo2VBBZcgcY=
X-Google-Smtp-Source: ABdhPJxDkjbO1JIrl9gN1yd1ayYsRZvZCbAJlhYOUArPZUB3RDpDr8uS5RFhv1q1XhPIL7RBXlqgZg==
X-Received: by 2002:a67:3258:: with SMTP id y85mr19397548vsy.157.1594405688609; 
 Fri, 10 Jul 2020 11:28:08 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id k2sm624478uaj.0.2020.07.10.11.28.05
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 11:28:07 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id h190so1445132vkh.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 11:28:05 -0700 (PDT)
X-Received: by 2002:a1f:9d57:: with SMTP id g84mr27397611vke.100.1594405685296; 
 Fri, 10 Jul 2020 11:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
 <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
In-Reply-To: <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Jul 2020 11:27:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfYL0po+8Wm4hLYgwDQpREFSeGEaNSQMCZhmV2tP_u0A@mail.gmail.com>
Message-ID: <CAD=FV=XfYL0po+8Wm4hLYgwDQpREFSeGEaNSQMCZhmV2tP_u0A@mail.gmail.com>
To: Evan Green <evgreen@chromium.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtxks-00DP9Z-UO
Subject: Re: [Kgdb-bugreport] [PATCH 2/2] serial: qcom_geni_serial: Always
 use 4 bytes per TX FIFO word
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

On Fri, Jul 10, 2020 at 10:46 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The geni serial driver had a rule that we'd only use 1 byte per FIFO
> > word for the TX FIFO if we were being used for the serial console.
> > This is ugly and a bit of a pain.  It's not too hard to fix, so fix
> > it.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/tty/serial/qcom_geni_serial.c | 57 +++++++++++++++++----------
> >  1 file changed, 37 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 4610e391e886..583d903321b5 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -103,12 +103,18 @@
> >  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
> >  #define IO_MACRO_IO2_IO3_SWAP          0x4640
> >
> > +/* We always configure 4 bytes per FIFO word */
> > +#define BYTES_PER_FIFO_WORD            4
> > +
> >  struct qcom_geni_private_data {
> >         /* NOTE: earlycon port will have NULL here */
> >         struct uart_driver *drv;
> >
> >         u32 poll_cached_bytes;
> >         unsigned int poll_cached_bytes_cnt;
> > +
> > +       u32 write_cached_bytes;
> > +       unsigned int write_cached_bytes_cnt;
> >  };
> >
> >  struct qcom_geni_serial_port {
> > @@ -121,8 +127,6 @@ struct qcom_geni_serial_port {
> >         bool setup;
> >         int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
> >         unsigned int baud;
> > -       unsigned int tx_bytes_pw;
> > -       unsigned int rx_bytes_pw;
> >         void *rx_fifo;
> >         u32 loopback;
> >         bool brk;
> > @@ -390,13 +394,25 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
> >  #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> >  static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
> >  {
> > -       writel(ch, uport->membase + SE_GENI_TX_FIFOn);
> > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > +
> > +       private_data->write_cached_bytes =
> > +               (private_data->write_cached_bytes >> 8) | (ch << 24);
> > +       private_data->write_cached_bytes_cnt++;
> > +
> > +       if (private_data->write_cached_bytes_cnt == BYTES_PER_FIFO_WORD) {
> > +               writel(private_data->write_cached_bytes,
> > +                      uport->membase + SE_GENI_TX_FIFOn);
> > +               private_data->write_cached_bytes_cnt = 0;
> > +       }
> >  }
> >
> >  static void
> >  __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
> >                                  unsigned int count)
> >  {
> > +       struct qcom_geni_private_data *private_data = uport->private_data;
> > +
> >         int i;
> >         u32 bytes_to_send = count;
> >
> > @@ -431,6 +447,15 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
> >                                                         SE_GENI_M_IRQ_CLEAR);
> >                 i += chars_to_write;
> >         }
> > +
> > +       if (private_data->write_cached_bytes_cnt) {
> > +               private_data->write_cached_bytes >>= BITS_PER_BYTE *
> > +                       (BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
> > +               writel(private_data->write_cached_bytes,
> > +                      uport->membase + SE_GENI_TX_FIFOn);
> > +               private_data->write_cached_bytes_cnt = 0;
> > +       }
>
> How does this not end up sending stray zeros? In other words, how does
> the hardware know which bytes of this word are valid?

We told it how many bytes we wanted to send in
qcom_geni_serial_setup_tx().  If the total number of bytes being sent
is not a multiple of the FIFO word size then it knows that the last
word will be a partial and it'll extract just the number of needed
bytes out of it.

Like receiving, sending bytes out of geni is also packet based.
Though the packets work a little differently for sending vs. receiving
in both cases you are supposed to fully finish a packet before you
send more bytes (you can sorta cancel / start a new packet, but that's
not what we're doing here).  So ahead of time we told it how many
bytes to expect and then we sent them all.

NOTE: if we wanted to simplify this function at the expense of
efficiency, we could change it to always send 1-byte packets.  Then
we'd start a packet, send 1 byte, wait for done, start a new packet,
send 1 byte, wait for done, etc.  In fact, that's how the polling code
does it...


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
