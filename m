Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E96895418
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Apr 2024 14:58:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rrdiP-0008VT-1J
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 02 Apr 2024 12:58:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rrdiO-0008VM-9g
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 02 Apr 2024 12:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sFx6hP8hvOPeUdfct+YUNkXorKxd3sUiyEh1lx2j5Y0=; b=jNZQkODPm6+OTvslAMhSs2ccSz
 vqACH8eaZr0TzHngCDQAeGH4kchqtbwhSFg3ajxiXH1HvvAdbCHEHt7rJLS8a6OhCQT6z9Teneroa
 CB2fk+oQQyHTR8VLb/BB5ERfzH/UABugmJq4v+injVMRhtLOdAfqXxEbZhmmgFS0WKDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sFx6hP8hvOPeUdfct+YUNkXorKxd3sUiyEh1lx2j5Y0=; b=mSJhfbwXkqloECxn0peoBIwF4i
 LSDldSHNHlHnmIIWFnQafHEvzv5jW+0232LRDl/sIHQxhWUvZqxKs+2QEOGKdysdVpGO85ZuGyVQ8
 6nSx+6chwBefTikoLdN6vQayjUfjd/CMh+/uqTCDaF55TlYS2vaQdaWsdClg/Fm6o5rY=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrdiN-0002Yj-3Q for kgdb-bugreport@lists.sourceforge.net;
 Tue, 02 Apr 2024 12:58:12 +0000
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-515a97846b5so5427553e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Apr 2024 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712062685; x=1712667485; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sFx6hP8hvOPeUdfct+YUNkXorKxd3sUiyEh1lx2j5Y0=;
 b=xr0zr6CvawU+C8lhSO8FcEEn4cqQqXXymFR4cJIAvAETZUbowVtxTiTd/RvTOrJPUS
 AEA0I66AOu88GXOpAUcfHZlJOwoYYg3GU8f6ZgxJOb4Je/3E4lgaQUAdwgEFiuDtIhgk
 6tfQ5Tlm4ZSBf5oVuINj/M5Dv/8bKi7xcptj0qOVNM48TBQyHuHQHIbYOz49uY+6ijnd
 QjTyfh/KV+XZ1BAd4ae0Au9ndALXxUcP2rs9+Kx550emlVddf+mElSVepit3Kd/YelYn
 vg8GphMTY6xIqpgt9kk2yBX5f9YcaCdggWycEWUqW0OUjdIXJpX6BglsJNSaZRSD4lvn
 71Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712062685; x=1712667485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFx6hP8hvOPeUdfct+YUNkXorKxd3sUiyEh1lx2j5Y0=;
 b=Nabc1lVbA/HvLhc2NkKKO5yJvGI1/6GtxzCmgq8kMEYRfiTqKcaezBkvjHo5PoF98c
 SWmPg2FR7+XvJsG+Td4O/QK9C0lT5zULZl9NCKIC1WL4KujozCzMNvllL5igHIx4QLYS
 JMR+3Vsi+sTckH3/WpMXHOtgy20aBqASeKqkc4Vo/zftYDgSG4irhz/gOg2NDB5+EYCC
 jv0NSs8KUsEudn4AhLW742a0iCiuq6gT6GwszQHUGGceyGLRxhh57KpDBBppQYRQqpFo
 p1DkjVinRfnd2fsTeQ5iwZfx8zxEZJMrvmL3+82JpcOIGWPaRHXEkJzl7mLb5aC4GfLN
 AIsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbwYveAKstQaf8rn02D0mxtVZRiKVbuBmlNiOVAtBIew9KWS6LytAt18G+ee4HNsvgGgfYxLCRMJp+wYlVv+MB20SBSfXvtrhin7fyDKHjMlSZ/ho=
X-Gm-Message-State: AOJu0Yz1R8tXECQOJ90+CYsmwE2iyi2Ph+NHYNKrU7VHDeZOToED9JxR
 fp6M13L1irLPkXnaREGEl9hc9NHlwt8XieBd4zAFhe1/KZdQBaBfabBrCcd1H2k=
X-Google-Smtp-Source: AGHT+IHWR0hLdOL78yMVv8MFgfNCo7t7ygA9mH2c/bUuGc7SlEtcmgj1HbUwD+5oLppZJcBjJKZHDQ==
X-Received: by 2002:a05:6512:2815:b0:515:d198:694d with SMTP id
 cf21-20020a056512281500b00515d198694dmr10154546lfb.26.1712062684514; 
 Tue, 02 Apr 2024 05:58:04 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c500700b00415870e1e88sm2728986wmr.29.2024.04.02.05.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 05:58:04 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:58:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: liu.yec@h3c.com
