Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E701C11AC
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 May 2020 13:49:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUUB3-0005JE-6A
	for lists+kgdb-bugreport@lfdr.de; Fri, 01 May 2020 11:49:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jUUB1-0005J2-2X
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 11:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wZe2OaPSCDY2afaaPs7tXOLu/QH16szPzOl/6fyIoCI=; b=ZYCbdvDYU+Q6U8zst+v5gOa9NJ
 CN14Xraf4lyu7CHQtqyT8H3JANDowrsyuU/KYKxtZJJes/oY6mv2yVuPeSPlbcmD84yQK8viH/SKX
 k+ZxsnlW42kDO3zv7R5d5dPiTq7ERtOYob2tIZYkHWC/4L78vtCDBf40VmeyMrkmLFro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wZe2OaPSCDY2afaaPs7tXOLu/QH16szPzOl/6fyIoCI=; b=LCbtg1LCk/U/3AtUGmAJTz8rHK
 KkitBWRUW3wIotEKuDmUmxFaWS4GITAsk2bbr+wQaxGgpTb1O/GyVv9S9IKd8SRLcyFeEttuagnIa
 GOk3dM9lGcHAnnyCb99eqEJ4/wvVwNky0PrkA64ey9qP4CNxj+oDCnALhSuL8fArBz8U=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUUAy-006eYf-6c
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 11:49:55 +0000
Received: by mail-wr1-f65.google.com with SMTP id h9so931263wrt.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wZe2OaPSCDY2afaaPs7tXOLu/QH16szPzOl/6fyIoCI=;
 b=HnpeYN4+TYH+XayrvAH7rL5ulJldblF3Ng/1chwg39cdkkrQL4rmBVo1lNcCQe1ahE
 9KyLRPrC6rq3s+1sin2kOHGQnkFiCQ9gC5CZlu2DX5cI9LmWo2Bi3miDdWZ5TKSWmET5
 SRMRg6gqQqE+GiVQ2dzIBKRxknXFevRv3w7t057tmCY4b8/RA7CwMmmcB+Td7+fv+vAC
 T6J8UT6bu3/6ANuZZahYPFDO/P/G43HlDBVLg+NiDmORssGZKuKq1ee1TMvhuli+ndt0
 4Q4zLMmYK2y5Evkdloc6SaWjMe8wQFoWs7NOPa86ImWE9cAfy6Z+/Ep69b3oXMs4dP+J
 BPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wZe2OaPSCDY2afaaPs7tXOLu/QH16szPzOl/6fyIoCI=;
 b=tycl0QNZ9GVrEV/n+P5N2ZYin0x/1PBfiMH1pqQMEXjOpiN/9KDuC44RVdQSUlP7mr
 xlRPe+LZ3qUygharQbW6+GBzXgQUrBghnB1ErQhJFnFmhbo5JbxQmgIU6uY6t7QQ38wz
 352ZGD+PjWgrbh37cFUp/5gHBozjv8PgpZaxUIcBLF1/DRKr6BvPOvAGXXR7vNs9sWKT
 wnAs5/Eb9kWD+aNynjj1yr4yVVTufpkF5CwNeZ08AwMKSHvdYfSgcG0JpRZiU7DMFwD+
 pGLcBjnnV7OTyW6tbzMgtRtSXO4OO86rZD03J2wJHf0UNytsm1Z8/9Ngq3R1A6SpCWeC
 7zFw==
X-Gm-Message-State: AGi0PuZQ3hFVOqNajUV42U3DSAurT1NdUpvbkU71aRzxH7Havv2s+4O5
 oq22NzczGBr6LxVZVUvRCM3rGw==
X-Google-Smtp-Source: APiQypISgLF1uo9wNeadwVw7nKzKFWvl5TOTlq1H4Pk/72E9uiX1TgTiyZUcpV2jCxAiwy9I2F7tRQ==
X-Received: by 2002:a5d:634a:: with SMTP id b10mr3866323wrw.263.1588333785560; 
 Fri, 01 May 2020 04:49:45 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b12sm4578913wro.18.2020.05.01.04.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 04:49:44 -0700 (PDT)
