Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD42926D8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Oct 2020 13:56:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUTmQ-00024D-Jh
	for lists+kgdb-bugreport@lfdr.de; Mon, 19 Oct 2020 11:56:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kUTmO-00023h-F8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 11:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aa/1CgdmdAujxaZr5GZ4f1AwMqv/vbuqBiMEeYZMW2g=; b=GGwLWUEJd9hqKRSl9TAbVUvBvn
 CyKNkZyy0s3lsZY260l+h94k6p5Momu5KzCvIR1HF+smezAdQQ6fQnJ9D2T8LdzxdgjU0CSi/kerK
 kw2k/zfxs24rDEIrChrD5cXYAxnm9ACfgQjTH38j4VHuos1CllhcnqF+R3NoJXY8xz3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aa/1CgdmdAujxaZr5GZ4f1AwMqv/vbuqBiMEeYZMW2g=; b=UqWJ3eapC3V1IoU9EpCJRuIcAP
 e5ZmIbM0ns1xmAGil8JCSHEoDjWHcRKAZ5ysvFZpybqAcyLQY/9e4t+gCcS1g59tlLEi7uLC81WvA
 Fo1V9rN0TQWN/uj5K6FUYneQKB4UO33nGk3sBxkm+FBT2PU1uvOB1FYMPTS3HGwJeF+o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kUTmK-00FcZu-7d
 for kgdb-bugreport@lists.sourceforge.net; Mon, 19 Oct 2020 11:56:44 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FD49221FC;
 Mon, 19 Oct 2020 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603108587;
 bh=QuduAn6k0rUFR+XlPjYg/pmTJf/ta7vn5SfuOao/njQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t3odKDxneKRZ/sEMPTz0TQL5M6chluNLskMhfyBO0ZuIYQ3YaEVqxox/KSXnBDm+e
 WJk11sjxsyrC2c1tXBgd4cpAtFX7sCdeRQD9nM2pCFNE82rXDqbOp8HBCfG2pbU6pd
 HS8X22ByDu8S+h4Q/EAEjXcDihwG5oaoUvKfcfyI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kUTm5-002POa-8O; Mon, 19 Oct 2020 12:56:25 +0100
MIME-Version: 1.0
Date: Mon, 19 Oct 2020 12:56:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <b366c68fe0b365892aa4324be90235d6@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kUTmK-00FcZu-7d
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 catalin.marinas@arm.com, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2020-10-14 12:12, Sumit Garg wrote:
> Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
> particular platform doesn't support pseudo NMIs, then request IPI as a
> regular IRQ.
> 
> The main motivation for this feature is to have an IPI that can be
> leveraged to invoke NMI functions on other CPUs. And current 
> prospective
> users are NMI backtrace and KGDB CPUs round-up whose support is added
> via future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/nmi.h | 16 +++++++++
>  arch/arm64/kernel/Makefile   |  2 +-
>  arch/arm64/kernel/ipi_nmi.c  | 77 
> ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 94 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/nmi.h
>  create mode 100644 arch/arm64/kernel/ipi_nmi.c

[...]

> +	irq_set_status_flags(ipi, IRQ_HIDDEN);

Another thing is this. Why are you hiding this from /proc/interrupts?
The only reason the other IPIs are hidden is that displaying them as
"normal" interrupts would be a change in userspace ABI.

In your case, this is something new that can perfectly appear as
a standard interrupt (and I don't see how you'd display the
statistics otherwise).

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
