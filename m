Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE188BC34
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Mar 2024 09:23:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rp25W-0007Y0-LF
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 26 Mar 2024 08:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1rp25U-0007Xr-7f
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Mar 2024 08:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zPGq9QAfs5yblIrjHBOytvOonJf9qJcXr2vlXfvH/I8=; b=hujg3BA7n3PnPL+0gx323hJFua
 ZrSahhvFIDSh8MlFFWz12wgMvXWmV+E0UCeNLHF7MRWK91/s7Y8WCtJRsrE4yFZIszELlsgtKUq+s
 fQpJcyuL+uzm8qB0VeZzz6GbX71lWC1nx7V0SKaPGKv7f+Li9MiEsZI3tl62c3x/1LQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zPGq9QAfs5yblIrjHBOytvOonJf9qJcXr2vlXfvH/I8=; b=fFfBWDv8ttACEEm1c29oeC5TUz
 kTslldDJzRacPTQH9AQ3JjNYb5QHIgG0TtnGGFB5NO4eicvRJ5uEPuHMENKhFH9RDEBH15kpozCey
 XUURokrMsNtuioZV1EfOhPWFPf3DcRsSFQot4e/PCgkIG9gQe111XbVWRMD2Vje5vkTg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rp25Q-0007X2-5i for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Mar 2024 08:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1430961280;
 Tue, 26 Mar 2024 08:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBC1C433F1;
 Tue, 26 Mar 2024 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711441381;
 bh=hwm0DgownOe+a+wofavFrRbBxRMYeIjoVarruVwkAp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJQoui9Wv8kNVDt2z9iBQZygQxlmX8aSnUITgrc3cyQw4pnhb+7i74VCqYXCe8lJy
 qKZwtCfRkdoc+PcDT45tR9DmH8PAr/1CIaBuR5suhR929+L/UJUwSCe01Ri4Yns4B5
 QS79pRCAD50jqWIOcKlqq+4Jg6aajCVTkyrriolw=
Date: Tue, 26 Mar 2024 09:22:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: liu.yec@h3c.com
Message-ID: <2024032630-croon-consuming-6ef9@gregkh>
References: <20240325165436.GA485978@aspen.lan>
 <20240326074014.1905023-1-liu.yec@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326074014.1905023-1-liu.yec@h3c.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 26, 2024 at 03:40:14PM +0800, liu.yec@h3c.com
 wrote: > Note that we still need to a workqueue since we cannot resync > the
 keyboard state from the hardirq context provided by irq_work. I think you
 are missing a word between "to" and "a", right? 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rp25Q-0007X2-5i
Subject: Re: [Kgdb-bugreport] [PATCH V6] kdb: Fix the deadlock issue in KDB
 debugging.
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 26, 2024 at 03:40:14PM +0800, liu.yec@h3c.com wrote:
> Note that we still need to  a workqueue since we cannot resync
> the keyboard state from the hardirq context provided by irq_work.

I think you are missing a word between "to" and "a", right?

> That must be done from task context for the calls into the input
> subystem. Hence we must defer the work twice. First to safely
> switch from the debug trap (NMI-like context) to hardirq and
> then, secondly, to get from hardirq to the system workqueue.
> 
> Signed-off-by: LiuYe <liu.yeC@h3c.com>
> Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> ---
> V5 -> V6: Replace with a more professional and accurate answer.
> V4 -> V5: Answer why schedule another work in the irq_work and not do the job directly.
> V3 -> V4: Add changelogs
> V2 -> V3: Add description information
> V1 -> V2: using irq_work to solve this properly.
> ---
> ---
>  drivers/tty/serial/kgdboc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 7ce7bb164..161b25ecc 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -22,6 +22,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_core.h>
> +#include <linux/irq_work.h>
>  
>  #define MAX_CONFIG_LEN		40
>  
> @@ -99,10 +100,17 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)
>  
>  static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);
>  
> +static void kgdboc_queue_restore_input_helper(struct irq_work *unused)
> +{
> +	schedule_work(&kgdboc_restore_input_work);

As this is a "two stage deferment" or something like that, it should be
documented in the code exactly why this is needed and what is happening,
otherwise it looks very odd.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
