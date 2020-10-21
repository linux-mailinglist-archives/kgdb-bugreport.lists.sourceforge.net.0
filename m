Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BB294B3F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 21 Oct 2020 12:28:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kVBM2-0005UA-Vt
	for lists+kgdb-bugreport@lfdr.de; Wed, 21 Oct 2020 10:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kVBLv-0005Sy-Hv
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 10:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XRbnyD0ULtEHZR1isiquT/eCWb2LUxNpylhEQsIIJcM=; b=OS2AKdIaF4ZUar4q8r3f5nFmAM
 tZPSV9ziEmhhux1S8G5bFDvV7MYXT1Sc7pOhtCfJnVU6FZTStuOExZpjuWQ78WqPYODPfnrDSGKkK
 15zEe52vlGPtUEynSQsoNRWDjFvkoyA5BDuP9QGsasQbY3q8/hOycHGup0fiproiHneA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XRbnyD0ULtEHZR1isiquT/eCWb2LUxNpylhEQsIIJcM=; b=FhugKNvAlUQCBoTxD11OozGS5O
 nofwQpyfUwjseAEf5GJal+tTujYCoFs68JqA4n9vt9jK9yOcy6ip0inLpJojOceCKmf4T3MCXdG0L
 UtIUtpkf80PczrXAJz7izCS0WURzAFYp3j0SPCvABGk7CgqPVLYjCLaR2hkGoT6TVll8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kVBLl-0073RQ-3S
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 10:28:18 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53A9720795;
 Wed, 21 Oct 2020 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603276078;
 bh=bUkGtFLF6jET5lEcrcQKVZVTxu7HB+oWtwgZEXhk4gk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KLQBz9PHgGvLwOxBZ+1qjVheotgicuLH1X2/hAEvcswpbIZugQefA2fSIV5fR2oBS
 pX2fDynzIC6NC2z5Si9WEvXFw7GS2YzhgHq5mqrEJZWNTfz+f8l59CW641sDY8/7dL
 lpW6iS3LG0cWXDF0Rb042Exlk/lTdJgMOtBqWOpM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kVBLY-0030gT-B3; Wed, 21 Oct 2020 11:27:56 +0100
MIME-Version: 1.0
Date: Wed, 21 Oct 2020 11:27:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
 <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
 <f3596e3ed70737d36f72056827d7d441@kernel.org>
 <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1d41e0e4e6ee6c794b83d2c75c3748da@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 jason@lakedaemon.net, mark.rutland@arm.com, julien.thierry.kdev@gmail.com,
 dianders@chromium.org, daniel.thompson@linaro.org, jason.wessel@windriver.com,
 msys.mizuma@gmail.com, ito-yuichi@fujitsu.com,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
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
X-Headers-End: 1kVBLl-0073RQ-3S
Subject: Re: [Kgdb-bugreport] [PATCH v5 1/5] arm64: Add framework to turn
 IPI as NMI
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 ito-yuichi@fujitsu.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-20 12:22, Sumit Garg wrote:
> On Tue, 20 Oct 2020 at 15:38, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-10-20 07:43, Sumit Garg wrote:
>> > On Mon, 19 Oct 2020 at 17:07, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> [...]
>> 
>> >> > +{
>> >> > +     if (!ipi_desc)
>> >> > +             return;
>> >> > +
>> >> > +     if (is_nmi) {
>> >> > +             if (!prepare_percpu_nmi(ipi_id))
>> >> > +                     enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
>> >> > +     } else {
>> >> > +             enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
>> >>
>> >> I'm not keen on this. Normal IRQs can't reliably work, so why do you
>> >> even bother with this?
>> >
>> > Yeah I agree but we need to support existing functionality for kgdb
>> > roundup and sysrq backtrace using normal IRQs as well.
>> 
>> When has this become a requirement? I don't really see the point in
>> implementing something that is known not to work.
>> 
> 
> For kgdb:
> 
> Default implementation [1] uses smp_call_function_single_async() which
> in turn will invoke IPI as a normal IRQ to roundup CPUs.
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/debug/debug_core.c#n244
> 
> For sysrq backtrace:
> 
> Default implementation [2] fallbacks to smp_call_function() (IPI as a
> normal IRQ) to print backtrace in case architecture doesn't provide
> arch_trigger_cpumask_backtrace() hook.
> 
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/sysrq.c#n250
> 
> So in general, IPI as a normal IRQ is still useful for debugging but
> it can't debug a core which is stuck in deadlock with interrupts
> disabled.

And that's not something we implement today for good reasons:
it *cannot* work reliably. What changed that we all of a sudden need it?

> And since we choose override default implementations for pseudo NMI
> support, we need to be backwards compatible for platforms which don't
> possess pseudo NMI support.

No. There is nothing to be "backward compatible" with, because
- this isn't a userspace visible feature
- *it doesn't work*

So please drop this non-feature from this series.

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
