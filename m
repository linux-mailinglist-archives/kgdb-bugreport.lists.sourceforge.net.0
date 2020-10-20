Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C15EF293584
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 09:08:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUlkY-0007XI-FM
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 07:08:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUlkW-0007X1-S4
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X8McS5lbaBCf5JTK6wcTtTbcIkoyUi8hMk2YmNfJw8M=; b=krwSTIxouOwmkS71lGf+cEnTYC
 TVJWEkYOPxMFpqShTCBVhaqesHnHwIf3h1NcOn5ARu6AYltTOUYa7wvLGcUs3NP1LeI72ZyllwDIB
 rk+rQEryYanh/3bZYzJya2ndi/pMeWaHPCrROqOWgycMaMc/9/U81+qaGLNfklGSKZsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X8McS5lbaBCf5JTK6wcTtTbcIkoyUi8hMk2YmNfJw8M=; b=VCkCnfKRXtex4cdFmypeH0jKa9
 QPQsXp5CqzZO+FMhJjHtu1g59hPiQg29CtHyJoMhoVs1NVZ6BSTnks+ARbEz88gwoe+UqAjPMpNEb
 Af+1oENd/Y20i+udw/CN9d5wysWyC1lDXpzWKCglBHoy7GSThL0mLjRg1JopG9HIVBbg=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUlkM-0053kf-Af
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:08:00 +0000
Received: by mail-lf1-f68.google.com with SMTP id 77so824097lfl.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 00:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X8McS5lbaBCf5JTK6wcTtTbcIkoyUi8hMk2YmNfJw8M=;
 b=e1Y8DGWy8PvUo/hwsGgNr/SxdVXPOv2DnsuZU21mBVE0a25+BM9fRGatglVVPp9dE7
 Lj1eLuXIUt6uQviUNHRz8UMfE7RvzoKm4fQ0fvZxduLALc0et0o6Z+aLVK+Kdg5Xgj9Q
 28dFK/a8fFtDoZwXlcR7MoOwy2Efmluo1+anAYmYnGchJFYr4fdJUQVVzVrFVp+F/gfB
 7UIUFT/uaTidTjc+5wmTzbtkd35BESS4VV6UbgNlcqV4/YHG+1LR39Dtr/GQ8up7Oq7a
 o/0XT1U70IqMREyAVcpkU7ZCRhNWbcYcdAcWvdVSYbFYo/y8aCFSYswwyFbA1P7L4whR
 SpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X8McS5lbaBCf5JTK6wcTtTbcIkoyUi8hMk2YmNfJw8M=;
 b=SiRYEvQQfGVEGRS4Z8xu2PQGMQqc1TjPLu/BXyrnFK21lH+JUocSfEL5hHN9dfwyh2
 r+EC8sMM8Antukl/9nsjDW0ZiJkIQsT9Ow7lORYNKGYSB9B7267pon2iHz0rZcPO0DwV
 oUR7NlWWzzOSCbk01WlxAv1EVHNTG87rDQI0OD+SVqFS+tAsDFW+as8bfRZwbQ48tCuI
 YFmTKRR4MPIbAh3eCtyZXA/uv46CnRvuF6YkOdGk6Vh6sw1ge9KtVupuj1RHzjHhtFPS
 DNV2b5L9HnV7UmB11Hs401iDg5L3zs7zMV0VySiZaKicIfn1QRcRUBdkSJ4lKIZTalJI
 r+1g==
X-Gm-Message-State: AOAM533NNWBaFIkcwzMJrhUZXORnFclwGeU4U8aotUWbY59ynQa06kW8
 KVqv2vxoqT0dy5PN4QQ+umcu5FHe/mQRxFj12O+B3g==
X-Google-Smtp-Source: ABdhPJze6CEfoi8/vvii5B8d0+u1FpywdGMBPFXjnDIeIpd5UubkRRY//yghku8Ufl5i5OH4rN/5B3WrTxn8dIcS/Dk=
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr465214lfg.419.1603177655367; 
 Tue, 20 Oct 2020 00:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <b366c68fe0b365892aa4324be90235d6@kernel.org>
In-Reply-To: <b366c68fe0b365892aa4324be90235d6@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 12:37:24 +0530
Message-ID: <CAFA6WYN18oe9143offQ1V5RwnYZmvy29vPR0SKFtpkdOePezsQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kUlkM-0053kf-Af
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 19 Oct 2020 at 17:26, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-14 12:12, Sumit Garg wrote:
> > Introduce framework to turn an IPI as NMI using pseudo NMIs. In case a
> > particular platform doesn't support pseudo NMIs, then request IPI as a
> > regular IRQ.
> >
> > The main motivation for this feature is to have an IPI that can be
> > leveraged to invoke NMI functions on other CPUs. And current
> > prospective
> > users are NMI backtrace and KGDB CPUs round-up whose support is added
> > via future patches.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/arm64/include/asm/nmi.h | 16 +++++++++
> >  arch/arm64/kernel/Makefile   |  2 +-
> >  arch/arm64/kernel/ipi_nmi.c  | 77
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 94 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/include/asm/nmi.h
> >  create mode 100644 arch/arm64/kernel/ipi_nmi.c
>
> [...]
>
> > +     irq_set_status_flags(ipi, IRQ_HIDDEN);
>
> Another thing is this. Why are you hiding this from /proc/interrupts?
> The only reason the other IPIs are hidden is that displaying them as
> "normal" interrupts would be a change in userspace ABI.
>
> In your case, this is something new that can perfectly appear as
> a standard interrupt (and I don't see how you'd display the
> statistics otherwise).

Makes sense. I will remove this flag for this IPI so that it can be
displayed as a standard interrupt.

-Sumit

>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
