Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0654716464
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:39:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40VP-0000sb-8z
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:39:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40VN-0000sV-VJ
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7vF9JpsfadEYC3jOZr5CnXQ2XIUYn0nPXlK7fmlNPM=; b=l0bL9Pg500GE5exsAAbEAJAEKy
 c9FKgwtS/f/v35amrK40w6SquIMH7BTKWdTNJ7aJWH10liaNKlXC9+fNbIcZ4aSuwDNAu+S5F8+30
 A8kM1U4upJkg3Ny9lGtrWPvL729Bi2z0OgsmAEhpKRVaSOaKmLexhMw3L0QslXepTHBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i7vF9JpsfadEYC3jOZr5CnXQ2XIUYn0nPXlK7fmlNPM=; b=O4sZk2SqgLvbvu8wlzjjUPpzEJ
 q3gwzA7pIGcofbLv6em8aAxPrJ/WZMnlBKrusT/Fc5SznH7YZShDxUCFNVezjlH+iJxzo+2q6TMZ9
 14gXwaq0ChSEGmo7YZbICicu7P3qf7cESkKtz1jnIQbdaNaVO4Wrio8vPVkakZTUwX4U=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40VM-0001nW-Eo for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:39:22 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 369D0219D2;
 Tue, 30 May 2023 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685457554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7vF9JpsfadEYC3jOZr5CnXQ2XIUYn0nPXlK7fmlNPM=;
 b=Mcr0cPG0zlm7cRNAao1VppvBZ1sCLRrD+rMuZYSu+6XdmhVyW0iiRrmrUJyt2leTqHVJhu
 1s4NCviWMX7pM28Yd9JqjR4mYtBN5zpUwzN9jcD9J7TqAavc0OnX1t9qFLj6TLOLwggdmW
 ItUgQHnJiJLEGRPz35ogDWLtz8WnvXI=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E94442C141;
 Tue, 30 May 2023 14:39:13 +0000 (UTC)
Date: Tue, 30 May 2023 16:39:13 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYKkbcIMoXBa0Vu@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.3.I660e103077dcc23bb29aaf2be09cb234e0495b2d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.3.I660e103077dcc23bb29aaf2be09cb234e0495b2d@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:33, Douglas Anderson wrote: > In the
 patch ("watchdog/hardlockup: add a "cpu" param to >
 watchdog_hardlockup_check()")
 there was no reason to use > raw_cpu_ptr(). Using this_cp [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q40VM-0001nW-Eo
Subject: Re: [Kgdb-bugreport] [PATCH 03/10] watchdog/hardlockup: Don't use
 raw_cpu_ptr() in watchdog_hardlockup_kick()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2023-05-26 18:41:33, Douglas Anderson wrote:
> In the patch ("watchdog/hardlockup: add a "cpu" param to
> watchdog_hardlockup_check()") there was no reason to use
> raw_cpu_ptr(). Using this_cpu_ptr() works fine.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
