Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF5862D048
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 01:56:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovTCq-0006br-6Y
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 00:56:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ovTCo-0006bk-IR
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1n9Efk70GF888Q8DxstqVav/EqXxYg0mmKjGntmJnKE=; b=d2841JLvRqHIiCZVMIbDpxIfJa
 CpSMG76M/eeiDrG1QSKxlB1TXir7huUYL1HY3otmWfv0eUK5wQ9umUVRtjN/K/MniKjosVOzpXjfb
 9J6y/YeB6KYbYqX86WbLTBckWaQun5d5nEdK2VsoapVqe4jVmgokDhW4mqHULSvzWxaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1n9Efk70GF888Q8DxstqVav/EqXxYg0mmKjGntmJnKE=; b=GD6S4DCc6O600rCOoJ6hNnzUcB
 FPt4MplY9vXI2rymz7+rI74GKwrfAisliu+4ry0tLqCfBuS2EipTCnsVFj3UqIOIvwIaBzoIzcTnT
 8mw7Wn2l1W7bJGcdEihhKXlRWOoJch61QFYVKH/ythvwWmgQMXa0fC0ntMBlhtEgxiBQ=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovTCk-0008PU-OT for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:56:38 +0000
Received: by mail-ed1-f53.google.com with SMTP id z18so363272edb.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1n9Efk70GF888Q8DxstqVav/EqXxYg0mmKjGntmJnKE=;
 b=jfAiRCbUBmzEJVryVoKrNvSRIVoS+m7YdWOdzKGdzU2SLFWxIZppc7/zdSDdZxS94A
 fSKXhPJgpc63X9youj+aXT15h+AF6oXExh9JstLh0qlntszrF2SdHhDIoGha0Vz4M3Qr
 zIOEF9lOEJmiQJRWePqZgcbAykhMpuRNHB9+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1n9Efk70GF888Q8DxstqVav/EqXxYg0mmKjGntmJnKE=;
 b=FQh4UVuNWYifyl2rAk7RcW72uy59Lzhrz8VHZDhEGw6NSZENML4o3MTej9cgwdXvHh
 ejJEANvWJLkZm02wZDiLnP/CVeail2B8cCuAgOi/cO12BB9gYAwwUWPNCEYvahQC6i4f
 rh6anKu3obEhDLMJOx11b/8XcMYsW5LSXoVYSXMJba23AhL+R9uEZi6KAWPphfJRawfr
 Y8ssMp4BZpAeoaeCkEBhYSNjNRajCiqA2aVojCQut5Ab86N+f91a0w+zEksasyOUibLv
 azrPGgkT89EjTaYB6vV251VnxFYMME6BXXWAlKsPRfemjbEGbuk/EvY4U5lcxnx5yWz1
 rCjQ==
X-Gm-Message-State: ANoB5pnNf6lakniWcd9GSys23NQD7r0qFBvSvGu3k5dABi0fy16uJBZX
 DDM6wbbLR+qIuTFsg5rXmBOPF6BzVhnzRce/
X-Google-Smtp-Source: AA0mqf62AsJaTbneaJOgK1znE+lVHHFsU3EAMyS7nuJgp9URm8vMGb2nx40PnEZeRAjmewNAJCcUVA==
X-Received: by 2002:a05:6402:3485:b0:468:89dd:d326 with SMTP id
 v5-20020a056402348500b0046889ddd326mr178796edc.352.1668646587888; 
 Wed, 16 Nov 2022 16:56:27 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 c3-20020a17090603c300b007af0f0d2249sm3941034eja.52.2022.11.16.16.56.26
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 16:56:27 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id cl5so374085wrb.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:56:26 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr37800wrj.583.1668646586474; Wed, 16 Nov
 2022 16:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-39-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-39-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Nov 2022 16:56:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VouG3ihFCg4gC3dNFs7TqzpDgowHd38y8fR8qiTfRw_A@mail.gmail.com>
Message-ID: <CAD=FV=VouG3ihFCg4gC3dNFs7TqzpDgowHd38y8fR8qiTfRw_A@mail.gmail.com>
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
 wrote: > > kgdboc_earlycon_init() uses the console_lock to ensure that no
 consoles > are unregistered until the kgdboc_earlycon [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.53 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.53 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ovTCk-0008PU-OT
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 38/40] tty: serial: kgdboc:
 use console_list_lock to trap exit
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
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. The console_list_lock
> should be used instead because list synchronization responsibility will
> be removed from the console_lock in a later change.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 8c2b7ccdfebf..a3ed9b34e2ab 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -558,13 +558,13 @@ static int __init kgdboc_earlycon_init(char *opt)
>          */
>
>         /*
> -        * Hold the console_lock to guarantee that no consoles are
> +        * Hold the console_list_lock to guarantee that no consoles are
>          * unregistered until the kgdboc_earlycon setup is complete.
>          * Trapping the exit() callback relies on exit() not being
>          * called until the trap is setup. This also allows safe
>          * traversal of the console list and race-free reading of @flags.
>          */
> -       console_lock();
> +       console_list_lock();
>         for_each_console(con) {
>                 if (con->write && con->read &&
>                     (con->flags & (CON_BOOT | CON_ENABLED)) &&

Officially don't we need both the list lock and normal lock here since
we're reaching into the consoles?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
