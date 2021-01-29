Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861D308CBF
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 Jan 2021 19:50:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l5YqM-0002SP-Ru
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 Jan 2021 18:50:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l5YiA-0001Ai-UT
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 Jan 2021 18:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ku2Wtzp4AOvn1tZk6Gm2zAKzbzJRvwj6cHEhqib91lQ=; b=IQi78nkM1mmSu6xXgK/wGA7L2T
 Ju+nyzNGAf8agp7nwONPK2y+mShxud5XK8qHp4LkP90ikXLQuEu3vJVHLd0xmoMRro4GLh1K5PoPk
 9ivxUH/gnQ4DsKGLwvurkxvPLJL18WWta1BxGLjQE2RVnJwsxx8N7Aar8rxbWMwJsXMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ku2Wtzp4AOvn1tZk6Gm2zAKzbzJRvwj6cHEhqib91lQ=; b=M7l7RgZ3v2S4mG+TTN9JT0ebHQ
 96UHUs557iGA7BhErT/GWT7xIN3j9htBLejyISVc+rghNpag36GvrDgnE0GxvSDQap3DY8J+n9v9r
 L/kU8sEdqHzZjY/RO4j90vMoTcMjGKzNI+H+zINxCN842xuZulcZO36p+3bOrb9GdMtM=;
Received: from mail-qk1-f175.google.com ([209.85.222.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l5Yi3-001dEC-FY
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 Jan 2021 18:41:38 +0000
Received: by mail-qk1-f175.google.com with SMTP id n15so9709342qkh.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 Jan 2021 10:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ku2Wtzp4AOvn1tZk6Gm2zAKzbzJRvwj6cHEhqib91lQ=;
 b=K9l7yrIL02K9CtNDwCzSRzt4c/262v5+QIWUnoorMP74a3TbbcH6OrrhSX/Xb4J5i3
 koeDC2PCmRupZIrDafOjlaSYrjbuUrtA1QPO/DQne/yJ+48aJ9iUqE4ncbJNXKZo/IHh
 p/sY9V/ssGbQaEiaU9S2f1mnWdNMW6YluyDlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ku2Wtzp4AOvn1tZk6Gm2zAKzbzJRvwj6cHEhqib91lQ=;
 b=QtXviF3Y2/dfdx0zxrVATgUwZ9CU8L2QAuq6kXQEj6wu0MQBlYkWEeb3xkumI0Etv2
 kB6SD42FEgWO6DFB9aUqyL9rLZY4LkcCNNvyPRgAXSGCtxGIosEszoSMBoO4ixQ+1bzz
 wueOZiH3cv/iKlmCpYrzM9or3fOYQzP4wQYA8b3l4tcEOtPEHv6o6gUrt0fyS86y2MkL
 O1vVUJ2MRMqS0dtp8dVkItJXuFul33IwH5jlHpdtpuK/O7YjIqJV6Dlj4DgI+8mT+UUE
 VIXR9l0mKgD+ufsSxAzxS0SKVwT+BWf4IW+ISNOV0wmFJ+Yujmyf178gbkzhGoGe+AsZ
 gVkA==
X-Gm-Message-State: AOAM5302CjR/FYKheGfDP75+XtKwxPl9ycEZX+94DvuFTzEbdnGe9qf2
 EFpD8Jch3sNZwFUGzfAa9msvvc0pH4kBlA==
X-Google-Smtp-Source: ABdhPJwM5NLg6a91Ib2jO227r+P84yLURUmXyw2AZ9oHqTPj34j9QECpAriCGYzwvg9tszSRmfpxJg==
X-Received: by 2002:a37:9281:: with SMTP id u123mr5594898qkd.77.1611945685362; 
 Fri, 29 Jan 2021 10:41:25 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id e5sm6474842qtp.86.2021.01.29.10.41.24
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 10:41:24 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id i6so3505016ybq.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 Jan 2021 10:41:24 -0800 (PST)
X-Received: by 2002:a25:b74d:: with SMTP id e13mr7800330ybm.405.1611945683825; 
 Fri, 29 Jan 2021 10:41:23 -0800 (PST)
MIME-Version: 1.0
References: <1611820190-12559-1-git-send-email-stephenzhangzsd@gmail.com>
In-Reply-To: <1611820190-12559-1-git-send-email-stephenzhangzsd@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Jan 2021 10:41:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXJD+cyZajdEpd_KvpVq9b7_XV=iP2+QwxaXjiRb_xtA@mail.gmail.com>
Message-ID: <CAD=FV=WXJD+cyZajdEpd_KvpVq9b7_XV=iP2+QwxaXjiRb_xtA@mail.gmail.com>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.175 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l5Yi3-001dEC-FY
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: kdb_support: Fix debugging
 information problem
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Jan 27, 2021 at 11:50 PM Stephen Zhang
<stephenzhangzsd@gmail.com> wrote:
>
>  int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
>  {
> -       if (KDB_DEBUG(AR))
> -               kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
> -                          symtab);
> +       kdb_dbg_printf(AR, "symname=%s, symtab=%px\n", symname,
> +               symtab);

nit: in this file it seems like convention is that alignment for
continued arguments is to match up with the first argument, so the
line starting with "symtab" needs to be indented more to line up under
"AR".  Similar in some cases below.


>         memset(symtab, 0, sizeof(*symtab));
>         symtab->sym_start = kallsyms_lookup_name(symname);
>         if (symtab->sym_start) {
> -               if (KDB_DEBUG(AR))
> -                       kdb_printf("kdbgetsymval: returns 1, "
> -                                  "symtab->sym_start=0x%lx\n",
> -                                  symtab->sym_start);
> +               kdb_dbg_printf(AR, "returns 1, "
> +                       "symtab->sym_start=0x%lx\n",
> +                       symtab->sym_start);

nit: This doesn't need to be 3 lines anymore.  Probably best is to
stop splitting the string.  In general the kernel convention considers
it better to not split strings even if you have to make long lines,
but in this case you won't even make a long line.

Other than those nits this looks really nice to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
