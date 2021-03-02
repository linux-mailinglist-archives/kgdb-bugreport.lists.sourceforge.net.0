Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080A32A05C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Mar 2021 14:21:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lH4xg-00081k-V6
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Mar 2021 13:21:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <john.ogness@linutronix.de>) id 1lH4xf-00081V-9c
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Mar 2021 13:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=; b=gJkGdHJBvzy8LbNzqjif8f3ZA
 nQUAd7i2lnsglkXOB7vwDmq58OeuHYWh72NEBkMq3m4m8hXBFjSrw8ZxnzRsaxkAUZJxFGp3ajnoy
 6vZZb3fonDrLxCzEd12T7ygQcdPjwBb4y8PNH/WT5Wdgr5wF62ZXr2RtxRQzNofjFZqio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=; b=kGG1W16hW+LaO+IGPAeC5O+xYI
 Fyy3VYe9LvAitKLvKBtKR0/ethtbn2bKOfNhYdLeD7Y+7hNbaWzB5R+HovzaEnYmeAH49cdrvHqtO
 Mg/vpSAHCF2L9l1+siKMsLcogQBRvUkllebpElGyKkURXh9lMmfXie/9GIEXlJ/FLmtY=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lH4xZ-0007Iu-8X
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Mar 2021 13:21:15 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614691254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=;
 b=pdbP0RvjlLwhT6MGt3O7gZlZ1Q1Vzt4kvyP2jb11vAJTSkByIgWXRKROCs34fG3dE0AwTY
 opU3gtVisKtnKDi9H9VaqI9P0bhcuxW+ktoNqViJTmLm/vR+nRGAu3kprbB/6g5+VBDeOZ
 ISR5jMmEubi9pF4n2AWS1K7EJF6nQqOZ7mmnpB1SEorJMS5eXC6YUniwsW+o9YMWNEx/Xj
 xPN5r8bZzOsf6A9vVjHdFrwNDVoQDh1yYdiMi7tbkNI3fa/NGcpZ+fYwM9XNXow6mIJwhV
 c6N2wQQqBhJ0Qe4yqQIr91zIX6QAKM27rCmbJHH1uo6HBm2Z4utmX+gBS6ubiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614691254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=;
 b=PvCf8UGzPtfD1uoD5xPlqfOPLQKMHyVSQbbcSZy98K9oXrA3licqYHQYy8osgfMblhBHAa
 hvqSY9FaOO6n64Aw==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <YD0tbVV+hZOFvWyB@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de> <YD0tbVV+hZOFvWyB@alley>
Date: Tue, 02 Mar 2021 14:20:51 +0100
Message-ID: <87lfb5pu8c.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lH4xZ-0007Iu-8X
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

On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
>> index 532f22637783..5a64b24a91c2 100644
>> --- a/arch/powerpc/kernel/nvram_64.c
>> +++ b/arch/powerpc/kernel/nvram_64.c
>> @@ -72,8 +72,7 @@ static const char *nvram_os_partitions[] = {
>>  	NULL
>>  };
>>  
>> -static void oops_to_nvram(struct kmsg_dumper *dumper,
>> -			  enum kmsg_dump_reason reason);
>> +static void oops_to_nvram(enum kmsg_dump_reason reason);
>>  
>>  static struct kmsg_dumper nvram_kmsg_dumper = {
>>  	.dump = oops_to_nvram
>> @@ -642,11 +641,11 @@ void __init nvram_init_oops_partition(int rtas_partition_exists)
>>   * that we think will compress sufficiently to fit in the lnx,oops-log
>>   * partition.  If that's too much, go back and capture uncompressed text.
>>   */
>> -static void oops_to_nvram(struct kmsg_dumper *dumper,
>> -			  enum kmsg_dump_reason reason)
>> +static void oops_to_nvram(enum kmsg_dump_reason reason)
>>  {
>>  	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>>  	static unsigned int oops_count = 0;
>> +	static struct kmsg_dump_iter iter;
>>  	static bool panicking = false;
>>  	static DEFINE_SPINLOCK(lock);
>>  	unsigned long flags;
>> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
>>  		return;
>>  
>>  	if (big_oops_buf) {
>> -		kmsg_dump_get_buffer(dumper, false,
>> +		kmsg_dump_rewind(&iter);
>
> It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
> in all callers.
>
> A solution might be to create the following in include/linux/kmsg_dump.h
>
> #define KMSG_DUMP_ITER_INIT(iter) {	\
> 	.cur_seq = 0,			\
> 	.next_seq = U64_MAX,		\
> 	}
>
> #define DEFINE_KMSG_DUMP_ITER(iter)	\
> 	struct kmsg_dump_iter iter = KMSG_DUMP_ITER_INIT(iter)

For this caller (arch/powerpc/kernel/nvram_64.c) and for
(kernel/debug/kdb/kdb_main.c), kmsg_dump_rewind() is called twice within
the dumper. So rewind will still be used there.

> Then we could do the following at the beginning of both
> kmsg_dump_get_buffer() and kmsg_dump_get_line():
>
> 	u64 clear_seq = latched_seq_read_nolock(&clear_seq);
>
> 	if (iter->cur_seq < clear_seq)
> 		cur_seq = clear_seq;

I suppose we need to add this part anyway, if we want to enforce that
records before @clear_seq are not to be available for dumpers.

> I am not completely sure about next_seq:
>
>    + kmsg_dump_get_buffer() will set it for the next call anyway.
>      It reads the blocks of messages from the newest.
>
>    + kmsg_dump_get_line() wants to read the entire buffer anyway.
>      But there is a small risk of an infinite loop when new messages
>      are printed when dumping each line.
>
> It might be better to avoid the infinite loop. We could do the following:
>
> static void check_and_set_iter(struct kmsg_dump_iter)
> {
> 	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
> 		kmsg_dump_rewind(iter);
> }
>
> and call this at the beginning of both kmsg_dump_get_buffer()
> and kmsg_dump_get_line()
>
> What do you think?

On a technical level, it does not make any difference. It is pure
cosmetic.

Personally, I prefer the rewind directly before the kmsg_dump_get calls
because it puts the initializer directly next to the user.

As an example to illustrate my view, I prefer:

    for (i = 0; i < n; i++)
        ...;

instead of:

    int i = 0;

    ...

    for (; i < n; i++)
        ...;

Also, I do not really like the special use of 0/U64_MAX to identify
special actions of the kmsg_dump_get functions.

> Note that I do not resist on it. But it might make the API easier to
> use from my POV.

Since you do not resist, I will keep the API the same for v4. But I will
add the @clear_seq check to the kmsg_dump_get functions.

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
