Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6D5EEA5B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Sep 2022 01:57:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1odgvi-0008TD-Uy
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 28 Sep 2022 23:57:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1odgvg-0008T5-JW
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 28 Sep 2022 23:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q74yArMABpzeLkr74sIBfXXMxk7/EMgQ3hoGRYitxYU=; b=ELmSXIitenKh8ZxDqiig0M2cQk
 qo5l4PMbUxbO1lRgzUlLc7u2JRnoV1NicJBaPkJj9Dz7NyUUxwC3guAkoa3nhulkwFnmLiaxxj2p8
 PwRXYTyJJ4psHBU6SYBsEG7hJ1J0bfqzlRP7xsRRra4BV5xPRbB9/EVkOi+zHOJlrOd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q74yArMABpzeLkr74sIBfXXMxk7/EMgQ3hoGRYitxYU=; b=R/iZbY3sR5u/SEhjTUBGJwgBPI
 tkDBJ0gZIEdz72qhw5ppFagaOdr7hszICnZKVqYpdBKgEkGjLtQ82nm7mhQaS9KGTTtkvAXttAQEb
 8e3SKpJWVkg+3qwi5SJ/m7amuu0gZke8D3dxf/zop4dskNYjWJ8uLBlOKw8neLX4r7YQ=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1odgvf-00624u-IZ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 28 Sep 2022 23:57:28 +0000
Received: by mail-lf1-f52.google.com with SMTP id z4so4885571lft.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 28 Sep 2022 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=q74yArMABpzeLkr74sIBfXXMxk7/EMgQ3hoGRYitxYU=;
 b=U0Q8SQFHSkScbj4cM4pTg7Yzb04zm5WgomM/5gs7MQUTxOnAoEjVy5BjCW7Lo5/BUi
 xVGQd3n/TGijftlrmbedS+TIFC4PIQ4GVxgHSTo1Hxqh7rav4zS5xPPOiO0U6zV/NMl4
 5n8EmZnC9tTRHnX8rS/uqie8PD5M0KehiVHl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=q74yArMABpzeLkr74sIBfXXMxk7/EMgQ3hoGRYitxYU=;
 b=54nSV4yihh9Hm9OIbEb3wG6In3+7Q0q2Cb2hOX2Y14tBaV329HKoVA6sZBBJsGt5EW
 o2vkXJ89fQonMne72QMHMJQ4/ttcCyvE4rBJEZvILEKERcmY5PqFK7Mh4nSr/JVkU/V7
 mhJpsztzvsrJoa7kquJ2Q3BMjZ8snmNGA2kvnPEpR8lbmvMAsGbxn57/26M9mblzB9Bi
 nXIa3LQfZHaf+TgckR2WoET26IJgMeir/oG1L7tixXIB+j/ZyZDiP38PXmGDOcuv7zxW
 pa3J8iQS1UMTnDcTBL7Z62u2cLsi7IH34KzlJmoaYtDGeOaX8s4mG3w8p6OWj4M1Xu3K
 UBlw==
X-Gm-Message-State: ACrzQf3H011zfAvsLb5rdCv6qPCAu0wkaSbGG7bP9JSn5SXaTleZwqeV
 WudgzhPM7Qq8IbrLjqXIPmE+h1rlygtdlGpL
X-Google-Smtp-Source: AMsMyM6zKLPJxTJJtIXhUzxTDOgFm4wrikMh2VSB5gRuswqRlChYCibPk4stukOZ79O2jtxEmrJJHw==
X-Received: by 2002:a17:907:6d28:b0:782:32ad:7b64 with SMTP id
 sa40-20020a1709076d2800b0078232ad7b64mr301333ejc.23.1664407986204; 
 Wed, 28 Sep 2022 16:33:06 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 n4-20020a1709065e0400b007822196378asm3127982eju.176.2022.09.28.16.33.03
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 16:33:04 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id v28so9180713wrd.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 28 Sep 2022 16:33:03 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr145687wra.617.1664407983299; Wed, 28
 Sep 2022 16:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-10-john.ogness@linutronix.de>
In-Reply-To: <20220924000454.3319186-10-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Sep 2022 16:32:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5mnR6MH+KLK9VgUCvY0rsjkMdR7un=pHmtNBBup7w7g@mail.gmail.com>
Message-ID: <CAD=FV=W5mnR6MH+KLK9VgUCvY0rsjkMdR7un=pHmtNBBup7w7g@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Sep 23,
 2022 at 5:05 PM John Ogness <john.ogness@linutronix.de>
 wrote: > > From: Thomas Gleixner <tglx@linutronix.de> > > Unprotected list
 walks are not necessarily safe. > > Signed-off-by: Th [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.52 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odgvf-00624u-IZ
Subject: Re: [Kgdb-bugreport] [PATCH printk 09/18] serial: kgdboc: Lock
 console list in probe function
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Sep 23, 2022 at 5:05 PM John Ogness <john.ogness@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Unprotected list walks are not necessarily safe.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/tty/serial/kgdboc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 79b7db8580e0..af2aa76bae15 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -193,7 +193,8 @@ static int configure_kgdboc(void)
>         if (!p)
>                 goto noconfig;
>
> -       for_each_console(cons) {
> +       console_list_lock();
> +       for_each_registered_console(cons) {
>                 int idx;
>                 if (cons->device && cons->device(cons, &idx) == p &&
>                     idx == tty_line) {
> @@ -201,6 +202,7 @@ static int configure_kgdboc(void)
>                         break;
>                 }
>         }
> +       console_list_unlock();

Seems right to me, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
