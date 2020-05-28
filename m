Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D61E64E1
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 May 2020 16:57:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jeJyQ-0005p4-NR
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 May 2020 14:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jeJyP-0005or-7e
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 14:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Cg5knSgbje3SL2aat9Uk/LIe0qdcPwkyPqiYuYqIHY=; b=Mogu8HmeHJ3Q+ovp9x2vBRTxbs
 wC0s4DQbvEOtMRe/L8zyxWizxeACH5lrV4G9Hax6ks/L+zojZrYnkTb8uHkBpqmfjdUHJkIXNxSXy
 m/SlThin1v2b+PSQ5yQbibeis/zSzS4PKZGMoYmnMIOuNm3Hs/ExFwUBHLD1XbHnXLzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Cg5knSgbje3SL2aat9Uk/LIe0qdcPwkyPqiYuYqIHY=; b=DPXSmr6/QOFK3LINRC6OG08ecm
 jnEUKo2bElzKEUFSJFBJwqPHbIgJDflzsJqfdpkNPLx6W/N9eJYrMtnsJ0h2o4DHpM0clSg0RiLHJ
 M02sb5rsd3h9Ekfqwr7SY0Em9K15wMmvwT50TrQw5ri2sB+7ZFRFfTL3R46cfju4J+xM=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeJyN-001cTh-Gm
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 14:57:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB96DAEC3;
 Thu, 28 May 2020 14:57:22 +0000 (UTC)
Date: Thu, 28 May 2020 16:57:22 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200528145721.GE11286@linux-b0ei>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-5-git-send-email-sumit.garg@linaro.org>
 <20200527133115.x5hqzttsg73saiky@holly.lan>
 <CAFA6WYNeBDRdRqb8dB5HA923ujD3zq7JEQQnV4WJr_fthCc=GQ@mail.gmail.com>
 <20200528112620.a6zhgnkl2izuggsa@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528112620.a6zhgnkl2izuggsa@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jeJyN-001cTh-Gm
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Switch kdb_msg_write() to
 use safer polling I/O
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2020-05-28 12:26:20, Daniel Thompson wrote:
> On Thu, May 28, 2020 at 11:48:48AM +0530, Sumit Garg wrote:
> > On Wed, 27 May 2020 at 19:01, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Wed, May 27, 2020 at 11:55:59AM +0530, Sumit Garg wrote:
> > > > In kgdb NMI context, calling console handlers isn't safe due to locks
> > > > used in those handlers which could lead to a deadlock. Although, using
> > > > oops_in_progress increases the chance to bypass locks in most console
> > > > handlers but it might not be sufficient enough in case a console uses
> > > > more locks (VT/TTY is good example).
> > > >
> > > > Currently when a driver provides both polling I/O and a console then kdb
> > > > will output using the console. We can increase robustness by using the
> > > > currently active polling I/O driver (which should be lockless) instead
> > > > of the corresponding console. For several common cases (e.g. an
> > > > embedded system with a single serial port that is used both for console
> > > > output and debugger I/O) this will result in no console handler being
> > > > used.
> > >
> > > > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > > > index b072aeb..05d165d 100644
> > > > --- a/include/linux/kgdb.h
> > > > +++ b/include/linux/kgdb.h
> > > > @@ -275,6 +275,7 @@ struct kgdb_arch {
> > > >   * for the I/O driver.
> > > >   * @is_console: 1 if the end device is a console 0 if the I/O device is
> > > >   * not a console
> > > > + * @tty_drv: Pointer to polling tty driver.
> > > >   */
> > > >  struct kgdb_io {
> > > >       const char              *name;
> > > > @@ -285,6 +286,7 @@ struct kgdb_io {
> > > >       void                    (*pre_exception) (void);
> > > >       void                    (*post_exception) (void);
> > > >       int                     is_console;
> > > > +     struct tty_driver       *tty_drv;
> > >
> > > Should this be a struct tty_driver or a struct console?
> > >
> > > In other words if the lifetime the console structure is the same as the
> > > tty_driver then isn't it better to capture the console instead
> > > (easier to compare and works with non-tty devices such as the
> > > USB debug mode).
> > >
> > 
> > IIUC, you mean to say we can easily replace "is_console" with "struct
> > console". This sounds feasible and should be a straightforward
> > comparison in order to prefer "dbg_io_ops" over console handlers. So I
> > will switch to use "struct console" instead.
> 
> My comment contains an if ("if the lifetime of the console structure is
> the same") so you need to check that it is true before sharing a patch to
> make the change.

Honestly, I am not completely familiar with the console an tty drivers
code.

Anyway, struct console is typically statically defined by the console
driver code. It is not must to have but I am not aware of any
driver where it would be dynamically defined.

On the other hand, struct tty_driver is dynamically allocated
when the driver gets initialized.

So I would say that it is pretty safe to store struct console.
Well, you need to call con->device() to see if the tty_driver
is actually initialized.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
