Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A271656F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:58:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40oE-0007nP-6X
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:58:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40oC-0007nI-2S
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjKvAvjKsZhLJii7xKzLSID8lAv9ypsI5HB8i6Xu65o=; b=e6ZpiFpjDI7C1Qu1Sdsu/A7Lhe
 riY5y2kPYeVk8hsxiRQxWHZgbHs1UWqzOesJLn9GjoSrK/ZOUVHXmKuJekz9DoI6HaERlrqp0FiNA
 eXDK1KN4kFBeqeA6LlSmPFIsI8UsH59f4FUNGJs8XhBx8CqJ5lBn6ZSl6R8mkKTlBLj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mjKvAvjKsZhLJii7xKzLSID8lAv9ypsI5HB8i6Xu65o=; b=N2IJuED9EFfMi3P7kkcmVeJPss
 Jvhnosef2fwTk7BAz9jMFZRgYiyo7obaOdw9PruscfpeRzCCz2NRY8LiE2N+ceBl4nzgwzXkqF3Hm
 eoNQVdT41y+j0pH7oMI/uuX70RolLR7Hk+FWgDwc1mN091DYItQj/opuDyjxoq3i9g4s=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40oB-0002UB-54 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:58:47 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 69F9B1FD85;
 Tue, 30 May 2023 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685458716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjKvAvjKsZhLJii7xKzLSID8lAv9ypsI5HB8i6Xu65o=;
 b=r5txExcrgzRyz58Xo6N9WkUxbsrwqPfxe1aST4QlTmXsD1zC5tSAGwH51buBaNkd/XnUml
 sk8N1gz/7447FO8Zy+ezqwb7uQFTcyzWTnq0g46skj8CciQwezQrmdQKPaOAlF2ahwjvqS
 Sjh1HI7v8HKc5dYuY8sHpV94zZUVS98=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1DBDD2C141;
 Tue, 30 May 2023 14:58:36 +0000 (UTC)
Date: Tue, 30 May 2023 16:58:34 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYPGgmoGNpMPd0v@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.8.I49d5b483336b65b8acb1e5066548a05260caf809@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.8.I49d5b483336b65b8acb1e5066548a05260caf809@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:38, Douglas Anderson wrote: > The
 dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY was more > complicated than
 it needed to be. If the "perf" detector is available > and we have [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
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
X-Headers-End: 1q40oB-0002UB-54
Subject: Re: [Kgdb-bugreport] [PATCH 08/10] watchdog/buddy: Simplify the
 dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY
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

On Fri 2023-05-26 18:41:38, Douglas Anderson wrote:
> The dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY was more
> complicated than it needed to be. If the "perf" detector is available
> and we have SMP then we have a choice, so enable the config based on
> just those two config items.
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
