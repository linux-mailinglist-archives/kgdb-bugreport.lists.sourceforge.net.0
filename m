Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9D21D38B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Jul 2020 12:08:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1juvOC-0003g3-Fs
	for lists+kgdb-bugreport@lfdr.de; Mon, 13 Jul 2020 10:08:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <evgreen@chromium.org>) id 1jtxx3-0002YP-F2
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m/CMHk4w6+cNFzgYJXIzp3UU76Y8y9UeHEGOkUVbXTU=; b=RosevJgwBb2DkcqjeFys2+9XBy
 DBdo/1hlpo+lO9FgsnoomvEeI3XMeu+FBpS2X6U8OmwkG/tkfylCul8et8Zw3wZLhu7gx+yQ5N5i0
 Zll5xoa5RiaZ9XOIaSrNT3DT9J3Ja4NjIkroCAKBRiaFHY1b90qDgj+8eupsXBW8OcSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m/CMHk4w6+cNFzgYJXIzp3UU76Y8y9UeHEGOkUVbXTU=; b=XbJ4DpnjL5NkvIEmUWQbs08waG
 WQk2qj3RzxlnIoBqSMR69vcdMF9C9WeifAHCnJjR6MHqdecWIi3SMeH9RzOVmO279fpZ9EHGmVWVp
 MNVXC047aILNSopjVeLKOczPHDZosX/qsPyXjX1PCKdWEBKD1gJGUpf0WXQRVdyuwVKM=;
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtxx2-00GPWD-5k
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Jul 2020 18:40:49 +0000
Received: by mail-ej1-f65.google.com with SMTP id p20so7116190ejd.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/CMHk4w6+cNFzgYJXIzp3UU76Y8y9UeHEGOkUVbXTU=;
 b=ILDYVm0LcXLZZrfmAxtURkQprTX9skjAShvhFipQKJAKbFGyoFEeZfJniL4uh1sJtQ
 6GQsddyIJ/M36EE7v0/XiEEynwtBixNj1dz7zWXkp46lP3Sbmpdp/lJneh5gVSnuRIoP
 uDZ95SWe4tPPb6v31ajhDIGF2FUlWNiVlWd+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/CMHk4w6+cNFzgYJXIzp3UU76Y8y9UeHEGOkUVbXTU=;
 b=l3Ha5NGkmMLxf2MvHJSlN6FwnLoiCYaY4Xb4OzYs+6crugwdadytmUEaKzGG+yLawi
 xJgyUo8My+ddh29AORLiwNJZA+hxGm4pP0tk7Dvk/Y0cQRQDv24F4/pTuk3SAyjVue27
 vG5m7JPF093/A584A/JhZHed+D36cg9p7fI1il64iyLzJBzVlUx4YjLkCn+5cW3RIk52
 7pY9RRuoDmwsjnymUC+Cosuim6SHuBdX73ulJhPPfc3NNyrjF+RTPudo8Ah+qwuihQEc
 7ePdekzCdb360vGmtXMs3rx7QAqKTTSx3NnrzrAhhPw/NwMBnEFMhQDXAYRBsYgHGw+3
 ZXKg==
X-Gm-Message-State: AOAM530OM6LAYcY+PxcjFyzBWR9JPtDE9+Zsx81/XGZFW2e++pX7NXhk
 PHtZNvX1JrivHW3+eSnen8WLAZsrvRI=
X-Google-Smtp-Source: ABdhPJwASd8ukyhbGt6XUT73HpO6jLxEkd6ykuwEYsWl43GFRv75lScnxjed/zEAqlrO++r/4F/prQ==
X-Received: by 2002:a05:6512:783:: with SMTP id
 x3mr34119383lfr.126.1594402770368; 
 Fri, 10 Jul 2020 10:39:30 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id g22sm2381104lfb.43.2020.07.10.10.39.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:39:29 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id y18so3655663lfh.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Jul 2020 10:39:27 -0700 (PDT)
X-Received: by 2002:ac2:44b2:: with SMTP id c18mr42517426lfm.99.1594402767378; 
 Fri, 10 Jul 2020 10:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org>
 <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
In-Reply-To: <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
From: Evan Green <evgreen@chromium.org>
Date: Fri, 10 Jul 2020 10:38:50 -0700
X-Gmail-Original-Message-ID: <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
Message-ID: <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtxx2-00GPWD-5k
X-Mailman-Approved-At: Mon, 13 Jul 2020 10:08:47 +0000
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
> The geni serial driver had a rule that we'd only use 1 byte per FIFO
> word for the TX FIFO if we were being used for the serial console.
> This is ugly and a bit of a pain.  It's not too hard to fix, so fix
> it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/tty/serial/qcom_geni_serial.c | 57 +++++++++++++++++----------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 4610e391e886..583d903321b5 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -103,12 +103,18 @@
>  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
>  #define IO_MACRO_IO2_IO3_SWAP          0x4640
>
> +/* We always configure 4 bytes per FIFO word */
> +#define BYTES_PER_FIFO_WORD            4
> +
>  struct qcom_geni_private_data {
>         /* NOTE: earlycon port will have NULL here */
>         struct uart_driver *drv;
>
>         u32 poll_cached_bytes;
>         unsigned int poll_cached_bytes_cnt;
> +
> +       u32 write_cached_bytes;
> +       unsigned int write_cached_bytes_cnt;
>  };
>
>  struct qcom_geni_serial_port {
> @@ -121,8 +127,6 @@ struct qcom_geni_serial_port {
>         bool setup;
>         int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
>         unsigned int baud;
> -       unsigned int tx_bytes_pw;
> -       unsigned int rx_bytes_pw;
>         void *rx_fifo;
>         u32 loopback;
>         bool brk;
> @@ -390,13 +394,25 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
>  #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
>  static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
>  {
> -       writel(ch, uport->membase + SE_GENI_TX_FIFOn);
> +       struct qcom_geni_private_data *private_data = uport->private_data;
> +
> +       private_data->write_cached_bytes =
> +               (private_data->write_cached_bytes >> 8) | (ch << 24);
> +       private_data->write_cached_bytes_cnt++;
> +
> +       if (private_data->write_cached_bytes_cnt == BYTES_PER_FIFO_WORD) {
> +               writel(private_data->write_cached_bytes,
> +                      uport->membase + SE_GENI_TX_FIFOn);
> +               private_data->write_cached_bytes_cnt = 0;
> +       }
>  }
>
>  static void
>  __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
>                                  unsigned int count)
>  {
> +       struct qcom_geni_private_data *private_data = uport->private_data;
> +
>         int i;
>         u32 bytes_to_send = count;
>
> @@ -431,6 +447,15 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
>                                                         SE_GENI_M_IRQ_CLEAR);
>                 i += chars_to_write;
>         }
> +
> +       if (private_data->write_cached_bytes_cnt) {
> +               private_data->write_cached_bytes >>= BITS_PER_BYTE *
> +                       (BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
> +               writel(private_data->write_cached_bytes,
> +                      uport->membase + SE_GENI_TX_FIFOn);
> +               private_data->write_cached_bytes_cnt = 0;
> +       }

How does this not end up sending stray zeros? In other words, how does
the hardware know which bytes of this word are valid?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
