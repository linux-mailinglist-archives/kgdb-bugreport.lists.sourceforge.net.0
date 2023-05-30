Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1759716585
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 17:00:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q40qF-000150-4S
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 15:00:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q40qD-00014t-Jl
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 15:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lzf8k9OeD6CxKARnPSlUMY/zE2d/0eZgKuThx3A5Fj4=; b=L15Z3WtqIZqr3qTkEfP5iRaNvk
 EjoHixSxKsJ+12uJhoAw0dpnZG4DncgKG/pdt0QHDA2jkX8bw0gcVn6xiT7fXwaSOC8N7WApzh6XU
 d5lF1JJnFZ3fqzPITsy1tWdYWP7L/xOwAbIh+CoxUWf78aW0uWd5vwxDO63/5XlVp6/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lzf8k9OeD6CxKARnPSlUMY/zE2d/0eZgKuThx3A5Fj4=; b=VZcEjdB5A+RloykAxDnkMyaS5w
 284sjP2dYdwzp9jnJbwUUcG5EAGqh14Eb5KNOuAQoRoS7EWxd0rLpJn3mH4dQ5PgycRcQkTXjluKd
 E4G4hUBM4cn+OlZEqr7aApxeVGxlZWH/SJdnUpbY3A18vitTjlqAnr8eLqOndORLiKws=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q40qD-006e0G-7q for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 15:00:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5DA861F8C8;
 Tue, 30 May 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685458845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lzf8k9OeD6CxKARnPSlUMY/zE2d/0eZgKuThx3A5Fj4=;
 b=EVny03Fpuk0L/eAxDq5AtkoQdDuOqfyJ7Ynis5eAo/QQE/uz4JFp9wkFa6GWJxxvIp89AX
 qC2iLiX+no6dVa9Q1Ggo/++xFZeUCnro6XI6oWHE917EOtE/68yB2PQvonkyCzRTjHLJav
 3s8c4Qs1zP94tZouCjAYz0nd2cpW40E=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 175C82C141;
 Tue, 30 May 2023 15:00:45 +0000 (UTC)
Date: Tue, 30 May 2023 17:00:43 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYPmxdzl0tOB_uY@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.9.I5ab0a0eeb0bd52fb23f901d298c72fa5c396e22b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.9.I5ab0a0eeb0bd52fb23f901d298c72fa5c396e22b@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:39, Douglas Anderson wrote: > It's
 been suggested that since the SMP barriers are only potentially > useful
 for the buddy hardlockup detector, not the perf hardlockup > detecto [...]
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
X-Headers-End: 1q40qD-006e0G-7q
Subject: Re: [Kgdb-bugreport] [PATCH 09/10] watchdog/hardlockup: Move SMP
 barriers from common code to buddy code
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

On Fri 2023-05-26 18:41:39, Douglas Anderson wrote:
> It's been suggested that since the SMP barriers are only potentially
> useful for the buddy hardlockup detector, not the perf hardlockup
> detector, that the barriers belong in the buddy code. Let's move them
> and add clearer comments about why they're needed.
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
