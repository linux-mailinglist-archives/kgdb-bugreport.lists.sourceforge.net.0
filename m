Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466E71636F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 May 2023 16:15:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q408e-0006ej-LV
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 30 May 2023 14:15:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q408b-0006ed-WF
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f03SjuaWbgPFKDNHkccYfxdvERRD4V1UOqT9AnVf20c=; b=C2iE43Rs5Jrue4gDJ/xdDo9dW/
 PcrNOK5s31lFW7TepwNHZwAOFLg/VAEyWVPf1wVbhAD0IQ8+b6cjhCBm3VtdUc9a/Of7tmwfHwXdC
 svxkBciEIC8ikxrt0daHWZ9mwAR34LFCECUNMNurJ/sc0o1C6YCoT95ELufUBufcSJJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f03SjuaWbgPFKDNHkccYfxdvERRD4V1UOqT9AnVf20c=; b=EnaRgYNAD7W1jYtWuRevVlJBli
 Vyp+MSIT9zRcQ56fLjj/cF/+P6+BbuLGUzkxkORz9UPQq0sGMh8iBwXUyPxikJBKxpejAEl37/QBD
 bvc25R5AMXAX0Iah3QYXHMW7X/+X6sZkory+tw4g7p59AOlse9ZdSwVeiMUr+tcIhYzY=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q408U-00010s-Mg for kgdb-bugreport@lists.sourceforge.net;
 Tue, 30 May 2023 14:15:50 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 71C5D1FD96;
 Tue, 30 May 2023 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685456136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f03SjuaWbgPFKDNHkccYfxdvERRD4V1UOqT9AnVf20c=;
 b=qwneuzT8aVE62UwAlpeyfFZ8eI36IDinEAOaWAF5L4znVMIaf6zMod/lkB42XEy/NcnL2A
 C+hZu4NVw46mIT0SZgCF7kkibghDwAAeOiAUxhgDsFJLco5k09k1bbmKdbw6adC+Nk7rpu
 CJ0MBEUmWwYed0L2p4tEgaYiUAzHSJQ=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DEA372C141;
 Tue, 30 May 2023 14:15:33 +0000 (UTC)
Date: Tue, 30 May 2023 16:15:33 +0200
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZHYFBUnXmjAvhUFT@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.1.I0d75971cc52a7283f495aac0bd5c3041aadc734e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526184139.1.I0d75971cc52a7283f495aac0bd5c3041aadc734e@changeid>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2023-05-26 18:41:31, Douglas Anderson wrote: > The
 permissions for the kernel.nmi_watchdog sysctl have always been > set at
 compile
 time despite the fact that a watchdog can fail to > probe. Le [...] 
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
X-Headers-End: 1q408U-00010s-Mg
Subject: Re: [Kgdb-bugreport] [PATCH 01/10] watchdog/hardlockup: Keep
 kernel.nmi_watchdog sysctl as 0444 if probe fails
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

On Fri 2023-05-26 18:41:31, Douglas Anderson wrote:
> The permissions for the kernel.nmi_watchdog sysctl have always been
> set at compile time despite the fact that a watchdog can fail to
> probe. Let's fix this and set the permissions based on whether the
> hardlockup detector actually probed.
> 
> Fixes: a994a3147e4c ("watchdog/hardlockup/perf: Implement init time detection of perf")
> Reported-by: Petr Mladek <pmladek@suse.com>
> Closes: https://lore.kernel.org/r/ZHCn4hNxFpY5-9Ki@alley
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
