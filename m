Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888D3C2B26
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 10 Jul 2021 00:02:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1yaE-0002Pn-R3
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 22:02:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m1yaD-0002Pa-HQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KeilyD9ahaj/44sq03A2+xgWY8Z3b90Fi9ryhOZxPFU=; b=fR96l6TNvV0nC3qdq6AZ2sHCW9
 0xjwwZw7kl1wLg9laeC8e+lmO+COIfNOu7lLFPaMGFfnYWAU2V2/60xRi/Kyo6zOqhhY0VPDaFW7S
 AsI2Ok5PNYP7nUIGh5Tjc+CR1dgV79Mm+IRL7KokUp1J9Pva+IdE42WAnqYBIPB77tE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KeilyD9ahaj/44sq03A2+xgWY8Z3b90Fi9ryhOZxPFU=; b=Vp0IkZzs6AfM/eVXG1ZDKZaQUQ
 USe/pzSQVoH5y5rrT/m1Q4WX2EiOv3gV2tEEf0aROHOGgnDyIF8kAGW6t+JsriOhr1p+dXMKlrPkc
 S68uL/jghOGg2/9d4gEzRe7Sm+FfogRX2DNQVI2nHl+GBCv6h2slqVT6y2pf2J90m4EE=;
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1ya9-002XO4-KQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:02:53 +0000
Received: by mail-qk1-f170.google.com with SMTP id 14so11103546qkh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 15:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KeilyD9ahaj/44sq03A2+xgWY8Z3b90Fi9ryhOZxPFU=;
 b=JQPh9cmQKdNIfHt+KKTETwk436zmgqj4jJMcmqZ8De0QsgicOU2RuauXHCdeF7jCmT
 hNThVxkXssH6KEkMYzJ7NaFTEYwcs83m0yKmtacXwkHurs71olQNsFt8rkXoHyRCXkwK
 dl/f2eqnEog1an+QDFoYu8JATSLT5wLymywuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeilyD9ahaj/44sq03A2+xgWY8Z3b90Fi9ryhOZxPFU=;
 b=kuB4I4fse/rPXxFd3xNLrwi2f1Ph/35QBJOoCvp880g8AHIHu3lZiIibxEVdiUDUfv
 DjH6oGyGtanchjcc21RAfEzHc6cYgi1yWMJbXKRMpIRQSY7BNHWnBQ3o9jrudvRXIA9L
 ZekG10TvYOu/jvJtJ1FtNsvhrFriPZ5CUJ/I09sMMBWroVQn07rd/sKbV+jZUXLmXZrx
 JjUw43MhRsmsg+QY5Sl9I70nad56qwKgs3dCi8X2B+fnGzE61wwTiqBuKmOABSHtH8WQ
 KRqTRbvE5og//kO4foXV1axDKyi6Kixx6PdeIYvWFEkF4PRPRlV3nVDa/S6UNsoz4Ymz
 An+g==
X-Gm-Message-State: AOAM532/GwGio1O2qHWAAf0YCFdXb0T5d7KBCAJH/JLlRjiPIWCplbMx
 cqmEH0BG13U9QT0bRSKWuc3u8lH30GLtVQ==
X-Google-Smtp-Source: ABdhPJwZ/ifkLXmaHgD3GQ45GwEVM+04qS1fi4vxc0Uo5Kw9vOjggAsvk1H73RBv7F2djNRxGAVvyw==
X-Received: by 2002:a05:620a:1a19:: with SMTP id
 bk25mr38526923qkb.38.1625866632807; 
 Fri, 09 Jul 2021 14:37:12 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id 71sm2706511qtc.97.2021.07.09.14.37.11
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 14:37:11 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i18so16626295yba.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 14:37:11 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr48821389ybk.79.1625866631195; 
 Fri, 09 Jul 2021 14:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-2-sumit.garg@linaro.org>
In-Reply-To: <20210709104320.101568-2-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jul 2021 14:36:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4zMtf-Cmu1KcboJTx=G52rr6Z7hy3LvT3fS76XEbtSw@mail.gmail.com>
Message-ID: <CAD=FV=W4zMtf-Cmu1KcboJTx=G52rr6Z7hy3LvT3fS76XEbtSw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.170 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.170 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1ya9-002XO4-KQ
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/4] kdb: Rename struct defcmd_set
 to struct kdb_macro_t
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Jul 9, 2021 at 3:43 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> as that sounds more appropriate given its purpose.

nit: Personally I prefer this to be a whole sentence that isn't just a
continuation of the patch subject.


> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_main.c | 38 ++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index d8ee5647b732..d4897fbc9d2e 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -654,7 +654,7 @@ static void kdb_cmderror(int diag)
>   * Returns:
>   *     zero for success, a kdb diagnostic if error
>   */
> -struct defcmd_set {
> +struct kdb_macro_t {

Why the "_t" at the end? To me that implies that this is a typedef, so
you'd declare a variable of this as:

kdb_macro_t my_macro;

...instead of:

struct kdb_macro_t my_macro;

Not that I'm suggesting adding a typedef for this structure. It seems
kernel convention is not to do typedefs for structures unless there's
a strong reason to. Rather, I'm just suggesting removing the "_t" from
the end.


> @@ -671,7 +671,7 @@ static int kdb_exec_defcmd(int argc, const char **argv);
>
>  static int kdb_defcmd2(const char *cmdstr, const char *argv0)
>  {
> -       struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
> +       struct kdb_macro_t *s = kdb_macro + kdb_macro_count - 1;

I guess the variable "s" was short for "set". Should it change to "m"
? Here and in other places below.


> @@ -727,13 +727,13 @@ static int kdb_defcmd(int argc, const char **argv)
>                 kdb_printf("Command only available during kdb_init()\n");
>                 return KDB_NOTIMP;
>         }
> -       defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
> +       kdb_macro = kmalloc_array(kdb_macro_count + 1, sizeof(*kdb_macro),
>                                    GFP_KDB);

nit: the indentation is now off for the GFP_KDB since you changed the
length of the previous line.

Sorry for not noticing those things in the previous version. I guess
having this part of the change split out really did make it easier to
review! ;-) Those are all pretty much just nits, so if they're fixed
feel free to add my Reviewed-by tag.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
