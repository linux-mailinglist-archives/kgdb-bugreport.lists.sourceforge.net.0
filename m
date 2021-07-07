Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DF53BE2EC
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jul 2021 08:04:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m10fF-0006VT-EG
	for lists+kgdb-bugreport@lfdr.de; Wed, 07 Jul 2021 06:04:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m10fD-0006VH-Ja
 for kgdb-bugreport@lists.sourceforge.net; Wed, 07 Jul 2021 06:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bsNR85tqDq0Nnn+qEiX/ciVIvYBVMUZ7RHqxFZuZ7ac=; b=HoSgoGvtv+QOva2qJckZW+qLTe
 J0uDm2pwy0OIgVBrY+x8Ou6u9rjsHiW9ZqdJn0wKdbJB03ImL44X+LUcWAaOgD54gCnM/GvJN4Lb+
 GukojAaktAUMsdLAOGeVXxb9wOp/858s6zZzNp6gW9x7otecXKN5bAA7EiAIZeWMRWrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bsNR85tqDq0Nnn+qEiX/ciVIvYBVMUZ7RHqxFZuZ7ac=; b=UXQfmO8WetbpWeMJx3XJCaCfPV
 b1dpISxRMYiy0jg0DvufZEik0EfwKb2oWly3lk/mENZtJI08+JCStmlmOz//SjTOkfE9MAVQxtqkD
 27cOF+rVrdpfkMfFty6I1PFcFqwXPbPieQSqrfgJLpFmV72JL1vJdotIVXYDQmC+chJs=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m10ex-0005sc-US
 for kgdb-bugreport@lists.sourceforge.net; Wed, 07 Jul 2021 06:04:03 +0000
Received: by mail-lf1-f43.google.com with SMTP id q18so2038255lfc.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 06 Jul 2021 23:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsNR85tqDq0Nnn+qEiX/ciVIvYBVMUZ7RHqxFZuZ7ac=;
 b=blo9Hicsv9504zHLVbxs8UBByiL7wgPHsEGttVgdYefQyIWPkuDVrZRisx9joq7Mz/
 Qu7N4YHMeiKdJl/rnFaBwKd+y7LtyFKFzqX6DyGXHJnw5la3DS32G1qr9LtwDltkCqZb
 HynWKzVzkf73s9lm/k5Gtb+2rFR0Nje3miol3zMdoTAGvyiHr/S0E47EZ2bnhDcfRlUF
 Cs37svVCH+kFq9isxxHAZ/w9flWKtpeMSapTxG+U5/MLRWNr4G9vidfiBnFXeXciMd/o
 SAliSgQrhlxOZd5x8LHWOrXkONosjNtuUGODCTc2u6TS8mEhENJItDcu8OnxOCUfdZ5T
 QmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsNR85tqDq0Nnn+qEiX/ciVIvYBVMUZ7RHqxFZuZ7ac=;
 b=FiLp9M27J8rlZn+YWDAYwgiOYuhye9taHI06RRkZenWjSPjjZ0193zC1zB0Avlgz4p
 BU9t+CQsRW0Y8zkuRfhaITrImifLaS/YUnIxWeNIQD5in0OoKLPwHyo4NNF9e1JQ+y5A
 vlr8oSMoFAgYiNoHFlwgYtfnpbSUFIqhL5FyRrW5ulQhsym95bVgVylh+r51CwfSYzdt
 vmdlOmO6waU4QwJuYMML+99VaKB14Od340Q7xgNVtvkhkfMo0LWgYYolb3osvfDlHZWx
 ExbfcSh/yNw6maQhxHOlbfLq+k3naF2kklrFM3UCGIH7q2EpZshEv5PXv6BxZFoYPKfJ
 A8yQ==
X-Gm-Message-State: AOAM5333wArPAjRe0j7KWaGqSHfEs2loo2oOuYgkVE+WeGVOAfuOWq1P
 PLdOmBZVpqBqlrmmS0JasnrDWfjv32LveH06xL7nJA==
X-Google-Smtp-Source: ABdhPJwuDZGs0hKLyoVnwNvI32TWwNFM1Ftg1kj8S0JdGejmefRNqnJcECXZmHEq2+4WMvIsxFQsowp575HfDWJxKa8=
X-Received: by 2002:a19:e002:: with SMTP id x2mr17608887lfg.84.1625637821291; 
 Tue, 06 Jul 2021 23:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYNn0+yxntkebqDVnOoq50gxY4Zvi1wGLAZTJyWGc7VLkw@mail.gmail.com>
 <f1aae58230a81e63cd380d1a45d5a2ee@kernel.org>
In-Reply-To: <f1aae58230a81e63cd380d1a45d5a2ee@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 7 Jul 2021 11:33:29 +0530
Message-ID: <CAFA6WYN3CvdP0DMMq3WBMGNju7h2tpMidFaTOvghLdxhWh+7Sg@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m10ex-0005sc-US
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, wens@kernel.org,
 ito-yuichi@fujitsu.com, mpe@ellerman.id.au, x86@kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Ingo Molnar <mingo@redhat.com>,
 bp@alien8.de, julien.thierry.kdev@gmail.com,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 5 Jan 2021 at 16:13, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-01-05 10:34, Sumit Garg wrote:
>
> > Do you have any further feedback on this patch-set?
>
> None at the moment. We have tons of issues to solve with the arm64
> interrupt entry code vs instrumentation at the moment, so it is
> pretty much at the bottom of the priority list for now.
>

I hope you were able to resolve most of the issues. Is it an
appropriate time to have a relook at this pseudo NMI feature?

-Sumit

> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
