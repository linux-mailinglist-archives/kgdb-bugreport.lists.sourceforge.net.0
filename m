Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 015AD30B411
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Feb 2021 01:28:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l6jY7-0001g9-La
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Feb 2021 00:28:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l6jY5-0001fk-VZ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Feb 2021 00:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8UGZKvaHFb3iDS8/ZSso0ZzQe1AcopNzi6dHcSpP2yM=; b=Gi79W0naNn50BEvLwRHHdXMiLI
 qkf5XHgwkv8vMkIXTLH2eNL13CCaJyqMqdJn0XU+fsRlH+EJmlKaUxBRFDAB6Ei7I7yPBJ/GEvvob
 XSg0Xa/dRE68J+CRmWE8ZGozsQZur8Oipr1MX4cmUZkucrQfcnukUJKX8rIIghm1uDag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8UGZKvaHFb3iDS8/ZSso0ZzQe1AcopNzi6dHcSpP2yM=; b=AixVltY8/z8oN2BG3x2Ih6TNQh
 jhRQRxi/vPT67JovonCCm5nMc333f9zTtGoUI4FFqKNlHwZuBCnYqkrSaEBylrsH19TEMhj3YKE3r
 KoeGUFxi3PIN2IkgOaBb4RG3x56O950pqntFsRULTuI4VxaIT1sfsfY7mFU0qy6QF3uA=;
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l6jXw-00CYd5-Ir
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Feb 2021 00:28:05 +0000
Received: by mail-qv1-f44.google.com with SMTP id l11so9143743qvt.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Feb 2021 16:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UGZKvaHFb3iDS8/ZSso0ZzQe1AcopNzi6dHcSpP2yM=;
 b=CuufbgPkddjEWWVVV/V3NZVBNOmyLbUtF8RcSt1Mga0OrI7WapMLmWqYwZeJe3rsGv
 uEFI05upNMWhBKhJBD2b7bxI0HUgQGNFmODaGysF4PFim8I5g15rl/FMniToWPXl1o68
 ZVsDdJjGHsu8q1knI5YjBmUNgGRu4I9tHeYsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UGZKvaHFb3iDS8/ZSso0ZzQe1AcopNzi6dHcSpP2yM=;
 b=Bj6NaPulr0QGyUnQC3nolv3TX18mnxK5CyKTChiNrNldGwDZYlVqcYLGJkK1StztsJ
 Pdk7kY69OSXnPz0RTGOczyXYJsHQqjhh65JDEPEpyCidA6vF32UaLT15VYANutL4Nsrn
 uFhnnZ7CcKneFAraenc1FWXuvX+ZZpAqkarVJUbm3iLqOoUy73po1K5+fEQZ/zK4+CJn
 U+mlw54lxso/43Ey8q2A8N1/1bQL1d8miiC+IhmAugIO1gK2wURZEPoVXENO1AQfZ6w3
 GkPdWWUilkTYLeYhwklqCalGob3lHXzTNPSEpmSeR1SSn+sDWRoL/h9xdUl/9Zp1DOom
 DkpQ==
X-Gm-Message-State: AOAM532FMad7P2nEpj0gqQs6aZrWLflc8VkgXU6NY2qELIl0sdofW70T
 B7REFhxVjrt3iZtqBQCIxnCBgw3QTv+gtg==
X-Google-Smtp-Source: ABdhPJxyuRYFOSh4fkqdJSUi9OJ43nY759vN99d66l8s6vzbMqX9KsEPaApqe5xgIEoP3w1GptvTcA==
X-Received: by 2002:a0c:a99e:: with SMTP id a30mr18105599qvb.38.1612225670133; 
 Mon, 01 Feb 2021 16:27:50 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id 11sm12953314qkm.25.2021.02.01.16.27.48
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 16:27:49 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id c3so8325325ybi.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Feb 2021 16:27:48 -0800 (PST)
X-Received: by 2002:a25:56c5:: with SMTP id
 k188mr30912661ybb.476.1612225668476; 
 Mon, 01 Feb 2021 16:27:48 -0800 (PST)
MIME-Version: 1.0
References: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
In-Reply-To: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Feb 2021 16:27:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
Message-ID: <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6jXw-00CYd5-Ir
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: kdb_support: Fix debugging
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

