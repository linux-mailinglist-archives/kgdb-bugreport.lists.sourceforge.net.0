Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434E3289D1
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Mar 2021 19:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HNH3Ol98MC7Ink9CK17WP88esEacWKgM69leTc35t1E=; b=a7UFmYeYP2G7OaeyL4jf2MlZA
	KXCjNM1fdm3EUO7JWy0OyHOElNY6Q71J7YKVep05IujKMiCRMFPoAoTy7NjbeGbZRdGnO0sIJGyhS
	ML5dJRGafjHG5nHK+HI/8OtczJjYoohdGm4LT2RHZ/67rhQcVPInZFg5EhVwiwYI4zpRY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lGmxd-0005ou-V1
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Mar 2021 18:08:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lGmxb-0005o8-DU
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Mar 2021 18:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qp4HJtwIT4bWIf+9Fj02wgzG00aspAv7NDE1H9XsKw8=; b=loNszeO8dbBBSDwnI12ccEZt5s
 fjJceizf3QxjyzqLSKRrFmZcxKHaMPjpGGtWkSmSnX/OMwmYySFA+6RRq8d0HRe8w9XZy+HlieS8m
 3zcGJV6OFqK/xW48i0nPZQmM7udScm9GWLdzZNqXhup9Ec3b0IREG8wOvteaZnmKjFiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qp4HJtwIT4bWIf+9Fj02wgzG00aspAv7NDE1H9XsKw8=; b=AMSCdZQrG+qaP1m4CM45ArDjYU
 brG5SXijUcHBtk0gROWWMDrOYYxvDG4IB9lA7waPTcl+r8nuLZfMD2a/NZBzml/MLSdWEpFmnt/cV
 rI8Dj9Bw7ufKfZIbwEprA+yspHbfYn1nrjUSp9RU4W3+1cEQMdJX51jLsWZiGiGd7510=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGmxW-0006Mv-Fh
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Mar 2021 18:07:59 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614622064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qp4HJtwIT4bWIf+9Fj02wgzG00aspAv7NDE1H9XsKw8=;
 b=aH1+7x/WqqqBgwoXsxJWiMMfixqBzqQo+CHJ0FMCUdP0kn8yxVawZhEsqiOr+QSi7cVRUm
 cH6dvttkUBHzyuxGaLPn0bQ3ilhyaCz7ZY6y77iScN5BUKhqdowr9f4TAygKPghH0VyeHu
 hCUXGbUSrWDF6mn/T5TxstesPyTwCSg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E550DAE3C;
 Mon,  1 Mar 2021 18:07:43 +0000 (UTC)
Date: Mon, 1 Mar 2021 19:07:41 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YD0tbVV+hZOFvWyB@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225202438.28985-13-john.ogness@linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lGmxW-0006Mv-Fh
Subject: Re: [Kgdb-bugreport] [PATCH next v3 12/15] printk: introduce a
 kmsg_dump iterator
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Wei Liu <wei.liu@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jason Wessel <jason.wessel@windriver.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jordan Niethe <jniethe5@gmail.com>, Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, kgdb-bugreport@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2021-02-25 21:24:35, John Ogness wrote:
> Rather than storing the iterator information in the registered
> kmsg_dumper structure, create a separate iterator structure. The
> kmsg_dump_iter structure can reside on the stack of the caller, thus
> allowing lockless use of the kmsg_dump functions.
> 
> This change also means that the kmsg_dumper dump() callback no
> longer needs to pass in the kmsg_dumper as an argument. If
> kmsg_dumpers want to access the kernel logs, they can use the new
> iterator.
> 
> Update the kmsg_dumper callback prototype. Update code that accesses
> the kernel logs using the kmsg_dumper structure to use the new
> kmsg_dump_iter structure. For kmsg_dumpers, this also means adding a
> call to kmsg_dump_rewind() to initialize the iterator.
> 
> All this is in preparation for removal of @logbuf_lock.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/powerpc/kernel/nvram_64.c             | 14 +++---
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  3 +-
>  arch/powerpc/xmon/xmon.c                   |  6 +--
>  arch/um/kernel/kmsg_dump.c                 |  8 +--
>  drivers/hv/vmbus_drv.c                     |  7 +--
>  drivers/mtd/mtdoops.c                      |  8 +--
>  fs/pstore/platform.c                       |  8 +--
>  include/linux/kmsg_dump.h                  | 38 ++++++++-------
>  kernel/debug/kdb/kdb_main.c                | 10 ++--
>  kernel/printk/printk.c                     | 57 ++++++++++------------
>  10 files changed, 81 insertions(+), 78 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> index 532f22637783..5a64b24a91c2 100644
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -72,8 +72,7 @@ static const char *nvram_os_partitions[] = {
>  	NULL
>  };
>  
> -static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason);
> +static void oops_to_nvram(enum kmsg_dump_reason reason);
>  
>  static struct kmsg_dumper nvram_kmsg_dumper = {
>  	.dump = oops_to_nvram
> @@ -642,11 +641,11 @@ void __init nvram_init_oops_partition(int rtas_partition_exists)
>   * that we think will compress sufficiently to fit in the lnx,oops-log
>   * partition.  If that's too much, go back and capture uncompressed text.
>   */
> -static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason)
> +static void oops_to_nvram(enum kmsg_dump_reason reason)
>  {
>  	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>  	static unsigned int oops_count = 0;
> +	static struct kmsg_dump_iter iter;
>  	static bool panicking = false;
>  	static DEFINE_SPINLOCK(lock);
>  	unsigned long flags;
> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
>  		return;
>  
>  	if (big_oops_buf) {
> -		kmsg_dump_get_buffer(dumper, false,
> +		kmsg_dump_rewind(&iter);

It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
in all callers.

A solution might be to create the following in include/linux/kmsg_dump.h

#define KMSG_DUMP_ITER_INIT(iter) {	\
	.cur_seq = 0,			\
	.next_seq = U64_MAX,		\
	}

#define DEFINE_KMSG_DUMP_ITER(iter)	\
	struct kmsg_dump_iter iter = KMSG_DUMP_ITER_INIT(iter)

Then we could do the following at the beginning of both
kmsg_dump_get_buffer() and kmsg_dump_get_line():

	u64 clear_seq = latched_seq_read_nolock(&clear_seq);

	if (iter->cur_seq < clear_seq)
		cur_seq = clear_seq;


I am not completely sure about next_seq:

   + kmsg_dump_get_buffer() will set it for the next call anyway.
     It reads the blocks of messages from the newest.

   + kmsg_dump_get_line() wants to read the entire buffer anyway.
     But there is a small risk of an infinite loop when new messages
     are printed when dumping each line.

It might be better to avoid the infinite loop. We could do the following:

static void check_and_set_iter(struct kmsg_dump_iter)
{
	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
		kmsg_dump_rewind(iter);
}

and call this at the beginning of both kmsg_dump_get_buffer()
and kmsg_dump_get_line()

What do you think?

Note that I do not resist on it. But it might make the API easier to
use from my POV.

Otherwise the patch looks good to me.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
