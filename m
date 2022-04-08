Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAA4F96B8
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 15:33:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncojU-0008HH-04
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 13:32:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1ncojT-0008HB-0v
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 13:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDC9L0lcr1QHf8qfh13ooZQp7CHb5z3+opmiIbCpO5g=; b=aJFI+H2fAiNGUEC2G4aDsuMKkp
 ty6QlIu3tyuGgPTk97sbHi6JIhezyZC90+sbYmFunpu34O0p6Z1xwN9b42FyAFrLp4u5vSehLCDMO
 8vTUNKMzaFVK1TU9c3ky4MLQzjjdIOFt7oAKx+oTWMeIWPJxOFL5OKgUIbnLA7GTGEp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDC9L0lcr1QHf8qfh13ooZQp7CHb5z3+opmiIbCpO5g=; b=D01dN5M+ggkA2DMs0+ijXYLbYa
 srwDPX0p9JhM3fHK5swYE3NS1wJk4627XLQz9WeO27ecWO4ksDvZtiIeS9XqmjFKUhmG17Cp4je6l
 nQR9uejfjn7MwoXTiym1sgoOSQt0Y3dN8EKIGMRQk9TGj93z7M8HKCsTb6QeLkO3nWYs=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ncojP-009nwz-36
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 13:32:57 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso7599857wma.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Apr 2022 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pDC9L0lcr1QHf8qfh13ooZQp7CHb5z3+opmiIbCpO5g=;
 b=jmrr9ES2B8XWO03NQZzQI4F2KKQwsDwVsKRsbWp63khlAKSkmi9C+eilQOfzSCKath
 b3no7GA5N4PEoy7SBC5oRO6EjCTlned/SX99tuyEsBpExUCpvQy48bLQ5u/Ei8+f7+70
 JjoSwIq3ChdypUMSjHJMZXtPDo6LBN4VWGLzEibGOseVKZTsmd8rOjKDQID9fcDLqQLJ
 NDZUZYPMPUPPbnyc0e1+Kc+f3IMnC7PXOXkmbrtOHF4HITAHh0MbxX93nNvzfRQLYfBj
 JRUU1LkEyrPi6gVeOgj1vX501pObHoK8SRG8vDH2evWMkgLQFKGNabXNKtnXXbfryVtb
 7B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDC9L0lcr1QHf8qfh13ooZQp7CHb5z3+opmiIbCpO5g=;
 b=8D3H54DmHpMcbtN8Pw9si25thRG6eARZb9g7I2fFmY4czy6ioNTC22y2Edp7rgZwDV
 Zni9ylkfxJEnsLFdN5EFsFH1tyboS5oAq8I1f/B1brzT7xRLMuQtRFZ7HVvQFTyvvBoD
 5ag3VGmKTrRibDIwFAd+p1tm2wdf39ssSXmz9uTe+td3FNJLsYoEcy5Un77EttupSp97
 6ox4B9w78jMip25wxpfXNO/1O3udUxgxiuJfnqzahJy27RIlC96N4FLrO35qdKqIXp+t
 3/nAyTTDyMxbWoSiwh+VVQPjkKWYJY/Z0ycXBnsBtwDCeLno5DYNzU6rFINMiQnJGUW3
 CX5Q==
X-Gm-Message-State: AOAM532fCbmT6b6oYuPJ0ngOGs2UPoKjxyNpwqT58SqVr2psWvDxhxAs
 uk3uqEORusyhqSR5BbjSAHaXbw==
X-Google-Smtp-Source: ABdhPJyeiw4bwAQfXU133L8POlyN9oSdy3Td0K/5lQO2DSbqQQ73iq/K4PM/64Hhgx/RD0NCcuI3hQ==
X-Received: by 2002:a05:600c:34c5:b0:38c:30e3:1e6c with SMTP id
 d5-20020a05600c34c500b0038c30e31e6cmr17255479wmq.144.1649424768622; 
 Fri, 08 Apr 2022 06:32:48 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 v26-20020a1cf71a000000b0038ea373273bsm1707695wmh.47.2022.04.08.06.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 06:32:48 -0700 (PDT)
Date: Fri, 8 Apr 2022 14:32:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20220408133246.fyw5554lgli4olvg@maple.lan>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 31, 2022 at 05:44:55PM +0200,
 Arnd Bergmann wrote:
 > On Thu, Mar 31, 2022 at 1:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
 > > > + > > > +static irqreturn_t a64fx_diag_handler(int ir [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ncojP-009nwz-36
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> On Thu, Mar 31, 2022 at 1:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > +
> > > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
> > > +{
> > > +     handle_sysrq('c');
> >
> >
> > Why is this calling this sysrq call?  From an interrupt?  Why?
> >
> > And you are hard-coding "c", are you sure?
> 
> This is an actual sysrq driver in the traditional sense, where you can send
> a single interrupt to the machine from the outside over a side channel.
> 
> I suggested sysrq instead of just panic() to make it a bit more flexible.
> Unfortunately there is no additional data, so it comes down to always
> sending the same character.
> 
> It would be possible to make that character configurable with a module
> parameter or something like that, but I'm not sure that is an improvement.
> Maybe you have another idea for this.

Given the interrupt can be dismissed then offering non-fatal actions in
response the chassis command seems reasonable.

There is some prior art for this sort of feature. AFAICT SGI UV has a
similar mechanism that can send an NMI-with-no-side-channel to the
kernel. The corresponding driver offers a range of actions using a
module parameter:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180

I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
it is just obfuscation. However it is certainly seems attractive to be
able to reuse handle_sysrq() to provide a more powerful set of actions.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
