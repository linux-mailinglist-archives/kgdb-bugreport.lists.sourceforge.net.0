Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB26830C919
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Feb 2021 19:10:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l708d-0007qd-OE
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Feb 2021 18:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l708c-0007qW-QU
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Feb 2021 18:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCvL276XXLN76mFM3Tv50taSjKfRq7S5/IJQSJlEqAY=; b=ITjmcisWgxBF+sjb3Lyj0t3LtS
 rmBVMAJKbDXVmHoyXeCExGA8isYSXooE252EHOL7dAbCoJGW5SNwZjlwcSeujR0NeLqgMG82lIsVS
 MNfzDGiRc+tY0NmToktAf4yxVPhdqY/vxwC8JIwN4YPWEGDctgBs9YP0aKfCjzvfNxWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCvL276XXLN76mFM3Tv50taSjKfRq7S5/IJQSJlEqAY=; b=GhOPPCrx4W95YExSJc3uPyqPPx
 R48Bd6c2bpsJRBRHVAmjaN5qskOvnSQA38jHTbWAAUfLK2wZyx0sxszmpvgt8wjZSqtESdV4g0zBe
 +iPX07OVfDN/SV7ffyEL8Reus63eZ7+N3Hqw0UcWliBFesxm0Pjuv5qgfb8nSC0oiYLY=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l708N-00FnSf-MT
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Feb 2021 18:10:54 +0000
Received: by mail-qt1-f177.google.com with SMTP id n8so7255652qtp.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Feb 2021 10:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCvL276XXLN76mFM3Tv50taSjKfRq7S5/IJQSJlEqAY=;
 b=SFfpqctK7Ngvylzo7AwvmzzWzBfd/cV07hD4gnD0CtE0u21zMdGu6NOI26L3kRiYgY
 ziRWyEMpi8Vf6aROCXtdqFgNJW2w1nYXo2xnoWq14jCn7QaUdO5HWcla48M0hjWdB70t
 A18vZTciBSiYEyu2xzYW6FyWNKWHpWvVHFybY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCvL276XXLN76mFM3Tv50taSjKfRq7S5/IJQSJlEqAY=;
 b=mCvu6TOSjN71hvAUhmodxbfg7JQvervjrEXo44O9qt77tNvufEz+c6LiQk2xUQkjdH
 aIA9Qc5bGs92/6PTrHnNheIHyYvDZMge0taOMfhEkxFSYb+0IZ0WouvUAHEtjNOZmed5
 CtVPTky7f8u8U+JEiVejEiTij70Q5O5LslndyFjufMkthzX56CqOPRvkjPKy1t5HhFN/
 DHwRa40GPEaSos70KeJkLF8Fj+dsLQkyPFFXMkwutLkd2YkhWTQ9B+1JXUcXuNxj/5wl
 rYNgSCE2/bnj1mM4SNj4wKHujx/aR9yhsJ/b92KY2n6V8jvNla6i6u7ZW/SItwJE0zy0
 Kb9w==
X-Gm-Message-State: AOAM532WkYSYuYU8CuCiltrY2NHAOSt+z+g4Fs56BvmXQGk2vyvkCAqP
 1ZSz27CxAX9xp8nLCNK/ycQPi8XH7QZhrg==
X-Google-Smtp-Source: ABdhPJx2TYO8MwPm58tkQKexhR4gb1vGJ9Wz8DeL5dAtmnXAoO1flVqXCkLbmxeZhHxZZL4eLozzSA==
X-Received: by 2002:ac8:584f:: with SMTP id h15mr18984812qth.104.1612287604527; 
 Tue, 02 Feb 2021 09:40:04 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id a68sm5116405qkd.29.2021.02.02.09.40.03
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 09:40:03 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id y4so1670048ybk.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Feb 2021 09:40:03 -0800 (PST)
X-Received: by 2002:a25:da53:: with SMTP id n80mr33069915ybf.79.1612287603131; 
 Tue, 02 Feb 2021 09:40:03 -0800 (PST)
MIME-Version: 1.0
References: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
 <CALuz2=erXGa2q_ODOpARK9yb_GQo0nOLWnP-PuBMCc+pv8Cp4Q@mail.gmail.com>
In-Reply-To: <CALuz2=erXGa2q_ODOpARK9yb_GQo0nOLWnP-PuBMCc+pv8Cp4Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Feb 2021 09:39:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xcywabh3U0=hzd8DXR2gdwLBEFsbwLof7Y6LMu+ViPNA@mail.gmail.com>
Message-ID: <CAD=FV=Xcywabh3U0=hzd8DXR2gdwLBEFsbwLof7Y6LMu+ViPNA@mail.gmail.com>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l708N-00FnSf-MT
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

On Tue, Feb 2, 2021 at 3:15 AM Stephen Zhang <stephenzhangzsd@gmail.com> wrote:
>>
>>
>> > @@ -147,11 +141,10 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
>> >
>> >         if (symtab->mod_name == NULL)
>> >                 symtab->mod_name = "kernel";
>> > -       if (KDB_DEBUG(AR))
>> > -               kdb_printf("kdbnearsym: returns %d symtab->sym_start=0x%lx, "
>> > -                  "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
>> > -                  symtab->sym_start, symtab->mod_name, symtab->sym_name,
>> > -                  symtab->sym_name);
>> > +       kdb_dbg_printf(AR, "returns %d symtab->sym_start=0x%lx, "
>> > +               "symtab->mod_name=%px, symtab->sym_name=%px (%s)\n", ret,
>> > +               symtab->sym_start, symtab->mod_name, symtab->sym_name,
>> > +               symtab->sym_name);
>>
>> This indention doesn't line up, but it didn't before.  I guess I'd let
>> Daniel say if he likes this or would prefer different wrapping /
>> indentation.
>
>
> Thanks for your patience. You told me that  the alignment for continued arguments is to
> match up with the first argument, so I was confused that the first line and the second line
> here don't follow the rule.  There are many  cases like this in  this file.

There's a saying: all rules are made to be broken.

I think the general rule is that the 2nd line of arguments should line
up with the first.  However, sometimes that forces way too much
wrapping.  If it's "too ugly" to use the general rule, then you can
fall back to some alternate rule.  Usually this alternate rule is
something like indending all subsequent lines by one tab.  The
definition of "too ugly" is left to the judgement of the person
writing / reviewing the code.  In this case maybe the general rule
would make your call need to take up 3 lines?

If I had to make a judgement call on this code, I'd say:

1. It seems to have been written before the "don't split strings" rule
was in full force.  See
<https://www.kernel.org/doc/html/v5.10/process/coding-style.html#breaking-long-lines-and-strings>
where it says "never break user-visible strings such as printk
messages because that breaks the ability to grep for them".

2. If we fix #1, we're already blowing over the 80 columns limit for
this string anyway.

3. Once we blow over the 80 columns, might as well do it for the
second line.  So then you'd end up with:

<tab>kdb_dbg_printf(AR, "returns [...] (%s)\n",
<tab><tab>       ret, symtab->sym_start, [...], symtab->sym_name);


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
