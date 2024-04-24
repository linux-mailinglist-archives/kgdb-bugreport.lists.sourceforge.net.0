Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF18B1528
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 23:24:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzk5u-0006u2-Ur
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 21:23:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1rzk5t-0006tw-MT
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 21:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RiFq9f787VXHEj+phuH3wq2xDvVAR6pUtbCTPsxdivU=; b=c5noLA2rJwRhBOT1RSdWnO15jq
 zqgTugbXSPVKu4uvXq/NHqUNFClmewW+WUayTQKR+wutkQxaVDW+cmRiWHl/ggPHIe2yW9E88mtl8
 m6F8cdku3lEDCUURCrYOqxr8YP28z8YbvNjTJ/Q6qZdttjFu9sqXqh0WkSPOK5Zi1FX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RiFq9f787VXHEj+phuH3wq2xDvVAR6pUtbCTPsxdivU=; b=YPipQOhMUqTP/35MEeefrPZFTc
 lthruQ/PClfgDEXKfnLzsKNYtrdylmyrl1MU+Qaoy8n9d4N0/+cajLiAVfl89nxnxtUD1k6s0IV0v
 THCp1SzxN1SNvXUjnpBGfcf3N2DXEv2Y+KpEWZ3NCKfvpSQw+zsBtu5a5+MOXa7+WC9U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzk5s-0003N3-NZ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 21:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0469619F8;
 Wed, 24 Apr 2024 21:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824F5C113CD;
 Wed, 24 Apr 2024 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713993831;
 bh=vkoQ3xlxRkOTA/ExiXKlpU0HDe2Y8nnTPrKZAKD/jho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oK0aO8jpxvVEH6ur4FPKIRrs9mR8FHc3mmj34ZHUanWUV7K7kEKNX/xbOCiH/jhSC
 RNlshUKkGcKQMcJyf2Y33oyVfM9fXeyu148SW9ERlRr2/HQXWWYLYp3GBWjcePsAcq
 1SryWxrrT+3ukSuQyhaeF9HpgsPwpj+1W7+5i7Y4=
Date: Wed, 24 Apr 2024 14:23:42 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <2024042427-luster-unbend-5ed6@gregkh>
References: <20240424-kgdboc_fix_schedule_work-v2-1-50f5a490aec5@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-kgdboc_fix_schedule_work-v2-1-50f5a490aec5@linaro.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 24, 2024 at 03:21:41PM +0100, Daniel Thompson
 wrote: > Currently, when kdb is compiled with keyboard support, then we will
 use > schedule_work() to provoke reset of the keyboard status. Un [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzk5s-0003N3-NZ
Subject: Re: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Fix NMI-safety
 problems from keyboard reset code
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
Cc: kgdb-bugreport@lists.sourceforge.net, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liuye <liu.yeC@h3c.com>,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 24, 2024 at 03:21:41PM +0100, Daniel Thompson wrote:
> Currently, when kdb is compiled with keyboard support, then we will use
> schedule_work() to provoke reset of the keyboard status.  Unfortunately
> schedule_work() gets called from the kgdboc post-debug-exception
> handler.  That risks deadlock since schedule_work() is not NMI-safe and,
> even on platforms where the NMI is not directly used for debugging, the
> debug trap can have NMI-like behaviour depending on where breakpoints
> are placed.
> 
> Fix this by using the irq work system, which is NMI-safe, to defer the
> call to schedule_work() to a point when it is safe to call.
> 
> Reported-by: Liuye <liu.yeC@h3c.com>
> Closes: https://lore.kernel.org/all/20240228025602.3087748-1-liu.yeC@h3c.com/
> Cc: stable@vger.kernel.org
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> @Greg: I'm assuming this could/should go via your tree but feel free
>        to share an ack if you want me to hoover it up instead.

Hoover away!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
