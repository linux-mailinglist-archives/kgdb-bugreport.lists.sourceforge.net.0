Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 431061EED22
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Jun 2020 23:12:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgxAK-00013c-37
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Jun 2020 21:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgxAI-00013Q-QF
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 21:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/2vvNqjDrDfa9zj4WkpMzbskQTo3mnO0g8KBrFA7s8=; b=FalgjOQc6IVgZXxnIaH+NQ6puB
 gr7dpdRGW1JtUzbTrqV7mRdxX9vfgRqDbyHLtb3J9O0HZvPLpjbzPowNs/ol9TRhUMRBm5SBUvEX+
 yvHTOXXzqv726DO5MxWS1sfgtecuGy+01yNQPVtVuzQrXfANgz6FDu4Bb+HD+bFM/uqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2/2vvNqjDrDfa9zj4WkpMzbskQTo3mnO0g8KBrFA7s8=; b=A/ei/9N2ZfDj771GCK2FJvWxG3
 GOZZdF/0HvuS3yXcTakQ6NmhuGV7/6MedF3z5X4aWLzODOSdYpDwe0Q6Lly4IL7drA+sIeG1hYxJq
 OB0BQO906z+y2CL5qYGPYlrpfvPoOEugWhIILJCUjIX8friPkiKuJM6Ug4zoHdgr8XBY=;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgxAH-00C7XP-HG
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 21:12:42 +0000
Received: by mail-vs1-f66.google.com with SMTP id r11so4394846vsj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2/2vvNqjDrDfa9zj4WkpMzbskQTo3mnO0g8KBrFA7s8=;
 b=CUAua5qV8xF2sA5jNCA2iEaVCwy8+VpWn+NmTfcE6rq0kqEpaokEJWOgU5rdPmU2g7
 1Vv5n3TRANrrPNT8DQXFfzcsyspUq7QIQNzjXHwb51Ovp3FYXom9Bk6Tt9wDXsmFiYI3
 sQsGqUR7iG/5s865l6vTA02WgDgK6RP0D8h7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/2vvNqjDrDfa9zj4WkpMzbskQTo3mnO0g8KBrFA7s8=;
 b=iooE1zrosYoggUgWrHxYNstAKGNChxEIUAlV7Xq8dE5Xl2ieRc2GvYxjTWRS+wSpci
 RlyxM+BYWKxHtXxuiQ8W854Gh0zekquZg7/eDHPQs2OvbHDH0zj3VYSxuCu6eeKI06xH
 fc8ts24uAg5FMRVxCenBcaFfUeUCJQBdxDAKTclu1N76rt2TB1KXWTPdAEJ4SS8WQaMt
 ZpJDS8fPCK1uQZJ8WEG5KQ4FEl0FKvNRusKEvViJLb+qaLCyh2kwR/t08O6p15UEPtcr
 hQWd9FFW5+STdHorYx0k7LrCRSCWCER9A94hh1d+5FHMeZ+e3D6BNdlnFNz8XSuJ87DO
 QHKQ==
X-Gm-Message-State: AOAM533Nl1Xc1SjULi+IehyrOvFdV+HRWfMFuxhFtTDMbeVkAVxFVVR8
 dAKxcHU8dNVT9vi/TXHkwdJ8yuFkuV0=
X-Google-Smtp-Source: ABdhPJyfjFPc+YLvKDMUoxV8S9SKRZlbPVPWznQgmva60EbOi3P066Hu3wDXGeuGJtsn0JYAUXGlbg==
X-Received: by 2002:a67:3c6:: with SMTP id 189mr5266628vsd.71.1591305155387;
 Thu, 04 Jun 2020 14:12:35 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id c68sm864550vkc.34.2020.06.04.14.12.34
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 14:12:34 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id c9so2560341uao.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 14:12:34 -0700 (PDT)
X-Received: by 2002:a9f:2804:: with SMTP id c4mr5242531uac.8.1591305153580;
 Thu, 04 Jun 2020 14:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
 <1591264879-25920-5-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1591264879-25920-5-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Jun 2020 14:12:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URj6UiZgH_g3twcYgv=USGr7YUV5SkW3J-WYR1vs+MDw@mail.gmail.com>
Message-ID: <CAD=FV=URj6UiZgH_g3twcYgv=USGr7YUV5SkW3J-WYR1vs+MDw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgxAH-00C7XP-HG
Subject: Re: [Kgdb-bugreport] [PATCH v6 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Jun 4, 2020 at 3:02 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> @@ -433,7 +432,8 @@ static int kgdboc_earlycon_get_char(void)
>  {
>         char c;
>
> -       if (!earlycon->read(earlycon, &c, 1))
> +       if (!kgdboc_earlycon_io_ops.cons->read(kgdboc_earlycon_io_ops.cons,
> +                                              &c, 1))
>                 return NO_POLL_CHAR;
>
>         return c;
> @@ -441,7 +441,8 @@ static int kgdboc_earlycon_get_char(void)
>
>  static void kgdboc_earlycon_put_char(u8 chr)
>  {
> -       earlycon->write(earlycon, &chr, 1);
> +       kgdboc_earlycon_io_ops.cons->write(kgdboc_earlycon_io_ops.cons, &chr,
> +                                          1);
>  }

The get_char / put_char functions are pretty unwieldy now.  If it were
me I would have done:

struct console *con =  kgdboc_earlycon_io_ops.cons;

...and then used it so the lines didn't wrap in such a terrible way.  ;-)

I'm not sure if I'd spin just for that, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
