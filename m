Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B201B9F44
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 11:02:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jSzfB-0006u1-J8
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 09:02:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1jSLqo-0004Xa-If
 for kgdb-bugreport@lists.sourceforge.net; Sat, 25 Apr 2020 14:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xfn0ZV82lCzSuQ4feUQDnO0CoRmmzD+VHwcFJdfruSo=; b=dZ591Kr/P/sGQ/e2QS0gE971RW
 w5wx+f3U+1U7uy1btZNoemGH999emyRpmgvxxp2qtDKOLzCXVGF9PmgPExz/gCOa7az1gh4v8Wzym
 lRxYEb2XtIqy9Tw7p93UxUmxPPRTRp/uLqHJ5UDvwaTn9vw+zZZRpU+/6tA3zA59y5VI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xfn0ZV82lCzSuQ4feUQDnO0CoRmmzD+VHwcFJdfruSo=; b=RNq2rm87Kmkv56e2HxMUIpA+t+
 7LfFlvZyJ4kin/GBbQBI2kgznALE91kGxV8/eIEzNTzsxTULeenA7y0k5g0dV6JFfWqH+KNNxDbur
 2+mE2G1y1sR3ljIeK1au+oj+DzqsLHr0o2FJNZqGdDPmo8UlLcx05RXJtlbzCsL9dVrc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jSLqk-00EmlK-Nl
 for kgdb-bugreport@lists.sourceforge.net; Sat, 25 Apr 2020 14:32:14 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50E2220714;
 Sat, 25 Apr 2020 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587825123;
 bh=2Q/upiP+dr67u4tRq9PLOWQ4B95IDVSlUcu4hEkJpe4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pqJIWQw9M3rWg7TDjn7p8ySmB13X4El1kyX3qnH3LVPt7EWQldjodI8gIKPjOmFXc
 +F9pgnaMf8nMDBetjN8qhRuLlN42MkDOPh172YQrIGRlcVnQOH3DA3B9aa92uxas2e
 ny1OA5kT+BAn2KUT6jpCDd21GVXoGP3H1o56KKUs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jSLqb-006JQH-4x; Sat, 25 Apr 2020 15:32:01 +0100
MIME-Version: 1.0
Date: Sat, 25 Apr 2020 15:32:01 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <20200425112950.3a4815b6@why>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
Message-ID: <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, daniel.thompson@linaro.org,
 jason@lakedaemon.net, catalin.marinas@arm.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, julien.thierry.kdev@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jSLqk-00EmlK-Nl
X-Mailman-Approved-At: Mon, 27 Apr 2020 09:02:51 +0000
Subject: Re: [Kgdb-bugreport] [RFC Patch v1 2/4] irqchip/gic-v3: Add support
 to handle SGI as pseudo NMI
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, julien.thierry.kdev@gmail.com,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-04-25 11:29, Marc Zyngier wrote:
> On Fri, 24 Apr 2020 16:39:12 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
> 
> Hi Sumit,
> 
>> With pseudo NMIs enabled, interrupt controller can be configured to
>> deliver SGI as a pseudo NMI. So add corresponding handling for SGIs.
>> 
>> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>> ---
>>  drivers/irqchip/irq-gic-v3.c | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/irqchip/irq-gic-v3.c 
>> b/drivers/irqchip/irq-gic-v3.c
>> index d7006ef..be361bf 100644
>> --- a/drivers/irqchip/irq-gic-v3.c
>> +++ b/drivers/irqchip/irq-gic-v3.c
>> @@ -609,17 +609,29 @@ static inline void gic_handle_nmi(u32 irqnr, 
>> struct pt_regs *regs)
>>  	if (irqs_enabled)
>>  		nmi_enter();
>> 
>> -	if (static_branch_likely(&supports_deactivate_key))
>> -		gic_write_eoir(irqnr);
>>  	/*
>>  	 * Leave the PSR.I bit set to prevent other NMIs to be
>>  	 * received while handling this one.
>>  	 * PSR.I will be restored when we ERET to the
>>  	 * interrupted context.
>>  	 */
>> -	err = handle_domain_nmi(gic_data.domain, irqnr, regs);
>> -	if (err)
>> -		gic_deactivate_unhandled(irqnr);
>> +	if (likely(irqnr > 15)) {
>> +		if (static_branch_likely(&supports_deactivate_key))
>> +			gic_write_eoir(irqnr);
>> +
>> +		err = handle_domain_nmi(gic_data.domain, irqnr, regs);
>> +		if (err)
>> +			gic_deactivate_unhandled(irqnr);
>> +	} else {
>> +		gic_write_eoir(irqnr);
>> +		if (static_branch_likely(&supports_deactivate_key))
>> +			gic_write_dir(irqnr);
>> +#ifdef CONFIG_SMP
>> +		handle_IPI(irqnr, regs);
>> +#else
>> +		WARN_ONCE(true, "Unexpected SGI received!\n");
>> +#endif
>> +	}
>> 
>>  	if (irqs_enabled)
>>  		nmi_exit();
> 
> If there is one thing I would like to avoid, it is to add more ugly
> hacks to the way we handle SGIs. There is very little reason why SGIs
> should be handled differently from all other interrupts. They have the
> same properties, and it is only because of the 32bit legacy that we 
> deal
> with them in such a cumbersome way. Nothing that we cannot fix though.
> 
> What I would really like to see is first a conversion of the SGIs to
> normal, full fat interrupts. These interrupts can then be configured as
> NMI using the normal API.
> 
> I think Julien had something along these lines (or was that limited to
> the PMU?). Otherwise, I'll happily help you with that.

OK, to give you an idea of what I am after, here's a small series[1] 
that
can be used as a base (it has been booted exactly *once* on a model, and
is thus absolutely perfect ;-).

There is still a bit of work to be able to actually request a SGI (they
are hard-wired as chained interrupts so far, as this otherwise changes
the output of /proc/interrupts, among other things), but you will
hopefully see what I'm aiming for.

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gic-sgi
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
