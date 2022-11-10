Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 121816248FE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Nov 2022 19:04:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1otBuG-0006Hm-Pq
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 10 Nov 2022 18:04:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1otBuC-0006HR-Uc
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 18:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yUxxNFRyrBakLyHUCOSvHWfBsY0UPGKUqsopoVuSD1g=; b=bP72pae/A0x9Xk0biJS7UU8hyx
 QbtLkGWKspLv4VrGQg3W+OgQbLt16GrBNKKWcRpEYULtEYzhBO8mp+1cFI7iijKaScsOs4AME0WEa
 AC5+UahUnv143wW0951wf1mmCYqTzex/g6RSwCmks+g+HIA8vmEXTgECKwd3liEa2BIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yUxxNFRyrBakLyHUCOSvHWfBsY0UPGKUqsopoVuSD1g=; b=bSwngrkeZiZAPCGJ0+Kc7T9NyD
 V5hQRb2lG5iwKxXJb3k9yx1qW1sl/JEwS8Tj3K62CLuRYJ5Rxccohfd/jX51iob0agw3fLVMgNlgH
 VOsijltWbbwfuGEs6cxL3O+FCN6YKtq1wxADtuAeBitI1cfkcL4iGIrODVPoX6ATPyyo=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otBuB-003MGn-Es for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 18:04:00 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 218392292B;
 Thu, 10 Nov 2022 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668103429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yUxxNFRyrBakLyHUCOSvHWfBsY0UPGKUqsopoVuSD1g=;
 b=qzFyp8E//kCUil5Kimk240zLxzo/MAIyT6Z5L/g7vmLkf7GhcukYXuTVM/QuhVsdB8Rm5N
 CJnjGMJl5yH3H9ShX2YjGZcmYeBWKoZOAJh91m6LOjm3xtcU2itWXOYppZCf7eiEWYmrK+
 7T3lXw+mHMzXHy2rKhPO26J7LHw/NOc=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B0FF72C141;
 Thu, 10 Nov 2022 18:03:47 +0000 (UTC)
Date: Thu, 10 Nov 2022 19:03:47 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y209A4xlsRiBMz6+@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-38-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-38-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2022-11-07 15:22:35,
 John Ogness wrote: > Calling tty_find_polling_driver()
 can lead to uart_set_options() being > called (via the poll_init() callback
 of tty_operations) to configure the > uar [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
X-Headers-End: 1otBuB-003MGn-Es
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 37/40] tty: serial: kgdboc:
 synchronize tty_find_polling_driver() and register_console()
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

On Mon 2022-11-07 15:22:35, John Ogness wrote:
> Calling tty_find_polling_driver() can lead to uart_set_options() being
> called (via the poll_init() callback of tty_operations) to configure the
> uart. But uart_set_options() can also be called by register_console()
> (via the setup() callback of console).
> 
> Take the console_list_lock to synchronize against register_console() and
> also use it for console list traversal. This also ensures the console list
> cannot change until the polling console has been chosen.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Huh, this is a maze of related calls. At least for me. But the change
seems to be correct.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
