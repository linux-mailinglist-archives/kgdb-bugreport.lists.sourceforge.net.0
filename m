Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E871647A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:41:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40X1-0007YQ-Rc
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:41:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40Wx-0007YG-HX
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a9sB6H+XW8Y7WjDvQjfVnkpXnUAqYkrBI6CEECBeZUA=; b=I960NeHa5Sea03OSiw+k+Gnvmv
 KYsR5t5jK9z2Z9XB0xMXkRK5YqI/7kiEWtQypdvSG/xusoEDmFdcxfNBHoCXePcTnScAdz5y3L8R8
 B3Xt1D/fT2cdnAOEk1xb1+P49MigkhIvkxfQuDDYlCBPXyC0HVEQQFZ16Lrnv0nqhOck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a9sB6H+XW8Y7WjDvQjfVnkpXnUAqYkrBI6CEECBeZUA=; b=jPf/2pPv5OWBmDYmiAbQ0jRC+J
 Y9mw3Nn66H/lJO8rM4zxA2GHG3t6RIw/dN5nfIx69vjXivP9QLjnN16D6+B9q6NEdLXAIF51Mm7Tu
 g19SBHSX0a5dX9SVoQHwcRdj/lBpxYWT5qt0XMgSqAG4Kg7PVPz9n4PZd56fEGYLYMtQ=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40Wu-006d8g-EY for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:40:59 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 338C921A03;
 Tue, 30 May 2023 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685457650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a9sB6H+XW8Y7WjDvQjfVnkpXnUAqYkrBI6CEECBeZUA=;
 b=UGwjgMinTKp0NsJ7pZlarCt1OheuX6unt7XijzKaXk1mMO1rIPhdMjZBOd+sRPfBYEZTXf
 3Exe5XXnF/9X9UqRSJdkgenu/x8GSb4mziBg7Ay1i9WhzKP/icDtGBDBRreSWdLf3bTTFp
 N5ljukBANN3f+Pmdgj1Dp+CwZ/3c4fs=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E44292C141;
 Tue, 30 May 2023 14:40:49 +0000 (UTC)
Date: Tue, 30 May 2023 16:40:49 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYK8dP8-kQ-_pBi@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.4.Iccee2d1ea19114dafb6553a854ea4d8ab2a3f25b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.4.Iccee2d1ea19114dafb6553a854ea4d8ab2a3f25b@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:34, Douglas Anderson wrote: > In the
 patch ("watchdog/hardlockup: add a "cpu" param to >
 watchdog_hardlockup_check()")
 we started using a cpumask to keep track > of which CPUs [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q40Wu-006d8g-EY
Subject: Re: [Kgdb-bugreport] [PATCH 04/10] watchdog/hardlockup: In
 watchdog_hardlockup_check() use cpumask_copy()
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

On Fri 2023-05-26 18:41:34, Douglas Anderson wrote:
> In the patch ("watchdog/hardlockup: add a "cpu" param to
> watchdog_hardlockup_check()") we started using a cpumask to keep track
> of which CPUs to backtrace. When setting up this cpumask, it's better
> to use cpumask_copy() than to just copy the structure directly. Fix this.
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