Message-ID: <20240402125802.GC25200@aspen.lan>
References: <2024032630-croon-consuming-6ef9@gregkh>
 <20240326085407.1970686-1-liu.yec@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326085407.1970686-1-liu.yec@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 26, 2024 at 04:54:07PM +0800, liu.yec@h3c.com
 wrote: > From: LiuYe <liu.yeC@h3c.com> > > Currently, if CONFIG_KDB_KEYBOARD
 is enabled, then kgdboc will > attempt to use schedule_work() to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.46 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rrdiN-0002Yj-3Q
Subject: Re: [Kgdb-bugreport] [PATCH V7] kdb: Fix the deadlock issue in KDB
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

On Tue, Mar 26, 2024 at 04:54:07PM +0800, liu.yec@h3c.com wrote:
> From: LiuYe <liu.yeC@h3c.com>
>
> Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will
> attempt to use schedule_work() to provoke a keyboard reset when
> transitioning out of the debugger and back to normal operation.
> This can cause deadlock because schedule_work() is not NMI-safe.
>
> The stack trace below shows an example of the problem. In this
> case the master cpu is not running from NMI but it has parked
> the slave CPUs using an NMI and the parked CPUs is holding
> spinlocks needed by schedule_work().
>
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
> We fix the problem by using irq_work to call schedule_work()
> instead of calling it directly. irq_work is an NMI-safe deferred work
> framework that performs the requested work from a hardirq context
> (usually an IPI but it can be timer interrupt on some
> architectures).
>
> Note that we still need to a workqueue since we cannot resync
> the keyboard state from the hardirq context provided by irq_work.
> That must be done from task context for the calls into the input
> subystem. Hence we must defer the work twice. First to safely
> switch from the debug trap (NMI-like context) to hardirq and
> then, secondly, to get from hardirq to the system workqueue.
>
> Signed-off-by: LiuYe <liu.yeC@h3c.com>
> Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> ---
> V6 -> V7: Add comments in the code.
> V5 -> V6: Replace with a more professional and accurate answer.
> V4 -> V5: Answer why schedule another work in the irq_work and not do the job directly.
> V3 -> V4: Add changelogs
> V2 -> V3: Add description information
> V1 -> V2: using irq_work to solve this properly.
> ---
> ---
>  drivers/tty/serial/kgdboc.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 7ce7bb164..750ed66d2 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -22,6 +22,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_core.h>
> +#include <linux/irq_work.h>
>
>  #define MAX_CONFIG_LEN		40
>
> @@ -98,11 +99,29 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)
>  }
>
>  static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);
> +/*
> + * We fix the problem by using irq_work to call schedule_work()
> + * instead of calling it directly.

What problem?

Put another way this text has been copy-pasted from
the commit message without any editing to make it make sense. Text in
the C file needs to be standalone!

More like:
--- cut here ---
This code ensures that the keyboard state, which is changed during kdb
execution, is resynchronized when we leave the debug trap. The resync
logic calls into the input subsystem to force a reset. The calls into
the input subsystem must be executed from normal task context.

We need to trigger the resync from the debug trap, which executes in an
NMI (or similar) context. To make it safe to call into the input
subsystem we end up having use two deferred execution techniques.
Firstly, we use irq_work, which is NMI-safe, to provoke a callback from
hardirq context. Then, from the hardirq callback we use the system
workqueue to provoke the callback that actually performs the resync.
--- cut here ---

>                                     irq_work is an NMI-safe deferred work
> + * framework that performs the requested work from a hardirq context
> + * (usually an IPI but it can be timer interrupt on some
> + * architectures). Note that we still need to a workqueue since we cannot resync
> + * the keyboard state from the hardirq context provided by irq_work.
> + * That must be done from task context for the calls into the input
> + * subystem. Hence we must defer the work twice. First to safely
> + * switch from the debug trap (NMI-like context) to hardirq and
> + * then, secondly, to get from hardirq to the system workqueue.
> + */

Please find a better place to anchor the comment. It should be further
up in the file when the first bit of deferred work appears, perhaps near
kgdboc_restore_input_helper().


> +static void kgdboc_queue_restore_input_helper(struct irq_work *unused)
> +{
> +	schedule_work(&kgdboc_restore_input_work);
> +}
> +
> +static DEFINE_IRQ_WORK(kgdboc_restore_input_irq_work, kgdboc_queue_restore_input_helper);


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
