Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DAC293BA5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 14:32:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUqob-0007rD-TU
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 12:32:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUqoa-0007qi-4d
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 12:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rZb8COTjASSKrkc+L1XXlTr3VKMxCT98zDB0Xb+NHuM=; b=gv483UU6rTgFkIPqIr4Z1anJ2q
 IQaUiLwYuUdEWcKGKWE+Vywf0KWooslA8a7vxNpZojqH4P6cQww6f8OuSZVZQttbd8m2IU4W2ppR+
 Ksgd4aMPvdK4M+CymhWjFe25jW0MNTZ8DQwXmzTocK/gsocW8SwswRL6noFkaurJMp3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rZb8COTjASSKrkc+L1XXlTr3VKMxCT98zDB0Xb+NHuM=; b=YiU5UBGR0HpUcNJxkHnQ7lIrdH
 4RvHmMKueQwWoix7PfRh2C1dIdH3WsRWnIGnfAbvqSMU4RU76hED6aFBsT9jSjM6IDDlopQKYOsVl
 RhxDFNldv18thidHZdjy/yerI9F5Sj/d6je8xCXWJHU8MU5R1ThwUKFaf4FU/4PP/bWo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUqoO-00HJIr-Th
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 12:32:32 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A1C222265;
 Tue, 20 Oct 2020 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603197126;
 bh=FNskQlyvjAYQ2kRwtssvTisWlw7hhgIkump+feNnth0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rZ9Ra18GZ+F44faWs6WTiw+eQmQtzYA2X2KmekvneqthHeJVYllH19lEDFgSbyDJ/
 tqdMBTqCDaIW8DBtvqvx7+tzk8SFLK6JRL16U4iYCUlwDGgR/OroVhUZDX2Jb4ELf5
 e2YYWVpFbwsYACRsP++e5PWxAGP6Vp5BmsR6I9Ks=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUqo8-002jGz-39; Tue, 20 Oct 2020 13:32:04 +0100
MIME-Version: 1.0
Date: Tue, 20 Oct 2020 13:32:03 +0100
From: Marc Zyngier <maz@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20201020122535.paym32gksuhcqtwq@holly.lan>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
 <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
 <f3596e3ed70737d36f72056827d7d441@kernel.org>
 <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
 <20201020122535.paym32gksuhcqtwq@holly.lan>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <abe358694e06a6076fb5838d1231eee6@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: daniel.thompson@linaro.org, sumit.garg@linaro.org,
 catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com,
 julien.thierry.kdev@gmail.com, dianders@chromium.org,
 jason.wessel@windriver.com, msys.mizuma@gmail.com, ito-yuichi@fujitsu.com,
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kUqoO-00HJIr-Th
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-20 13:25, Daniel Thompson wrote:
> On Tue, Oct 20, 2020 at 04:52:43PM +0530, Sumit Garg wrote:

[...]

>> So in general, IPI as a normal IRQ is still useful for debugging but
>> it can't debug a core which is stuck in deadlock with interrupts
>> disabled.
>> 
>> And since we choose override default implementations for pseudo NMI
>> support, we need to be backwards compatible for platforms which don't
>> possess pseudo NMI support.
> 
> Do the fallback implementations require a new IPI? The fallbacks
> could rely on existing mechanisms such as the smp_call_function
> family.

Indeed. I'd be worried of using that mechanism for NMIs, but normal
IPIs should stick to the normal cross-call stuff.

The jury is still out on why this is a good idea, given that it
doesn't work in the only interesting case (deadlocked CPUs).

          M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
