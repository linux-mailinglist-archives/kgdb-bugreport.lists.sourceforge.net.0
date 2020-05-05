Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B63641C5473
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 May 2020 13:33:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jVvpZ-0001XW-IL
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 May 2020 11:33:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jVvpY-0001XB-B2
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 May 2020 11:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hupIsa73mYi5wqryxe4Qi42JysQkQpBvcd0iG3bDTIg=; b=V8ZRfOk4B1EfiH/iqxeGvMPl8c
 Mu+wdthJpWTvEqXO+gpd5qnqbRaD0eW8EEPFTxEcEVhD+yLlkvW3yFXRX0PAEWG/ln3rHbhwkOnFm
 nMfT0a/NpL5Okj3MZL+7Mth9lBaOgPoNaL3ykP/zzr/2aFTrkzT2MxHM2T13+U/h9qgM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hupIsa73mYi5wqryxe4Qi42JysQkQpBvcd0iG3bDTIg=; b=mUyDudSRXb8jGO5a7B/EY834xL
 NNfqqLCyWjxqrJg1AhyUQEjlI0ytGyecHjYJev7xEK4NSGk1JJWNt+0I2UO/6BZLUNaLUALnpqDB7
 H29CbPrQ0EuAdXyQuNB4Dn9d93PEkm7zkKLwHA3oHngIkUemqj6jUT39+FVw2/XsWaRI=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jVvpW-00ECJ4-F8
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 May 2020 11:33:44 +0000
Received: by mail-lf1-f66.google.com with SMTP id 188so1054901lfa.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 May 2020 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hupIsa73mYi5wqryxe4Qi42JysQkQpBvcd0iG3bDTIg=;
 b=VH3NB1RZHEvs5K7gdOjwynz0XSk4hklChAwSnf9CBV0dqOMKufdJjyxgi+kZvX5uNZ
 +oynGrV0QHSRGalM8tgG/rbkxVYT8F0cBFML/4yh0b8obwpoV2EwRk7T1x5Czne4EXu5
 l5uw/K26uHeZS6VWJsGc7f5OjmRrmPWwevTr+TnDoyD2fSHoASkUOKfFhaclL3Oi3rfB
 RBoM5NzMZSJtkRMwsAYIPgcAf6di6MPGj3PtIXwHnOQ0X3xLs1KYjdDogTLFWE5X/KBm
 +m6A6Xe+SN8BnlU1uKncJpvfWoeRLE476mXu8gCUiXNZ4q+V+iA/qf7Mn3GUSl3H7h58
 FI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hupIsa73mYi5wqryxe4Qi42JysQkQpBvcd0iG3bDTIg=;
 b=ZSvbt0JWkDc/pebSzRJ4sNVVNCqMVwqjXvUsCWu5BmQ0kWXj3TDKc73tcudc1r+sS/
 HXdyrUf/ABWb/ONScXMuxg8wkuzBOivReezuDQqEVRKoCE3ASD/O//1nnUpv7D1UuuBe
 KwOTWLxK5vmj/Hk7beCpSg58dvcqtX+U92IuOPCUxddx/eE3zcKG0cJxNeR29Bee8h7R
 acFGWxhlziDEYbsASVwUMlPpqmf0CPb8wadvIaQUONXT9c8pwjaM6U4t6ZqSk32BksF1
 o0QJ05H2/GHGkgAo60aBtIgmU29dfbGZAdCCB7ha0nmi064lUlNEj1Jc/41btbVLJrKp
 j+UA==
X-Gm-Message-State: AGi0PubhSAilbY81SB3wUl9cHQSUAH8Z+9CPOxSXsPwSm3ElzAQ8eD/n
 YQQUhMCKVART56CwZGE23rYUYfzDsKc5eL1XLtEb9Q==
X-Google-Smtp-Source: APiQypLU2m/D7oJWk9It8mtjKBIlV1BpWKwlq9Nc3PajJn78yBAiMiIjgK7Faej/USSOYk2Wxlaz7fdud7Qz/+U/Wfg=
X-Received: by 2002:a19:7418:: with SMTP id v24mr1403778lfe.15.1588678415695; 
 Tue, 05 May 2020 04:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
 <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
 <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
 <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
 <CAFA6WYMheJxeKVC_YWN9owNJhcWTBsaOCvZXxq=GVj5ROJ0cvg@mail.gmail.com>
 <20200430101322.420e4052@why>
 <CAFA6WYO+NGLfNkOah4YzXx5XuaDh=QtWHgnMBwwMFY1zRt15GQ@mail.gmail.com>
 <CAFA6WYPxiwxpJitX7fCSESUvQSa9Dq89GwL4e3w33ooetV=ysw@mail.gmail.com>
 <CAFA6WYOn+DLf77C1+e5bq-NdT+o4=o32oPu2b3bxD_U+mLQ3WQ@mail.gmail.com>
 <306aecc560a9503e500fbf1f512c6d30@kernel.org>
In-Reply-To: <306aecc560a9503e500fbf1f512c6d30@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 5 May 2020 17:03:24 +0530
Message-ID: <CAFA6WYPHWP46TY_XdxVVrTr6AChU_1ATXu+p32vXCjkaXWPWOQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jVvpW-00ECJ4-F8
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

On Tue, 5 May 2020 at 15:38, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-05-05 05:09, Sumit Garg wrote:
> > On Fri, 1 May 2020 at 18:33, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> [...]
>
> > In case there are no major objections to this approach, I will post
> > complete v2 patch-set (alongwith Marc's patches) for detailed review.
>
> As this is still a work in progress (I'm currently wrestling with
> the stupid RPi driver), whatever you have is unlikely to apply on
> top of the final series.
>
> I'm not going to stop you from posting the patches, it is just that
> they will be obsolete by the end of the week...

Thanks for the heads up. Will wait for your final series.

But while working on an NMI request, I noticed a hack in common gic
code [1] which basically enables all SGIs for every CPU by default.
This hack is quite similar to mine initial hack to set priority for a
particular SGI by default to act as pseudo NMI.

Due to this hack I got following error message while configuring SGI as NMI:

[    0.000000] GICv3: Cannot set NMI property of enabled IRQ 8
[    0.000000] genirq: Failed to setup NMI delivery: irq 8

I think chained IRQs worked for you due to this hack only as it
doesn't seem to enable SGIs per CPU.

IMO, as we shift to SGIs being standard interrupts, we should also
rely on standard interrupt framework to enable SGIs. So it seems the
correct way would be to use "request_percpu_irq()" and
"enable_percpu_irq()" for configuring SGIs as demonstrated in updated
commit here [2].

Also, we should get rid of this hack as demonstrated via commit [3].

Apart from above changes, there was a minor update needed for commit
"irqchip/gic-v3: Describe the SGI range" [4].

I hope these updates are useful for you while preparing the final series.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-gic-common.c#n155
[2] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=e208979b5165d753d144db57e0cb8646fdedc495
[3] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=cd6d0d7cea14ac16156f0dbd297940df382f8cea
[4] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=1180e9c54547ec05d96cc6b36c26005059c90d9a

-Sumit

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
