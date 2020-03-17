Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE4187680
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 17 Mar 2020 01:07:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jDzlU-0000ac-AG
	for lists+kgdb-bugreport@lfdr.de; Tue, 17 Mar 2020 00:07:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jDzlS-0000aM-IA
 for kgdb-bugreport@lists.sourceforge.net; Tue, 17 Mar 2020 00:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ntKJKBz3QZaW3upO5B77khaQdlJEtk26+mdI0qKPpo=; b=hcJcaoI7OG8hJS5sJ+C3o8hGN7
 fcFSHq4mFgNnK3Q9nxgTbe+Uv3rAw0c9p5x8qzEsFyN2dePuHJP8wTPsGz8cz9VlPRkglkvyoskS/
 BxS7nH2yxSQ26b0GoXovNBcmGS56wo8APrrG4dAcc7Muec1l8mhV7ROdeKlcNaoNS6iQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ntKJKBz3QZaW3upO5B77khaQdlJEtk26+mdI0qKPpo=; b=UCqNm+e9q5Q0r9negwfzMS47J3
 HMqEpRVwpxjQXEEiv2X/WZFuqsmxa6uGhtrqEdr45tI73LHTLpmRrwWKYOM//EZ6XaiQnUebNs+K6
 zsBBuGmIyWC2NWHj3Ci51KSefparM/JWOw61mQrmGpr6Vkwd0eIACd3GwN3OydUAzrb0=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jDzlM-003QlG-FE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 17 Mar 2020 00:07:22 +0000
Received: by mail-vs1-f68.google.com with SMTP id n6so12665147vsc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Mar 2020 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ntKJKBz3QZaW3upO5B77khaQdlJEtk26+mdI0qKPpo=;
 b=kvfshzNlH4GhDvSk8suwxv4rlbjov+ouHN1bXNvo95mWddKa0+ZXU5p0pE7LcZYAtx
 APOIogl/EVUTjvKtNAnnqgOiQkejh6bPINWYeNJOxzGqyE5hBBmXW4sRVFeitovagUDP
 r2O8J+vfLmAudOUh4T7Q9Kpg8ykyjwsrcshUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ntKJKBz3QZaW3upO5B77khaQdlJEtk26+mdI0qKPpo=;
 b=A61l3+VcB0Iv/173zr/16RIxPw64sukf9nMxra5UzZtqqKgi9DPhxltT7h2Xa8Bv0D
 ex5sLC3n0SpkJs8dIuDIIjIGaq+ouxbuQ68SXOAxMxkeyTxpRHYel4kUxliVN0zESgHH
 KL5Q5SEieRHmYA5zQqPr427SyDG9/iGfSirSBxNjzrFVZ1K+y3e1yVz/99V8gTCnLf/d
 h+G8MExaF31PxTqm/6oiHH80BgjnBzt0SMFRHhAq/ZJV0vNheRBr52qC60Q+pJszbIDo
 R99+gyozKmTfYFKfdLjilhoiK6pwn8YMUdKtUqxYyGpPTmoVfCN2ksUqbiYj0LPjGZTy
 6ALg==
X-Gm-Message-State: ANhLgQ15RTH/pcEIdRFjzceBgLWdE8JdUBTBwSkH+dHkSGO/dpohvczC
 5zaAXSDzq/3Lj79wGQDPHG5jQpiOOsI=
X-Google-Smtp-Source: ADFU+vvuZv3I+432CFzAzKnWZFWEEFsOFekEucO84MiPnyht2avwtjzQ9RJg7Nvdr21Bd4/1ULHu6w==
X-Received: by 2002:a67:6483:: with SMTP id y125mr1744419vsb.212.1584403628178; 
 Mon, 16 Mar 2020 17:07:08 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id c77sm612181vke.7.2020.03.16.17.07.06
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 17:07:06 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id b2so7306456uas.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Mar 2020 17:07:06 -0700 (PDT)
X-Received: by 2002:ab0:2e91:: with SMTP id f17mr1804155uaa.22.1584403626259; 
 Mon, 16 Mar 2020 17:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200316143916.195608-1-dima@arista.com>
 <20200316143916.195608-48-dima@arista.com>
In-Reply-To: <20200316143916.195608-48-dima@arista.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Mar 2020 17:06:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4Ourc0gbVnq_eQqyxDn05uV3NT2raEAKSohrN5qrwgQ@mail.gmail.com>
Message-ID: <CAD=FV=X4Ourc0gbVnq_eQqyxDn05uV3NT2raEAKSohrN5qrwgQ@mail.gmail.com>
To: Dmitry Safonov <dima@arista.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDzlM-003QlG-FE
Subject: Re: [Kgdb-bugreport] [PATCHv2 47/50] kdb: Don't play with
 console_loglevel
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Mar 16, 2020 at 7:43 AM Dmitry Safonov <dima@arista.com> wrote:
>
> Print the stack trace with KERN_EMERG - it should be always visible.
>
> Playing with console_loglevel is a bad idea as there may be more
> messages printed than wanted. Also the stack trace might be not printed
> at all if printk() was deferred and console_loglevel was raised back
> before the trace got flushed.
>
> Unfortunately, after rebasing on commit 2277b492582d ("kdb: Fix stack
> crawling on 'running' CPUs that aren't the master"), kdb_show_stack()
> uses now kdb_dump_stack_on_cpu(), which for now won't be converted as it
> uses dump_stack() instead of show_stack().
>
> Convert for now the branch that uses show_stack() and remove
> console_loglevel exercise from that case.
>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  kernel/debug/kdb/kdb_bt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Presuming that the rest of this series is deemed acceptable by those
in charge, this patch looks fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
