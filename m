Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E88871D0ED0
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 13 May 2020 12:02:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYoE6-0001sg-Ok
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 May 2020 10:02:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jYoE5-0001s9-H2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 10:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2aCxmJXofWWXF7Hc0yY8XDq7DjFWltNq1d94lnkIpsc=; b=J67Evn1T+JLQVBtuS4BNGU0j6J
 M4p62wGFlAJmnZ8PUYGxtwQr49jp+r1yI44olXr3kMo5LeWpGBMEsxGPHsimhnRiG1c3D+Tqo+nI9
 0rcgT1yi7fEGHI3h7+TuJCJLYTpko55Z1Vva1BsqRPTsUGjUdQubZsm1XXJFFyyXoTqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2aCxmJXofWWXF7Hc0yY8XDq7DjFWltNq1d94lnkIpsc=; b=NkzUeBL02bGNjbeauWhlEVFuGA
 gOaMU1NvPoE5S2ZXSkuQWopZHDMBcKeYnCVFZWzppc0YNlJoAGEa6+uqKsDVPhd5NOQG+9BjLZ3RF
 YPzFBe/Das0KxjON1raAOPI3x6qJLhoCuKVnQNeE5humKElDQtjgWCHGHndemb1LlBc4=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYoE2-00CoW3-4y
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 10:02:57 +0000
Received: by mail-lf1-f67.google.com with SMTP id r17so10071145lff.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2aCxmJXofWWXF7Hc0yY8XDq7DjFWltNq1d94lnkIpsc=;
 b=FiM4i2KZIvyApC6+NTNxDEVrlPFXsYzw6RVLZXT4qflN6pIIA0k8LCKBZsRqYOBtf8
 OoPskUmWqZTXpWeUbxdlLrpclL0TGUJUsYBxFTSXoOXyriXxXnF3IWjoatIFXluJLogV
 xhhINKLRwcvGlIuPlqW6Bjzk7/ua+XGA/3cHWGToX3l6EdzQ6n2BQfqE48HXHH9+qXZc
 wfbYsFb2PBCyKpU3yZv12c+hALk4nMBzt4Z9UaeeDNsjMkQlGyXUC5YQE+XjcorZDSsU
 iDOQN1RVuNbVyzQ9BNZw+AF4Dn8tbWdgswN6lQAptsOvBQhJWIK20Cp+XRGrP558LOu1
 KW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2aCxmJXofWWXF7Hc0yY8XDq7DjFWltNq1d94lnkIpsc=;
 b=jKsbIqwVtSRgqowINTnU4yzlzbEzPafixfY+Kc69T1IIN7Mn+PZ/QxogT7L71EmTm9
 heOBHofYcxXw+dq8SbATbV8k9ox9S83meijcppBIpSzy269IMQU7v6QXAh5C7+ZgVvv3
 qqAbnlD5NIOnPqR7Mm6Lq1iO26MwjN2ppZaUy3oKslSEqessVEHAr/OkrqJMhSkzts/7
 cvIygdKFj0VZJ1BZWrMsT4kzmexIc1uRCF5gCnlw6nv+0gl4EthsP+8LXdK3n62VCqWI
 gOSKhM1NjM31K/pXQftdVcfuw60uojhEOMFtPtspZQjmwUMMLNezqrbcApacXkeVJ3Z0
 BXvA==
X-Gm-Message-State: AOAM533qWSC+mvItqUjYgXMh0WxaRq7GgSlh6HR4cSvkp68MCOGoHC5g
 Cl3qYMkS6fmj8t2x+hEwtFKyFymqrcBpL7vTspbtgg==
X-Google-Smtp-Source: ABdhPJx16S95QuKV1iQrjHSlON/GYRqUod0w3hMx4HOwmWPFryc++fQrBz+1QzK7p6ucn4AJzZma99Yb4MdTiDAon0k=
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr14866106lfm.40.1589364167487; 
 Wed, 13 May 2020 03:02:47 -0700 (PDT)
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
 <CAFA6WYPHWP46TY_XdxVVrTr6AChU_1ATXu+p32vXCjkaXWPWOQ@mail.gmail.com>
In-Reply-To: <CAFA6WYPHWP46TY_XdxVVrTr6AChU_1ATXu+p32vXCjkaXWPWOQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 13 May 2020 15:32:36 +0530
Message-ID: <CAFA6WYO3=BHX1exF+J=93ECnQFe3S5O4HrT4t14euw3t9PXE7A@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jYoE2-00CoW3-4y
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

Hi Marc,

On Tue, 5 May 2020 at 17:03, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Tue, 5 May 2020 at 15:38, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On 2020-05-05 05:09, Sumit Garg wrote:
> > > On Fri, 1 May 2020 at 18:33, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > [...]
> >
> > > In case there are no major objections to this approach, I will post
> > > complete v2 patch-set (alongwith Marc's patches) for detailed review.
> >
> > As this is still a work in progress (I'm currently wrestling with
> > the stupid RPi driver), whatever you have is unlikely to apply on
> > top of the final series.
> >
> > I'm not going to stop you from posting the patches, it is just that
> > they will be obsolete by the end of the week...
>
> Thanks for the heads up. Will wait for your final series.
>

Were you able to give a final shape to your SGIs related patch-set?

-Sumit

> But while working on an NMI request, I noticed a hack in common gic
> code [1] which basically enables all SGIs for every CPU by default.
> This hack is quite similar to mine initial hack to set priority for a
> particular SGI by default to act as pseudo NMI.
>
> Due to this hack I got following error message while configuring SGI as NMI:
>
> [    0.000000] GICv3: Cannot set NMI property of enabled IRQ 8
> [    0.000000] genirq: Failed to setup NMI delivery: irq 8
>
> I think chained IRQs worked for you due to this hack only as it
> doesn't seem to enable SGIs per CPU.
>
> IMO, as we shift to SGIs being standard interrupts, we should also
> rely on standard interrupt framework to enable SGIs. So it seems the
> correct way would be to use "request_percpu_irq()" and
> "enable_percpu_irq()" for configuring SGIs as demonstrated in updated
> commit here [2].
>
> Also, we should get rid of this hack as demonstrated via commit [3].
>
> Apart from above changes, there was a minor update needed for commit
> "irqchip/gic-v3: Describe the SGI range" [4].
>
> I hope these updates are useful for you while preparing the final series.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-gic-common.c#n155
> [2] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=e208979b5165d753d144db57e0cb8646fdedc495
> [3] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=cd6d0d7cea14ac16156f0dbd297940df382f8cea
> [4] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=1180e9c54547ec05d96cc6b36c26005059c90d9a
>
> -Sumit
>
> >
> > Thanks,
> >
> >          M.
> > --
> > Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
