Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 083DC6B22D6
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  9 Mar 2023 12:26:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1paEPw-0006Me-9W
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 09 Mar 2023 11:26:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1paEPu-0006MK-WA
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 11:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1JyAd3b05tzFLupYz6YAu1igKV4UZRoyxnsO7wPUvRo=; b=Ok7LevXYAPGUuxzyQsl9D1c3mJ
 RX8/3UJclKY/j34DO/fT4QLvasA75vo8MlTs/Ez+4KprfD23RcCqRwowcNalOVZmEc4I+XaKsUmjZ
 BcyjDZ/vRB4W0V2d8ac0lRXLrPea06I1ilXDSm2C5HLSyYOd+TZEGFOGNCSCbKLX4Ebg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1JyAd3b05tzFLupYz6YAu1igKV4UZRoyxnsO7wPUvRo=; b=KnxGN+NRj8a5fvHg8ucAPg/od+
 N5q9Kn+hej7dhSN4cLc0d68NagqHEFNY6K4A1Ae8v+YSTtRubSKMbBvk4FfmFgNLesCKK2VHH+jZS
 BkJtZhJe20g48qBCBa5RDlqh+5nS20g1wnJI17Ott52TlcBAWmh4PDvLVJIpcPEhWlPo=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1paEPt-0003D3-LC for kgdb-bugreport@lists.sourceforge.net;
 Thu, 09 Mar 2023 11:26:38 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3B86920042;
 Thu,  9 Mar 2023 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678361187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JyAd3b05tzFLupYz6YAu1igKV4UZRoyxnsO7wPUvRo=;
 b=fl+t7ds86l4W4IrXmm7wX8HBqQofRJ6coWsVs6X9QULqy0qTojEr9ZiEpgeGJBnP2srvYT
 y8/YkJkRL/c8PVEkcLL3fpfY8IunDKj07U9yvvyWgt1jg7UjkYXblom04btAQADNV9vv4o
 xKAPkosPanOlhxSHCps2Zqg7pG8lOmg=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 391312C141;
 Thu,  9 Mar 2023 11:26:23 +0000 (UTC)
Date: Thu, 9 Mar 2023 12:26:23 +0100
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <ZAnCXxui+QiNNRb6@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <20230302195618.156940-2-john.ogness@linutronix.de>
 <20230309105240.GA83039@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230309105240.GA83039@aspen.lan>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-03-09 10:52:40, Daniel Thompson wrote: > On Thu, 
 Mar 02, 2023 at 09:02:01PM +0106, John Ogness wrote: > > It is allowed for
 consoles to provide no write() callback. For > > example ttynull [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1paEPt-0003D3-LC
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 01/18] kdb: do not assume
 write() callback available
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
Cc: John Ogness <john.ogness@linutronix.de>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2023-03-09 10:52:40, Daniel Thompson wrote:
> On Thu, Mar 02, 2023 at 09:02:01PM +0106, John Ogness wrote:
> > It is allowed for consoles to provide no write() callback. For
> > example ttynull does this.
> >
> > Check if a write() callback is available before using it.
> >
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Any thoughts on best way to land the series. All via one tree or can
> we pick and mix?

I would prefer to take everything via the printk tree because
most changes are there. Otherwise, we might end up with non-necessary
cross-tree merge conflicts. Also I would know when all pieces are
there.

That said, this seems to be the only change in
kernel/debug/kdb/kdb_io.c and it is relatively independent.
So, it should not be a big problem to take it separately.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
