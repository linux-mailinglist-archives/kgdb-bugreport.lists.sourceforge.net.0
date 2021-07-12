Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5083C5E03
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 16:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2weN-00045F-7v
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 14:11:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m2weL-00044x-6h
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 14:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xh0/hl3rEaM0oE3+jbjU5+PdwxFL2+pFn2TrMvbM6jg=; b=ZqmZv5Q/m1nSI/4et11W9PL2sh
 12BuoNFEdtn6EZe5SIep/qxr+T1kZ8aFNwfpAMF+AlKf3eSGLOvdIijqY0qRTbt2d/5Q0QcHi5fSt
 hNdPpI077r7KPGWpmE/Rr6QNs+Akgi5kY8N9atDIFUFxM0wACDMUmPo2y0aDbmGP6CDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xh0/hl3rEaM0oE3+jbjU5+PdwxFL2+pFn2TrMvbM6jg=; b=WVzSW1yYiA69u2/Lkm6+1J7Idz
 0PcODL16PM/vs6zTc3URAeBfcf8BG7ntyrgCB46wen97oZ6qMUfAgvL8UxSCb7T7SuDzjh4WEUZFe
 qhuxhWc5zxDv7NckvVHKElGqw7DWGh9mV7rs3D3zEDtBxlyqSHC5Y6OfowOwNvUJFTP0=;
Received: from mail-qv1-f53.google.com ([209.85.219.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2we9-005pWg-Q8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 14:11:09 +0000
Received: by mail-qv1-f53.google.com with SMTP id w2so6192416qvh.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xh0/hl3rEaM0oE3+jbjU5+PdwxFL2+pFn2TrMvbM6jg=;
 b=YBte8QnlpAinhGxAXgFETYp8h/u4RH5EU5HSraJkrGuMlD0GHW4UagAdFKfhz9iNKU
 jXajwJPWxl1XBeXs6ykJMgy7I+iym12hbFZQmugKXe/7sVZE9z8U88MvpyCe616z8tqp
 Ry5/zbfGU66TjbGODAmaUJSvyDNir9iFAosO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xh0/hl3rEaM0oE3+jbjU5+PdwxFL2+pFn2TrMvbM6jg=;
 b=MUO6wlotPz8mEeOkSy+SOJlauihSNa73GWkL3e9E3aa8d3sLH6xxmgiA6ds5ewBifQ
 Ih4V+JYVtZ/T4Rv8fFdXApkkalXxHbUX7ms5rXxuTQHJUK8+TCtIApTvZkWkESdtr3BP
 k39gZEswgYoLxgyp50uckLmi9u+AN3QOCxZW9HaYf3IWGXdSCmIi6X9csUmm5AcAvKnv
 LTcfCBiMrIPi48Fr1eYkMJ5JCGV5sV2lbFN2KiZGaiedNjcwt/YYzNT2nP08TR2yBhLk
 cWGIGgwjAxoN5+O6xbD7YpDBP3KtU40zUTdC/Sj+pznCn+7eyRt/Zh7goUXG0vGO39yK
 OcRA==
X-Gm-Message-State: AOAM532I53YlfXFtDRlswedVYKZ3T3hxmtz5VqHfOlpSNEK7WxlK4i0D
 n1G6nqUOWnkiOP0Qjk7fNlaqPlxmrrxhRA==
X-Google-Smtp-Source: ABdhPJwdD4yidwCngMIEM2AqxVwLZvGC2MWM9cDs8s4eW+reF/u2z0xSrGqgOX8s7987jrclEbcgYQ==
X-Received: by 2002:ad4:5d62:: with SMTP id fn2mr3069835qvb.61.1626097275742; 
 Mon, 12 Jul 2021 06:41:15 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id o66sm6684833qkd.60.2021.07.12.06.41.14
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 06:41:14 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id o139so28950329ybg.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 06:41:14 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr64512160ybk.79.1626097274290; 
 Mon, 12 Jul 2021 06:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-2-sumit.garg@linaro.org>
 <CAD=FV=W4zMtf-Cmu1KcboJTx=G52rr6Z7hy3LvT3fS76XEbtSw@mail.gmail.com>
 <CAFA6WYOYin8v6y+Pk4mqLHjENkhyGvmX_pqWVvT1TifTahJwYQ@mail.gmail.com>
In-Reply-To: <CAFA6WYOYin8v6y+Pk4mqLHjENkhyGvmX_pqWVvT1TifTahJwYQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jul 2021 06:40:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJAAz1a0DJF0f23e+6SPWrNW2EbhWp5xiq40OCLu4m5w@mail.gmail.com>
Message-ID: <CAD=FV=XJAAz1a0DJF0f23e+6SPWrNW2EbhWp5xiq40OCLu4m5w@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2we9-005pWg-Q8
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

On Mon, Jul 12, 2021 at 12:13 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > > @@ -671,7 +671,7 @@ static int kdb_exec_defcmd(int argc, const char **argv);
> > >
> > >  static int kdb_defcmd2(const char *cmdstr, const char *argv0)
> > >  {
> > > -       struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
> > > +       struct kdb_macro_t *s = kdb_macro + kdb_macro_count - 1;
> >
> > I guess the variable "s" was short for "set". Should it change to "m"
> > ? Here and in other places below.
> >
>
> This variable is dropped in patch #3. Can we bear this variable name
> until that patch?

Sure.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
