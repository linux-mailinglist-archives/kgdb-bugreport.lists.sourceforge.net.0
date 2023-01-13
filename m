Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 954876697EA
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jan 2023 14:02:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pGJh3-0006Wy-2O
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jan 2023 13:02:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pGJgy-0006Wq-Ja
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 13:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7/OqbhbsKfXjsF4AocIDhio9AfQMHnKZW5A8YLWr5ig=; b=V41BFsRROj+zdPZQgZjwrFDwCW
 OFAYCKvP7Lokj8o2ZYuF6N2tbbC4D6ZzBQIUzV1Odj6cOPd0DNo9UZvObGW+qd1u2KAgqzgJPRQwC
 gx/HoeOVBiMVpxm6BsEUhxPhWew4VgKghmGMdEIrbBZ5Q7nMZQSoNimxImrZcfR+eoY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7/OqbhbsKfXjsF4AocIDhio9AfQMHnKZW5A8YLWr5ig=; b=Di8h49EjkrpQEGYMJ+0tp88JG+
 zAGw1yayQM+yOokhwSN0DbwWxWq2+dv/UcgYUEfFv38CfbkenWhno1JFlxZMmIGOzLv+xzkOAwbXX
 8RVLYlDS6AIaPoxenbKgrI+YGeWKrolmm6FbNqMEgXkrY0uC+dW3hz8Y45XR6DslBlz0=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pGJgt-002S1q-RS for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 13:01:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0CC3525513;
 Fri, 13 Jan 2023 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673614901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/OqbhbsKfXjsF4AocIDhio9AfQMHnKZW5A8YLWr5ig=;
 b=e710yCnHzPs6PmOCMPyvIFiQ2pYNTP1nP8K+bl0joD5vswiQDH88JUdBxsZoJKAaon3xA0
 VwZD0Gr30y5TAoAJkWRZs6FKL4drj1lOeeMvksNg+h5W32Cy4s3aMauEzlKw+UAbLLz/wd
 DnfJvwHtmQJLjeuQRk+WD1XM/QjoHsE=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 77EF42C141;
 Fri, 13 Jan 2023 13:01:40 +0000 (UTC)
Date: Fri, 13 Jan 2023 14:01:37 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y8FWMd7nK5g7lV8M@alley>
References: <20230112161213.1434854-1-john.ogness@linutronix.de>
 <Y8Eg1wDOOkSCAh2E@alley> <87r0vypyon.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r0vypyon.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-01-13 10:38:24,
 John Ogness wrote: > On 2023-01-13, 
 Petr Mladek <pmladek@suse.com> wrote: > > JFYI, the patch has been committed
 into printk/linux.git, > > branch rework/console-list-lock. [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pGJgt-002S1q-RS
Subject: Re: [Kgdb-bugreport] [PATCH v2] tty: serial: kgdboc: fix mutex
 locking order for configure_kgdboc()
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-01-13 10:38:24, John Ogness wrote:
> On 2023-01-13, Petr Mladek <pmladek@suse.com> wrote:
> > JFYI, the patch has been committed into printk/linux.git,
> > branch rework/console-list-lock.
> 
> > I am going to give it few days in linux-next. If there is no problem
> > I will send a pull request for 6.2-rc5 later the following week.
> 
> Sounds good to me. For the 6.2 pull request, please also add Sergey's
> reviewed-by tag.

Done. Sigh, I have missed it in the original commit. I am somehow in
rush last three days and "b4" script did not get it.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
