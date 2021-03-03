Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4D32B851
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Mar 2021 14:48:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yCH7u1FRHt3Q0PyR5ZIVDJwb185qgGNNWkiqtzrlC+8=; b=B29F3Qr1Hurxi3iPw/2pZBtn5
	c3/DfhVL/D8fZu3XPhqbtbdNzNtvPA21wX61axkDwLmboanCtGF+Tj5UdjZApo/1u7q6D4pqARFLr
	uU3bepTSajIv6HOu2p4S8ZFsb8v1b4NpM+sBqzR+33y0FPBd1WY24dfeWkID0usLe0yX8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lHRs1-0003AO-GL
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Mar 2021 13:48:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lHRrz-0003AE-Rb
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 13:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pu/3seYMql33mUGXHcZj1oG0qaMLQn8mcgtStwoiQOY=; b=U82Y9GGo6epvzQ/DT0OaRDdgti
 HtYadri3IAM/nReiNWv4L1YoeXh5WhXQJGusdvPrfI5fhYCQiw2IAP+qIzV29b6R3Axg9p7sLdx0n
 dkd/yHgrrIY2PBVIJhcOujjxHho32uyG4yxpkQWj6+lihPfxiPetx97z1nCa9vCUp2sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pu/3seYMql33mUGXHcZj1oG0qaMLQn8mcgtStwoiQOY=; b=JJp40tC6/a7puaL739ntPXCmc6
 hNb9QVAl+fk8INNo0af8sk3QnuhMjMII/inniz8u/h1miR3rPPK7/vyFnqxN4c2RIW97PB4vyMm0W
 kyLd82YKbl+qUzolJoa6zNncVXz/fP8NXf1hVT8V58hAJrNn4GK36EX3DCcw2F5L3D+c=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHRrp-00081D-GI
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 13:48:55 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614779319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pu/3seYMql33mUGXHcZj1oG0qaMLQn8mcgtStwoiQOY=;
 b=qi4UC6hUpKVqsIab1ecHkri1SQfudluavf0CINthr1FLnsNtM5q8rG05RSaCJn+Um9pgwR
 JfB+Vj2/CNZ02GVC22inMEzATHJ+8kPxSW7/R6gewxBgKHq1cQaLnv6iq+ws7baN5OJd9I
 zx5+UaQymkuoSD+q1Ar5CPG7aqqg87o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9E98AC24;
 Wed,  3 Mar 2021 13:48:38 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:48:33 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YD+TsR+yiM2RB9Hh@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <20210303101528.29901-13-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303101528.29901-13-john.ogness@linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
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
X-Headers-End: 1lHRrp-00081D-GI
Subject: Re: [Kgdb-bugreport] [PATCH next v4 12/15] printk: introduce a
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
 Jason Wessel <jason.wessel@windriver.com>,
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

On Wed 2021-03-03 11:15:25, John Ogness wrote:
> Rather than storing the iterator information in the registered
> kmsg_dumper structure, create a separate iterator structure. The
> kmsg_dump_iter structure can reside on the stack of the caller, thus
> allowing lockless use of the kmsg_dump functions.
> 
> Update code that accesses the kernel logs using the kmsg_dumper
> structure to use the new kmsg_dump_iter structure. For kmsg_dumpers,
> this also means adding a call to kmsg_dump_rewind() to initialize
> the iterator.
> 
> All this is in preparation for removal of @logbuf_lock.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Kees Cook <keescook@chromium.org> # pstore

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
