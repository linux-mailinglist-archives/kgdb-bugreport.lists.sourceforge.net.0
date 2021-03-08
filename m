Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4223311AE
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Mar 2021 16:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6G49QRIe08VtE5eanFVV4II+X6pi07unGm1NjVfjvZg=; b=mxPB11O6d3ZAck6Jhu1DDdJmd
	/mZef81iyMhW9fjoMOBvJnHnIUwFShBHALGyJvkV4odfg6I6cBvdhZRsXo9y1KqYqjaATdGY4dhno
	srQLB+6W65pDqRIUmnSv3uG/q2MgeCuOTLfp8lXhYn40DJuCHD5E7PADVZtQqwjEYBmyI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lJHVz-0007MX-5e
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Mar 2021 15:09:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lJHVy-0007MF-33
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Mar 2021 15:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RHCVpD0EOCWBr4CM42VDdFRC20Sv2OvcSQKI4oBR4WQ=; b=lyfKY/8kopAqvCpdHIim2PBs+2
 fqoMCOclzvGf4YQwEE73SGjyk4Vl/Jag3HUyS/fFcbWwAoAEtFkkuI/FnpCNEptcSArKDLUZZ17RO
 ZQcxAawFXubG4CI+yfDk8FKFWPuyp0o06O1y/XJEYvVjKHioPSlsAj1bdNpmyyhgWPKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RHCVpD0EOCWBr4CM42VDdFRC20Sv2OvcSQKI4oBR4WQ=; b=JH2T7GtRq1UjdGki6Q6BsXIp1u
 C+bD1AOPUPhzyynquKWSdPU+uIlIdCbxsMPkVJbCPT4n6ZMvNCcMSnmdnwzRI6ppxb/al7RN+lchX
 PaklqLbogbls5o/weu2TCIHlaFugJiWmqNm62ApyqrsS9+xe+rR1ztthDeT9wStVZ8hw=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lJHVq-0003TV-QI
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Mar 2021 15:09:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1615216168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHCVpD0EOCWBr4CM42VDdFRC20Sv2OvcSQKI4oBR4WQ=;
 b=SaBGiuJH7cduvyTTcI+RG2JjQktgD14lFw9EnpYlsPN2C7K+17NrvYz5FyASkVVnIgOUYN
 +kK0dQIfGNaN4EONLEjJGI5netP1nGsyeOX6ULd53kyHRvCliMWlQbMithU17Uqe3j5h0p
 +r0W3a8FhYIp0uDbypux7b88gkU35xY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45672AE15;
 Mon,  8 Mar 2021 15:09:28 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:09:24 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YEY+JBoW6TByix30@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
 <YD+seF3dQUoPcZP7@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD+seF3dQUoPcZP7@alley>
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
X-Headers-End: 1lJHVq-0003TV-QI
Subject: Re: [Kgdb-bugreport] [PATCH next v4 00/15] printk: remove
 logbuf_lock
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
 linux-mtd@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2021-03-03 16:34:19, Petr Mladek wrote:
> On Wed 2021-03-03 11:15:13, John Ogness wrote:
> > Hello,
> > 
> > Here is v4 of a series to remove @logbuf_lock, exposing the
> > ringbuffer locklessly to both readers and writers. v3 is
> > here [0].
> 
> The series look ready. I am going to push it into printk/linux.git
> the following week unless anyone speaks against it in the meantime.

The series is committed in printk/linux.git, branch printk-rework.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
