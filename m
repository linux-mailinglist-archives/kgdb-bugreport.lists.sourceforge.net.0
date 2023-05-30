Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3286716492
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:42:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40YU-0007yk-NL
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:42:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40YT-0007yV-1P
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aD9ZEOWoaqRaDaOGqzkCoyKy74GVA/ok3TJS5xm11zk=; b=AB/lIMMHmrkDWYu6DL1C05VA1Y
 LnES87wpJ1HHDisg4qxIvK2JEnAxZElrwb0Sz+drJndcWeihUsKjV66LfVLhS5m2NN4jxptR7axFj
 8+XMqmG5XQQzmqO5XOQkonGtmDJF2PXZP41d9IxC2u9OHChmHDyni3pAy0bhg5JpOYh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aD9ZEOWoaqRaDaOGqzkCoyKy74GVA/ok3TJS5xm11zk=; b=S0Pb+4/8IiC8oaKmvK+5HU2C3g
 hWd8y7MSU6TCM5PcopudUrMrOugOlP273tKsuODub7fMhC3QM6q4U0SZ522kQ651B059yGB4y526x
 8a5NSRc/7PEKBqnfF4Tt7X1Q05QXa8fAkpXbTPY7fvuflVX+I2mTJqluIT/9xS/ZQCyY=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40YT-006dFz-4y for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:42:33 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DB9051FDD8;
 Tue, 30 May 2023 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685457746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aD9ZEOWoaqRaDaOGqzkCoyKy74GVA/ok3TJS5xm11zk=;
 b=ohGewJyXy7GILzNKMuH3pmyRCNjWuCqfknJFD0LnUtw981rBavMZe85EgNmbvK/LM5xOsW
 Qr4Kog1Q/N8iA2RtgfayrxVDbcR4fpoLEPgvFhn73JczL1UgCJvKC+WoXU9ew1SnzRJWm8
 kHK1i0HBZ/UrW3sQMHDTqVn8XvEFeAc=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9A3D42C141;
 Tue, 30 May 2023 14:42:26 +0000 (UTC)
Date: Tue, 30 May 2023 16:42:26 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYLUsKaFebd5gvR@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.5.Ia593afc9eb12082d55ea6681dc2c5a89677f20a8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.5.Ia593afc9eb12082d55ea6681dc2c5a89677f20a8@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:35, Douglas Anderson wrote: > In the
 patch ("watchdog/hardlockup: add comments to > touch_nmi_watchdog()") we
 adjusted some comments for > touch_nmi_watchdog(). The comment abo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q40YT-006dFz-4y
Subject: Re: [Kgdb-bugreport] [PATCH 05/10] watchdog/hardlockup: remove
 softlockup comment in touch_nmi_watchdog()
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

On Fri 2023-05-26 18:41:35, Douglas Anderson wrote:
> In the patch ("watchdog/hardlockup: add comments to
> touch_nmi_watchdog()") we adjusted some comments for
> touch_nmi_watchdog(). The comment about the softlockup had a typo and
> were also felt to be too obvious. Remove it.
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
