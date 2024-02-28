Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D562A86AEBA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 28 Feb 2024 13:05:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rfIgm-0005TQ-Le
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 28 Feb 2024 12:05:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rfIgl-0005TI-JC
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 28 Feb 2024 12:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PzqyTr5X+aYREyJTGjIbzkTXpuehiLhDk3JwLwQ/6fk=; b=Q5Xi9ED7G+HZSqPy36agTBJc0Z
 N9MXo7l7PIA/kQhaQSvu9vssBDzMmvPLcPB5c2c5wjGuaQU3OGZ31SCmSuVzkFZRnPTiSiHowyXZl
 cII5BMSJdJjal+H1C99RwzoMwJboeWlAEGqPXy+twpX3bj+ThAzRyoJZcH2xhFFFaDKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PzqyTr5X+aYREyJTGjIbzkTXpuehiLhDk3JwLwQ/6fk=; b=Cfxbr3Cq7OWrfxf/kpxuXnEDSi
 D34fqTdST1WaqdUkDyoe40aQngcCMBgvq8rtmrhL2VgkkjC9P31KX24LTqYshVJ78ib/3aR72ZMMs
 S0RymbPmaS5BTPGy71Z69pLwROQ4vzV+CSu3vEFhVi6Hedzb3/gI4qvfLqQ9Ey3QUcdg=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfIgk-0006I8-Pg for kgdb-bugreport@lists.sourceforge.net;
 Wed, 28 Feb 2024 12:05:31 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33d28468666so4573950f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 28 Feb 2024 04:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709121919; x=1709726719; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PzqyTr5X+aYREyJTGjIbzkTXpuehiLhDk3JwLwQ/6fk=;
 b=gwIU0llj//fJK0yWXXaJceywcphg/ZWMuh1fq2cTKmmn7EqneHT+E131/q6pxg6jT7
 x5Banj5Xllg0YGatD9orWDBG7wEkyaAWJszT/boM72Sym7Rlr5hVk+PWIy+tAOHvGyE3
 DChtmO8WcltYosqQCjpxT2VunsdpD0Bs3n7PLHF1ZW5WRC1yLwhEmWl0Zw3u91U3oCDg
 juOELq4EFsPx3xtp37IBDzvRso1zLUPXv09I4xtEgOLmdWbqpDNB+fqEeTlmwLh8d/3W
 mOiEeAc6RvLyblLXdvsYmdKyU/jlNKv+KN4es6UaJjhd/U0ZL8OoFqxNSMWZI+js2+N0
 9sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709121919; x=1709726719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzqyTr5X+aYREyJTGjIbzkTXpuehiLhDk3JwLwQ/6fk=;
 b=FcOCCoTvPry7AJbO++CsVr6AY2q2r2DwXNwil2gpyhvotuywFrriy07uTg2vLYBwNa
 ZlYKin3ZApslIN8nr15SAq098h6sbb2EnDxtSpZr9eHhD1xMQS7v+Bp5OElaU66WiP9J
 ospsWzjHa3VS4bGVZc2l+aq6X8QQNIyVHLTGrPKitNqUlzyPyQ7VexL9Weo+wtm4wOs4
 DFKMGdd7z0X68OBIce6o2JG493ijDOlVgi1DDJeNQbEXrp2KXjThLlA5kudBj5Xz0/OQ
 kiPJpEJKTs4Nmo97EKYVMdKrzUSaM6Kik8zzzjzFUxw55KWho3rPmLONYzAjb3HSHNZE
 D2sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkx3K9TQy3yy1ytiffeNSO4VXgnHa+z9gJxRq4qKDRC0p190qX2T2bAh8uAqgHLZMW1ZTrTjlrG6wtpJfMQJd+7pxCaJJZO1lHo5RgwUPsF0j82Ro=
X-Gm-Message-State: AOJu0Yz4MROFml/fd8P+HiwJAJxxwXlx1kD8BwOx4jtlvqfRu/43jfiD
 MHZ7kCs59DbsdKKJleVbtlUA4wBgMrTUjWi3WgFtl6Ri8dPbG84kxjb8V9XvtdIHMdHFtvFmTo5
 S8n4=
X-Google-Smtp-Source: AGHT+IGzDI2CfjF+ZrK4HMu6I+33GKctiF8gxjlQv7RCYlslkD+rRN0WYOsloPznRjtf3XKHGUlwOA==
X-Received: by 2002:a5d:52cb:0:b0:33d:89a8:6b99 with SMTP id
 r11-20020a5d52cb000000b0033d89a86b99mr7802213wrv.70.1709121919242; 
 Wed, 28 Feb 2024 04:05:19 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 by15-20020a056000098f00b0033e02f181f7sm1248178wrb.89.2024.02.28.04.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 04:05:18 -0800 (PST)
