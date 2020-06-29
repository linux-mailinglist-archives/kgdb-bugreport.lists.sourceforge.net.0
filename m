Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E6120DD0B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 23:04:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jq0wu-0004dz-Bl
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 21:04:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jq0wt-0004dq-Q0
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 21:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EDDadDrSXYKtXL/TsWS5vlQswAboTcT6W+3/Oif1F20=; b=hIXOKgnnf2RL/BY8bCd6XQbgNl
 LJ0rpoHnoLuXGvjVU0cqyC++ZM8w67r8y7FePG05sIZtHd6nhzOwxEa6mOjdK0RCWj3s3UBQGW8gA
 m9U/3TdddF0suoovQ4PBhOI+n2hvcnIH0Nmgvq2uPTLSrWJgAKhvvfH7hCiUPWYo4c+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EDDadDrSXYKtXL/TsWS5vlQswAboTcT6W+3/Oif1F20=; b=AvyPrle3akuUu+mG+ockxWH3OF
 brvTv+/d7MihyMLVKR4rnBP02nDRbE4OwIb3j9SR8uonCDtW2A1DpBKjpGbIcaXqs08ZXHjg5UyhJ
 DCcohqxtuJy7X5CGXgQsXinS6fW23+0gl1ytR2FnzEMxzbaOoc5vcLEiF3tfclLXTjJc=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jq0wq-006Yvc-Vx
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 21:04:19 +0000
Received: by mail-vs1-f68.google.com with SMTP id 190so10004588vsr.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EDDadDrSXYKtXL/TsWS5vlQswAboTcT6W+3/Oif1F20=;
 b=Zhnvic0KQUbDVX5LSFm3hAeLEERhKCRPhYViT3hL3yJyva8CW+btVllsX8lmru+EeN
 mvetgyKknHBgMwldDe67snB8PwHBZBQDGudwVnaGCiiwsZng5RVqjW+9G7Ul26gvfXoZ
 55TX9gVBEka/btSKGV2IxuxB22BeiWRHiweFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDDadDrSXYKtXL/TsWS5vlQswAboTcT6W+3/Oif1F20=;
 b=NXfACoQ8/+0gxU925vKrWXJAa7Ya6cMbnhfD1tpIsY6Pvht8d8FnAySlvE/oiXHp8b
 Zk2YqfiSeebDfnjrSaBSX3sp/xZ5OQHmrPO6biO6ul3cQ280u4K/4pCbYJY/HCjHHLYA
 J6hsG5BcnAshptQhpZ/5N5NoyY3bmHI0YriFLKs0VTUB2o5zLJNPcseUiRLq0Rp9rW6f
 yA2Xuj/HvIcUDBtb47M3ZPxhQQ8zPJkEvx1Qzv0LKpFieH5hRP5/3DPY+VGRzTDAvO2q
 Ic6x2ax6FQjmBhEtBlQmqZaYvHFkaH2AncpS88I4DsRRRq34tQoMeG3W1zjHqQ5r4qGs
 lKgg==
X-Gm-Message-State: AOAM531JsZ1joV1vL/LJTTwrpm5we6JG9tYioTfRGoqqPnpzSPaDajze
 Beki1XUCcYv7ElKoyeV54k8/ezy3k9A=
X-Google-Smtp-Source: ABdhPJzmudiRQgxK0T4SX9Y85nQstTBnvvucA8ECSMqxORb4zjLuvLgVzAxE5VvIIbkPBp0u6QA7jw==
X-Received: by 2002:a67:4c1:: with SMTP id 184mr11807365vse.102.1593464645783; 
 Mon, 29 Jun 2020 14:04:05 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id v4sm84297vsk.9.2020.06.29.14.04.04
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 14:04:05 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id s192so4057828vkh.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 14:04:04 -0700 (PDT)
X-Received: by 2002:a1f:280c:: with SMTP id o12mr11043341vko.92.1593464644374; 
 Mon, 29 Jun 2020 14:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200629171529.558003-1-daniel.thompson@linaro.org>
In-Reply-To: <20200629171529.558003-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Jun 2020 14:03:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9rdEsO1jP-kg6OetXmZO+kC9LenZM=CdxjUvv8BEU4g@mail.gmail.com>
Message-ID: <CAD=FV=W9rdEsO1jP-kg6OetXmZO+kC9LenZM=CdxjUvv8BEU4g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jq0wq-006Yvc-Vx
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Resolve races during
 kgdb_io_register/unregister_module
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
Cc: kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Jun 29, 2020 at 10:15 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kgdb_register_callbacks() and kgdb_unregister_callbacks()
> are called outside the scope of the kgdb_registration_lock. This
> allows them to race with each other. This could do all sorts of crazy
> things up to and including dbg_io_ops becoming NULL partway through the
> execution of the kgdb trap handler (which isn't allowed and would be
> fatal).
>
> Fix this by bringing the trap handler setup and teardown into the scope
> of the registration lock.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 9e5934780f41..9799f2c6dc94 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1117,9 +1117,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>
>         dbg_io_ops = new_dbg_io_ops;
>
> -       spin_unlock(&kgdb_registration_lock);
> -
>         if (old_dbg_io_ops) {
> +               spin_unlock(&kgdb_registration_lock);
>                 old_dbg_io_ops->deinit();
>                 return 0;
>         }
> @@ -1129,6 +1128,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>         /* Arm KGDB now. */
>         kgdb_register_callbacks();
>
> +       spin_unlock(&kgdb_registration_lock);

From looking at code paths, I think this is illegal, isn't it?  You're
now calling kgdb_register_callbacks() while holding a spinlock, but:

kgdb_register_callbacks()
-> register_console()
--> console_lock()
---> might_sleep()
----> <boom!>


I'm a little curious about the exact race we're trying to solve.
Calling unregister on an IO module before register even finished seems
like an error on the caller, so I guess it would be calling register
from a 2nd thread for a different IO module while the first thread was
partway through unregistering?  Even that seems awfully sketchy since
you're risking registering a 2nd IO ops while the first is still there
and that's illegal enough that we do a pr_err() for it (though we
don't crash), but let's say we're trying to solve that one.

Looking at it closely, I _think_ the only race in this case is if the
one we're trying to unregister had a deinit() function and we going to
replace it?  If it didn't have a deinit function:

cpu1 (unregister)                 cpu2 (register):
-----------------                 ----------------------
kgdb_unregister_callbacks()
                                  spin_lock() <got>
spin_lock() <blocked>
                                  if (old_dbg_io_ops) <true>
                                    if (has dinit) <false>
                                      print error
                                      spin_unlock()
                                      return -EBUSY
<finish unregister>

The above is fine and is the same thing that would happen if the
whole register function ran before the unregister even started, right?

Also: if the unregister won the race that should also be fine.

So really the problem is this:

cpu1 (unregister)                 cpu2 (register):
-----------------                 ----------------------
kgdb_unregister_callbacks()
                                  spin_lock() <got>
spin_lock() <blocked>
                                  if (old_dbg_io_ops) <true>
                                    if (has dinit) <true>
                                      print Replacing
                                  init new IO ops
                                  spin_unlock()
                                  if (old_dbg_io_ops) <true>
                                    finish deinit of old
                                    return true
WARN_ON() <hits and shouts!>
dbg_io_ops = NULL
spin_unlock()
if (deinit) <true>
  double-call to deinit of old

So in this case we'll hit a WARN_ON(), incorrectly unregister the new
IO ops, and call deinit twice.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
