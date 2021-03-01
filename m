Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA532864A
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Mar 2021 18:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j+NwPGEgAhMN1Uq2AR1M5tcZP8//V8jGW0bR3JHDj1c=; b=m0YX69up7+vQ+LnZo4n7/EuUs
	uR6wq9rzuiFtO3+yb01ONv9LWyRJFjgvYvHe/fH+oXDwzUFw+E603n/TIQEZjVH8kUtHcA92A823C
	ml1PDxkL2TrFP+JrWaEfaBkI9+OvXIEZV4cfbWuSrPbL+kLur41V7dsCRhoDw5ka+UJkg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lGm3D-0000BO-Fv
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Mar 2021 17:09:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lGm3B-0000BH-Mk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Mar 2021 17:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H35nz79U3iTc666xWR8lPmhHegrvhs5FWA9WuA5DkEI=; b=A3aLRSRI65SOW0RxGvyHHIOYOQ
 8JegW3dgalcPCsWR8zGD29znpsIp2IWKIoAhWTZwII0Q6j7mTxAapRvWRVklYbFgC3ptJO9PitTvr
 Q/uQT7T+O2rNAAJ6HiQSRaXHsS5y7qHl7ZoGsQT+KXma85OsMIRCZ4m5tNiBlbN+P8KM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H35nz79U3iTc666xWR8lPmhHegrvhs5FWA9WuA5DkEI=; b=FRK7L/1ySLLOgh7+j65ON9f0+9
 KBO11flEVNl+b6WuisqreQ8tgGt4o+HDTiMFSexLevzdgkDTLJShdo2oAl+R+YiMI88zYbogkxPCA
 HOkxd0XgingJUZZyP5jNdRwuPGF8sGDHZPgTrucUopfS8G7LAEyD8/2Ox1OP54czMdmo=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGm35-00A9Iv-KS
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Mar 2021 17:09:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614618565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H35nz79U3iTc666xWR8lPmhHegrvhs5FWA9WuA5DkEI=;
 b=RqQ5wOe0/iOPbgkCB6+F3wjB6c0eOIYiAodwUelOlBKkvKla4T6I47dITleDs6+RLWIspc
 Es21DW2KUJVlAfVhSegO/4+EAe2vuEUr39OyN6XxmJfp4q/GBF6Pnh5R6EkEnA3PcrwpfB
 JyUEYKEYJ1KY7x0yNXuizUFDOpdNCiw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FB08AE3C;
 Mon,  1 Mar 2021 17:09:25 +0000 (UTC)
Date: Mon, 1 Mar 2021 18:09:23 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YD0fw0DErfsi2ibs@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-12-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225202438.28985-12-john.ogness@linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lGm35-00A9Iv-KS
Subject: Re: [Kgdb-bugreport] [PATCH next v3 11/15] printk: kmsg_dumper:
 remove @active field
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe <jniethe5@gmail.com>,
 Wei Li <liwei391@huawei.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, Alistair Popple <alistair@popple.id.au>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2021-02-25 21:24:34, John Ogness wrote:
> All 6 kmsg_dumpers do not benefit from the @active flag:
> 
>   (provide their own synchronization)
>   - arch/powerpc/kernel/nvram_64.c
>   - arch/um/kernel/kmsg_dump.c
>   - drivers/mtd/mtdoops.c
>   - fs/pstore/platform.c
> 
>   (only dump on KMSG_DUMP_PANIC, which does not require
>   synchronization)
>   - arch/powerpc/platforms/powernv/opal-kmsg.c
>   - drivers/hv/vmbus_drv.c
> 
> The other 2 kmsg_dump users also do not rely on @active:
> 
>   (hard-code @active to always be true)
>   - arch/powerpc/xmon/xmon.c
>   - kernel/debug/kdb/kdb_main.c

Great summary!

> Therefore, @active can be removed.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
