Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F432B8A1
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Mar 2021 15:34:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lHSaP-0005Pt-Bg
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Mar 2021 14:34:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=ZNcr=IB=goodmis.org=rostedt@kernel.org>)
 id 1lHSaO-0005Pl-B2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 14:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vQQYclZemRCsDmI55KbxT5Jnti/1tTrx8cpBRYPsKlU=; b=bXzjI8Me911gdazz/aNkAR+RRC
 2DCIRDVauYjW78HaYCBmAm9BLCz859XFauwOf6MP8c+epKvU43oxJ/hXV864XDR03GPKl6P+CIa3d
 bzvjtPmcF1RElDM9Rp82cycfjTzoS+7E210r/YlbrGsvWRdGIBwpSreet864v6HoRqMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vQQYclZemRCsDmI55KbxT5Jnti/1tTrx8cpBRYPsKlU=; b=PYE7rNqiD0Yb73OefBaJo4elXy
 QGQPdEwb3eTgO569x/CWrcjMjvtBhLqSPnnssBdOLbuBk24GRMQ1PJ463/8BUSkAZnJQCKSqw47sJ
 YiqgO+eemfm3BEh2yCPt3p7CfsPDN8NBusddsZjXB/70L+eQ+KG6KfxD+lS5JE58LZI0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lHSaC-00Cawy-Vv
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 14:34:48 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C337464EE4;
 Wed,  3 Mar 2021 14:34:22 +0000 (UTC)
Date: Wed, 3 Mar 2021 09:34:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20210303093421.2b9c936a@gandalf.local.home>
In-Reply-To: <YD+MpccJp4gX6bOP@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <YD+MpccJp4gX6bOP@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lHSaC-00Cawy-Vv
Subject: Re: [Kgdb-bugreport] lkml delivery: was: Re: [PATCH next v4 00/15]
 printk: remove logbuf_lock
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
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, kgdb-bugreport@lists.sourceforge.net,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 3 Mar 2021 14:18:29 +0100
Petr Mladek <pmladek@suse.com> wrote:

> Hi John,
> 
> On Wed 2021-03-03 11:15:13, John Ogness wrote:
> > Hello,
> > 
> > Here is v4 of a series to remove @logbuf_lock, exposing the
> > ringbuffer locklessly to both readers and writers. v3 is
> > here [0].  
> 
> Have you got some reply from lkml that it has not delivered there,
> please?

vger has been having some issues as of late, and emails have been coming in
slowly. I just received emails I sent more than 24 hours a head of time.
Those in charge are trying to work things out.

-- Steve


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
