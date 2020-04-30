Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC81BF3E1
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 11:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jU5GH-0004TJ-Es
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 09:13:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1jU5GE-0004SL-Ff
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 09:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzwQHzOoFG3icMRV5S2aDg7aZBxo9fif/iPgROpp1/g=; b=NvddY4jWVkmVHmkq3mThCToFrG
 eUnKPFZhZ8oY0M7wVNh+AyYEhEF2/L4mI657HkQ2Ots1OEItn1bUkC9Tc9SUUTvmlKOA6XLxpETld
 GTk34ETdp3T7N6YaOZHrLAPos2Sv2uQPyxAdgF/iYcbaTNTcO3LNEI1nIXbfOAL805ME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tzwQHzOoFG3icMRV5S2aDg7aZBxo9fif/iPgROpp1/g=; b=B+jWcBUDJ1NACBjm0e8ysFvfEw
 ajg1mlbaImbG0LU2x0HytsdYCylh5HFJfPYSU03Tb8m66po6ZSNIoEB9S6MACIDxv0UedNDKvoNFN
 iSbQqWnD0Pp3nV6MWYrOGS8qcAKvfktKZTCMJZ2Y1AebgDf5IUWJ/MCezGGuHVVWNCf8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jU5GB-003Aqi-Sx
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 09:13:38 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6447E2082E;
 Thu, 30 Apr 2020 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588238005;
 bh=JNYY/lIhM+KmdtUid3oVijBTFJzmnGX8VYYWh0ljOVM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=amam8/YRxVFOJY0P8cbDGOng2efgsO4eZKRsGMKz1P1/NT9yf/O8TivOn/9sMmHx5
 wUCMkApwmRepMAyqdrzEuaRIDxKqEMl3Rk3vHoTxrEpjk1gIbdIuUtnTGLbW0iIRJE
 hsQRCHqD3dsrNODE12FNE6mysH5j7dnRabx6Tw64=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jU5Fz-007yZV-OB; Thu, 30 Apr 2020 10:13:23 +0100
Date: Thu, 30 Apr 2020 10:13:22 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200430101322.420e4052@why>
In-Reply-To: <CAFA6WYMheJxeKVC_YWN9owNJhcWTBsaOCvZXxq=GVj5ROJ0cvg@mail.gmail.com>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
 <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
 <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
 <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
 <CAFA6WYMheJxeKVC_YWN9owNJhcWTBsaOCvZXxq=GVj5ROJ0cvg@mail.gmail.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jU5GB-003Aqi-Sx
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 30 Apr 2020 12:50:28 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

> Hi Marc,
> 
> On Wed, 29 Apr 2020 at 13:53, Marc Zyngier <maz@kernel.org> wrote:

[...]

> > What I would like is for the arch code to request these interrupts as
> > normal interrupts, for which there is one problem to solve: how do you
> > find out about the Linux IRQ number for a given IPI. Or rather, how
> > do you get rid of the requirement to have IPI numbers at all and just
> > say "give me a per-cpu interrupt that I can use as an IPI, and by the
> > way here's the handler you can call".  
> 
> I think what you are looking for here is something that could be
> sufficed via enabling "CONFIG_GENERIC_IRQ_IPI" framework for arm64/arm
> architectures. It's currently used for mips architecture. Looking at
> its implementation, I think it should be possible to hook up SGIs
> under new IPI irq_domain for GICv2/v3.
> 
> So with this framework we should be able to dynamically allocate IPIs
> and use common APIs such as request_irq()/request_nmi() to tell IPI
> specific handlers.
> 
> If this approach looks sane to you then I can start working on a PoC
> implementation for arm64.

I can't say I'm keen. This IPI framework doesn't really work for the
GIC:

- it requires a separate irqdomain to be able to guarantee that you
  allocate the hwirq in the SGI range. What is the point?
- it creates yet another level of indirection on IPI injection

This framework was created to deal with two cases:
- systems that can't represent their IPI with a single hwirq spanning
  all the CPUs
- "accelerator cores" that don't run Linux

The GIC architecture avoids the first point, and I don't even want to
think of the second one.

Also, it doesn't solve the initial problem, which is to bootstrap the
whole thing. The IPI framework relies on an irqdomain to be created the
first place. This would mean teaching the arch code about the
intricacies of irqdomains, FW nodes and other terrible things. All
things which are better hidden in the GIC drivers (not to mention the
other horror stories that are the RPi-2/3 irqchip and the Huawei GIC
knock-off).

What I have in mind is to replace the set_smp_cross_call() with
something that passes the required set of information (interrupt range,
at the very least). The only thing that I plan to reuse from the IPI
framework is the chip->ipi_send_mask() callback.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
