Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCE60C983
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 12:09:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1onGsW-0001i4-Nw
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 10:09:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1onGsN-0001h2-H7
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 10:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ux62HDRPYlDLLBODOUnZkbRi1/eHkDR13k5JCm7MLk=; b=WM/HjM6qsQZZ42VlzhTrNXSKQ2
 1Y03lNh0Xu26ZyY6Spis2mkrcy7Tg2G9ylhqC6nMPqwbUTxF/KogdAAA3MsqaFnlHRDL41UOFbMZV
 a3CSEvepJpEhvnGjQyU767+urvfJAbJmfxiZkJCr+CjotffVIasXjiUYApx65Rh0igec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3ux62HDRPYlDLLBODOUnZkbRi1/eHkDR13k5JCm7MLk=; b=gg1t5vP3PsWc7Aaf/Xw9ji1DzR
 hH4uMh6OtKveQ07iACSunJEOjFMvQlZiglNtQJIzZrJDYKp28ynFmOx1tdjrqVKlWaVDEODsfQ6pH
 o3Jn7rlFhWt3Tc7Km+ophs81rheNaRur+2RL5uODh6RpOoNPOylPSQIB2h1Rp6kj+m5w=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1onGsH-00GncZ-RG for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 10:09:38 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CD37E1FD6C;
 Tue, 25 Oct 2022 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666692565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ux62HDRPYlDLLBODOUnZkbRi1/eHkDR13k5JCm7MLk=;
 b=pe95vjayzklaVLXKUbO97EJ97WMPCsVMYOBmzxLulcVWLYFdKU6sUz2NBWSF/GJySVz+pD
 nlLHyQ6AjOfjpbrhd8bQedACqg6T0DS/easbo/kY8WaoRMq+AzWkdOg9Q6Tt64fZMfuFU2
 yIXbNA+81edyfWKbo0+f9Lj4ttQBJN0=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6B0FE2C141;
 Tue, 25 Oct 2022 10:09:25 +0000 (UTC)
Date: Tue, 25 Oct 2022 12:09:22 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y1e10nnjR6zysUwh@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-23-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-23-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2022-10-19 17:01:44,
 John Ogness wrote: > kgdboc_earlycon_init()
 uses the console_lock to ensure that no consoles > are unregistered until
 the kgdboc_earlycon is setup. This is necessary > beca [...] 
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
X-Headers-End: 1onGsH-00GncZ-RG
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 22/38] serial: kgdboc:
 document console_lock usage
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

On Wed 2022-10-19 17:01:44, John Ogness wrote:
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. This is necessary
> because the trapping of the exit() callback assumes that the exit()
> callback is not called before the trap is setup.

Great catch!

Note: This behavior might be dangerous. printk_late_init() checks if
      the early console code is in the init section. It unregisters
      such consoles even when keep_bootcon parameter is used.

      Well, it is "not serious" and might be improved later.
      If the early console has this code in the early section
      then it is a bug and should be fixed. printk_late_init() does
      the best effort because this problem would block all consoles
      and would be hard to debug. It is the same with kgdb but
      it is still only a corner case and just the best effort.

> Explicitly document this non-typical console_lock usage.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
