Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47E62D04B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 01:59:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovTFc-0006gU-OU
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 00:59:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ovTFa-0006gN-Np
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5z9QLYoOFm95pMVOnKF25qs3Hcqgci3miwbsOY+I7C0=; b=WEnRNC4Q1LW4pcqFNH7glS1i2V
 kaEDQvGzqIAmW+kYEyJz+wtcFGdYMxn5K44+nJ43o7z9Qm8KASDEsQ7e0H0fgrIMONz3gXy+ywE29
 IJwINg/DeD3Q2qOQVBT4kh4pO3EPtHa2WJMklwNwmUOnpb5KO6D3e+nKgeSXKA5kBmFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5z9QLYoOFm95pMVOnKF25qs3Hcqgci3miwbsOY+I7C0=; b=M/WHDxWkpNLPSW+R9PnOXNF2Pq
 1VryiRVwCoYLTckumV1bTsFx3OPYRHETHjzamgRObpVGBeFeVeg8gqZ703SqBIfrnWlo8B5j0fF/8
 2HE/6QcTOo1tiUcDg+li47aHr8nWrrBMxClpp6hsMabWBCMSO4SQfDKfVHns3IqoRzvY=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovTFZ-00AvBl-0f for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:59:30 +0000
Received: by mail-ej1-f44.google.com with SMTP id bj12so1249299ejb.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5z9QLYoOFm95pMVOnKF25qs3Hcqgci3miwbsOY+I7C0=;
 b=aoSgoXP2zY/ZjfphtaJ/kTepLvpy5D+9DdGupsf/12+gXXehkXjkHUg6wn2VSX8VwU
 bPsEpBCjmTno6sKngL1LHpPiYZymT1EQwM8fJ3Qu9ZEn83R3dKrXfbpX1BBzBd4FTO67
 V5zSbzQ7arcbflqVfWpaHTBo8VouN+J2TfYCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5z9QLYoOFm95pMVOnKF25qs3Hcqgci3miwbsOY+I7C0=;
 b=VHvRLzRxrUZlDxQTdtjNOkazcBo3tjQi60rsSkOBN1rfhKq27mlBS8QCOfzaUSqILT
 cHxdKFqZF3CxSh9FBy7aGc2Yrn6CEbDOphPnGQI9zVg3wpmVNO8d5QytnzmCFyQkfcCT
 w6RRhZccRgRKv3GoiZR42SEaTXOIi0CCb8Pr2eyJv5P+bMpP0s7PQXipuCyOV5411hfS
 2Zu8f+smkZrk/tsevfVYWpLCO80xL00ppHagi96ljPDcrW3dxO+hTynuCNMkiUExuFGl
 nCaXLC61fgDJB45d21KvP9vbJwkEzubh9Yw5K+e0zA1MzGQQuweDHOE/tsfabOVwace8
 n9oQ==
X-Gm-Message-State: ANoB5pl3k0w48XzQuC+T1WqE/LX2ddZ/WzUF8ACbDiWNjzfkb7O2JmGf
 MwUmkV0WHXJJNhXeO6AAgPL2cDEUrzCU2/+d
X-Google-Smtp-Source: AA0mqf7opFsH4vr56ladIY9eOYYfJkr4wENrTi65HmslzaIdmLGf3fo0Ctm8mFCK1aIiJwBG9fq9cg==
X-Received: by 2002:a17:906:c0c:b0:78d:77b1:a433 with SMTP id
 s12-20020a1709060c0c00b0078d77b1a433mr271942ejf.486.1668646761470; 
 Wed, 16 Nov 2022 16:59:21 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 g16-20020a1709065d1000b0073d7b876621sm7431187ejt.205.2022.11.16.16.59.20
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 16:59:20 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 h186-20020a1c21c3000000b003cfe48519a6so3312540wmh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:20 -0800 (PST)
X-Received: by 2002:a1c:cc04:0:b0:3cf:7716:8954 with SMTP id
 h4-20020a1ccc04000000b003cf77168954mr157185wmb.57.1668646760151; Wed, 16 Nov
 2022 16:59:20 -0800 (PST)
MIME-Version: 1.0
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-38-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-38-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Nov 2022 16:59:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWZAAhw7rWjCvtqz6VGh-PzG_zMnugX_KkG7gZ+a9Qpw@mail.gmail.com>
Message-ID: <CAD=FV=WWZAAhw7rWjCvtqz6VGh-PzG_zMnugX_KkG7gZ+a9Qpw@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Nov 16,
 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > Calling tty_find_polling_driver() can lead to uart_set_options()
 being > called (via the poll_init() callback of tty_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ovTFZ-00AvBl-0f
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 37/40] tty: serial: kgdboc:
 synchronize tty_find_polling_driver() and register_console()
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
> Calling tty_find_polling_driver() can lead to uart_set_options() being
> called (via the poll_init() callback of tty_operations) to configure the
> uart. But uart_set_options() can also be called by register_console()
> (via the setup() callback of console).
>
> Take the console_list_lock to synchronize against register_console() and
> also use it for console list traversal. This also ensures the console list
> cannot change until the polling console has been chosen.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 82b4b4d67823..8c2b7ccdfebf 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -189,12 +189,20 @@ static int configure_kgdboc(void)
>         if (kgdboc_register_kbd(&cptr))
>                 goto do_register;
>
> +       /*
> +        * tty_find_polling_driver() can call uart_set_options()
> +        * (via poll_init) to configure the uart. Take the console_list_lock
> +        * in order to synchronize against register_console(), which can also
> +        * configure the uart via uart_set_options(). This also allows safe
> +        * traversal of the console list.
> +        */
> +       console_list_lock();
> +
>         p = tty_find_polling_driver(cptr, &tty_line);
> -       if (!p)
> +       if (!p) {
> +               console_list_unlock();
>                 goto noconfig;
> -
> -       /* For safe traversal of the console list. */
> -       console_list_lock();
> +       }

Seems OK to me, though I guess I would have moved console_lock() up
too just because this isn't a case we need to optimize and then we can
be extra certain that nobody else is messing with console structures
while we're looking at them.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
