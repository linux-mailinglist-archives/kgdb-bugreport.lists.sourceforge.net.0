Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08D625781
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Nov 2022 10:59:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1otQpC-0007MW-Gb
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 11 Nov 2022 09:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1otQpB-0007MK-Jk
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 11 Nov 2022 09:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uyn60W/v8JE7SjdKlawr3nBkaxBT1V/caWA0/DUgMEU=; b=hRd06hbCW7LJ4BAJpPjWzTwC50
 R9U09RDzt8u4ezxHcvIAlzSzUH0qAvOKnti8lvqrawBJtMwNsmSeKDpldw9OcvMRsLUbXrpCavqlY
 knegStql3oLSGVxhfFchMjHoNfWiFhTQQtLAJEnZhcv6c+Kl6Rd89PJxqw+17JcUE1W4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uyn60W/v8JE7SjdKlawr3nBkaxBT1V/caWA0/DUgMEU=; b=DExnSqBraD0pDUvUY51LBa0Yn9
 RqWj63NzgLIfEHwtkUWFpkjrw/gUEDBYjAFcsm35sPBl9iq4A5AGV24n/CvMUquf+r12Lradeyyi5
 1pctNqXTm9luDnQaLYukJ6NigxhWBKKEc7ctjf9PZAnuXX2XbwHvQaQe9SfDTb5oj7zk=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otQpA-0006bN-Jc for kgdb-bugreport@lists.sourceforge.net;
 Fri, 11 Nov 2022 09:59:49 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0F2F52018F;
 Fri, 11 Nov 2022 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668160779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uyn60W/v8JE7SjdKlawr3nBkaxBT1V/caWA0/DUgMEU=;
 b=sf7oK0ZFSmbDUtArZU9Tg84hj8t2CYyovBkWZxmx1rB8kblb9tDCqdmiaDF+DHSLSXyTd4
 LZaG+9luTXHvJOr325VhohT3V5jeNMkBCe21ihz2v8vLYuXK1noC+rgJe/g3R2WHy8K+bU
 MJ8edXMtOSgKBr94W1e/WMxA+YIt6Pc=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B213F2C142;
 Fri, 11 Nov 2022 09:59:37 +0000 (UTC)
Date: Fri, 11 Nov 2022 10:59:37 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y24dCalaGXJQcNTI@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-39-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-39-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2022-11-07 15:22:36,
 John Ogness wrote: > kgdboc_earlycon_init()
 uses the console_lock to ensure that no consoles > are unregistered until
 the kgdboc_earlycon is setup. The console_list_lock > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1otQpA-0006bN-Jc
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 38/40] tty: serial: kgdboc:
 use console_list_lock to trap exit
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

On Mon 2022-11-07 15:22:36, John Ogness wrote:
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. The console_list_lock
> should be used instead because list synchronization responsibility will
> be removed from the console_lock in a later change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
