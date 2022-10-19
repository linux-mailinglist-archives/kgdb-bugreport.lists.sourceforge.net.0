Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028F604C8B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Oct 2022 18:00:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olBUk-00013r-1F
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Oct 2022 16:00:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1olBUg-00013l-Ta
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 16:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y98qVWPjAvnsgoG34rIeowhN1BtVDKBR6QdzaAqNXxg=; b=ZYk0tBvSbmBo1wR3WRDrqMSy7t
 RRSBbgav2H/2IzyYzKeHtsbb65yQeZFCtmDSBnHRxGsBxMQRuLa3KNR/Du4e8Rctkr6d6zX4HVqRx
 vu/AJ4xv0dj35thIJRLqVT78QgxlFKzpQGrGEBvP94i/QI0ShM60JR49kixXTADH0Xb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y98qVWPjAvnsgoG34rIeowhN1BtVDKBR6QdzaAqNXxg=; b=RihyqVaxoSPWhcVhTZYqn3Zyf2
 SG1Gx1L27vdBCds8Fg/3A3KuHEiTMh9TU0/YoZgUmJf8O2MNmWi3Ki2oHQgqsL1ixQlphp0/dssH5
 LJt8ik+/qkgLeFQ3AsZ7XyC6q3PZIgYBT95WKt5T6caNpCJrReGq3ObVpY8+s5NHSHuE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olBUZ-009pmT-Ot for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Oct 2022 16:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D37B2CE2273;
 Wed, 19 Oct 2022 15:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6F3C433C1;
 Wed, 19 Oct 2022 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666194097;
 bh=pp0u8hipLhDrQpM4yh61waqBQ+HKhDl84yhWKQ9AfSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1s+6wLnCcSZQDw219lUCDYZT/y2g3M30CfQLQHGJ4FgEHDEubtlKJ3MqSnxemyF+
 HJdvMXI8I9hLkebNLu9nujeG7K5+0YHxNAtdFSofb/EOE9MYzEjyLxKG1v7Ezsnu/H
 aPWDWGxxThDCgS0o3xDvY9J81p4lIc+++fMm40DY=
Date: Wed, 19 Oct 2022 17:41:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y1Aarp6pv34/cioY@kroah.com>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-2-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-2-john.ogness@linutronix.de>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 19, 2022 at 05:01:23PM +0206, John Ogness wrote:
 > From: Thomas Gleixner <tglx@linutronix.de> > > Unprotected list walks are
 not necessarily safe. > > Signed-off-by: Thomas Gleixner <tglx@ [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olBUZ-009pmT-Ot
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 01/38] serial: kgdboc: Lock
 console list in probe function
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 19, 2022 at 05:01:23PM +0206, John Ogness wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Unprotected list walks are not necessarily safe.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
