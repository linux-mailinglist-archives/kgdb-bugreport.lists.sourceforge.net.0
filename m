Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF5629D26
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 15 Nov 2022 16:17:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ouxgv-0008Gy-BS
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 15 Nov 2022 15:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1ouxgu-0008Gr-Dq
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 15 Nov 2022 15:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2jGjCBC2yemDtVCuVdEWxN6sUISWDcy6vegJOKCR1Zs=; b=dgCBVb8t4kDpvf9DuDeC7UVlZU
 NbIFYAvbTHM2ITaJDVXQe+32yr0WTTe9yaGREMiapRMcjIeCrpPm+u8Uj51F5j4R93ADapUVPr3e9
 1DeysAAmhx2ZtpN72bTq8F1x9bkinrlzy9wuBdcvll3rox2WoloxwwbPIi/GwjP7xRxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2jGjCBC2yemDtVCuVdEWxN6sUISWDcy6vegJOKCR1Zs=; b=P/9cumIvuoPhNgsT3oehs52CUH
 KuWTKJBMM1iL0cjeWhsxK5nljGYEEFuKEK4I7yp5hdeY5GtbM3H8/eaRcN6E7NYFP09dPwRPpYzCA
 az0AMJXDuUlLP7RxiMuLxsYigJFJxY2e755qYk5p6XeO3ROZlqW4P7p24J1X+7rUtGf4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ouxgq-0000tV-MU for kgdb-bugreport@lists.sourceforge.net;
 Tue, 15 Nov 2022 15:17:36 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 50B7033688;
 Tue, 15 Nov 2022 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668525446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2jGjCBC2yemDtVCuVdEWxN6sUISWDcy6vegJOKCR1Zs=;
 b=eRwk2xjIL4HNLI316ymCTN9eTQ3XTwO8MvM/ALv/0nS/lWOgFPLWzwWPyH3p5BsEnyHY6V
 GimerjTqc8nTABUNJADzkYVZ+1v/5WILY+UwExPBUJ+uKsVcT9AHrshwgkjAcWm9ezCjlM
 QKBBHtX+4lrOkWoXqCrFZb6e7EJPTd8=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B3C542C142;
 Tue, 15 Nov 2022 15:17:25 +0000 (UTC)
Date: Tue, 15 Nov 2022 16:17:22 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y3Otgsd/uBbWciaf@alley>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
 <20221114162932.141883-35-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221114162932.141883-35-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2022-11-14 17:35:27, John Ogness wrote: > Use srcu
 console list iteration for safe console list traversal. > Note that this is
 a preparatory change for when console_lock no > longer provides sy [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ouxgq-0000tV-MU
Subject: Re: [Kgdb-bugreport] [PATCH printk v4 34/39] tty: serial: kgdboc:
 use srcu console list iterator
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

On Mon 2022-11-14 17:35:27, John Ogness wrote:
> Use srcu console list iteration for safe console list traversal.
> Note that this is a preparatory change for when console_lock no
> longer provides synchronization for the console list.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
