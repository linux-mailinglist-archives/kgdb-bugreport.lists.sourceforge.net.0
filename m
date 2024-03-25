Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F988AA47
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Mar 2024 17:55:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ronb9-0001XA-P9
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 25 Mar 2024 16:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1ronb5-0001Wg-EL
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 25 Mar 2024 16:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=thWnxSeVJWJoNwYSEy6KslujnniVC0YW7pv2seZdkrc=; b=NX8X+BZEXB1zLJPjgVA8InzQQS
 aa7pKtiwRSyZmcgSBiRv6Ct4O8/wbrFt8IkCiR7c+aeCyq+GdSZJRWPL5L4dwGlY/Ee6Rg4n0QRDT
 YYzgwKybDc0w8rjz2UYQBxtRoPTkEW8GthEtKXugd9Z6P3SUJJMta5bKXEOpBKeDvd5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=thWnxSeVJWJoNwYSEy6KslujnniVC0YW7pv2seZdkrc=; b=RGOatWgt4XeC4H1fBkgDZts6Lb
 AOEz83Q6ANKo7nOcCUqodPm6tAzt2shhCmh//fEvKVUbw5TVm4fI9x32t/uPmXiMQWZWzQVt+dzAP
 QFJxMotBwTWrkXT0ylYZ4JqwDch9K9pdOyXd9F7Ix8NOS0+eoCQrODR0hlmPPJ/nJ54E=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ronb1-0003X6-Hy for kgdb-bugreport@lists.sourceforge.net;
 Mon, 25 Mar 2024 16:54:56 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4148c95db1fso1276295e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Mar 2024 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711385680; x=1711990480; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=thWnxSeVJWJoNwYSEy6KslujnniVC0YW7pv2seZdkrc=;
 b=PGuPJy6UhwZL5nmZVdVP9eCcD77oOEHgAORZaSI4I76KdW+4hAfEkv5ObnvtUOq4P/
 vn+yQdZ3sWNsT2yHCxyK6BTojTT5aswan9iDpT2xmh/IDUrQH2oFdeiemmWcm+PacKnC
 OX5MEBpfiLzwgUOUGwgNjBm1cFdwOKhv9NnkvSotCwW9337Dhx5dUDgOAdbTbVpQdLX0
 cAZI8PRA8JnfqMMgiiPJAWgEWyVu58dS8jaK8uX7ajOCsQ3WUTfOAnEs1T2NmAgX3H1S
 VzsfiyMdGiZD3j/7nP9V72vBGkOd8++rsIZhP2vSnnfS6Ebj+XBPkEbmdljbif4ibfHK
 +KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711385680; x=1711990480;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thWnxSeVJWJoNwYSEy6KslujnniVC0YW7pv2seZdkrc=;
 b=GobfucROvcBjJXVk6Y4ntjUjPM6i+kpP6EYbFyb8eVV/QOQW1pMIkogcX/sOzqkrzA
 auuTWXIQK4RKSDlSTVc7BYslQgLK0cvXH9g7F+YEpHVA5koFky11Jxnppzk0eEWqyQS9
 3d9w4JGTlhXviqIsrrWmyJ4xuKArS4ZGabYsqBlXupSGUSvgdzTn+DrKYa+W7kXQdaGG
 Days99xNLI9TUQvuldtsA7TRhv0MSQKmzF6LLSBEQXb7x1JG2lOT7iVwrlPDpx90fMYB
 Odp3hwEjIxclvE9Pqe9kHbtoacSV+tqZ6uUjMj0ZZCWXgASKWEyyH5zXfCAVQn4VDcH/
 w8rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV549YU8YCwvst1VVM9A3T08miWtS5atF1OSdB7INRqPgld/boiReYvSigPfVKzaTqm5QSrsecztix/tvjrXh99SA83T7h5dhGOkiVYH0cdqCLpFMA=
X-Gm-Message-State: AOJu0YztoQrwp6KlE0uL5TaYQFk6Im+cuEM2yrIwMlgbUK94Xqy7f7nB
 6Oqyam5o6C2xqajOgwk3mTPOTI1C1OOdia9xFA18q+AE3+4ZnSowKMKOkslUhAa2br8tVNNvFYZ
 33cs=
X-Google-Smtp-Source: AGHT+IHteQ08KR4uBeC4mxrJOYPYdh8IfwZeys4Zf0ji1SkwDrS1kdczfpPUgcIsXuTKPaRgcaodUQ==
X-Received: by 2002:a05:600c:214:b0:414:924:8ff9 with SMTP id
 20-20020a05600c021400b0041409248ff9mr6276879wmi.34.1711385680250; 
 Mon, 25 Mar 2024 09:54:40 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b003418016b04csm9938384wrt.76.2024.03.25.09.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:54:38 -0700 (PDT)
Date: Mon, 25 Mar 2024 16:54:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: liu.yec@h3c.com
Message-ID: <20240325165436.GA485978@aspen.lan>
References: <20240322155818.GD7342@aspen.lan>
 <20240323014141.3621738-1-liu.yec@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240323014141.3621738-1-liu.yec@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Mar 23, 2024 at 09:41:41AM +0800, liu.yec@h3c.com
 wrote: > From: LiuYe <liu.yeC@h3c.com> > > Currently, if CONFIG_KDB_KEYBOARD
 is enabled, then kgdboc will > attempt to use schedule_work() to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ronb1-0003X6-Hy
Subject: Re: [Kgdb-bugreport] [PATCH V5] kdb: Fix the deadlock issue in KDB
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

On Sat, Mar 23, 2024 at 09:41:41AM +0800, liu.yec@h3c.com wrote:
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
> Just need to postpone schedule_work to the slave CPU exiting the NMI context.
>
> irq_work will only respond to handle schedule_work after exiting the current interrupt context.
>
> When the master CPU exits the interrupt context, other CPUs will naturally exit the NMI context, so there will be no deadlock.
>
> It is the call to input_register_handler() that forces us not to do the work from irq_work's hardirq callback.
>
> Therefore schedule another work in the irq_work and not do the job directly.

This looks like it was copy and pasted from the e-mail thread without
any editing to make it make any sense. It not even formatted correctly
(where are the line breaks?).

How about:

We fix the problem by using irq_work to call schedule_work()
instead of calling it directly. irq_work is an NMI-safe deferred work
framework that performs the requested work from a hardirq context
(usually an IPI but it can be timer interrupt on some
architectures).

Note that we still need to  a workqueue since we cannot resync
the keyboard state from the hardirq context provided by irq_work.
That must be done from task context for the calls into the input
subystem. Hence we must defer the work twice. First to safely
switch from the debug trap (NMI-like context) to hardirq and
then, secondly, to get from hardirq to the system workqueue.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
