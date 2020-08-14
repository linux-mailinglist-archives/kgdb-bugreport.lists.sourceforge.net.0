Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45815244B43
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 16:34:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6amz-000304-3a
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 14:34:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1k6amx-0002zw-67
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YYYrjEgMAA4u8RoHDSiUNVuFlpaGFObMWit7kqQR9vU=; b=E7lu9VJ5nZ7TQzqiIeorp5E3u3
 mBpj4xwj2OF6ktDAft8xS9YEPdFEhNXqqc2KJkntg3GIrd9gUkShUoOurI5TNzNMD2O2J6rUCB+NJ
 g+4MLDut7xWIV7t7plsqEzi7N7p9eg5gxRLnE2moXwx0NZe/On9Jwsomrh2iCUiqGFrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YYYrjEgMAA4u8RoHDSiUNVuFlpaGFObMWit7kqQR9vU=; b=ApBI911o/9tFjojunPsRSpbn9q
 jgy0FrMzIbGhZ9lNXfr+2kbNvLKW0gHOf9qFE6k3oBcNa9BWSnMt9q8CSl49iUkSWOilSSvqA4iuL
 JAeVfQT3WokJ9MBWfb9Qh7qkZYTHSY/VB3zDJp1PpDEGqMbw+4+zxLiuQfTeS3SVHX5g=;
Received: from merlin.infradead.org ([205.233.59.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k6ame-007BUz-77
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YYYrjEgMAA4u8RoHDSiUNVuFlpaGFObMWit7kqQR9vU=; b=fOhW/yhl8mj63z46HaCxzt/X5J
 XNcVszm1/6jzcRI4Dhj9LUdZHuvb0F+XA2jTy+xBujD5/Nh1TgIz6YWlOsIlxLnJ3fJSAC356go8F
 cMKV9QxC7Q/z7/mwZjCU11Dg/P4PvZqxnYrHHtMP6/4EUNA0RnAAIx3qdSsscPP6C2LeXkHTayD0R
 bmITOvcic+ZbcOMCEUfGWQrhWsuAWrbFySHWUA0EHRy/ScEbQnPG4QId4HvJnhGBdlCGKQHdE9wmI
 /tfPaJEK/mUWwSXPyudzMHgV0qBNTOFnFLugzmiJdSn0og5NQ3rsUupcnSGKsQtcYbm2D2NnXR7tH
 PJ2+EN7A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6amT-0008I7-PU; Fri, 14 Aug 2020 14:34:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3DDBC300238;
 Fri, 14 Aug 2020 16:34:00 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2258C2C36C972; Fri, 14 Aug 2020 16:34:00 +0200 (CEST)
Date: Fri, 14 Aug 2020 16:34:00 +0200
From: peterz@infradead.org
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200814143400.GB165568@hirez.programming.kicks-ass.net>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
 <CAFA6WYMy_+RdsPJekm7zmCrFUXHqjsfr3JvyD7L8A2X8+jB8Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMy_+RdsPJekm7zmCrFUXHqjsfr3JvyD7L8A2X8+jB8Qw@mail.gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1k6ame-007BUz-77
Subject: Re: [Kgdb-bugreport] [RFC 1/5] tty/sysrq: Make sysrq handler NMI
 aware
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Aug 14, 2020 at 12:54:35PM +0530, Sumit Garg wrote:
> On Thu, 13 Aug 2020 at 05:30, Doug Anderson <dianders@chromium.org> wrote:
> > On Tue, Jul 21, 2020 at 5:10 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > Wishful thinking, but (as far as I can tell) irq_work_queue() only
> > queues work on the CPU running the NMI.  I don't have lots of NMI
> > experience, but any chance there is a variant that will queue work on
> > any CPU?  Then sysrq handlers that aren't NMI aware will be more
> > likely to work.
> >
> 
> Unfortunately, queuing work on other CPUs isn't safe in NMI context,
> see this warning [1]. The comment mentions:
> 
> /* Arch remote IPI send/receive backend aren't NMI safe */
> 
> Peter,
> 
> Can you throw some light here as to why it isn't considered NMI-safe
> to send remote IPI in NMI context? Is it an arch specific limitation?

Yeah, remote irq_work uses __smp_call_single_queue() /
send_call_function_single_ipi() which isn't safe to be used from NMI
context in general.

arch_irq_work_raise() is very carefully implemented on a number of
platforms to be able to (self) IPI from NMI context.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
