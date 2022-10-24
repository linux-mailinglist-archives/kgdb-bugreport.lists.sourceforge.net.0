Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE860BE5D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 01:15:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on6f8-0003pR-3Q
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Oct 2022 23:15:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on6f6-0003pL-OJ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Oct 2022 23:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIHl2iCS5umkUQOttHMwOxT4DU4dTXsnDaz+mZRAMKc=; b=RYfq1ZApbjK27243spxKgqe6ua
 D7nZCwLIB9leHxoW3Lm28vQKjMiz9x5oI7gH8MjnleoV0OH0FhPn9SPZnhAuuBR3e48apKvlAkk0K
 2rc5orrK7FnpmqkX2dHaM1IBYLykI93Y3c9qdgsuBOuaEtbPQ+fwyRBIQO0rEZpBWGwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oIHl2iCS5umkUQOttHMwOxT4DU4dTXsnDaz+mZRAMKc=; b=WpntVbhFRTaG0Cc3hcugJ9Ibyc
 yBdaORmaNefukhdJeA8ZaIJyCnrMR3U9bIoY9tq3N+xUvGekuiZdE6lXaUvAUAXAr+JNvpsngW5wE
 P8YeRdY69+umCb07yGp3pRc6fRmw9Pupro6scQdQCn2SmsZbeAnTpAKGNXplpMsTeo7M=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on6f5-00GAl3-2B for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Oct 2022 23:15:16 +0000
Received: by mail-lf1-f48.google.com with SMTP id be13so19120737lfb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 16:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oIHl2iCS5umkUQOttHMwOxT4DU4dTXsnDaz+mZRAMKc=;
 b=oZyDNuZZ8bs6Dd/+bmcm0ORHJLVHkh6oX/lOWkQd7odI9UAqCD7O/wCA/hDvorihH3
 N9+QLewwBtMtqshKTjtsp9e5sf8Q8V9IMkMUcxglNK13SVPGIcxHiUROeBAQPe//FtdZ
 MC3KWgqs6B/AegdXOlxhnQfyBH4y0fiqdEFFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIHl2iCS5umkUQOttHMwOxT4DU4dTXsnDaz+mZRAMKc=;
 b=ayVwg22eCkxZyTSiF0GzNGiM57i0z6OUi28jXHMR8hW6WxaPW+WLvwVUfO/mMqb+t7
 hOj+7V26uT8J3idUQDHPgp0CHb4OWzssyD2muRCqOCyMhHuADlovoZVvtSujU8KDerGs
 Y8DVrsj82Z0kZb97snCFMANTT9DlR2EL84P4+vlXoO3V2I18nyZModb2BbSl/oUe98lP
 xOQyUE/LogBDtcs1VRGBQSItSavpRxPtAS30kldp4EqbkCCchc4/58s7PaNq6QMPhZCT
 Tcq3qcOe9sSuY4vjZ2wRSQYFJOIBZEbcERbb1OkjBBsBa7f7PnbdOi/hBmEx0sIRoeQ6
 ntAA==
X-Gm-Message-State: ACrzQf2qbPDe1ZIYp+uIBVkAsESjllHpeA+cd5eMsWN5gbhtcz3rTH2c
 aLiic5IAuWh1SmhNos1GNoiCqBvGa/9FU5N9
X-Google-Smtp-Source: AMsMyM4srsXzXLAmhi3J7uKNJQejGf4OFSzGu8oT+UwF48ytJOJNdc/RP080wXOiDtZ/wmhLZ5FsJQ==
X-Received: by 2002:a17:907:3e9c:b0:78d:ce8b:8548 with SMTP id
 hs28-20020a1709073e9c00b0078dce8b8548mr30400922ejc.427.1666651596031; 
 Mon, 24 Oct 2022 15:46:36 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 vs22-20020a170907139600b0077826b92d99sm480553ejb.12.2022.10.24.15.46.35
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 15:46:35 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id l14so11006942wrw.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 15:46:35 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr23635683wri.138.1666651584545; Mon, 24
 Oct 2022 15:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-13-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-13-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 15:46:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
Message-ID: <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Oct 19,
 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > Replace (console->flags & CON_ENABLED) usage with
 console_is_enabled().
 > > Signed-off-by: John Ogness <john.ogness@l [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.48 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on6f5-00GAl3-2B
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc:
 use console_is_enabled()
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

On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  drivers/tty/serial/kgdboc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index e76f0186c335..b17aa7e49894 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -533,7 +533,7 @@ static int __init kgdboc_earlycon_init(char *opt)
>         console_lock();
>         for_each_console(con) {
>                 if (con->write && con->read &&
> -                   (con->flags & (CON_BOOT | CON_ENABLED)) &&
> +                   (console_is_enabled(con) || (con->flags & CON_BOOT)) &&

<shrug>. I guess this is OK, but it feels a little pointless. If we're
still directly looking at the CON_BOOT bit in con->flags it seems
weird to be accessing CON_ENABLED through a special wrapper that's
marked as a `data_race`. In our case it's _not_ a data race, right,
since this function continues to hold the console_lock() even at the
end of the series? I personally would drop this patch but if you
really want it I won't object.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