Date: Fri, 1 May 2020 12:49:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200501114943.ioetuxe24gi27bll@holly.lan>
References: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUUAy-006eYf-6c
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Be a bit more robust about
 handling earlycon leaving
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Apr 30, 2020 at 09:59:09AM -0700, Douglas Anderson wrote:
> The original implementation of kgdboc_earlycon included a comment
> about how it was impossible to get notified about the boot console
> going away without making changes to the Linux core.  Since folks
> often don't want to change the Linux core for kgdb's purposes, the
> kgdboc_earlycon implementation did a bit of polling to figure out when
> the boot console went away.
> 
> It turns out, though, that it is possible to get notified about the
> boot console going away.  The solution is either clever or a hack
> depending on your viewpoint.  ...or, perhaps, a clever hack.  All we
> need to do is head-patch the "exit" routine of the boot console.  We
> know that "struct console" must be writable because it has a "next"
> pointer in it, so we can just put our own exit routine in, do our
> stuff, and then call back to the original.

I think I'm in the hack camp on this one!

 
> This works great to get notified about the boot console going away.
> The (slight) problem is that in the context of the boot console's exit
> routine we can't call tty_find_polling_driver().

I presume this is something to do with the tty_mutex?


> We solve this by
> kicking off some work on the system_wq when we get notified and this
> works pretty well.

There are some problems with the workqueue approach.

Firstly, its runs too early on many systems (esp. those that register
the console from a console initcall. kgdboc cannot find the tty, I think
because the console is registered a long time before the corresponding
tty comes up.

Secondly I am seeing warnings related to the tty_mutex where the
might_sleep() machinery ends up flushing the active workqueue.

[   39.298332] ------------[ cut here ]------------                             
[   39.298332] WARNING: CPU: 0 PID: 5 at kernel/workqueue.c:3033 __flush_work+00
[   39.298332] Modules linked in:                                               
[   39.298332] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.7.0-rc3+ #47       
[   39.298332] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-204
[   39.298332] Workqueue: events kgdboc_earlycon_exit_work_fn           
[   39.298332] RIP: 0010:__flush_work+0x19c/0x1c0                               
[   39.298332] Code: 4c 8b 6d 20 e9 06 ff ff ff 41 c6 04 24 00 fb 45 31 f6 eb 8f
[   39.298332] RSP: 0018:ffff993500033dd0 EFLAGS: 00010246                      
[   39.298332] RAX: 0000000000000000 RBX: ffffffffadcd0720 RCX: 0000000000000001
[   39.298332] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffadcd0820
[   39.298332] RBP: ffff8a633ec299c0 R08: 0000000000000000 R09: 0000000000000001
[   39.298332] R10: 000000000000000a R11: f000000000000000 R12: 00000000ffffffed
[   39.298332] R13: ffff8a633e408840 R14: 0000000000000000 R15: ffff8a633e408840
[   39.298332] FS:  0000000000000000(0000) GS:ffff8a633ec00000(0000) knlGS:00000
[   39.298332] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033                
[   39.298332] CR2: ffff8a6333201000 CR3: 0000000032a0a000 CR4: 00000000000006f0
[   39.298332] Call Trace:                                                      
[   39.298332]  ? _cond_resched+0x10/0x20                                       
[   39.298332]  ? mutex_lock+0x9/0x30                                           
[   39.298332]  ? tty_find_polling_driver+0x134/0x1a0                      
[   39.298332]  configure_kgdboc+0x12d/0x1c0                                    
[   39.298332]  kgdboc_earlycon_exit_work_fn+0x1a/0x40                          
[   39.298332]  process_one_work+0x1d3/0x380                                    
[   39.298332]  worker_thread+0x45/0x3c0                                        
[   39.298332]  kthread+0xf6/0x130                                              
[   39.298332]  ? process_one_work+0x380/0x380                                  
[   39.298332]  ? kthread_park+0x80/0x80                                        
[   39.298332]  ret_from_fork+0x22/0x40                                         
[   39.298332] ---[ end trace 1190f578d6e11204 ]---                             
[   39.298338] KGDB: Unregistered I/O driver kgdboc_earlycon, debugger disabled 


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
