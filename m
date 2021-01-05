Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEDC2EA910
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Jan 2021 11:43:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwjoQ-0004V0-Df
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Jan 2021 10:43:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1kwjoO-0004Ut-SC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 10:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7O7kMD4v0hxcsXGg36p/23kUlXh4WDFGdJR5yIAQMSU=; b=hkUgkve6O+/vF4Z8MYMDldEjqb
 qEW4j40iL43SJThr7mEShqvvSlfql0TZ4aZ1eIs0Tq8sDhOa7ut446rvDI+OL5nf8GATq+vZ2Ny7R
 LHiYJt33KIS/GNlIxTXK9tfgKJmNVdHNQIBA6yQ1vlfrKJ85Ka3NyeB2fYDA0TlmQl9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7O7kMD4v0hxcsXGg36p/23kUlXh4WDFGdJR5yIAQMSU=; b=UB6XwhBbKuJiczrZGe1XGyOW8N
 kRSr4b+LcBIH23kIoxNy1hOlbX7noYH1Vo/jnFvVbyA9bjh7tptCEIxNhraZ+NrolGgzQS+ewMR62
 acNeUvBD1Tx6Ig/g/9TQlwnTR32ieoJ/we6Zq1tZp4gGsoNRKgkllXMQ3plET1jiElo8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwjoL-00FhgX-F6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 10:43:36 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FD5E22515;
 Tue,  5 Jan 2021 10:43:20 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kwjo5-005Pae-Vx; Tue, 05 Jan 2021 10:43:18 +0000
MIME-Version: 1.0
Date: Tue, 05 Jan 2021 10:43:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <CAFA6WYNn0+yxntkebqDVnOoq50gxY4Zvi1wGLAZTJyWGc7VLkw@mail.gmail.com>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYNn0+yxntkebqDVnOoq50gxY4Zvi1wGLAZTJyWGc7VLkw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <f1aae58230a81e63cd380d1a45d5a2ee@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 mpe@ellerman.id.au, davem@davemloft.net, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, mark.rutland@arm.com, julien.thierry.kdev@gmail.com,
 dianders@chromium.org, jason.wessel@windriver.com, msys.mizuma@gmail.com,
 ito-yuichi@fujitsu.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 daniel.thompson@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kwjoL-00FhgX-F6
Subject: Re: [Kgdb-bugreport] [PATCH v7 0/7] arm64: Add framework to turn an
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
 Daniel Thompson <daniel.thompson@linaro.org>, tsbogend@alpha.franken.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ito-yuichi@fujitsu.com, mpe@ellerman.id.au, x86@kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, mingo@redhat.com, bp@alien8.de,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2021-01-05 10:34, Sumit Garg wrote:

> Do you have any further feedback on this patch-set?

None at the moment. We have tons of issues to solve with the arm64
interrupt entry code vs instrumentation at the moment, so it is
pretty much at the bottom of the priority list for now.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