On Sat, Jan 30, 2021 at 3:24 AM Stephen Zhang <stephenzhangzsd@gmail.com> wrote:
>
>  int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
>  {
> -       if (KDB_DEBUG(AR))
> -               kdb_printf("kdbgetsymval: symname=%s, symtab=%px\n", symname,
> -                          symtab);
> +       kdb_dbg_printf(AR, "symname=%s, symtab=%px\n", symname, symtab);
>         memset(symtab, 0, sizeof(*symtab));
>         symtab->sym_start = kallsyms_lookup_name(symname);
>         if (symtab->sym_start) {
> -               if (KDB_DEBUG(AR))
> -                       kdb_printf("kdbgetsymval: returns 1, "
> -                                  "symtab->sym_start=0x%lx\n",
> -                                  symtab->sym_start);
> +               kdb_dbg_printf(AR, "returns 1,symtab->sym_start=0x%lx\n",

nit: There used to be a space after the "," and there no longer is.


> +                             symtab->sym_start);

nit: I think it was supposed to be indented 1 more space so it's under "AR".


>  EXPORT_SYMBOL(kdbgetsymval);
> @@ -87,15 +82,14 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
>  #define knt1_size 128          /* must be >= kallsyms table size */
>         char *knt1 = NULL;
>
> -       if (KDB_DEBUG(AR))
> -               kdb_printf("kdbnearsym: addr=0x%lx, symtab=%px\n", addr, symtab);
> +       kdb_dbg_printf(AR, "addr=0x%lx, symtab=%px\n", addr, symtab);
>         memset(symtab, 0, sizeof(*symtab));
>
>         if (addr < 4096)
>                 goto out;
>         knt1 = debug_kmalloc(knt1_size, GFP_ATOMIC);
>         if (!knt1) {
> -               kdb_printf("kdbnearsym: addr=0x%lx cannot kmalloc knt1\n",
> +               kdb_func_printf("addr=0x%lx cannot kmalloc knt1\n",
>                            addr);

nit: "addr" used to be indented properly before your change and now
it's not.  It could also move up to the previous line.


> @@ -147,11 +141,10 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
>
>         if (symtab->mod_name == NULL)
>                 symtab->mod_name = "kernel";
> -       if (KDB_DEBUG(AR))
> -               kdb_printf("kdbnearsym: returns %d symtab->sym_start=0x%lx, "
> -                  "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
> -                  symtab->sym_start, symtab->mod_name, symtab->sym_name,
> -                  symtab->sym_name);
> +       kdb_dbg_printf(AR, "returns %d symtab->sym_start=0x%lx, "
> +               "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
> +               symtab->sym_start, symtab->mod_name, symtab->sym_name,
> +               symtab->sym_name);

This indention doesn't line up, but it didn't before.  I guess I'd let
Daniel say if he likes this or would prefer different wrapping /
indentation.


> @@ -884,18 +876,17 @@ void debug_kusage(void)
>         if (!debug_kusage_one_time)
>                 goto out;
>         debug_kusage_one_time = 0;
> -       kdb_printf("%s: debug_kmalloc memory leak dah_first %d\n",
> -                  __func__, dah_first);
> +       kdb_func_printf("debug_kmalloc memory leak dah_first %d\n", dah_first);
>         if (dah_first) {
>                 h_used = (struct debug_alloc_header *)debug_alloc_pool;
> -               kdb_printf("%s: h_used %px size %d\n", __func__, h_used,
> +               kdb_func_printf("h_used %px size %d\n", h_used,
>                            h_used->size);

nit: "h_used->size" used to be indented properly before your change
and now it's not.  It could also move up to the previous line.

>         }
>         do {
>                 h_used = (struct debug_alloc_header *)
>                           ((char *)h_free + dah_overhead + h_free->size);
> -               kdb_printf("%s: h_used %px size %d caller %px\n",
> -                          __func__, h_used, h_used->size, h_used->caller);
> +               kdb_func_printf("h_used %px size %d caller %px\n",
> +                         h_used, h_used->size, h_used->caller);

nit: "h_used" used to be indented properly before your change and now it's not.


> @@ -903,8 +894,8 @@ void debug_kusage(void)
>                   ((char *)h_free + dah_overhead + h_free->size);
>         if ((char *)h_used - debug_alloc_pool !=
>             sizeof(debug_alloc_pool_aligned))
> -               kdb_printf("%s: h_used %px size %d caller %px\n",
> -                          __func__, h_used, h_used->size, h_used->caller);
> +               kdb_func_printf("h_used %px size %d caller %px\n",
> +                          h_used, h_used->size, h_used->caller);

nit: "h_used" used to be indented properly before your change and now it's not.


It's possible that Daniel would prefer to fix these word-wrapping and
indention things when he applies your change?

I know the above is all pretty nitty, but given that the whole point
of the change is to clean up the code it seems like it's fair game to
make sure the code touched is fully clean...

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
