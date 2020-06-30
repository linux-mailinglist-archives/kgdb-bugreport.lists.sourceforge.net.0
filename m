Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476020F3A5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 13:36:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqEZK-0002JH-73
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 11:36:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jqEZI-0002JA-S4
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 11:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZwFfXOGz4fxYZqVjks/MQV6KVpu2SdXqlr5+gsasvuE=; b=dWOs+AprbIe3E/52NLmRavMLYY
 HKqaq2esaiJp/zLvZve00MbZBm7STEkBfWrstG6GMIX3P8PKQygCiHVjpJaAjdQTw20+Em5A78pRX
 zB79INMQ+p0TxiZttHa0S/33A+2onXyB+u5ohv+6tEzwf8ctnv4hLzlxS9s8uyoamPhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZwFfXOGz4fxYZqVjks/MQV6KVpu2SdXqlr5+gsasvuE=; b=eNNd50vVjCORa8egeIa89GvAQS
 t7srj0AW6MwKoa8wzCBW7kzaSE7j6bc1flH7g13DoKHihW8fs7a5z7N14S62lgu1VPSiXUD0Wh3Ju
 SCspszu0HTHBMD+QtoNcAm5ASkce7f4VmhsPlAKT5qRzQcIyRFcGkTzBte3fr/xfd2+0=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqEZG-002vIb-1z
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 11:36:52 +0000
Received: by mail-lf1-f68.google.com with SMTP id g139so11130556lfd.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 04:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZwFfXOGz4fxYZqVjks/MQV6KVpu2SdXqlr5+gsasvuE=;
 b=d2Z/LJOrxI2sK/tnaStkPJbMfShNAs6iVqT+bRYw0LM4swNXBIn2gO3o+QA/oDFXXu
 1H7pynjzt1f7s6oQ7MJ7ffa/nyEWclXo/+z/QgQEAqK5MR9ISJaKinJpScZQLM1BUqtD
 oItWSrmUk6BAJEfVY5q8jDk1QbUIIVylOrDDym0HHRr/4uskhZMJqxMveoFBUO7CnKi6
 tgFnwrDpCuFVoQCdrq5oOmrBbjcGyRMaKhWnlsaNWLba76yPtqZegF2oogYgqqsJ54Gb
 jNdCJGUm0ietNh0RWrauTNTxTIjpkx0LttlMXfKYPPLIk6gbIexfbYcDPL0TbzOcvABn
 n1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZwFfXOGz4fxYZqVjks/MQV6KVpu2SdXqlr5+gsasvuE=;
 b=UBCHQ3m1ZAsoQ3W0a0158Y1XtvqRzO1VCEiQc697GHUF/ZC2cS9kHTgnR/5w8mqgUw
 ZE2HsWH/WC9D3AXZeBZf+zYIm6HmpZxpCb6bOQe2pQEpyhf5pYqmfDtcbjSvhe5C6vfx
 MYLxFpogSXRIMKn71XP/BjeAXD4vCsNFVJUHHngspIfpc6hkQxjbfw1ByOS/GVElVJ3x
 bvz5+CjaRrHozfNHytRKhd7fX4LHUlwsATYCQm0fzdrzrD1kN2u/A2STUjAwATUTQTRD
 zZY7Xi4dWXQa0NbGVOx9ivH9zqgMwcoMTuUe5nPnzaOKmJI3GrVLLZ2jBrscVsJaD6hv
 G+XA==
X-Gm-Message-State: AOAM531shtAlXUwPTzIYNqPbvh2txRryWlT2NDhIjZhxEjdBeDAKfIe6
 ZS1W0kqzLKocUwolFitiXWl6Y9HEaQERvuC+XRD8aw==
X-Google-Smtp-Source: ABdhPJy4I/6mxnpgXaNzE6Z3Ywobj35ziVNzhzkEx84vEjsqwwojs1dmBLrfTNEH+2Ne4WTLUHFLueH+JsJLBp1XV1c=
X-Received: by 2002:a19:cc93:: with SMTP id c141mr11746250lfg.15.1593517003341; 
 Tue, 30 Jun 2020 04:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAFA6WYNpCG2xPERd=NeKf+EthbX+1R4iieOL52kWnBp8y_+Nbw@mail.gmail.com>
 <20200630082922.28672-1-cengiz@kernel.wtf>
In-Reply-To: <20200630082922.28672-1-cengiz@kernel.wtf>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 30 Jun 2020 17:06:31 +0530
Message-ID: <CAFA6WYPDTKQ4cm+TMmRt+qDiF+s3gggCsW1gfzCaaOdP9rJgdQ@mail.gmail.com>
To: Cengiz Can <cengiz@kernel.wtf>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.wtf]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jqEZG-002vIb-1z
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: remove unnecessary null check
 of dbg_io_ops
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 30 Jun 2020 at 14:00, Cengiz Can <cengiz@kernel.wtf> wrote:
>
> `kdb_msg_write` operates on a global `struct kgdb_io *` called
> `dbg_io_ops`.
>
> It's initialized in `debug_core.c` and checked throughout the debug
> flow.
>
> There's a null check in `kdb_msg_write` which triggers static analyzers
> and gives the (almost entirely wrong) impression that it can be null.
>
> Coverity scanner caught this as CID 1465042.
>
> I have removed the unnecessary null check and eliminated false-positive
> forward null dereference warning.
>
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  kernel/debug/kdb/kdb_io.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 683a799618ad..81783ecaec58 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -545,18 +545,18 @@ static int kdb_search_string(char *searched, char *searchfor)
>  static void kdb_msg_write(const char *msg, int msg_len)
>  {
>         struct console *c;
> +       const char *cp;
> +       int len;
>
>         if (msg_len == 0)
>                 return;
>
> -       if (dbg_io_ops) {
> -               const char *cp = msg;
> -               int len = msg_len;
> +       cp = msg;
> +       len = msg_len;
>
> -               while (len--) {
> -                       dbg_io_ops->write_char(*cp);
> -                       cp++;
> -               }
> +       while (len--) {
> +               dbg_io_ops->write_char(*cp);
> +               cp++;
>         }
>
>         for_each_console(c) {
> --
> 2.27.0
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
