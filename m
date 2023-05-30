Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FD71654C
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:56:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40m3-00012O-4w
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:56:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40m2-00012I-33
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4zjZSXWgs35Ue3qF1WuzqRP54/h45jHQgSPnhYcIU8k=; b=RBLoDXrFd2Z0HvvEijyauR5FNC
 bkjp/zJu1y3N8zKueDSW3ZFEmMCZWlwi2i9pp4Rq6QWJGBuO0qqijH/HsspglbnTSVlL7QW2QvX/+
 CQVMzSvFGLaMYLlz6GIxN9Rt342CZxdjuV2BwHun2B1kSSNIm9qaIHwGEtbynoNjXg9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4zjZSXWgs35Ue3qF1WuzqRP54/h45jHQgSPnhYcIU8k=; b=j46LxqoeDExNl8cErjWiy1jgjS
 KVMe1Wd8IFOkAadt4xYpyh1N5L5/hyN4T+xfZePmWXdBQwyiX199iktiELb5QqWntqwqBnWsypfI0
 IBIqp29gzSX8Ogy623ny8ZZsMHFUuPsQoZUCr0pURRTkVICaH491JnI9ampuBzJynwy8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40m1-006drI-Ns for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:56:34 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7A06F1FD85;
 Tue, 30 May 2023 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685458587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zjZSXWgs35Ue3qF1WuzqRP54/h45jHQgSPnhYcIU8k=;
 b=X7CGi3j7OdaOafJPBf4V7/HfYwoFC4WhmdvEtMPU/E5sBlErtslZ0vRFR0mCB3gXTWC5M/
 pWYwuEZXPzhVsflGNNkoJ7gkdwRBeN017rNvllAhCW2x9iPDS+i86UBflSU835J+caFnAC
 vDypk4j2dnH67+rCEnPiE4IRyvA9VDI=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 261FD2C141;
 Tue, 30 May 2023 14:56:27 +0000 (UTC)
Date: Tue, 30 May 2023 16:56:26 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYOmkZBxd4TiTv-@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.6.I006c7d958a1ea5c4e1e4dc44a25596d9bb5fd3ba@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.6.I006c7d958a1ea5c4e1e4dc44a25596d9bb5fd3ba@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:36, Douglas Anderson wrote: > In the
 patch ("watchdog/hardlockup: detect hard lockups using > secondary (buddy)
 CPUs"), we added a call from the common watchdog.c > file into t [...] 
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
X-Headers-End: 1q40m1-006drI-Ns
Subject: Re: [Kgdb-bugreport] [PATCH 06/10] watchdog/buddy: Cleanup how
 watchdog_buddy_check_hardlockup() is called
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

On Fri 2023-05-26 18:41:36, Douglas Anderson wrote:
> In the patch ("watchdog/hardlockup: detect hard lockups using
> secondary (buddy) CPUs"), we added a call from the common watchdog.c
> file into the buddy. That call could be done more cleanly.
> Specifically:
> 1. If we move the call into watchdog_hardlockup_kick() then it keeps
>    watchdog_timer_fn() simpler.
> 2. We don't need to pass an "unsigned long" to the buddy for the timer
>    count. In the patch ("watchdog/hardlockup: add a "cpu" param to
>    watchdog_hardlockup_check()") the count was changed to "atomic_t"
>    which is backed by an int, so we should match types.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>


The change looks fine:

Reviewed-by: Petr Mladek <pmladek@suse.com>

That said, I would prefer to squash it into the patch ("watchdog/hardlockup:
detect hard lockups using secondary (buddy) CPUs"). It would remove
some back and forth churn in the git history. But it is up to Andrew.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
