Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A481E32A1A1
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Mar 2021 14:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p0RkTc9ZglpCLjKSu5Uk1+5Mx46p8RWL6WwnNJefUxA=; b=LVMerGqn3RvaXysnaZEygKNpP
	2LVSTWJ71/4irJ5vitzHgJH7yKrrYyLYRD99h7FgfkShvbRWRA3pcgFIn3YMPk6t5utLawXKjmLcC
	pRtOP+FuS8G/SCuhTN/cZdm0IWYc/BnEgwfVww+lhwS1ByQLpW5L+UIjdfnST8x6CDft4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lH5V5-0006FL-Es
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Mar 2021 13:55:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lH5V3-0006FC-Ir
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Mar 2021 13:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zHzG0WPsx3xKiPqPnMCcC9JpT/COf8SAqNxgYPDcwI=; b=k8tJZi2M0CbKNfejSjgunW/6/E
 dm5cp+NHQAxOhXjgU86ZhL26up8QFLRr6WLo5YPnU6KCfIwC+FSKRZwLb86Iy3aAe9XF/UhbktYMX
 9r+VD5I+bCEYPc98nHRszqFTymxVJEIzuwpnuskQwPY0wVqjGjAWJRTnzC9sfSIbs7DQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zHzG0WPsx3xKiPqPnMCcC9JpT/COf8SAqNxgYPDcwI=; b=D9LXggPVUoEUFXvcayYj7ZANdf
 KNZH+9TteGiRbikcBRUiiioDdyme3dZyqgB3ObiiJz8bL5stlw1ThthTRBV6PyZPptGBlxoVXW46t
 JEJD6QXyhobj7d5rBfVTTYakXrn+4YzJfgl6KWqtIgPkeB5xg6AOFuCVZxKE+4IZuoFo=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lH5Us-0000SD-SQ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Mar 2021 13:55:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614693328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2zHzG0WPsx3xKiPqPnMCcC9JpT/COf8SAqNxgYPDcwI=;
 b=oL4v99bE7SLyOQloEmxBm5+k/xMRvTkk4pt/OG8qvLA6b9DdiRhtxaD+0nUB4F5N4OQcsj
 Ic/6CdYJx/OPu8rlCqsNQGpM38HYhSfsHpGptacoyamFaVFqs7/yek3tHvqyg/+qcdd+DL
 OfjwuhDgZRqJTg+9ADLiziF6AFqEqM8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5718AAFF5;
 Tue,  2 Mar 2021 13:55:28 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:55:26 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YD5DzldNpnzuECaA@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de>
 <YD0tbVV+hZOFvWyB@alley> <87lfb5pu8c.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lfb5pu8c.fsf@jogness.linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
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
X-Headers-End: 1lH5Us-0000SD-SQ
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

On Tue 2021-03-02 14:20:51, John Ogness wrote:
> On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> >> index 532f22637783..5a64b24a91c2 100644
> >> --- a/arch/powerpc/kernel/nvram_64.c
> >> +++ b/arch/powerpc/kernel/nvram_64.c
> >> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
> >>  		return;
> >>  
> >>  	if (big_oops_buf) {
> >> -		kmsg_dump_get_buffer(dumper, false,
> >> +		kmsg_dump_rewind(&iter);
> >
> > It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
> > in all callers.
> >
> > A solution might be to create the following in include/linux/kmsg_dump.h
> >
> > Then we could do the following at the beginning of both
> > kmsg_dump_get_buffer() and kmsg_dump_get_line():
> >
> > 	u64 clear_seq = latched_seq_read_nolock(&clear_seq);
> >
> > 	if (iter->cur_seq < clear_seq)
> > 		cur_seq = clear_seq;
> 
> I suppose we need to add this part anyway, if we want to enforce that
> records before @clear_seq are not to be available for dumpers.

Yup.

> > It might be better to avoid the infinite loop. We could do the following:
> >
> > static void check_and_set_iter(struct kmsg_dump_iter)
> > {
> > 	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
> > 		kmsg_dump_rewind(iter);
> > }
> >
> > and call this at the beginning of both kmsg_dump_get_buffer()
> > and kmsg_dump_get_line()
> >
> > What do you think?
> 
> On a technical level, it does not make any difference. It is pure
> cosmetic.

Yup.

> Personally, I prefer the rewind directly before the kmsg_dump_get calls
> because it puts the initializer directly next to the user.
> 
> As an example to illustrate my view, I prefer:
> 
>     for (i = 0; i < n; i++)
>         ...;
> 
> instead of:
> 
>     int i = 0;
> 
>     ...
> 
>     for (; i < n; i++)
>         ...;
> 
> Also, I do not really like the special use of 0/U64_MAX to identify
> special actions of the kmsg_dump_get functions.

Fair enough.

> > Note that I do not resist on it. But it might make the API easier to
> > use from my POV.
> 
> Since you do not resist, I will keep the API the same for v4. But I will
> add the @clear_seq check to the kmsg_dump_get functions.

Go for it.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
