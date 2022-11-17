Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9462D051
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 02:00:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovTG3-0004Jb-BC
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 00:59:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ovTG1-0004JV-P7
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7IItaZa/7I4VBu5cw0wrKUsh/hbQDFMwGlkpESbfAao=; b=H+7E9YSIFqKoouCZGy3+g+FLdL
 kkbh4eL9OHI66Hg9Qqx0/QTkntPGHjEFICV0cMuqdUPCbdFNiF+srVHaNL7i5cptsggxNk8T8RnHl
 cKwlG90Y5JHrOpygoJU/o3sWW06uyyZoPGWh0wtdHWVufdG9S8+0m4dNxiUkfQYg35aU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7IItaZa/7I4VBu5cw0wrKUsh/hbQDFMwGlkpESbfAao=; b=TMcEXQylSvk/cCFTA/C4r/AEVf
 9a9jy7mBGTqMF8HTsXOG66PZ58t+GwZrTgNnKOcSiRXYpYg5PXEgfK1m5nhUl++DLADgcMdtH/hQu
 58m/VKu/+GkkOs8GkQHMZSQcNdnYb+Unk5+jP9D07sRj690QYFZc7zjr/ORusUFcemHM=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovTFz-00AvCZ-V4 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:59:57 +0000
Received: by mail-ej1-f47.google.com with SMTP id n12so1278629eja.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7IItaZa/7I4VBu5cw0wrKUsh/hbQDFMwGlkpESbfAao=;
 b=HAD+QNbZhmm80gWWfMxazQiOdxU/8OoWGwpppi16ividblCxYrow2hz0E0zZ7AhQ0z
 cJqUTprf41aF4MbLXaLFlbvRQJVq6IL9gsK+Kqxa/h2queVIuT30rA6VyDlCgXIBzNyT
 qslBCis6l11GbiAG8lz7dScccivWN8QaYUE08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7IItaZa/7I4VBu5cw0wrKUsh/hbQDFMwGlkpESbfAao=;
 b=KUvG9skvVF+z3Kh1NKptRviLe+vT/rIew0x+hZLoMlwx8pClGP0BkpKHDitIetTezu
 jYggPgGAE7HDqpkf9U/fGL5CK02meprDYi9wDfQI8GkCy0nVvMEtekubPigdx5+u++1h
 r2bxFTbfwQ2vThEEvyn/k95WHI8NPJqPvPmQp4mS5UxcHmQduGJg6RrW6gOH4dsFRqN1
 L1OTavQTC6HHjbuuuemUVsRvoTZ0tmLD+ikazTyDla7JbW6my+Nu6xFlHRlLnye7iz2k
 DoBS7mEnvJPQ8GqP0gP53ISlunnlssl2W+xwviK9GhlWSiRgegH7vsHWBMQ0CLcVuv7M
 usQw==
X-Gm-Message-State: ANoB5pnizNG6HMMih+2aUCbeE5QbcTxuMHIG2ntBUlLypRpAx6LbWT+n
 1OV6vtD0evAOwCJqiK4kglGLyZZTo+R/IV25
X-Google-Smtp-Source: AA0mqf4gMOlUoBpnKlRWx6NlaeddsR8Gxvl3vApqGBpqYcZA159rw1kUc2lTiwBnGqjoa25QhSmuLA==
X-Received: by 2002:a17:906:50f:b0:78d:ad5d:75e with SMTP id
 j15-20020a170906050f00b0078dad5d075emr304770eja.172.1668646789130; 
 Wed, 16 Nov 2022 16:59:49 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 ky14-20020a170907778e00b0078afe360800sm7408200ejc.199.2022.11.16.16.59.47
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 16:59:48 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id o4so414717wrq.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:47 -0800 (PST)
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr35889wrs.659.1668646787360; Wed, 16 Nov
 2022 16:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-36-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-36-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Nov 2022 16:59:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHEjpL1VYnLRp9Vy300Xd3Tu=u3MOo_rvHCABDTsQFPA@mail.gmail.com>
Message-ID: <CAD=FV=WHEjpL1VYnLRp9Vy300Xd3Tu=u3MOo_rvHCABDTsQFPA@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Nov 16,
 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > Use srcu console list iteration for safe console list traversal.
 > Note that this is a preparatory change for when co [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ovTFz-00AvCZ-V4
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 35/40] tty: serial: kgdboc:
 use srcu console list iterator
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Nov 16, 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> Use srcu console list iteration for safe console list traversal.
> Note that this is a preparatory change for when console_lock no
> longer provides synchronization for the console list.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 5be381003e58..c6df9ef34099 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -451,6 +451,7 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>  {
>         struct console *con;
>         static bool already_warned;
> +       int cookie;
>
>         if (already_warned)
>                 return;
> @@ -463,9 +464,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>          * serial drivers might be OK with this, print a warning once per
>          * boot if we detect this case.
>          */
> -       for_each_console(con)
> +       cookie = console_srcu_read_lock();
> +       for_each_console_srcu(con) {
>                 if (con == kgdboc_earlycon_io_ops.cons)
> -                       return;
> +                       break;
> +       }
> +       console_srcu_read_unlock(cookie);
> +       if (con)
> +               return;

Is there truly any guarantee that "con" will be NULL if
for_each_console_srcu() finishes naturally (AKA without a "break"
being executed)?

It looks as if currently this will be true but nothing in the comments
of for_each_console_srcu() nor hlist_for_each_entry_srcu() (which it
calls) guarantees this, right? It would be nice if that was
documented, but I guess it's not a huge deal.

 Also: wasn't there just some big issue about people using loop
iteration variables after the loop finished?

https://lwn.net/Articles/885941/

Ah, I guess that's a slightly different problem and probably not relevant here.

So it seems like this is fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
