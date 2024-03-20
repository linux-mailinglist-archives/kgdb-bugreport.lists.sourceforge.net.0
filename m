Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1F8815A1
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 Mar 2024 17:28:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rmyna-0007AD-H5
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 20 Mar 2024 16:28:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rmyna-0007A7-5K
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 20 Mar 2024 16:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msB9F7QOeQwvM5EEEp7pk58WHiFSBilQq0veDXMN8ik=; b=cLv9ddxa6gjmUqiqfeRYbBXDiW
 y9zkJWc/p2akaeAONJU5ndVaWf3My63anf3TiAWytwpeAwwi/BHRmdLQl/ZYO3pSlnQrJn4Fu+BaN
 l3Rj7RxSglHgTHIHA7r65kwWejpBnza2yGphlibYx66coPZT8xPVa0iMHWB4BLS1XQBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=msB9F7QOeQwvM5EEEp7pk58WHiFSBilQq0veDXMN8ik=; b=hIT87z2blPEdnLhgxEWYolq7C1
 05a9HLljrIz729UHHVxtr2yyXGhIHl+132jxqU91N5P8fi/EocuYHvhaXWPMw+A55oFIgGoVz7ILa
 6epVNr6BR6iqvn9tc9uhYrdf5XmlYTMrt1c8lGJOzSEwo9tLQNpxKR3B0jC17AEB6VfE=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rmynQ-0004fm-Px for kgdb-bugreport@lists.sourceforge.net;
 Wed, 20 Mar 2024 16:28:18 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso1650f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 Mar 2024 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710952085; x=1711556885; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=msB9F7QOeQwvM5EEEp7pk58WHiFSBilQq0veDXMN8ik=;
 b=LoROdShPQSIrHdJ8/Oqlk02smni4ouPlljEI54MqSLkhGA1APtPUI7aPqY8sw5asqo
 jXb0crYfci89KVbCk509dtYphWVuG4g3vYRhW5xu5PAFdVLFbzzJPlmZeYWyh1U+Xm7F
 oHTRDV4Idvw8UfywVCRSKtmp0lGQHSXkMPV+ZJo3DnCdZo0Oj2WArhGFevarhmXh15Ka
 Jq5lt3Dv6WkfP5JskKHUkzz5UYf7cbLo27OPKsPWgm8bGPDzCYtyYPW3Bdztij51Eipe
 u6Ae9SvXB7RtSg39/+XqePqxFW0rOlgh8KMm2M4tMEcvNJHrGYJkpkFs3iGA+cjxtkW9
 oZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710952085; x=1711556885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msB9F7QOeQwvM5EEEp7pk58WHiFSBilQq0veDXMN8ik=;
 b=FohXHovG8BEqdhd5VxmGSXMIMisIXsqtCQytNpX1DG6w2A8b2dstIOA9XuSiIcKdTV
 rJ3z/QIjlGlLmr3KhSmBgldrGukBwuqWgpjB1yfnQJf6DWwjN/ZRf8Zbt/ELrueVLXFo
 8sKciEKQEF5YkLzmyZuPL95AgYMglvgPWqqED1ZU2qiQFL1QqYNMgEqYyGdUATF64CSb
 v7q/4uyHGdUNX0rvIwfcrzu/Pbhpo8oPsoVNg+1hkJOGZ7GM9qtM3TmqoPal3bv62dwU
 wLuccL8MTCwdJC5JzTR3JqKFx8EfnY/N7SjTC3yVq+I4PvbSt3qHUisWjVjxqtz1q/cs
 9omg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxwYzaG5s1byUgk2DwCw4hfsYepxag/GljDLJ3MSvQnexmsN+glQtboNKT2hOvS99twfsUxsQaaQjkhE11zZ4Rp5ggjKJakT4HqGd0F9eHTqFsw/Y=
X-Gm-Message-State: AOJu0YzqKq6rP16FwNV/kGoGU2F2jQ6XTJeZ4WaQ/SXvjRxUcqRHFT61
 WUZAlfdhHQIg69un+pWrN4dTETotkrN9OHbRRgg+CIM5+44HK1gRmCubopTG0tg=
X-Google-Smtp-Source: AGHT+IHstSVEPL+xvtOXSxEs1vKRqfJRf0BWqW/KLyPo8TIErjY7+CyoRIq2xlo5N0rNxiR2Se/3NA==
X-Received: by 2002:a5d:64ab:0:b0:33e:781e:da57 with SMTP id
 m11-20020a5d64ab000000b0033e781eda57mr1983079wrp.53.1710952084670; 
 Wed, 20 Mar 2024 09:28:04 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m10-20020adffe4a000000b0033de10c9efcsm14961571wrs.114.2024.03.20.09.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 09:28:04 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:28:02 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: liu.yec@h3c.com
Message-ID: <20240320162802.GA22198@aspen.lan>
References: <20240314130916.GE202685@aspen.lan>
 <20240316023443.101169-1-liu.yec@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240316023443.101169-1-liu.yec@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ^^^ This is v2 isn't it? On Sat, Mar 16, 2024 at 10:34:43AM
 +0800, liu.yec@h3c.com wrote: > From: LiuYe <liu.yeC@h3c.com> > > Currently,
 if CONFIG_KDB_KEYBOARD is enabled,
 then kgdboc will > attempt to use schedule_work() to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmynQ-0004fm-Px
Subject: Re: [Kgdb-bugreport] [PATCH v1] kdb: Fix the deadlock issue in KDB
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

^^^ This is v2 isn't it?

On Sat, Mar 16, 2024 at 10:34:43AM +0800, liu.yec@h3c.com wrote:
> From: LiuYe <liu.yeC@h3c.com>
>
> Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will
>   attempt to use schedule_work() to provoke a keyboard reset when transitioning out

Please format the description correctly.


> of the debugger and back to normal operation. This can cause
> deadlock because schedule_work() is not NMI-safe.

Wasn't there another paragraph to go here?

: The stack trace below shows an example of the problem. In this
: case the master cpu is not running from NMI but it has parked
: the slave CPUs using an NMI and the parked CPUs is holding
: spinlocks needed by schedule_work().


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
> Suggested-by: daniel.thompson@linaro.org

Thanks for the credit but I think the following is probably a better way
to express it:

Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