Date: Wed, 28 Feb 2024 12:05:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: LiuYe <liu.yeC@h3c.com>
Message-ID: <20240228120516.GA22898@aspen.lan>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228025602.3087748-1-liu.yeC@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 28, 2024 at 10:56:02AM +0800,
 LiuYe wrote: > master
 cpu : After executing the go command, a deadlock occurs. > slave cpu: may
 be performing thread migration, > acquiring the running queue [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfIgk-0006I8-Pg
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix the deadlock issue in KDB
 debugging.
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Feb 28, 2024 at 10:56:02AM +0800, LiuYe wrote:
> master cpu : After executing the go command, a deadlock occurs.
> slave cpu: may be performing thread migration,
>         acquiring the running queue lock of master CPU.
>         Then it was interrupted by kdb NMI and entered the nmi_handler process.
>         (nmi_handle-> kgdb_nmicallback-> kgdb_cpu_enter
>         while(1){ touch wathcdog}.)

I think this description is a little short and doesn't clearly explain
the cause. How about:

Currently, if kgdboc includes 'kdb', then kgdboc will attempt to
use schedule_work() to provoke a keyboard reset when transitioning out
of the debugger and back to normal operation. This can cause
deadlock because schedule_work() is not NMI-safe.

The stack trace below shows an example of the problem. In this
case the master cpu is not running from NMI but it has parked
the slace CPUs using an NMI and the parked CPUs is holding
spinlocks needed by schedule_work().


> example:
>  BUG: spinlock lockup suspected on CPU#0, namex/10450
>  lock: 0xffff881ffe823980, .magic: dead4ead, .owner: namexx/21888, .owner_cpu: 1
>  ffff881741d00000 ffff881741c01000 0000000000000000 0000000000000000
>  ffff881740f58e78 ffff881741cffdd0 ffffffff8147a7fc ffff881740f58f20
> Call Trace:
>  [<ffffffff81479e6d>] ? __schedule+0x16d/0xac0
>  [<ffffffff8147a7fc>] ? schedule+0x3c/0x90
>  [<ffffffff8147e71a>] ? schedule_hrtimeout_range_clock+0x10a/0x120
>  [<ffffffff8147d22e>] ? mutex_unlock+0xe/0x10
>  [<ffffffff811c839b>] ? ep_scan_ready_list+0x1db/0x1e0
>  [<ffffffff8147e743>] ? schedule_hrtimeout_range+0x13/0x20
>  [<ffffffff811c864a>] ? ep_poll+0x27a/0x3b0
>  [<ffffffff8108c540>] ? wake_up_q+0x70/0x70
>  [<ffffffff811c99a8>] ? SyS_epoll_wait+0xb8/0xd0
>  [<ffffffff8147f296>] ? entry_SYSCALL_64_fastpath+0x12/0x75
>  CPU: 0 PID: 10450 Comm: namex Tainted: G           O    4.4.65 #1
>  Hardware name: Insyde Purley/Type2 - Board Product Name1, BIOS 05.21.51.0036 07/19/2019
>   0000000000000000 ffff881ffe813c10 ffffffff8124e883 ffff881741c01000
>   ffff881ffe823980 ffff881ffe813c38 ffffffff810a7f7f ffff881ffe823980
>   000000007d2b7cd0 0000000000000001 ffff881ffe813c68 ffffffff810a80e0
>   Call Trace:
>   <#DB>  [<ffffffff8124e883>] dump_stack+0x85/0xc2
>   [<ffffffff810a7f7f>] spin_dump+0x7f/0x100
>   [<ffffffff810a80e0>] do_raw_spin_lock+0xa0/0x150
>   [<ffffffff8147eb55>] _raw_spin_lock+0x15/0x20
>   [<ffffffff8108c256>] try_to_wake_up+0x176/0x3d0
>   [<ffffffff8108c4c5>] wake_up_process+0x15/0x20
>   [<ffffffff8107b371>] insert_work+0x81/0xc0
>   [<ffffffff8107b4e5>] __queue_work+0x135/0x390
>   [<ffffffff8107b786>] queue_work_on+0x46/0x90
>   [<ffffffff81313d28>] kgdboc_post_exp_handler+0x48/0x70
>   [<ffffffff810ed488>] kgdb_cpu_enter+0x598/0x610
>   [<ffffffff810ed6e2>] kgdb_handle_exception+0xf2/0x1f0
>   [<ffffffff81054e21>] __kgdb_notify+0x71/0xd0
>   [<ffffffff81054eb5>] kgdb_notify+0x35/0x70
>   [<ffffffff81082e6a>] notifier_call_chain+0x4a/0x70
>   [<ffffffff8108304d>] notify_die+0x3d/0x50
>   [<ffffffff81017219>] do_int3+0x89/0x120
>   [<ffffffff81480fb4>] int3+0x44/0x80
>
> Signed-off-by: LiuYe <liu.yeC@h3c.com>
> ---
>  drivers/tty/serial/kgdboc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 7ce7bb164..945318ef1 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -22,6 +22,9 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_core.h>
> +#include <linux/smp.h>
> +
> +#include "../kernel/sched/sched.h"
>
>  #define MAX_CONFIG_LEN         40
>
> @@ -399,7 +402,8 @@ static void kgdboc_post_exp_handler(void)
>                 dbg_restore_graphics = 0;
>                 con_debug_leave();
>         }
> -       kgdboc_restore_input();
> +       if (!raw_spin_is_locked(&(cpu_rq(smp_processor_id())->lock)))
> +               kgdboc_restore_input();

I don't think solving this by access internal scheduler state is the
right approach .

The description I wrote above perhaps already suggests why. The
deadlock occurs because it is unsafe to call schedule_work() from
the debug trap handler. The debug trap handler in your stack trace is not
running from an NMI but it certainly has NMI-like properties. Therefore
a better fix is not to call schedule_work() at all from the debug trap
handler.

Instead we need to use an NMI-safe API such as irq_work_queue() and that
irq_work can call schedule_work() and trigger the keyboard reset.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
