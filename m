Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BFB1EC460
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 23:33:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgEX6-00067J-9t
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 21:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgEWr-00066Q-RJ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2rCy6JhciRmnrRJ+3cwFrQGHFe5sBy1qAr/EQNm0QcM=; b=E9NlScL4n4Y+QuumdDYinCK1GC
 lRHTgeOfjHunkeh19BCY77UJUygcZQdyPFrulm6OkTkP2+fgk1QPqosN+mBUZZo3UOtKu27T0O0Jq
 IQ/wXITHiK5CW1jRQ1ejl+GV6Sanm9evK2fnoyByUfsHlJ8j4hXJNWW0Mr37W0mSSkTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2rCy6JhciRmnrRJ+3cwFrQGHFe5sBy1qAr/EQNm0QcM=; b=bNKim1FcLGsgne6NJX5jmcy8a6
 HNmOQgaPNliKfYVbB+MttbtZvqDo+UipXlIpQFGNu3XAlLCRVQIiXEV/5BmVO5Qv/M+4xh3uEl71s
 ITJ0UL76H6f8gMOojYvxLQOMiF291x35bO8fRPmDapjSfBohgjrw0VBoHvmGxFWutI9w=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgEWq-0037Vc-3q
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:33:01 +0000
Received: by mail-ua1-f66.google.com with SMTP id q15so127346uaa.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2rCy6JhciRmnrRJ+3cwFrQGHFe5sBy1qAr/EQNm0QcM=;
 b=ciixlNC0q8jiB9c1y5NKtCxgjskcRH5ZADVDSGiuv1LafL24gHJAWjAAOzHUwhxFaP
 yuVuXTSwK7lwK5QiEtlqu46S7j17gkm8Ki1FB/8j7VTmrdi57wfGjUZ74VcpqclUvGbU
 8N9UENxO7x0eTZsNRlRFUZLK5q7WoDrzvPCIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2rCy6JhciRmnrRJ+3cwFrQGHFe5sBy1qAr/EQNm0QcM=;
 b=cs6CGGPAL01QECkJsmR8Z1v6TFv6OmYT/Q0/i87ei5+wlShOmmooGPkumpwuCIemQb
 ZHtqP2pHGDB18QdjyyNhOAR5r0Rc7jG22im4UXec00yHpetCJ9b1sRudrCzVsedUmt7y
 66PjQHqjRvntBndMC7KHxtwJk2Vbd+95NbcdOBkW+Iv3R9EHUj9XSGSZAFgDvjuTSHwu
 +KEsSa5dn8SwEBmUtgAGsw7cfB0726nuCTqgufKJQupwh8Mox4/YoBd4Xw7YEQ7hiyBW
 zq7mRA5VsKs2nFV25MlEtn/vlb0YyMjL2eZWyHphyO0FDRRzImQTcMR+U3X4BI+jmWeC
 vpSg==
X-Gm-Message-State: AOAM532dMpjHaral7K3AArRsu3cRpUYBI1i48mtbr+16V4xZSOT1DENa
 8g44WAYBXkE6JEo5QH1cc9LkvTAQ9Pk=
X-Google-Smtp-Source: ABdhPJzmuVpWHOfi9I0CQLYD1cBuZEC9pIPv/aoG4SXdkTih51g/6lfWTZasycty7wBtj2v4PPI6/w==
X-Received: by 2002:ab0:7619:: with SMTP id o25mr5930370uap.109.1591133574133; 
 Tue, 02 Jun 2020 14:32:54 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id x136sm29912vkx.13.2020.06.02.14.32.53
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:32:53 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id b13so131179uav.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:53 -0700 (PDT)
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr22707773uav.0.1591133572856; 
 Tue, 02 Jun 2020 14:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1590751607-29676-5-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Jun 2020 14:32:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WZwUx0SKO96g6vqh3qgwq5xeaAOoT-Qgx3JnEB3c1AkQ@mail.gmail.com>
Message-ID: <CAD=FV=WZwUx0SKO96g6vqh3qgwq5xeaAOoT-Qgx3JnEB3c1AkQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgEWq-0037Vc-3q
Subject: Re: [Kgdb-bugreport] [PATCH v4 4/4] kdb: Switch to use safer
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

On Fri, May 29, 2020 at 4:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> In kgdb context, calling console handlers aren't safe due to locks used
> in those handlers which could in turn lead to a deadlock. Although, using
> oops_in_progress increases the chance to bypass locks in most console
> handlers but it might not be sufficient enough in case a console uses
> more locks (VT/TTY is good example).
>
> Currently when a driver provides both polling I/O and a console then kdb
> will output using the console. We can increase robustness by using the
> currently active polling I/O driver (which should be lockless) instead
> of the corresponding console. For several common cases (e.g. an
> embedded system with a single serial port that is used both for console
> output and debugger I/O) this will result in no console handler being
> used.
>
> In order to achieve this we need to reverse the order of preference to
> use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> store "struct console" that represents debugger I/O in dbg_io_ops and
> while emitting kdb messages, skip console that matches dbg_io_ops
> console in order to avoid duplicate messages. After this change,
> "is_console" param becomes redundant and hence removed.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/kgdb_nmi.c | 2 +-
>  drivers/tty/serial/kgdboc.c   | 4 ++--

I don't think this will compile against the "kgdboc_earlycon" patches
that landed, will it?  Specifically when I apply your patch I still
see "is_console" in:

static struct kgdb_io kgdboc_earlycon_io_ops = {
  .name = "kgdboc_earlycon",
  .read_char = kgdboc_earlycon_get_char,
  .write_char = kgdboc_earlycon_put_char,
  .pre_exception = kgdboc_earlycon_pre_exp_handler,
  .deinit = kgdboc_earlycon_deinit,
  .is_console = true,
};


> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb..bc0face3 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -273,8 +273,7 @@ struct kgdb_arch {
>   * the I/O driver.
>   * @post_exception: Pointer to a function that will do any cleanup work
>   * for the I/O driver.
> - * @is_console: 1 if the end device is a console 0 if the I/O device is
> - * not a console
> + * @cons: valid if the I/O device is a console.

optional nit: add "; else NULL"


Other than that this looks great.  Feel free to add my Reviewed-by:
tag once you've fixed the error that the bot found and resolved with
kgdb_earlycon.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
